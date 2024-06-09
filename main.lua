-- Create main GUI components
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local statusLabel = Instance.new("TextLabel")
local creditsLabel = Instance.new("TextLabel")
local closeButton = Instance.new("TextButton")

local uiCornerMain = Instance.new("UICorner")
local uiStrokeMain = Instance.new("UIStroke")
local uiPaddingMain = Instance.new("UIPadding")

local uiCornerClose = Instance.new("UICorner")
local uiStrokeClose = Instance.new("UIStroke")

-- Set parent for screenGui
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame properties
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.Position = UDim2.new(0.7, 0, 0.1, 0)
mainFrame.Size = UDim2.new(0, 400, 0, 200)
mainFrame.BorderSizePixel = 0

-- Apply rounded corners, stroke, and padding to main frame
uiCornerMain.Parent = mainFrame
uiCornerMain.CornerRadius = UDim.new(0, 15)
uiStrokeMain.Parent = mainFrame
uiStrokeMain.Color = Color3.fromRGB(60, 60, 60)
uiStrokeMain.Thickness = 2

uiPaddingMain.Parent = mainFrame
uiPaddingMain.PaddingLeft = UDim.new(0, 10)
uiPaddingMain.PaddingRight = UDim.new(0, 10)
uiPaddingMain.PaddingTop = UDim.new(0, 10)
uiPaddingMain.PaddingBottom = UDim.new(0, 10)

-- Title label properties
titleLabel.Parent = mainFrame
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(1, -40, 0, 50)  -- Adjusted to make space for the close button
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "Anti Afk"
titleLabel.TextColor3 = Color3.fromRGB(0, 170, 255)
titleLabel.TextSize = 24
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Status label properties
statusLabel.Parent = mainFrame
statusLabel.BackgroundTransparency = 1
statusLabel.Position = UDim2.new(0, 0, 0.32, 0)
statusLabel.Size = UDim2.new(1, 0, 0, 44)
statusLabel.Font = Enum.Font.Gotham
statusLabel.Text = "Status: Active"
statusLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
statusLabel.TextSize = 20
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Credits label properties
creditsLabel.Parent = mainFrame
creditsLabel.BackgroundTransparency = 1
creditsLabel.Position = UDim2.new(0, 0, 0.8, 0)
creditsLabel.Size = UDim2.new(1, 0, 0, 21)
creditsLabel.Font = Enum.Font.Gotham
creditsLabel.Text = "Made by zensware"
creditsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
creditsLabel.TextSize = 16
creditsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close button properties
closeButton.Parent = mainFrame
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.Position = UDim2.new(1, -30, 0, 10)
closeButton.Size = UDim2.new(0, 20, 0, 20)
closeButton.Font = Enum.Font.GothamBold
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextSize = 14
closeButton.BorderSizePixel = 0

-- Apply rounded corners and stroke to close button
uiCornerClose.Parent = closeButton
uiCornerClose.CornerRadius = UDim.new(0, 5)
uiStrokeClose.Parent = closeButton
uiStrokeClose.Color = Color3.fromRGB(200, 0, 0)
uiStrokeClose.Thickness = 2

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Anti-AFK functionality
local virtualUser = game:service('VirtualUser')
game:service('Players').LocalPlayer.Idled:connect(function()
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
    statusLabel.Text = "Roblox tried to kick you, but we prevented it!"
    wait(2)
    statusLabel.Text = "Status: Active"
end)
