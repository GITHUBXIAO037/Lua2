-- 1
--[[
co = coroutine.create(function( ... )
	print("here is a coroutine")
end)
-- print(co)
st = coroutine.status(co)
print(st)
coroutine.resume(co)
st = coroutine.status(co)
print(st)
-- print(type(co))
--]]
-- 2
-- co = coroutine.create(function()
-- 	for i=1,10 do
-- 		print("co",i)
-- 		coroutine.yield()
-- 	end
-- end)
-- 3
-- coroutine.resume(co)
-- st = coroutine.status(co)
-- print(st)
-- print("wait......")
-- coroutine.resume(co)
-- coroutine.resume(co)
-- 4
-- co = coroutine.create(function (a, b, c)
-- 		print("co", a, b, c + 2)
-- end)
-- coroutine.resume(co, 1, 2, 3) --> co 1 2 5

-- co = coroutine.create(function (a,b)
-- 		coroutine.yield(a + b, a - b)
-- 		print("another") --not excute
-- end)
-- print(coroutine.resume(co, 20, 10))