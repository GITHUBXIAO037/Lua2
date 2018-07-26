function fsize (file)
	local current = file:seek() -- get current position
	local size = file:seek("end") -- get file size
	file:seek("set", current) -- restore position
	return size
end

local f = io.open(arg[1], "rb")
local s = fsize(f)
-- 19,252,240 bytes
print(s)