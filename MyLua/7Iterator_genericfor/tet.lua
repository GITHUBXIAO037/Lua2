-- 直到条件为真
repeat
	print("nil")
until 0

function allwords(f)
	local i = 1
	for line in io.lines() do
		for word in string.gmatch(line, "%w+") do
			print(i)
			i = i + 1
			f(word)
		end
	end
end
local icount = 0
allwords(
function(word)
	if word == "hello" then icount = icount + 1 end
	print(icount)
end
)

