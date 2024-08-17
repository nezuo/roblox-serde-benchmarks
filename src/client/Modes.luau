--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")

local BlinkClient = require(script.Parent.BlinkClient)
local ZapClient = require(ReplicatedStorage.Client.ZapClient)
local ByteNetPackets = require(ReplicatedStorage.Shared.ByteNetPackets)

local remoteEvent = ReplicatedStorage.RemoteEvent

export type Mode = "Roblox" | "Zap" | "ByteNet" | "Blink"

local Modes: { [Mode]: (name: string, data: any) -> () -> () } = {
	Roblox = function(_, data)
		return function()
			remoteEvent:FireServer(data)
		end
	end,
	Zap = function(bench, data)
		local event = ZapClient[bench]

		return function()
			event.fire(data)
		end
	end,
	ByteNet = function(bench, data)
		local event = ByteNetPackets[bench]

		return function()
			event.send(data)
		end
	end,
	Blink = function(bench, data)
		local event = BlinkClient[bench]

		return function()
			event.fire(data)
		end
	end,
}

return Modes
