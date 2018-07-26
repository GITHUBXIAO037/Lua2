-- 在lua的主函数中查看coroutine.running()是false
co = coroutine.create(
	function()
		local r,l = coroutine.running()
		print(r,l)
	end
)

s = coroutine.status(co)

print(s)

local r,l = coroutine.running(co)
print(r,l)
-- =====================================
local r,l = coroutine.resume(co)
print(r,l)
-- =====================================
local r,l = coroutine.running(co)
print(r,l)