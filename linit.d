/*
** $Id: linit.c $
** Initialization of libraries for lua.c and other clients
** See Copyright Notice in lua.h
*/



/*
** If you embed Lua in your program and need to open the standard
** libraries, call luaL_openlibs in your program. If you need a
** different set of libraries, copy this file to your project and edit
** it to suit your needs.
**
** You can also *preload* libraries, so that a later 'require' can
** open the library, which is already linked to the application.
** For that, do the following code:
**
**  luaL_getsubtable(L, LUA_REGISTRYINDEX, LUA_PRELOAD_TABLE);
**  lua_pushcfunction(L, luaopen_modname);
**  lua_setfield(L, -2, modname);
**  lua_pop(L, 1);  // remove PRELOAD table
*/


import core.stdc.stddef;

//#include "lprefix.h"

//#include "lua.h"

//#include "lualib.h"
//#include "lauxlib.h"
auto lua_pop(L,N)(L l, N n)	{
   lua_settop(l, -(n)-1);
}

extern(C) {
    struct lua_State;
    void luaL_requiref(lua_State*, const(char)*, int function(lua_State*), int) @nogc nothrow;
    void lua_settop(lua_State*, int) @nogc nothrow;

    int luaopen_base(lua_State*) @nogc nothrow;
    int luaopen_package(lua_State*) @nogc nothrow;
    int luaopen_coroutine(lua_State*) @nogc nothrow;
    int luaopen_table(lua_State*) @nogc nothrow;
    int luaopen_io(lua_State*) @nogc nothrow;
    int luaopen_os(lua_State*) @nogc nothrow;
    int luaopen_string(lua_State*) @nogc nothrow;
    int luaopen_math(lua_State*) @nogc nothrow;
    int luaopen_utf8(lua_State*) @nogc nothrow;
    int luaopen_debug(lua_State*) @nogc nothrow;

    struct luaL_Reg
    {
        const(char)* name;
        int function(lua_State*) func;
    }
}

enum LUA_GNAME = "_G";
enum LUA_COLIBNAME	= "coroutine";
enum LUA_TABLIBNAME	= "table";
enum LUA_IOLIBNAME	= "io";
enum LUA_OSLIBNAME	= "os";
enum LUA_STRLIBNAME	= "string";
enum LUA_UTF8LIBNAME= 	"utf8";
enum LUA_MATHLIBNAME= 	"math";
enum LUA_DBLIBNAME	= "debug";
enum LUA_LOADLIBNAME= 	"package";

/*
** these libs are loaded by lua.c and are readily available to any Lua
** program
*/
static const luaL_Reg[] loadedlibs = [
  {LUA_GNAME, &luaopen_base},
  {LUA_LOADLIBNAME, &luaopen_package},
  {LUA_COLIBNAME, &luaopen_coroutine},
  {LUA_TABLIBNAME, &luaopen_table},
  {LUA_IOLIBNAME, &luaopen_io},
  {LUA_OSLIBNAME, &luaopen_os},
  {LUA_STRLIBNAME, &luaopen_string},
  {LUA_MATHLIBNAME, &luaopen_math},
  {LUA_UTF8LIBNAME, &luaopen_utf8},
  {LUA_DBLIBNAME, &luaopen_debug},
];


extern(C) @nogc nothrow
void luaL_openlibs (lua_State *L) {
  /* "require" functions from 'loadedlibs' and set results to global table */
  foreach(lib; loadedlibs) {
    luaL_requiref(L, lib.name, lib.func, 1);
    lua_pop(L, 1);  /* remove lib */
  }
}

