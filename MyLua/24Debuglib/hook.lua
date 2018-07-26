--[[

function trace (event, line)
	local s = debug.getinfo(2).short_src
	
	print(s .. ":" .. line)
end


debug.sethook(trace, "l")
-- debug.sethook(print, "l")

trace(print,"line")

--]]

local Counters = {}
local Names = {}

local function hook ()
	local f = debug.getinfo(2, "f").func
	local count = Counters[f]
	if count == nil then -- first time 'f' is called?
		Counters[f] = 1
		Names[f] = debug.getinfo(2, "Sn")
	else -- only increment the counter
		Counters[f] = count + 1
	end
end
-- 获得函数名
function getname (func)
	local n = Names[func]
	if n.what == "C" then
		return n.name
	end
	local lc = string.format("[%s]:%d", n.short_src, n.linedefined)
	if n.what ~= "main" and n.namewhat ~= "" then
		return string.format("%s (%s)", lc, n.name)
	else
		return lc
	end
end