
function newAccount (initialBalance)
	-- local self = {balance = initialBalance}
	local withdraw = function (v)
		self.balance = self.balance - v
	end

	local self = {
		balance = initialBalance,
		LIM = 10000.00,
	}

	local extra = function ()
		if self.balance > self.LIM then
			return self.balance*0.10
		else
			return 0
		end
	end

	local getBalance = function ()
		return self.balance + extra()
	end

	local deposit = function (v)
		self.balance = self.balance + v
	end

	local getBalance = function () return self.balance end
	
	return {
		withdraw = withdraw,
		deposit = deposit,
		getBalance = getBalance
	}
end
-- key point:方法不会将self作为外部参数，而是直接对self存取
acc1 = newAccount(100.00)
acc1.withdraw(40.00)
print(acc1.getBalance()) --> 60