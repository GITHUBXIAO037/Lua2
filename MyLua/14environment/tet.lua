a = 2

for n in pairs(_ENV) do print(n) end

-- print("over")
do
	local _ENV = {print = print, a = 14,g = _G}
	print(a) --> 14

	for n in g.pairs(_ENV) do print(n) end --> 666

	print("blocks")
end
print(a) --> 2 (back to the original _ENV)
