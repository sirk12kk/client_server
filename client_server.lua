-- Client Script: Place this in StarterPlayerScripts
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")

-- Fetch Remote Events
local RemoteEvents = {
    GiveBazooka = ReplicatedStorage:WaitForChild("GiveBazooka"),
    ExplodePlayer = ReplicatedStorage:WaitForChild("ExplodePlayer"),
    SpawnPart = ReplicatedStorage:WaitForChild("SpawnPart"),
    RainbowCharacter = ReplicatedStorage:WaitForChild("RainbowCharacter"),
    TeleportPlayer = ReplicatedStorage:WaitForChild("TeleportPlayer")
}

-- Create GUI
local ScreenGui = Instance.new("ScreenGui")
local MainFrame = Instance.new("Frame")
local TitleBar = Instance.new("TextLabel")
local MenuContent = Instance.new("Frame")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.Name = "ExploitMenu"

MainFrame.Name = "MainFrame"
MainFrame.Parent = ScreenGui
MainFrame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
MainFrame.Size = UDim2.new(0, 300, 0, 400)
MainFrame.Position = UDim2.new(0.5, -150, 0.5, -200)
MainFrame.Active = true
MainFrame.Draggable = true

TitleBar.Name = "TitleBar"
TitleBar.Parent = MainFrame
TitleBar.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
TitleBar.Size = UDim2.new(1, 0, 0, 50)
TitleBar.Font = Enum.Font.SourceSansBold
TitleBar.Text = "Exploit Menu"
TitleBar.TextColor3 = Color3.new(1, 1, 1)
TitleBar.TextSize = 20

MenuContent.Name = "MenuContent"
MenuContent.Parent = MainFrame
MenuContent.BackgroundColor3 = Color3.new(0.15, 0.15, 0.15)
MenuContent.Size = UDim2.new(1, 0, 1, -50)
MenuContent.Position = UDim2.new(0, 0, 0, 50)

-- Exploits
local exploits = {
    {name = "Give Rocket Launcher", action = function()
        RemoteEvents.GiveBazooka:FireServer()
    end},
    {name = "Explode Player", action = function()
        local targetPlayer = Players:GetPlayers()[2] -- Example: Second player
        if targetPlayer then
            RemoteEvents.ExplodePlayer:FireServer(targetPlayer)
        end
    end},
    {name = "Spawn Part", action = function()
        local position = game.Players.LocalPlayer.Character.HumanoidRootPart.Position + Vector3.new(0, 5, 0)
        RemoteEvents.SpawnPart:FireServer(position)
    end},
    {name = "Rainbow Character", action = function()
        RemoteEvents.RainbowCharacter:FireServer()
    end},
    {name = "Teleport to Player", action = function()
        local targetPlayer = Players:GetPlayers()[2] -- Example: Second player
        if targetPlayer then
            RemoteEvents.TeleportPlayer:FireServer(targetPlayer)
        end
    end},
}

-- Create Buttons
for i, exploit in ipairs(exploits) do
    local Button = Instance.new("TextButton")
    Button.Name = exploit.name .. "Button"
    Button.Parent = MenuContent
    Button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
    Button.Size = UDim2.new(1, -10, 0, 40)
    Button.Position = UDim2.new(0, 5, 0, (i - 1) * 45 + 5)
    Button.Font = Enum.Font.SourceSansBold
    Button.Text = exploit.name
    Button.TextColor3 = Color3.new(1, 1, 1)
    Button.TextSize = 18
    Button.MouseButton1Click:Connect(exploit.action)
end
