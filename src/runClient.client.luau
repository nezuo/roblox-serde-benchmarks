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

type BenchmarkMode = "FPS" | "Bandwidth"

local SEND_AMOUNT = 1000
local BANDWIDTH_MODE_SEND_RATE = 1

local benches = {}
for _, child in ReplicatedStorage.Client.Benches:GetChildren() do
	benches[child.Name] = require(child)
end

local selectedBench
local selectedMode: Modes.Mode = "Roblox"
local benchmarkMode: BenchmarkMode = "FPS"

local connection
local accumulated = 0

local function runBench(name, mode: Modes.Mode)
	if connection ~= nil then
		connection:Disconnect()
	end

	local data = benches[name]
	local callback = Modes[mode](name, data)

	print(`Running benchmark {name} with {mode}`)

	accumulated = 0

	connection = RunService.PostSimulation:Connect(function(deltaTime)
		if benchmarkMode == "FPS" then
			for _ = 1, SEND_AMOUNT do
				callback()
			end
		else
			accumulated += deltaTime

			while accumulated >= BANDWIDTH_MODE_SEND_RATE do
				accumulated -= BANDWIDTH_MODE_SEND_RATE

				for _ = 1, SEND_AMOUNT do
					callback()
				end
			end
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

local function selectBenchmarkMode(mode: BenchmarkMode)
	benchmarkMode = mode
	accumulated = 0
end

StarterGui:SetCoreGuiEnabled(Enum.CoreGuiType.All, false)

App({
	benchModules = benches,
	selectBench = selectBench,
	selectMode = selectMode,
	selectBenchmarkMode = selectBenchmarkMode,
})
