--[[
a = {}

x = 'index'

a[x] = 123

print(a['index']) -- same as a[x]

a[20] = 'array'

x = 20
print(a[20]) -- a[x] is array

--]]

-- a = {}

-- for i=1,100 do
-- 	a[i] = 2*i
-- end

-- for i=1,#a do -- #a = 100
-- 	print(a[i])
-- end

-- print(a[50])
-- print(a["x"]) -- nil

-- a = {}
-- x = "y"
-- a[x] = 123

-- print(a.x)
-- print(a.y)
-- print(a[x])

a = {}

a.a = a
a.a.a.a.a = 5
print(a) -- orignal table
print(a.a) -- index a is the orignal table 
print(a["a"])