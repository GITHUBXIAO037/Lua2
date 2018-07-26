local function test(a) 
	print("test : ", a) 
	return coroutine.yield(2 * a) 
end 

local co = coroutine.create( 
function(b, c) 
	print("running : ", coroutine.running()) 
	print("co-body 1 : ", b, c) 
	local r = test(b + 1) 
	print("co-body 2 : ", r) 
	local n, m = coroutine.yield(b - c, b + c) 
	print("co-body 3 : ", n, m) 
	return "begin", "end" 
end
) 

print("test status 1 : ", coroutine.status(co))
print("main 1 : ", coroutine.resume(co, 1, 9)) 
print("main 2 : ", coroutine.resume(co, "r"))
print("main 3 : ", coroutine.resume(co, "n", "m"))
print("main 4 : ", coroutine.resume(co, "x", "y"))
print("test status 3 : ", coroutine.status(co))

