local x1 = os.clock()

local t = os.time()
local d = os.date("*t",t)
local s = d.year..d.month..d.day.." "..d.hour.." "..d.min.." "..d.sec
-- print(s)
-- print(d.isdst)

-- print(os.date("%A")) --> %A :weekday
-- print(os.date("%B")) --> %B :month
-- print(os.date("a %A in %B")) --> a Thursday in April
-- print(os.date("%x", t)) --> 04/12/18
s = 0
-- for i = 1, 100000000 do s = s + i end

local x2 = os.clock()
-- print(string.format("time end: %.8f",x2-x1))

-- print(os.getenv("HOME"))
-- local o1,o2,o3 = os.execute("ps aux")

-- print(o1,o2,o3)

local l = os.setlocale()
print(l) --> C