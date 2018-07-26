function fact( n )
	if(n < 0) then
		print(n.." is a negtive number!")
		return
	end
	-- body
	if(n == 1) then
		return 1
	end

	return n*fact(n-1)
end

local n = fact(5)

print("The n is: "..n)

print("input a number:")

local iNumber = io.read("*n")

print(iNumber)
