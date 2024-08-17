local ReplicatedStorage = game:GetService("ReplicatedStorage")

local ByteNet = require(ReplicatedStorage.Packages.ByteNet)

return ByteNet.defineNamespace("byteNet", function()
	return {
		Booleans = ByteNet.definePacket({
			value = ByteNet.array(ByteNet.bool),
		}),
		StructOfNumbers = ByteNet.definePacket({
			value = ByteNet.array(ByteNet.struct({
				id = ByteNet.uint16,
				x = ByteNet.int8,
				y = ByteNet.int16,
				z = ByteNet.int8,
				orientation = ByteNet.int16,
				animation = ByteNet.uint8,
			})),
		}),
	}
end)
