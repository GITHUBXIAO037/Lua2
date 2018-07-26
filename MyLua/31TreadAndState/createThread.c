#include <pthread.h>
#include "lua.h"
typedef struct Proc {
	lua_State *L;
	pthread_t thread;
	pthread_cond_t cond;
	const char *channel;
	struct Proc *previous, *next;
} Proc;

static Proc *waitsend = NULL;
static Proc *waitreceive = NULL;
static pthread_mutex_t kernel_access = PTHREAD_MUTEX_INITIALIZER;

static Proc *getself (lua_State *L) {
	Proc *p;
	lua_getfield(L, LUA_REGISTRYINDEX, "_SELF");
	p = (Proc *)lua_touserdata(L, -1);
	lua_pop(L, 1);
	return p;
}

static void movevalues (lua_State *send, lua_State *rec) {
	int n = lua_gettop(send);
	int i;
	for (i = 2; i <= n; i++) /* move values to receiver */
	lua_pushstring(rec, lua_tostring(send, i));
}

static Proc *searchmatch (const char *channel, Proc **list) {
	Proc *node = *list;
	if (node == NULL) return NULL; /* empty list? */
	do {
		if (strcmp(channel, node->channel) == 0) { /* match? */
		/* remove node from the list */
		if (*list == node) /* is this node the first element? */
			*list = (node->next == node) ? NULL : node->next;
			node->previous->next = node->next;
			node->next->previous = node->previous;
			return node;
		}
		node = node->next;
	} while (node != *list);
	return NULL; /* no match */
}

static void waitonlist (lua_State *L, const char *channel,Proc **list) {
	Proc *p = getself(L);
	/* link itself at the end of the list */
	if (*list == NULL) { /* empty list? */
		*list = p;
		p->previous = p->next = p;
	}
	else {
		p->previous = (*list)->previous;
		p->next = *list;
		p->previous->next = p->next->previous = p;
	}
	p->channel = channel;
	do { /* waits on its condition variable */
		pthread_cond_wait(&p->cond, &kernel_access);
	} while (p->channel);
}

static int ll_send (lua_State *L) {
	Proc *p;
	const char *channel = luaL_checkstring(L, 1);
	pthread_mutex_lock(&kernel_access);
	p = searchmatch(channel, &waitreceive);
	if (p) { /* found a matching receiver? */
		movevalues(L, p->L); /* move values to receiver */
		p->channel = NULL; /* mark receiver as not waiting */
		pthread_cond_signal(&p->cond); /* wake it up */
	}
	else
		waitonlist(L, channel, &waitsend);
	pthread_mutex_unlock(&kernel_access);
	return 0;
}

static int ll_receive (lua_State *L) {
	Proc *p;
	const char *channel = luaL_checkstring(L, 1);
	lua_settop(L, 1);
	pthread_mutex_lock(&kernel_access);
	p = searchmatch(channel, &waitsend);
	if (p) { /* found a matching sender? */
		movevalues(p->L, L); /* get values from sender */
		p->channel = NULL; /* mark sender as not waiting */
		pthread_cond_signal(&p->cond); /* wake it up */
	}
	else
		waitonlist(L, channel, &waitreceive);
	pthread_mutex_unlock(&kernel_access);
	/* return all stack values but channel */
	return lua_gettop(L) - 1;
}

static int ll_start (lua_State *L) {
	pthread_t thread;
	const char *chunk = luaL_checkstring(L, 1);
	lua_State *L1 = luaL_newstate();
	if (L1 == NULL)
		luaL_error(L, "unable to create new state");
	if (luaL_loadstring(L1, chunk) != 0)
		luaL_error(L, "error starting thread: %s",
	lua_tostring(L1, -1));
	if (pthread_create(&thread, NULL, ll_thread, L1) != 0)
		luaL_error(L, "unable to create new thread");
	pthread_detach(thread);
	return 0;
}

int luaopen_lproc (lua_State *L);
static void *ll_thread (void *arg) {
	lua_State *L = (lua_State *)arg;
	luaL_openlibs(L); /* open standard libraries */
	luaL_requiref(L, "lproc", luaopen_lproc, 1);
	lua_pop(L, 1);
	if (lua_pcall(L, 0, 0, 0) != 0) /* call main chunk */
		fprintf(stderr, "thread error: %s", lua_tostring(L, -1));
	pthread_cond_destroy(&getself(L)->cond);
	lua_close(L);
	return NULL;
}

static int ll_exit (lua_State *L) {
	pthread_exit(NULL);
	return 0;
}

// luaL_requiref:使用指定的函数来打开库

static const struct luaL_reg ll_funcs[] = {
	{"start", ll_start},
	{"send", ll_send},
	{"receive", ll_receive},
	{"exit", ll_exit},
	{NULL, NULL}
};
int luaopen_lproc (lua_State *L) {
/* create own control block */
	Proc *self = (Proc *)lua_newuserdata(L, sizeof(Proc));
	lua_setfield(L, LUA_REGISTRYINDEX, "_SELF");
	self->L = L;
	self->thread = pthread_self();
	self->channel = NULL;
	pthread_cond_init(&self->cond, NULL);
	luaL_register(L, "lproc", ll_funcs); /* open library */
	return 1;
}

static void registerlib (lua_State *L, const char *name,
	lua_CFunction f) {
	lua_getglobal(L, "package");
	lua_getfield(L, -1, "preload"); /* get 'package.preload' */
	lua_pushcfunction(L, f);
	lua_setfield(L, -2, name); /* package.preload[name] = f */
	lua_pop(L, 2); /* pop 'package' and 'preload' tables */
}
static void openlibs (lua_State *L) {
	luaL_requiref(L, "_G", luaopen_base, 1);
	luaL_requiref(L, "package", luaopen_package, 1);
	lua_pop(L, 2); /* remove results from previous calls */
	registerlib(L, "io", luaopen_io);
	registerlib(L, "os", luaopen_os);
	registerlib(L, "table", luaopen_table);
	registerlib(L, "string", luaopen_string);
	registerlib(L, "math", luaopen_math);
	registerlib(L, "debug", luaopen_debug);
}