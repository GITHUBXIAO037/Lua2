#include <stdio.h>
// #include "mathfunction.lua"
// g++ main.c -llua -ldl 
extern "C"{
	#include "lua.h"
	#include "lauxlib.h"
	#include "lualib.h"
}

int invokeLuaFun(lua_State *L, int x, int y){
	int sum = 0;
	int z;

	//创建LUA环境
	luaL_openlibs(L);

	if(luaL_loadfile(L, "mathfunction.lua") || lua_pcall(L, 0,0,0)){
	    printf("error %s\n", lua_tostring(L,-1));
	    return -1;
  	}

	lua_getglobal(L,"foo");
	lua_pushnumber(L, x);
	lua_pushnumber(L, y);
	printf("%d\n",LUA_OK);

	if(lua_pcall(L, 2, 1, 0) != LUA_OK)
		// error(L, "error running function 'foo': %s", lua_tostring(L, -1));
		{
			printf("error running function 'foo'\n" );
			return -1;
		}
	z = lua_tonumberx(L, -1, &sum);

	if (!sum)
	{
		/* code */

		printf("sum is zero\n");
	}

	lua_pop(L, 1);

	return z;

}

int main(int argc, char const *argv[])
{
	lua_State *L = luaL_newstate();
	
	int a = invokeLuaFun(L, 4, 5);

	printf("aaaaaaa: %d\n", a);
	return 0;
}