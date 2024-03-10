local random = Random.new()

local array = {}

for _ = 1, 100 do
	table.insert(array, {
		id = random:NextInteger(0, 65535),
		x = random:NextInteger(-128, 127),
		y = random:NextInteger(-32768, 32767),
		z = random:NextInteger(-128, 127),
		orientation = random:NextInteger(-32768, 32767),
		animation = random:NextInteger(0, 255),
	})
end

return array
