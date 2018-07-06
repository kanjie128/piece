#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <string>

extern "C"{
    #include <lua.h>
    #include <lualib.h> 
    #include <lauxlib.h>
}

const char * lua_func = "for i=0,3 do print(\"Lua in C++\") end";

int main(){
    //1. create lua env
    lua_State* luaEnv = luaL_newstate();  
    //2. open libs
    luaL_openlibs(luaEnv);
    //3. execute lua function
    luaL_dostring(luaEnv, lua_func);
    //4. close lua env
    lua_close(luaEnv);

    return 0;
}
