-- bit32.rshift(0xDF, 4) --> 0xD
-- bit32.lshift(0xDF, 4) --> 0xDF0
-- bit32.rshift(-1, 28) --> 0xF
-- bit32.arshift(-1, 28) --> 0xFFFFFFFF
-- bit32.lrotate(0xABCDEF01, 4) --> 0xBCDEF01A
-- bit32.rrotate(0xABCDEF01, 4) --> 0x1ABCDEF0

-- a = bit32.btest(15)
-- print(a)

t = {12,10,13,15,14,11}
table.sort( t )

-- for _,k in pairs(t) do print(k) end

a = {"1k","2k","3k"}
-- for n in pairs(a) do print(n) end

s = table.concat(a)


-- print(s)
--[[
print(string.format("pi = %.4f", math.pi)) --> pi = 3.1416
d = 23; m = 3; y = 2018
print(string.format("%02d/%02d/%04d", d, m, y)) --> 03/23/2018
tag, title = "h1", "a title"
print(string.format("<%s>%s</%s>", tag, title, tag))
--> <h1>a title</h1>
--]]

-- print(string.match("hello world", "hello")) --> hello

print(string.gsub("hello, up-down!", "%A", "*"))
--> hello**up*down* 4

