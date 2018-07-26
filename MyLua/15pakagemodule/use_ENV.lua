--[[
-- first
local M = {}
-- _ENV = M                     --不可取
setmetatable(M, {__index = _G}) --使用继承 
								--attempt to call a nil value (global 'print')
_ENV = M

--]]

--[[

--second
local M = {}
local _G = _G
_ENV = M -- or _ENV = nil

--]]

--[[
function add ()
	-- print("ADD1")   --first
	-- _G.print("ADD2")   --second 
end
--]]

return _ENV
