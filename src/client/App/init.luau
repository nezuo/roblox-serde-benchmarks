local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local Modes = require(script.Parent.Modes)
local Fusion = require(ReplicatedStorage.Packages.Fusion)

local Children = Fusion.Children
local Computed = Fusion.Computed
local New = Fusion.New
local OnEvent = Fusion.OnEvent
local Value = Fusion.Value

local function Bench(bench: string, selectedBench, selectBench)
	return New("TextButton")({
		Size = UDim2.new(1, 0, 0, 50),

		BorderMode = Enum.BorderMode.Inset,
		BorderColor3 = Color3.new(1, 0, 0),
		BorderSizePixel = Computed(function()
			return if selectedBench:get() == bench then 2 else 0
		end),

		Text = bench,

		[OnEvent("Activated")] = function()
			if selectedBench:get() == bench then
				selectedBench:set(nil)
				selectBench(nil)
			else
				selectedBench:set(bench)
				selectBench(bench)
			end
		end,
	})
end

local function BenchesList(benchModules, selectBench)
	local selectedBench = Value()

	local benches = {}
	for bench in benchModules do
		table.insert(benches, Bench(bench, selectedBench, selectBench))
	end

	return New("ScrollingFrame")({
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -310, 1, 0),
		Size = UDim2.new(0, 300, 1, -43),

		BackgroundTransparency = 1,

		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.fromOffset(0, 0),

		[Children] = {
			New("UIListLayout")({
				Padding = UDim.new(0, 10),
			}),
			benches,
		},
	})
end

local function Mode(mode: string, selectedMode, selectMode)
	return New("TextButton")({
		Size = UDim2.new(1, 0, 0, 50),

		BorderMode = Enum.BorderMode.Inset,
		BorderColor3 = Color3.new(1, 0, 0),
		BorderSizePixel = Computed(function()
			return if selectedMode:get() == mode then 2 else 0
		end),

		Text = mode,

		[OnEvent("Activated")] = function()
			if selectedMode:get() ~= mode then
				selectedMode:set(mode)
				selectMode(mode)
			end
		end,
	})
end

local function ModesList(selectMode)
	local selectedMode = Value("Roblox")

	local modes = {}
	for mode in Modes do
		table.insert(modes, Mode(mode, selectedMode, selectMode))
	end

	return New("Frame")({
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.fromScale(1, 1),
		Size = UDim2.new(0, 300, 1, -43),

		BackgroundTransparency = 1,

		[Children] = {
			New("UIListLayout")({
				Padding = UDim.new(0, 10),
			}),
			modes,
		},
	})
end

local function BenchmarkMode(selectBenchmarkMode)
	local benchmarkMode = Value("FPS")

	return New("Frame")({
		AnchorPoint = Vector2.new(1, 1),
		Position = UDim2.new(1, -620, 1, 0),
		Size = UDim2.new(0, 300, 1, -43),

		BackgroundTransparency = 1,

		[Children] = New("TextButton")({
			Size = UDim2.new(1, 0, 0, 50),

			Text = Computed(function()
				return `Benchmark Mode: {benchmarkMode:get()}`
			end),

			[OnEvent("Activated")] = function()
				if benchmarkMode:get() == "FPS" then
					benchmarkMode:set("Bandwidth")
					selectBenchmarkMode("Bandwidth")
				else
					benchmarkMode:set("FPS")
					selectBenchmarkMode("FPS")
				end
			end,
		}),
	})
end

local function App(props)
	return New("ScreenGui")({
		Parent = Players.LocalPlayer.PlayerGui,

		[Children] = {
			ModesList(props.selectMode),
			BenchesList(props.benchModules, props.selectBench),
			BenchmarkMode(props.selectBenchmarkMode),
		},
	})
end

return App
