
-- create the prototype with default values
prototype = {x = 0, y = 0, width = 100, height = 100}
mt = {} -- create a metatable

-- declare the constructor function
function new (o)
	setmetatable(o, mt)
	return o
end

-- define the __index metamethod
mt.__index = function (_, key)
	return --prototype[key]
	"width"
end

w = new{x=10, y=20}
-- create a new window and query it for an absent field
-- 查询和修改表中没有的字段
-- print(w.width) --> 100 