local mt = {} -- metatable for sets
Set = {}
function Set.new (l) -- 2nd version
	local set = {}
	setmetatable(set, mt)
	for _, v in ipairs(l) do set[v] = true end
	return set
end

function Set.union (a, b)
	local res = Set.new{}
	for k in pairs(a) do res[k] = true end
	for k in pairs(b) do res[k] = true end
	return res
end

function Set.intersection (a, b)
	local res = Set.new{}
	for k in pairs(a) do
		res[k] = b[k]
	end
	return res
end

-- presents a set as a string
function Set.tostring (set)
	local l = {} -- list to put all elements from the set

	for e in pairs(set) do
		l[#l + 1] = e
	end
	return "{" .. table.concat(l, ", ") .. "}"
end

-- print a set
function Set.print (s)
	print(Set.tostring(s))
end
--[[
local l = {'k',1,2,3,4,5}
s = Set.new(l)

for k, v in ipairs(s) do print(s[k]) end
--]]

--> have the same metatable
s1 = Set.new{10, 20, 30, 50}
s2 = Set.new{30, 1}

-- print(getmetatable(s1)) --> table: 00672B60
-- print(getmetatable(s2)) --> table: 00672B60

-- add to the metatable the metamethod
mt.__add = Set.union

s3 = s1 + s2
Set.print(s3) --> {1, 10, 20, 30, 50}

mt.__mul = Set.intersection
Set.print((s1 + s2)*s1) --> {10, 20, 30, 50}