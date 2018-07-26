--[[
--read current input to current output

for count = 1, math.huge do
	local line = io.read()
	if line == nil then break end
	io.write(string.format("%6d ", count), line, "\n")
	-- io.write("me.io")
end

--]]

--[[

local lines = {}
-- read the lines in table 'lines'
for line in io.lines() do lines[#lines + 1] = line end
-- sort
table.sort(lines)
-- write all the lines
for _, l in ipairs(lines) do io.write(l, "\n") end

--]]

--[[
-- read n byte

while true do
	local block = io.read(2^13) -- buffer size is 8K
	if not block then break end
	io.write(block)
end

--]]

--[[
local a = io.read(2)
print(a)

local s = io.open("file.io","r")
print(s)

local t =  s:read("*a")

print(t)

s:close()
message = t
io.stderr:write(message,"\n")
--]]


local temp = io.input() -- save current file
local s = io.input("file.io") -- open a new current file
-- <do something with new input>

a = s:read("*a")
print(a)
local o = io.output("s")

o:write("Hello World")

io.input():close() -- close current file
io.input(temp) -- restore previous current file

-- print("=============")

-- for block in io.lines("file.io",16,"*a") do
-- 	io.write(block)
-- end
-- print("=============")