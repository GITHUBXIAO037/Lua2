-- print(_G._G == _G) --> true

-- for n in pairs(_G) do print(n) end

-- print(_VERSION)

-- _VERSION = "lua 5.1"

-- print(_VERSION)

-- xx = 5620

-- print(_G['xx']) --> 5620
-- print(_G.xx)    --> 5620
---[[
-- 设置新的环境
rawset(_G, 'vxiao', "肖济")

-- print(_G.vxiao)
-- print(_G['vxiao'])

a = rawget(_G, 'vxiao')
print('vxiao exist')
print(a)

--]]

--[[
a = debug.getinfo(2,"S").what
print(a)
--]]
