-- a = string.reverse('123456')
-- print(a)
-- a = string.byte('\128')
-- print(a)
-- a = string.char(97)
-- print(a)
-- a = string.upper('abcd')
-- print(a)
-- a = string.lower('VXIAO')
-- print(a)

-- 输出UTF-8字符：
s = 'abc'
for c in string.gmatch(s, ".[\128-\191]*") do
	print(c)
end