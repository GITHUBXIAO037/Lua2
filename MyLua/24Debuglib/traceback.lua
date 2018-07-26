
-- print(1)
debug.traceback()


function foo()
	-- body
	local x = 112  --> (1,1)
	local y = 102  --> (1,2) 
	a,b = debug.getlocal(1,2)
	print(a,b)

	c = debug.setlocal(1,1,120)
	print(c)

	print("x --> "..x)
end
-- foo()


function xoo( a,b )
	local c = a

	local d = (b or 1) + 49

	print(c,d)
end

-- xoo(12,13)

co = coroutine.create(function ()
	local x = 10
	coroutine.yield()
	error("some error")
end)

coroutine.resume(co)
print(coroutine.resume(co)) --> false temp:4: some error
print(debug.traceback(co))