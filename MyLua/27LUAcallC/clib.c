#include <cstdio>
extern "C"  
{  
	#include "lua.h"  
	#include "lauxlib.h"  
	#include "lualib.h"  
}  

// 1 lib function
static int poo(lua_State *L) {
	
	printf("C LIB");

}
// 2 array with function name
static const struct luaL_Reg mylib [] = {
	{"foo", poo},
	{NULL, NULL} /* sentinel */
};
// 3 decare a main function
int luaopen_mylib (lua_State *L) {
	luaL_newlib(L, mylib);
	return 1;
}

int main(int argc, char const *argv[])
{
	// g++ clib.c
	return 0;
}