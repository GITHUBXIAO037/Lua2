#include <stdarg.h>
#include <stdio.h>
#include <stdlib.h>

extern "C"{

#include "lua.h"
#include "lauxlib.h"
#include "lualib.h"

}

static void error (lua_State *L, const char *fmt, ...) {
	va_list argp;
	va_start(argp, fmt);
	vfprintf(stderr, fmt, argp);
	va_end(argp);
	lua_close(L);
	exit(EXIT_FAILURE);
}

int main(int argc, char const *argv[])
{
	
	return 0;
}