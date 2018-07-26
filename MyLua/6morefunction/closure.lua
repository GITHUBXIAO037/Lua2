function fu( ... )
	-- body

	return ...
end

a ,b = fu(12,32,123,321)
-- print(a, b)

-- closure
function foo( ... )
	-- body

	local i = 1

	return function ()
		-- body
		i = i + 1

		return i
	end
end

ll = type((12))

print(ll)