Account = {balance = 0}
-- create a new Account
function Account:new (o)
	o = o or {} -- create table if user does not provide one
	setmetatable(o, self) -- self is equal to Account
	self.__index = self  -- self in the call to Account:new
	return o
end

function Account:withdraw (v)
	self.balance = self.balance - v
end

function Account:deposit (v)
	self.balance = self.balance + v
end

a = Account:new{balance = 0}
a:deposit(100.00)

--a.deposit(a,100.00)  因为冒号的缘故，省略a参数
-- 此时a表中没有deposit,所以lua查找元表的__index元方法
-- getmetatable(a).__index.deposit(a, 100.00)
-- a的元表是Account，Account.__index也是表Account，因为new方法中的self.__index=self
-- Account:withdraw(152)

print(a.balance)
a:withdraw(80)
print(a.balance)

b = Account:new()
print("Account b: " .. b.balance) --> 0