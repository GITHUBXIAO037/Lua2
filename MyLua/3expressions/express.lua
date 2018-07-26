--[[
acfun = function ( x )
	-- body
	return x^0.5
end

a = acfun(25)

print("the square value of 25 is "..a)

bcfun = function ( x )
	-- body
	--return x^(-1/2)
	return x^(-1)

end

b = bcfun(4)

print("the square value of 4 is "..b)
--]]

-- m = math.floor(12/5) 12 % 5 = 12 - math.floor(12/5)*5
-- m = math.ceil(12/5)
-- print(12 - m * 5)

-- print(13 % 5)
--[[
x = math.pi 

a = x % 0.01
-- print(a)

-- print("abc" > "abcd")

print(nil or true and "one")
print(nil or "one")

print("one1" or true)

print("one1" and "two")
--]]

-- a = {x = 10, "1"}
-- x = "x"
-- print(a.x)
-- print(a[x])
-- print(a[1])

-- a["2"] = 12
-- print(a["2"])

-- b = {}
-- b[1] = 1
-- b[1000] = 1000
-- print(b[1000])
-- print(b[2])
-- print(b[#b])


-- a = {1,2,3,4,nil,nil, nil,5,6,7}
-- print(#a)

-- a = {
-- 	{x = 12, y = 13},
-- 	{y = 14, x = 15}
-- }

-- print(a[1].x) -- 12

-- a = {["*"] = "add", ["-"] = "sub", ["*"] = "mul", ["/"] = "div"}

-- print(a."*")
-- print(a["*"])

-- {x=10, y = 12} == {["x"] = 10, ["y"] = 12}

-- a1 = {x=10, y = 12} 
-- a2 = {["x"] = 10, ["y"] = 12}
-- print(a2["x"])
-- print(a1.x)
--[[

print(-5%2)
print(-5/2)

print(2^3^4)
print(2^3)
print(8^4)
print(3^4)
print(2^81)

--]]

-------------------------
sunday = "monday"
monday = "sunday"

t = {sunday = "monday",[sunday] = "sunday"}

print(t.sunday) -- monday 
print(t[sunday]) -- sunday
print(t[t.sunday]) -- sunday
-------------------------