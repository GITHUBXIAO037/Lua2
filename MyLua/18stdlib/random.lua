-- require("math")
math.randomseed(os.time())
a = math.random(1,50)
-- print(a)
-- print(math.huge)
-- print(string.format("0x%x",15))


-- b = bit32.bor(3,4) --> 7
-- b = bit32.bor(5,4) --> 5
-- print(b)

-- b = bit32.band(5,4)
-- print(b)

b = bit32.bnot(-1)
print(b)
