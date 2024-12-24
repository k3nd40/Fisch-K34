repeat wait() until game:IsLoaded()

local StarterGui = game:GetService("StarterGui") -- not sure why you used CoreGui
local bindable = Instance.new("BindableFunction")

print("Loading gui....")


game:GetService("StarterGui"):SetCore("SendNotification", { 
    Title = "Loding....!";
    Text = "";
    Icon = "rbxthumb://type=Asset&id=5107182114&w=150&h=150";
    Duration = 4;
})


wait(2)

game:GetService("StarterGui"):SetCore("SendNotification",{ 	

Title = "Loaded!",  	

Text = "",

})

game:GetService("StarterGui"):SetCore("SendNotification",{ 	

Title = "Some dont work",  	

Text = "Dm me!",

})

local Player = game:GetService("Players")
local LocalPlayer = Player.LocalPlayer
local Char = LocalPlayer.Character
local Humanoid = Char.Humanoid
local VirtualInputManager = game:GetService("VirtualInputManager")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GuiService = game:GetService("GuiService")

equipitem = function(v)
if LocalPlayer.Backpack:FindFirstChild(v) then
    local a = LocalPlayer.Backpack:FindFirstChild(v)
        Humanoid:EquipTool(a)
    end
end



print('gui loaded!')
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("K Hub - Fisch 🎣", "DarkTheme")

local Tab = Window:NewTab("Main")
local Section = Tab:NewSection("This script was in testing")
local Section = Tab:NewSection("Dev:Cfr2me")
local Section = Tab:NewSection("Ty ui from kavo!")


local Tab = Window:NewTab("Auto Farm")
local Section = Tab:NewSection("Farm")

-- AutoCast
Section:NewToggle("Auto Cast", "", function(v)
_G.AutoCast = v
     pcall(function()
while _G.AutoCast do wait()
    local Rod = Char:FindFirstChildOfClass("Tool")
                task.wait(.1)
                    Rod.events.cast:FireServer(100,1)
        end
    end)
end)

local Section = Tab:NewSection("Autofarm Settings")
Section:NewToggle("Auto Shake", "", function(v)
    _G.AutoShake = v
pcall(function()
while _G.AutoShake do wait()
              task.wait(0.01)
                local PlayerGUI = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")
                local shakeUI = PlayerGUI:FindFirstChild("shakeui")
                if shakeUI and shakeUI.Enabled then
                    local safezone = shakeUI:FindFirstChild("safezone")
                    if safezone then
                        local button = safezone:FindFirstChild("button")
                        if button and button:IsA("ImageButton") and button.Visible then
                                GuiService.SelectedObject = button
                                VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.Return, false, game)
                                VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.Return, false, game)
                    end
                end
            end
        end
    end)
end)
-- AutoReel
Section:NewToggle("Auto Reel", "", function(v)
     _G.AutoReel = v
pcall(function()
    while _G.AutoReel do wait()
            for i,v in pairs(LocalPlayer.PlayerGui:GetChildren()) do
                if v:IsA "ScreenGui" and v.Name == "reel"then
                    if v:FindFirstChild "bar" then
                        wait(.15)
                            ReplicatedStorage.events.reelfinished:FireServer(100,true)
                    end
                end
            end
        end
    end)
end)

local Section = Tab:NewSection("Player Settings")
Section:NewToggle("Freeze Character", "", function(v)
    Char.HumanoidRootPart.Anchored = v
end)

-- equipitem
spawn(function()
    while wait() do
        if _G.AutoCast then
            pcall(function()
                for i,v in pairs(LocalPlayer.Backpack:GetChildren()) do
                    if v:IsA ("Tool") and v.Name:lower():find("rod") then
                    equipitem(v.Name)
                    end
                end
            end)
        end
    end
end)
local Tab = Window:NewTab("Shop")
local Section = Tab:NewSection("Coming soon nigga")


local Tab = Window:NewTab("Misc")
local Section = Tab:NewSection("Rendering")
Section:NewButton("Fps boost", "", function()
    local timeBegan = tick()
for i,v in ipairs(workspace:GetDescendants()) do
if v:IsA("BasePart") then
v.Material = "SmoothPlastic"
end
end
for i,v in ipairs(game:GetService("Lighting"):GetChildren()) do
v:Destroy()
end
local timeEnd = tick() - timeBegan
local timeMS = math.floor(timeEnd*1000)
print("SmoothFPS loaded successfully in " .. timeMS .. "ms")
end)


local Section = Tab:NewSection("Player")
Section:NewSlider("Speed", "", 500, 0, function(s) -- 500 (MaxValue) | 0 (MinValue)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)


local Tab = Window:NewTab("Sever hopping")
local Section = Tab:NewSection("Severs")
Section:NewButton("Sever hop", "", function()
    game:GetService("TeleportService"):Teleport(gameid, game:GetService("Players").LocalPlayer)
end)

Section:NewButton("Rejoin", "", function()
    local ts = game:GetService("TeleportService")
local p = game:GetService("Players").LocalPlayer
ts:Teleport(game.PlaceId, p)
end)



local Tab = Window:NewTab("Setting")
local Section = Tab:NewSection("Ui setting")
Section:NewKeybind("Setkeybind", "", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)

local Tab = Window:NewTab("Adds on(soon)")
local Section = Tab:NewSection("Fps/cpu check water mark")
local Section = Tab:NewSection("Make color customize gui")
local Section = Tab:NewSection("Add shop")
local Section = Tab:NewSection("Add Auto do rods quests")
local Section = Tab:NewSection("Add teleport island/npc")
local Section = Tab:NewSection("Add auto event")
local Section = Tab:NewSection("Change gui")
local Section = Tab:NewSection("Make better auto farm")
local Section = Tab:NewSection("Add more fps boost funtions")
local Section = Tab:NewSection("Add game/player status")
local Section = Tab:NewSection("Add auto nukes")
local Section = Tab:NewSection("Add webhook")
local Section = Tab:NewSection("Add treasure farm")
local Section = Tab:NewSection("Add levels farm")
local Section = Tab:NewSection("Add mobile support")
local Section = Tab:NewSection("Add settings/misc funtions")
