#include <stdio.h>

#include "foo.h"

#include "lauxlib.h"

void foo(lua_State* L){
	puts("Hello, Dynamic library");
}