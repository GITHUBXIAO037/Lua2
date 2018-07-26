-- #!/usr/local/bin/lua

-- chmod +x weakTable.lua
-- ./weakTable.lua
a = {}
b = {__mode = "k"}

setmetatable(a, b) -- now 'a' has weak keys

key = {} -- creates first key
-- l = "l"
a[key] = 1
-- a[l] = 10
key = {} -- creates second key
-- l = "l"
a[key] = 2
-- a[l] = 20
collectgarbage() -- forces a garbage collection cycle
for k, v in pairs(a) do print(v) end
--> 2