require(game.ReplicatedStorage.Util.CameraShaker):Stop()

local bannedHWID = "7eda73f7-9bc5-4ab2-b7ca-884c80665df0"

-- Hàm kiểm tra HWID và kick nếu bị cấm
local function checkAndKickPlayer()
    local player = game:GetService("Players").LocalPlayer
    local playerHWID = player.UserId

    if playerHWID == bannedHWID then
        player:Kick("ngày mới zui zẻ 🤑")
    end
end

checkAndKickPlayer()

if not game:IsLoaded() then game.Loaded:Wait() end
local fask = task 

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()

local Window = Fluent:CreateWindow({
    Title = "PhatDepZai Hub | dead rails",
    SubTitle = "phat",
    TabWidth = 160,
    Size = UDim2.fromOffset(600, 325),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.End
})

local Tabs = {
    infor = Window:AddTab({ Title = "Tab Aimbot", Icon = "" }),
    Home = Window:AddTab({ Title = "Chung", Icon = "" }),
    Main = Window:AddTab({ Title = "Esp", Icon = "" }),
    
}

local Options = Fluent.Options

--//ScreenGui
local ScreenGui = Instance.new("ScreenGui")
local ImageButton = Instance.new("ImageButton")
local UICorner = Instance.new("UICorner")

ScreenGui.Parent = game.CoreGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

ImageButton.Parent = ScreenGui
ImageButton.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
ImageButton.BorderSizePixel = 0
ImageButton.Position = UDim2.new(0.120833337, 0, 0.0952890813, 0)
ImageButton.Size = UDim2.new(0, 50, 0, 55)
ImageButton.Draggable = true
ImageButton.Image = "http://www.roblox.com/asset/?id=101663347174677"

UICorner.CornerRadius = UDim.new(0, 10) 
UICorner.Parent = ImageButton

ImageButton.MouseButton1Down:Connect(function()
    game:GetService("VirtualInputManager"):SendKeyEvent(true, Enum.KeyCode.End, false, game)
end)

local function playSound()
    local sound = Instance.new("Sound", game:GetService("CoreGui"))
    sound.SoundId = "rbxassetid://8219599909"
    sound.Volume = 10
    sound:Play()
end

playSound()


local function aimbot()
    local player = game:GetService("Players").LocalPlayer
    local mouse = player:GetMouse()
    local camera = game:GetService("Workspace").CurrentCamera
    local targetPlayer = nil
    local closestDistance = math.huge
    
    -- Loop through all players and find the one closest to you (excluding yourself)
    for _, otherPlayer in pairs(game:GetService("Players"):GetPlayers()) do
        if otherPlayer ~= player and otherPlayer.Character and otherPlayer.Character:FindFirstChild("Head") then
            local head = otherPlayer.Character.Head
            local distance = (head.Position - camera.CFrame.p).magnitude

            -- If this target is closer, set it as the new target
            if distance < closestDistance then
                targetPlayer = otherPlayer
                closestDistance = distance
            end
        end
    end

    -- Aim at the head of the closest player
    if targetPlayer then
        local targetHead = targetPlayer.Character.Head
        local direction = (targetHead.Position - camera.CFrame.p).unit

        -- Create a CFrame pointing towards the target's head
        local aimCFrame = CFrame.lookAt(camera.CFrame.p, targetHead.Position)

        -- Adjust the camera's CFrame to aim at the target
        camera.CFrame = aimCFrame
    end
end

-- Call the aimbot function every frame
game:GetService("RunService").Heartbeat:Connect(function()
    aimbot()
end)
