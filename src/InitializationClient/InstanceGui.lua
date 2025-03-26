--!strict
local Players = game:GetService("Players")

local plr = Players.LocalPlayer or Players.PlayerAdded:Wait()
local plrGui = plr:WaitForChild("PlayerGui")
--

export type InstanceGui = ScreenGui & {
	Frame: Frame & {
		Execute: TextButton,
		Properties: ScrollingFrame & {
			Resource: Folder & {
				Variable: TextBox & {
					UIAspectRatioConstraint: UIAspectRatioConstraint,
					UIStroke: UIStroke,
				},
			},
			UIListLayout: UIListLayout,
		},
		SelectNames: ScrollingFrame & {
			UIListLayout: UIListLayout,
			Resource: Folder & {
				TextButton: TextButton,
			},
		},
	},
}

local function _instanceGui(): InstanceGui
	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = plrGui

	local Frame = Instance.new("Frame")
	Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Frame.BorderSizePixel = 0
	Frame.Position = UDim2.new(0.15, 0, 0.065, 0)
	Frame.Size = UDim2.new(0, 726, 0, 62)
	Frame.Parent = ScreenGui

	local SelectNames = Instance.new("ScrollingFrame")
	SelectNames.Active = true
	SelectNames.AutomaticCanvasSize = Enum.AutomaticSize.Y
	SelectNames.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SelectNames.BorderSizePixel = 0
	SelectNames.CanvasSize = UDim2.new(0, 0, 0, 0)
	SelectNames.Name = "SelectNames"
	SelectNames.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	SelectNames.Size = UDim2.new(0, 198, 0, 210)
	SelectNames.Parent = Frame

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Padding = UDim.new(0.1, 0)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = SelectNames

	local Resource = Instance.new("Folder")
	Resource.Name = "Resource"
	Resource.Parent = SelectNames

	local TextButton = Instance.new("TextButton")
	TextButton.BackgroundColor3 = Color3.fromRGB(129, 255, 32)
	TextButton.BorderSizePixel = 0
	TextButton.Font = Enum.Font.SourceSans
	TextButton.Size = UDim2.new(0, 200, 0, 50)
	TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
	TextButton.TextSize = 14
	TextButton.Visible = false
	TextButton.Parent = Resource

	local Properties = Instance.new("ScrollingFrame")
	Properties.Active = true
	Properties.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Properties.BorderSizePixel = 0
	Properties.CanvasSize = UDim2.new(0, 0, 0, 0)
	Properties.Name = "Properties"
	Properties.Position = UDim2.new(0.273, 0, 0, 0)
	Properties.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)
	Properties.Size = UDim2.new(0, 436, 0, 62)
	Properties.Parent = Frame

	local Resource = Instance.new("Folder")
	Resource.Name = "Resource"
	Resource.Parent = Properties

	local Variable = Instance.new("TextBox")
	Variable.Active = false
	Variable.BackgroundColor3 = Color3.fromRGB(220, 220, 220)
	Variable.BorderSizePixel = 0
	Variable.Font = Enum.Font.SourceSans
	Variable.Name = "Variable"
	Variable.Position = UDim2.new(0.256, 0, 0.097, 0)
	Variable.Size = UDim2.new(0, 200, 0, 50)
	Variable.Text = ""
	Variable.TextColor3 = Color3.fromRGB(0, 0, 0)
	Variable.TextSize = 14
	Variable.Visible = false
	Variable.Parent = Resource

	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	UIAspectRatioConstraint.Parent = Variable

	local UIStroke = Instance.new("UIStroke")
	UIStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
	UIStroke.Parent = Variable

	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.FillDirection = Enum.FillDirection.Horizontal
	UIListLayout.HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween
	UIListLayout.Padding = UDim.new(0.1, 0)
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	UIListLayout.Parent = Properties

	local Execute = Instance.new("TextButton")
	Execute.BackgroundColor3 = Color3.fromRGB(129, 255, 32)
	Execute.BorderSizePixel = 0
	Execute.Font = Enum.Font.SourceSans
	Execute.Name = "Execute"
	Execute.Position = UDim2.new(0.89, 0, 0.097, 0)
	Execute.Size = UDim2.new(0, 79, 0, 50)
	Execute.Text = "Execute"
	Execute.TextColor3 = Color3.fromRGB(0, 0, 0)
	Execute.TextSize = 14
	Execute.Parent = Frame

	return ScreenGui :: InstanceGui
end

return _instanceGui
