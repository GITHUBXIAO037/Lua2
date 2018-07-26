#define MAX_COLOR 255
/* assume that table is on the stack top */
int getcolorfield (lua_State *L, const char *key) {
	
	int result;
	
	lua_pushstring(L, key); /* push key */
	lua_gettable(L, -2); /* get background[key] */
	
	if (!lua_isnumber(L, -1))
		error(L, "invalid component in background color");
	
	result = (int)(lua_tonumber(L, -1) * MAX_COLOR);
	lua_pop(L, 1); /* remove number */
	
	return result;
}