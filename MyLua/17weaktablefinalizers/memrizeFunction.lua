-- 将函数计算的结果存储下来，以便下次调用

local results = {}

setmetatable(results, {__mode = "v"}) -- make values weak
setmetatable(results, {__mode = "kv"}) -- make fully weak
function mem_loadstring (s)
	local res = results[s]
	
	if res == nil then -- result not available?
		res = assert(load(s)) -- compute new result
		results[s] = res -- save for later reuse
	end
	
	return res
end