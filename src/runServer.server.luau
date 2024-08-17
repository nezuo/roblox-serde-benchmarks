local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

local BlinkServer = require(ServerScriptService.Server.BlinkServer)
local ZapServer = require(ServerScriptService.Server.ZapServer)
local ByteNetPackets = require(ReplicatedStorage.Shared.ByteNetPackets)

for _, child in ReplicatedStorage.Client.Benches:GetChildren() do
	BlinkServer[child.Name].on(function() end)
	ZapServer[child.Name].setCallback(function() end)
	ByteNetPackets[child.Name].listen(function() end)
end

ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function() end)
