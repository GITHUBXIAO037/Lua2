
local function fun1( ... )
	-- body
	print()
	print("fun1")

	local fun2 = function()
		-- body

		print("fun2")
	end

	-- return fun2 -- ok
	return fun2()
end 

-- ff = fun1() 	-- ff nil
-- print(ff)

a = {p = print}
a.p("Hello World") --> Hello World


network = {
	{name = "grauna", IP = "210.26.30.34"},
	{name = "arraial", IP = "210.26.30.23"},
	{name = "lua", IP = "210.26.23.12"},
	{name = "derain", IP = "210.26.23.20"},
}

table.sort(network, function (a,b) return (a.name > b.name) end)

for i,v in ipairs(network) do
	-- print(network[i])

	for k,v in pairs(network[i]) do
		print(v)
	end
end