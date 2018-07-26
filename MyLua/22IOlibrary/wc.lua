local BUFSIZE = 2^13 -- 8K
local f = io.input(arg[1]) -- open input file
local cc, lc, wc = 0, 0, 0 -- char, line, and word counts

for lines, rest in io.lines(arg[1], BUFSIZE, "*L") do
	if rest then lines = lines .. rest end
	cc = cc + #lines
	-- count words in the chunk
	local _, t = string.gsub(lines, "%S+", "")
	wc = wc + t
	-- count newlines in the chunk
	_,t = string.gsub(lines, "\n", "\n")
	lc = lc + t
end
print(lc, wc, cc)