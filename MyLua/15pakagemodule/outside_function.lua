---[[
-- third
-- module setup
local M = {}
-- Import Section:
-- declare everything this module needs from outside

local ver = math.sin
-- no more external access after this point
_ENV = nil -- or _ENV = M

--]]

return _ENV