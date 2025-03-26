--!strict
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local UserInputService = game:GetService("UserInputService")
--
local InstanceGui = require(script.InstanceGui)
local Command = require(script.Parent.Command)
--

local gui = InstanceGui()
local frame = gui.Frame

local lastSelection: TextButton | nil

local function executeFunction(): ()
	local CommandRemote = ReplicatedStorage:WaitForChild("_CommandRemote") :: RemoteEvent

	frame.Execute.MouseButton1Click:Connect(function()
		if lastSelection == nil then
			return
		end
		local name = lastSelection.Name

		local properties = frame.Properties

		local parameters: { string | number } = {}
		for _, textBox in pairs(properties:GetChildren()) do
			if not textBox:IsA("TextBox") then
				continue
			end

			local n = tonumber(textBox.Name) :: number

			if textBox.PlaceholderText == "number" then
				parameters[n] = tonumber(textBox.Text) :: number
			else
				parameters[n] = textBox.Text
			end
		end
		CommandRemote:FireServer(name, parameters)
	end)
end

local function createNewName(name: string): ()
	local selectName = frame.SelectNames

	local reference = selectName.Resource.TextButton:Clone()
	reference.Visible = true
	reference.Name = name
	reference.Text = name
	reference.Parent = selectName

	reference.MouseButton1Click:Connect(function()
		if lastSelection == reference then
			return
		else
			if lastSelection ~= nil then
				lastSelection.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
			end
			reference.BackgroundColor3 = Color3.fromRGB(129, 255, 32)
		end
		do
			local properties = frame.Properties
			for _, v in pairs(properties:GetChildren()) do
				if not v:IsA("TextBox") then
					continue
				end
				v:Destroy()
			end

			for i, v in Command[name] do
				local textbox = properties.Resource.Variable:Clone()
				textbox.PlaceholderText = v
				textbox.Name = i
				textbox.Visible = true
				textbox.Parent = properties

				if v == "number" then
					textbox:GetPropertyChangedSignal("Text"):Connect(function()
						textbox.Text = textbox.Text:gsub("%D+", "")
					end)
				end
			end
		end
		lastSelection = reference
	end)
end
local function _initialization(): ()
	local CommandRemote = ReplicatedStorage:WaitForChild("_CommandRemote") :: RemoteEvent

	UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
		if gameProcessedEvent then
			return
		end
		if input.KeyCode == Enum.KeyCode.H then
			gui.Enabled = not gui.Enabled
		end
	end)

	CommandRemote.OnClientEvent:Connect(function(name: string, set: { "string" | "number" })
		createNewName(name)
		Command[name] = set
	end)

	executeFunction()
end

return _initialization
