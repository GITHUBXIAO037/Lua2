function setDefault (t, d)
	local mt = {__index = function () return d end}
	setmetatable(t, mt)
end

-- o = {}

-- setDefault(o,520)

-- print(o[2])

tab = {x=10, y=20}
print(tab.x, tab.z) --> 10 nil
setDefault(tab, 0)
print(tab.x, tab.z) --> 10 0