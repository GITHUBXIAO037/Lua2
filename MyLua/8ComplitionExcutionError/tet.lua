function argument( ... )
	
	print(arg[-1]) --arg[index]:获取命令行参数，程序名的位置时0，向后加1，向前减1

end

-- argument(0,1,2,3,4)

-- print(package.loadlib("a","b"))
print "before"
-- error("11 line")
-- print "after"

assert(io.open("do.lua","r"),"not such file")
print "after"