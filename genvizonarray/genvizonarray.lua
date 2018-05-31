hexchat.register("genvizonarray.lua", "0.1", "Generates array of numbers for VIzon lottery on Rizon")
-- seed the random number generator
math.randomseed(os.time())

-- final output function
function printarray(x)
	local muhoutput = ""
	for i = 1, #x do
		muhoutput = muhoutput .. " " .. x[i]
	end
	print("VIzon bet" .. muhoutput)
end

-- function to populate the array with random numbers
function populatearray(x)
	for i = 1, 6 do
		x[i] = math.random(1, 29)
	end
	return x
end

-- main function
function genvizonarray()
	-- loop control variable
	local continuelooping = true
	-- empty table to populate with random numbers
	local muhtable = {}
	-- main loop
	while continuelooping do
		-- turn off looping
		continuelooping = false
		-- populate the table
		muhtable = populatearray(muhtable)
		-- sort it for uniqueness checking
		table.sort(muhtable)
		-- loop through the array checking for repeating elements
		for i = 1, #muhtable do
			if muhtable[i] == muhtable[i + 1] then
				continuelooping = true
			end
		end
	end
	-- finally print the array
	printarray(muhtable)
end

genvizonarray()
