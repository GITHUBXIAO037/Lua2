function string_print( str )
	--print(str)
	local one = assert("xone" == str)
	local two = assert(loadfile(str) == nil)
	return one,two
end

print(string_print("xone"))