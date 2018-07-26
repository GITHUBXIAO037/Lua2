--[[
print(_ENV)
local print, sin = print, math.sin
_ENV = nil
print(13) --> 13
print(sin(13)) --> 0.42016703682664
print(math.cos(13)) -- error!
--]]

--[[

a = 13 -- global
local a = 12
print(a) --> 12 (local)
print(_ENV.a) --> 13 (global)

--]]

-- -- change current environment to a new empty table
-- _ENV = {}
-- a = 1 -- create a field in _ENV
-- print(a) --> stdin:4: attempt to call global 'print' (a nil value)

--[[

a = 15 -- create a global variable
_ENV = {g = _G} -- change current environment
a = 1 -- create a field in _ENV
g.print(a) --> 1
g.print(g.a) --> 15

--]]

-- 使用继承来移植环境
a = 1
local newgt = {} -- create new environment
setmetatable(newgt, {__index = _G})
_ENV = newgt -- set it
print(a) --> 1

a = 10
print(a) --> 10
print(_G.a) --> 1
_G.a = 20
print(_G.a)
print(a)

