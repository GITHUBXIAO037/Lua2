--[[
o = {x = "hi"}
setmetatable(o, {__gc = function (o) print(o.x) end})
o = nil --调用collectgarbage擦除连接，强制垃圾回收
collectgarbage() --> hi
--]]

--[[

尽管为元表设置了__gc元方法，但lua并不检测赋值，所以lua不标记这个对象。
o = {x = "hi"}
mt = {}
setmetatable(o, mt)
mt.__gc = function (o) print(o.x) end
o = nil
collectgarbage() --> (prints nothing)
--]]

--[[

如果回收器在一段周期内终结了几个对象，回收器会以相反的顺序收集标记为终结的对象
mt = {__gc = function (o) print(o[1]) end}
list = nil
for i = 1, 3 do
	list = setmetatable({i, link = list}, mt)
end
list = nil
collectgarbage()
--> 3
--> 2
--> 1
--]]

--[[

-- Resurrection must be transitive
A = {x = "this is A"}
B = {f = A}
setmetatable(B, {__gc = function (o) print(o.f.x) end})
A, B = nil
collectgarbage() --> this is A

--]]

--[[

-- atexit函数：在程序结束之前函数即刻运行，我们所做的是在表中创建一个终结器，
-- 并固定终结器到某个地方，比如说全局变量。
_G.AA = {__gc = function ()
-- your 'atexit' code comes here
print("finishing Lua program")
end}
setmetatable(_G.AA, _G.AA)

--]]

--[[

-- 带有终结器的对象和和弱表也有一点细微的差别
-- 收集器再弱表中的值唤醒之前清除弱表中的值，键在唤醒之后再清除：
-- a table with weak keys
wk = setmetatable({}, {__mode = "k"})
-- a table with weak values
wv = setmetatable({}, {__mode = "v"})
o = {} -- an object
wv[1] = o; wk[o] = 10 -- add it to both tables
setmetatable(o, {__gc = function (o)
print(wk[o], wv[1])
end})
o = nil; collectgarbage() --> 10 nil

--]]
