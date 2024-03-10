local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerScriptService = game:GetService("ServerScriptService")

require(ReplicatedStorage.Shared.ByteNetPackets)
require(ServerScriptService.Server.ZapServer)

ReplicatedStorage.RemoteEvent.OnServerEvent:Connect(function() end)
