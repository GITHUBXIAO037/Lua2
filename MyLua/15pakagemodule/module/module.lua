a = {}
function a.foo()
	print("foo @ module ")
end

function say()
	-- body

	print("say me to you")
end
-- 1 return a
-- 2 package.loaded[...] = tablename
-- package.loaded[...] = a 
return {foo = a.foo,say = say}
