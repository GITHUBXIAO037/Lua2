local i = 1

some = 911

function foo(  )
	-- body
	local i = 11

::all::
	print("jump to label all")

	i = i + 1
	-- print(i)
	local some = some + 1
	-- print(some)
	if i == 12 then print("if");print(i); goto kill end
	local ss = 1

	print(ss)

	print(i)
	-- if i == 911 then
	-- 	goto all
	-- end	
	print("something")
	::kill::

end

goto SayMe

::all::
	print("jump to label all www")
-- print(ss) nil

foo()
-- print(i)

-- print(math.huge) -- inf

days = {"Sunday","Monday","Tuesday","Wednesday","Thuesday","Friday","Satday"}
--语句块的设计
::SayMe::do 

	print("SayMe")

end