-- tet for test
-- if nil then
-- 	error("输出到命令行，标准输出", 2)
-- end

-- print("nil")
--[[
local x = {}

a = {}
b = {}
ax = setmetatable(a,x)
bx = setmetatable(b,x)
print(type(ax))

a1 = getmetatable(a,x)
b1 = getmetatable(b,x)
print(a1 == b1)
--]]

print({}) -- tostring 以一种更简单的格式来表示表,tostring来格式化它的输出
-- table: 0x89afd88