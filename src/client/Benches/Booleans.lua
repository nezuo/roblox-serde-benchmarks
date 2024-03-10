local random = Random.new(908248)

local data = {}

for _ = 1, 1000 do
	table.insert(data, random:NextInteger(0, 1) == 1)
end

return data
