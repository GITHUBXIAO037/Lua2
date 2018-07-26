-- catpture: yank parts of the subject string that match parts of the pattern for further use
pair = "name = Anna"
key, value = string.match(pair, "(%a+)%s*=%s*(%a+)")
-- print(key, value) --> name Anna

-- str = type(key)
-- print(str)

s = [[then he said: "it's all right"!]]
q, quotedPart = string.match(s, "([\"'])(.-)%1")
-- print(quotedPart) --> it's all right
-- print(q) --> "


-- a = tonumber('fa',16)
-- print(a)

-- a = string.char(15)
-- print(a)

name = "al"; query = "a+b = c"; q="yes or no"

function unescape (s)
	s = string.gsub(s, "+", " ")
	s = string.gsub(s, "%%(%x%x)", function (h)
		return string.char(tonumber(h, 16))
	end)
	return s
end

function escape (s)
	s = string.gsub(s, "[&=+%%%c]", function (c)
		return string.format("%%%02X", string.byte(c))
	end)
	s = string.gsub(s, " ", "+")
	return s
end

function encode (t)
	local b = {}
	for k,v in pairs(t) do
		b[#b + 1] = (escape(k) .. "=" .. escape(v))
	end
	return table.concat(b, "&")
end
t = {name = "al", query = "a+b = c", q = "yes or no"}
print(encode(t)) --> q=yes+or+no&query=a%2Bb+%3D+c&name=al

