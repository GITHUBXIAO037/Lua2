local a = {}
a[#a + 1] = "Nähdään"
a[#a + 1] = "ação"
a[#a + 1] = "ÃøÆËÐ"
local l = table.concat(a, ";")

print(l)

print(l, #(string.gsub(l, "[\128-\191]", "")))
--> Nähdään;ação;ÃøÆËÐ 18
for w in string.gmatch(l, "[^;]+") do
	print(w)
end
--> Nähdään
--> ação
--> ÃøÆËÐ
for c in string.gmatch(a[3], ".[\128-\191]*") do
	print(c)
end
--> Ã
--> ø
--> Æ
--> Ë
--> Ð