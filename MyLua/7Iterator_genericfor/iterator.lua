function valuesTable(t)
	
	local i = 0

	return function( )
		i = i + 1
		--print(i)
		return t[i]
	end
end

a = {1,2.3,4,5,6,7,8,9,10}

-- local ele = valuesTable(a)
-- for i=1,#a do
-- 	print(ele())
-- end

for ele in valuesTable(a) do
	print(ele.." 100")
end