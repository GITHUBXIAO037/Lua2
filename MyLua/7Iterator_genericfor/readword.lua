function allwords()
	local line = io.read()
	local position = 1

	return function()
		while line do
			local s, e = string.find(line, "%w+", position)
			if s then 
				position = e + 1

				return string.sub(line, s, e)
			else
				line = io.read()
				position = 1
			end
		end

		return nil
	end
end

-- for word in allwords() do
-- 	print(word)
-- end

function all()
	
	return function()--会引起死循环的闭包
		return 1,3
	end
end

for i,k in all() do
	-- print(k)
	-- i = 2
	-- if i == 1 then
	-- 	print(i)
	-- end

	-- if i == 2 then 
	-- 	break
	-- end
end

function a()
	local x = 1
	return function ()

		return x
	end
end

for i in a() do 

	print(i)

	if i == 12 then 
		break
	end
end