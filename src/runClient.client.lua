local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")
local StarterGui = game:GetService("StarterGui")

local requiredZapAt = os.clock()
require(ReplicatedStorage.Client.ZapClient)
print("Required Zap in ", os.clock() - requiredZapAt)

local requiredByteNetAt = os.clock()
require(ReplicatedStorage.Shared.ByteNetPackets)
print("Required ByteNet in ", os.clock() - requiredByteNetAt)

local App = require(ReplicatedStorage.Client.App)
local Modes = require(ReplicatedStorage.Client.Modes)

local benches = {}
for _, child in ReplicatedStorage.Client.Benches:GetChildren() do
	benches[child.Name] = require(child)
end

local selectedBench
local selectedMode: Modes.Mode = "Roblox"

local connection

local function runBench(name, mode: Modes.Mode)
	if connection ~= nil then
		connection:Disconnect()
	end

	local data = benches[name]
	local callback = Modes[mode](name, data)

	print(`Running benchmark {name} with {mode}`)

	connection = RunService.PostSimulation:Connect(function()
		for _ = 1, 1000 do
			callback()
		end
	end)
end

local function selectBench(bench: string?)
	selectedBench = bench

	if bench ~= nil then
		runBench(selectedBench, selectedMode)
	elseif connection ~= nil then
		print("Stopping benchmark")
		connection:Disconnect()
	end
end

local function selectMode(mode: Modes.Mode)
	selectedMode = mode

	if selectedBench ~= nil then
		runBench(selectedBench, mode)
	end
end

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

App({
	benchModules = benches,
	selectBench = selectBench,
	selectMode = selectMode,
})
