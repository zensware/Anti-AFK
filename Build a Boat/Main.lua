-- Create main GUI components
local screenGui = Instance.new("ScreenGui")
local mainFrame = Instance.new("Frame")
local titleLabel = Instance.new("TextLabel")
local statsLabel = Instance.new("TextLabel")
local statusLabel = Instance.new("TextLabel")
local creditsLabel = Instance.new("TextLabel")
local closeButton = Instance.new("TextButton")
local antiAfkButton = Instance.new("TextButton")
local autoFarmButton = Instance.new("TextButton")

local uiCornerMain = Instance.new("UICorner")
local uiStrokeMain = Instance.new("UIStroke")
local uiPaddingMain = Instance.new("UIPadding")

local uiCornerClose = Instance.new("UICorner")
local uiStrokeClose = Instance.new("UIStroke")

local uiCornerToggle = Instance.new("UICorner")

-- Set parent for screenGui
screenGui.Parent = game.CoreGui
screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

-- Main frame properties
mainFrame.Parent = screenGui
mainFrame.Active = true
mainFrame.Draggable = true
mainFrame.BackgroundColor3 = Color3.fromRGB(24, 24, 24)
mainFrame.Position = UDim2.new(0.3, 0, 0.2, 0)
mainFrame.Size = UDim2.new(0, 400, 0, 300)
mainFrame.BorderSizePixel = 0

-- Apply rounded corners, stroke, and padding to main frame
uiCornerMain.Parent = mainFrame
uiCornerMain.CornerRadius = UDim.new(0, 15)
uiStrokeMain.Parent = mainFrame
uiStrokeMain.Color = Color3.fromRGB(35, 35, 35)
uiStrokeMain.Thickness = 2

uiPaddingMain.Parent = mainFrame
uiPaddingMain.PaddingLeft = UDim.new(0, 20)
uiPaddingMain.PaddingRight = UDim.new(0, 20)
uiPaddingMain.PaddingTop = UDim.new(0, 20)
uiPaddingMain.PaddingBottom = UDim.new(0, 20)

-- Title label properties
titleLabel.Parent = mainFrame
titleLabel.BackgroundTransparency = 1
titleLabel.Size = UDim2.new(1, -40, 0, 40)  -- Adjusted to make space for the close button
titleLabel.Font = Enum.Font.GothamBold
titleLabel.Text = "zensware.com | BBT"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextSize = 24
titleLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Stats label properties
statsLabel.Parent = mainFrame
statsLabel.BackgroundTransparency = 1
statsLabel.Position = UDim2.new(0, 0, 0.2, 0)
statsLabel.Size = UDim2.new(1, 0, 0, 20)
statsLabel.Font = Enum.Font.Gotham
statsLabel.Text = "User: " .. game.Players.LocalPlayer.Name .. " | Ingame Time: 0s"
statsLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statsLabel.TextSize = 14
statsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Status label properties
statusLabel.Parent = mainFrame
statusLabel.BackgroundTransparency = 1
statusLabel.Position = UDim2.new(0, 0, 0.35, 0)
statusLabel.Size = UDim2.new(1, 0, 0.3, 44)
statusLabel.Font = Enum.Font.Gotham
statusLabel.Text = "Status: Inactive"
statusLabel.TextColor3 = Color3.fromRGB(200, 200, 200)
statusLabel.TextSize = 14
statusLabel.TextWrapped = true
statusLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Credits label properties
creditsLabel.Parent = mainFrame
creditsLabel.BackgroundTransparency = 1
creditsLabel.Position = UDim2.new(0, 0, 0.85, 0)
creditsLabel.Size = UDim2.new(1, 0, 0, 21)
creditsLabel.Font = Enum.Font.Gotham
creditsLabel.Text = "Made by zensware"
creditsLabel.TextColor3 = Color3.fromRGB(150, 150, 150)
creditsLabel.TextSize = 12
creditsLabel.TextXAlignment = Enum.TextXAlignment.Left

-- Close button properties
closeButton.Parent = mainFrame
closeButton.BackgroundColor3 = Color3.fromRGB(255, 87, 34)
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
uiStrokeClose.Color = Color3.fromRGB(255, 87, 34)
uiStrokeClose.Thickness = 2

-- Anti-AFK toggle button properties
antiAfkButton.Parent = mainFrame
antiAfkButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
antiAfkButton.Position = UDim2.new(0.1, 0, 0.6, 0)
antiAfkButton.Size = UDim2.new(0, 150, 0, 40)
antiAfkButton.Font = Enum.Font.GothamBold
antiAfkButton.Text = "Activate Anti-AFK"
antiAfkButton.TextColor3 = Color3.fromRGB(255, 255, 255)
antiAfkButton.TextSize = 16
antiAfkButton.BorderSizePixel = 0

