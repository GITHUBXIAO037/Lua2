-- function dofile( filename )
-- 	print(filename)
-- 	local f = loadfile(filename)
-- 	-- assert()

-- 	return f()
-- end

f = load("local a = 10; print(a + 20)")