--[[

local function t(a)
	coroutine.yield(a)
	print(".....")
end

co = coroutine.create(
	function(a)
		t(a)
	end
)

local s,l = coroutine.resume(co,163)
print(s,l)

--]]

co = coroutine.create(
	function(a)
		print("start")
		print(a)
		
		coroutine.yield("ONG")

		print("on")
		print(a)

		coroutine.yield("SEG")
	end
)

local x,l = coroutine.resume(co,1)

print(x,l)


local x,l = coroutine.resume(co)

print(x,l)