-- Apply rounded corners to anti-AFK button
uiCornerToggle.Parent = antiAfkButton
uiCornerToggle.CornerRadius = UDim.new(0, 10)

-- Auto Farm toggle button properties
autoFarmButton.Parent = mainFrame
autoFarmButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
autoFarmButton.Position = UDim2.new(0.6, 0, 0.6, 0)
autoFarmButton.Size = UDim2.new(0, 150, 0, 40)
autoFarmButton.Font = Enum.Font.GothamBold
autoFarmButton.Text = "Activate Auto Farm"
autoFarmButton.TextColor3 = Color3.fromRGB(255, 255, 255)
autoFarmButton.TextSize = 16
autoFarmButton.BorderSizePixel = 0

-- Apply rounded corners to auto farm button
uiCornerToggle.Parent = autoFarmButton
uiCornerToggle.CornerRadius = UDim.new(0, 10)

-- Close button functionality
closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Anti-AFK functionality
local virtualUser = game:service('VirtualUser')
local antiAFKEnabled = false
local ingameTime = 0

game:service('Players').LocalPlayer.Idled:connect(function()
    if antiAFKEnabled then
        virtualUser:CaptureController()
        virtualUser:ClickButton2(Vector2.new())
        statusLabel.Text = "Roblox tried to kick you, but we prevented it!"
        wait(2)
        statusLabel.Text = "Status: Active"
    end
end)

-- Update ingame time every second
spawn(function()
    while true do
        wait(1)
        ingameTime = ingameTime + 1
        statsLabel.Text = "User: " .. game.Players.LocalPlayer.Name .. " | Ingame Time: " .. ingameTime .. "s"
    end
end)

-- Toggle Anti-AFK functionality
antiAfkButton.MouseButton1Click:Connect(function()
    antiAFKEnabled = not antiAFKEnabled
    if antiAFKEnabled then
        antiAfkButton.Text = "Deactivate Anti-AFK"
        antiAfkButton.BackgroundColor3 = Color3.fromRGB(244, 67, 54)
        statusLabel.Text = "Status: Active"
    else
        antiAfkButton.Text = "Activate Anti-AFK"
        antiAfkButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
        statusLabel.Text = "Status: Inactive"
    end
end)

-- Auto Farm functionality
local autoFarmEnabled = false

local function autoFarm()
    if autoFarmEnabled then
        local players = game:GetService("Players")
        local plr = players.LocalPlayer
        local tween = game:GetService("TweenService")
        game.Workspace.Gravity = 0.5 -- reduces glitchiness

        local function main()
            local humroot = plr.Character:WaitForChild("HumanoidRootPart")
            local startTween = tween:Create(humroot, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(-51.3946571, 67.3164978, 814.888123, -0.999501824, -0.00451373775, 0.0312365349, -8.62000427e-09, 0.989720345, 0.14301616, -0.0315609723, 0.142944917, -0.989227295)})
            startTween:Play()
            startTween.Completed:Wait()
            local mainTween = tween:Create(humroot, TweenInfo.new(20.50, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = CFrame.new(-77.0485153, 82.6013031, 8625.86719, -0.995574772, 0.022579968, -0.0912195817, -4.97565011e-09, 0.970703065, 0.240282282, 0.0939726979, 0.23921898, -0.966407478)})
            mainTween:Play()
            mainTween.Completed:Wait()
            local endTween = tween:Create(humroot, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, false, 0), {CFrame = game:GetService("Workspace").BoatStages.NormalStages.TheEnd.GoldenChest.Trigger.CFrame})
            endTween:Play()
            endTween.Completed:Wait()
        end

        main()

        plr.CharacterAdded:Connect(function(char)
            char:WaitForChild("HumanoidRootPart")
            main()
        end)
    end
end

-- Toggle Auto Farm functionality
autoFarmButton.MouseButton1Click:Connect(function()
    autoFarmEnabled = not autoFarmEnabled
    if autoFarmEnabled then
        autoFarmButton.Text = "Deactivate Auto Farm"
        autoFarmButton.BackgroundColor3 = Color3.fromRGB(244, 67, 54)
        autoFarm()
    else
        autoFarmButton.Text = "Activate Auto Farm"
        autoFarmButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
    end
end)

-- Initialize buttons color
antiAfkButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
autoFarmButton.BackgroundColor3 = Color3.fromRGB(76, 175, 80)
