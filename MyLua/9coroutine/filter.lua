-- consumer( filter(producer()) )
function receive(prog)
	local status, value = coroutine.resume(prog)
	return value
end

function send(x)
	coroutine.yield(x)
end

function producer()
	return coroutine.create(
			function ()
				while true do
					local x = io.read()
					send(x)
				end
			end
		)
end

function filter(prog)
	return coroutine.create(
		function ()
			for line=1, math.huge do
				local x = receive(prog)
				x = string.format("%5d %s", line, x)
				send(x)
			end
		end
	
	)
end

function consumer(prog)
	while true do
		local x = receive(prog)
		io.write(x,"\n")
	end
end
consumer( filter(producer()) )
