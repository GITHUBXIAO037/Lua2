---[[
local foo
do
	
	local _ENV = _ENV

	for i in pairs(_ENV) do
		print(i)
	end
	function foo() print(X) end
	
end

X = 13
_ENV = nil
print"456"
foo()
X = 0
print(X)
foo()
--]]

-- print(str)

-- local str = ''

-- print(str)

-- X = nil
-- print(X)

-- t = {x = nil}
-- print(t["x"])

--[[
local print = print
function foo (_ENV, a)
	print(a + b)
end
foo({b = 14}, 12)
foo({b = 10}, 1)
--]]