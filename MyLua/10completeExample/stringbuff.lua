local buff = ""

for line in io.lines() do	
	if line == "q" then
		break
	end
	buff = buff .. line
end
print(buff)