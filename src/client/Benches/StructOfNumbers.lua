local array = {}

for _ = 1, 100 do
	table.insert(array, {
		id = math.random(),
		x = math.random(),
		y = math.random(),
		z = math.random(),
		orientation = math.random(),
		animation = math.random(),
	})
end

return array
