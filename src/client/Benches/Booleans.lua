local random = Random.new(908248)

local data = {}

for _ = 1, 1000 do
	table.insert(data, if random:NextInteger(0, 1) == 0 then false else true)
end

return data
