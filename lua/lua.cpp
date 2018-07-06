#include <stdlib.h>
#include <stdio.h>
#include <iostream>
#include <string>

extern "C"{
    #include <lua.h>
    #include <lualib.h> 
    #include <lauxlib.h>
}

using namespace std;

// 初始化Lua环境.  
lua_State* initLuaEnv()  
{  
    lua_State* luaEnv = luaL_newstate();//lua_open();  
    cout << "stack len empty1 "<<lua_gettop(luaEnv)<<endl;
    luaopen_base(luaEnv);  
    luaL_openlibs(luaEnv);  
    cout << "stack len empty2 "<<lua_gettop(luaEnv)<<endl;

    return luaEnv;  
}  
 
// 加载Lua文件到Lua运行时环境中
bool loadLuaFile(lua_State* luaEnv, const string& fileName)  
{  
    int result = luaL_loadfile(luaEnv, fileName.c_str());  
    if (result)  
    {  
        return false;  
    }  

    result = lua_pcall(luaEnv, 0, 0, 0);  
    return result == 0;  
}  

int testLuaGlobal(lua_State * lua){

    // 加载脚本到Lua环境中.  
    if (!loadLuaFile(lua, "./test.lua"))  
    {  
        cout<<"Load Lua File FAILED!"<<endl;  
        return -1;  
    }  
    cout << "stack len empty "<<lua_gettop(lua)<<endl;
    int appid = -123;
    //cout<<"put appid:"<<endl;
    //cin>>appid;
    for(int i = 0; i < 1; i++){
    lua_getglobal(lua, "example2");//stack function
    lua_pushinteger(lua, appid);  //push parameter
    lua_pushstring(lua, "abc");  //push parameter
    //lua_pushinteger(lua, 0x6);  //push parameter

    //int stack_len = lua_gettop(lua);
    //cout << "stack len before "<<stack_len <<endl;
    lua_pcall(lua, 2, 1, 0);//3 param, 1 return  
    bool ret = lua_toboolean(lua, -1);
    if(ret)
        printf("positive\n");
    else 
        printf("negative\n");
    lua_pop(lua, 1);
    }
    return 0;
    //stack_len = lua_gettop(lua);
    //cout << "stack len after "<<stack_len <<endl;

    //get return value from lua
    // 获取返回值.  
    /*
    if (!lua_isboolean(lua, -1))  
    {  
        cout<<"lua call stack error" <<endl;
        return -1;
    }  
    int success = lua_toboolean(lua, -2);  
    if (!success)  
    {  
        cout<<"lua call return error!"<<endl;  
        return -2;
    } 

    if (!lua_isnumber(lua, -1))  
    {  
        cout<<"lua call stack error" <<endl;
        return -1;
    }  
    int iIsNeedSave = lua_tointeger(lua, -1);
    cout<<"appid "<<appid<<", save flag:"<<iIsNeedSave<<endl;

    stack_len = lua_gettop(lua);
    cout << "stack len after pop "<< stack_len <<endl;
    return 0;
    */
}

void CloseLua(lua_State * l){

    if(l)
        lua_close(l); 
}

#define DIM(Arr) (sizeof(Arr)/sizeof(Arr[0]))

int testLocal(int id){
    static int appid[] = {123, 456, 111, 222};
    uint64_t i = 0;
    uint64_t max = 100000000UL;
    for(; i < max; i++){
        for(int j = 0; j < DIM(appid); j++)
        {
            if(id == appid[j])
                break;
        }
    }
    return 0;
}

int main(){
    lua_State * luaEnv = initLuaEnv();
    int i = 0;
    while( i < 1){
        testLuaGlobal(luaEnv);
        //testLocal(222);
        i++;
    }
    CloseLua(luaEnv);
    return 0;

    // 加载脚本到Lua环境中.  
    if (!loadLuaFile(luaEnv, "./GenerateNoteXML.lua"))  
    {  
        cout<<"Load Lua File FAILED!"<<endl;  
        return -1;  
    }  

    // 获取Note信息.  
    string fromName;  
    string toName;  
    string msgContent;  

    cout<<"Enter your name:"<<endl;  
    cin>>fromName;  

    cout<<"\nEnter destination name:"<<endl;  
    cin>>toName;  

    cout<<"\nEnter message content:"<<endl;  
    getline(cin, msgContent);  
    getline(cin, msgContent);  

    // 将要调用的函数和函数调用参数入栈.  
    lua_getglobal(luaEnv, "generateNoteXML");  
    lua_pushstring(luaEnv, fromName.c_str());  
    lua_pushstring(luaEnv, toName.c_str());  
    lua_pushstring(luaEnv, msgContent.c_str());  

    // 调用Lua函数（3个参数,一个返回值）.  
    lua_pcall(luaEnv, 3, 1, 0);  

    // 获取返回值.  
    if (lua_isboolean(luaEnv, -1))  
    {  
        int success = lua_toboolean(luaEnv, -1);  
        if (success)  
        {  
            cout<<"\nGenerate Note File Successful!"<<endl;  
        }  
    }  

    // 将返回值出栈.  
    lua_pop(luaEnv, 1);  

    // 释放Lua运行时环境.  
    lua_close(luaEnv); 
    return 0;
}
