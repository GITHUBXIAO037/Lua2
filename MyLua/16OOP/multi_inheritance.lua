require("Name")
require("inheritance")

-- look up for 'k' in list of tables 'plist'
local function search (k, plist)
	for i = 1, #plist do
		print(k)
		local v = plist[i][k] -- try 'i'-th superclass
		print(v)
		if v then return v end
	end
end

function createClass (...)
	local c = {} -- new class
	local parents = {...}
	for k,v in pairs(parents) do
		print(k,v)
	end
	-- -- class will search for each method in the list of its parents
	-- setmetatable(c, {__index = function (t, k)
	-- 								return search(k, parents)
	-- 			end}
	-- )
	setmetatable(c, {__index = function (t, k)
		local v = search(k, parents)
		t[k] = v -- save for next access
		return v
	end}
)
	-- prepare 'c' to be the metatable of its instances
	c.__index = c
	-- define a new constructor for this new class
	function c:new (o)
		o = o or {}
		setmetatable(o, c)
		return o
	end

	return c -- return new class
end
-- 创建Named和Account的子类
NamedAccount = createClass(Account, Named)
-- 创建并使用实例
account = NamedAccount:new{name = "Paul"}
print(account:getname()) --> Paul