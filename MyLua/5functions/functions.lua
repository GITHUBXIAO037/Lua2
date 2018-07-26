count = 0
function incCounter( n )
	-- body

	n = n or 1
	count = count + n 

end

-- print(count)

incCounter()
incCounter()

-- print(count)

function a(  )
	-- body
	return "a","b"
end

l, k= (a())

-- print(l)
-- print(k)

-- print(a()) -- single

-- print((a())) -- multiful

function say( )
	return 1,2,3
end

function now( ... )
	-- body
	return (say())
end

a,b,c = now()

-- print(a,b,c)

a = {"Sun", "Mon", "Tue", "Wed"}
-- print(table.unpack(a, 1, 4))

-- local a, b = ...

function all(...) return ... end

aa,bb,cc = all(12,46,65)

sd = all (table.unpack(a))

-- print(sd)
-- print(aa,bb,cc)

newtable = table.pack(1,2,3,4,5,6,7,8,9,"WW")
mm = newtable.n
-- print(newtable[10])

-- print "({111,222,333,444})"
-- print({111,222,333,444})

function  constr( ... )
	-- body
	local x = { ... }
	local str = ""
	for i=1,#x do
		-- print(x[i])
		str = str..x[i]
	end
	return str
end

ss = constr("123","456","789")
-- print(ss)

function arrele( ... )
	-- body

	for i,v in ipairs({...}) do
			print(i,v)
		end	

end

-- arrele(table.unpack({1,2,"key"}))
function collect( ... )
	-- body

	local t = table.pack(...)
	local s = {}
	for i = 2,t.n do
		-- print(t[i])

		s[i-1] = t[i]
	end
	return s
end

tt = collect(1,2.3,4,5,"k")

-- print(tt[1])
-- print(#tt)
