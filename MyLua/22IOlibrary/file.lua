local inp = assert(io.open(arg[1], "rb"))
local out = assert(io.open(arg[2], "wb"))
local data = inp:read("*a")
print(data)
data = string.gsub(data, "\r\n", "\n").."END"
out:write(data)
assert(out:close())