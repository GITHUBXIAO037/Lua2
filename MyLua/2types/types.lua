--[[
print(type("string0"))
print(type(nil))
print(type(911))
print(type(12.012))
print(type(true))
print(type(print))
print(type(type(12)))
--]]

-- number
-- p 表示以2为基地的数字表示 
-- print(0x1p-4)
-- print(0x5p2)
-- print(0xff)
-- print(0x8.2p2)
-- print(0x1.2p2)
-- print(0xa.bp2)

-- print(0xabp2)

-- 0xa.b = 10.0875
-- p2 = 2*2 = 4
-- 0xa.b * p2 = 42.75 

-- print(0xa.bp2)

-- string 
--[[
a = "one string"

b = string.gsub(a, "one", "another")

print(#a)
print(#b)

print(#"goo\0")

print(#'foo\0')
--]]
-- print("one line\nnext line\n\"in quote\"" ,"same line")
-- print('\' \\ \\ \'')

-- print("alo\n123\"")
-- print('\97lo\10\04923"')
data = "\0x00\0x01\0x02\0x03\0x04\0x05\0x06\0x07\z
\0x08\0x09\0x0A\0x0B\0x0C\0x0D\0x0E\0x0F"
print(data)