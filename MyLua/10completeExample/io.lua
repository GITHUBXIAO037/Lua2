-- io.write("hello\n")
-- print("ll")
-- print("kk")
-- io.write("hello\n")
--[[
a = {x=1, y=2; {3,4,5}}
print(a[1][1])
a[2] = a
print(a[1])
print(a[2])
print(a.x)

print(a.y)
--]]
a = [=[
a = tostring(123456)

print(type(a))
]=]

-- print(a)
--[[
a = tostring(123456)

print(type(a))
print(a)
--]]

string.format("%s[%s]", "name", '"k"')
s = string.format("%q",'s for save // d')
print(s)