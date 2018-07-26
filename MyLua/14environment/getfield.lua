-- return field of special 
function getfield (f)
	local v = _G -- start with the table of globals
	for w in string.gmatch(f, "[%w_]+") do
		v = v[w]
	end
	return v
end