repeat task.wait() until game:IsLoaded()
local Far = false
local UFast = false
local Float = false
local Gravity = false
local originalGravity = game.workSpace.Gravity
local originalWalkSpeed = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
local originalJumpPower = game.Players.LocalPlayer.Character.Humanoid.JumpPower
local Part = Instance.new("Part")
Part.Size = Vector3.new(2, 0.2, 1.5)
Part.Material = Enum.Material.Grass
Part.Anchored = true
Part.Transparency = 1
Part.Parent = workspace
local function updatePartPosition()
    local character = game.Players.LocalPlayer.Character
    local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
    
    if humanoidRootPart and Float then
        Part.CFrame = humanoidRootPart.CFrame * CFrame.new(0, -3.1, 0)
    else
        Part.CFrame = CFrame.new(0, -10000, 0)
    end
end
game:GetService("RunService").RenderStepped:Connect(updatePartPosition)
local function updateGravity()
    if Gravity then
        game.workspace.Gravity = 0
    else

    end
end
game:GetService("RunService").RenderStepped:Connect(updateGravity)
local function UniqueTp(a, b, c, speedoftpNTP)
    local hrd = game.Players.LocalPlayer.Character.HumanoidRootPart
    local p = hrd.Position
    local currentPos = Vector3.new(p.x, p.y, p.z)
    local targetPos = Vector3.new(a, b, c)
    
    local direction = (targetPos - currentPos).Unit
    local distance = (targetPos - currentPos).Magnitude
    local steps = math.floor(distance / speedoftpNTP) 
    for i = 1, steps do
        currentPos = currentPos + direction * speedoftpNTP 
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(currentPos)
        task.wait()
    end
end
local function Tween(posX, posY, posZ, speed)
    tweenInfo = TweenInfo.new(speed, Enum.EasingStyle.Linear)
    tween = tweenService:Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, tweenInfo, {CFrame = CFrame.new(posX, posY, posZ)})
    tween:Play()
end
local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = _G.ScriptName .. " v." .. _G.VersionNGen1,
    SubTitle = "by TTJY",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = false,
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.RightControl
})

local Tabs = {
    Main = Window:AddTab({ Title = "Main UI TEST", Icon = "" }),
    Settings = Window:AddTab({ Title = "Settings UI TEST", Icon = "settings" }),
    Developer = Window:AddTab({ Title = "Developer", Icon = "" }),
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent", -- Optional
        Duration = 5 -- Set to nil to make the notification not disappear
    })



    Tabs.Main:AddParagraph({
        Title = "Paragraph",
        Content = "This is a paragraph.\nSecond line!"
    })



    Tabs.Main:AddButton({
        Title = "Button",
        Description = "Very important button",
        Callback = function()
            Window:Dialog({
                Title = "Title",
                Content = "This is a dialog",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                            print("Confirmed the dialog.")
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                            print("Cancelled the dialog.")
                        end
                    }
                }
            })
        end
    })



    local Toggle = Tabs.Main:AddToggle("MyToggle", {Title = "Toggle", Default = false })

    Toggle:OnChanged(function()
        print("Toggle changed:", Options.MyToggle.Value)
    end)

    Options.MyToggle:SetValue(false)


    
    local Slider = Tabs.Main:AddSlider("Slider", {
        Title = "Slider",
        Description = "This is a slider",
        Default = 2,
        Min = 0,
        Max = 5,
        Rounding = 1,
        Callback = function(Value)
            print("Slider was changed:", Value)
        end
    })

    Slider:OnChanged(function(Value)
        print("Slider changed:", Value)
    end)

    Slider:SetValue(3)



    local Dropdown = Tabs.Main:AddDropdown("Dropdown", {
        Title = "Dropdown",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = false,
        Default = 1,
    })

    Dropdown:SetValue("four")

    Dropdown:OnChanged(function(Value)
        print("Dropdown changed:", Value)
    end)


    
    local MultiDropdown = Tabs.Main:AddDropdown("MultiDropdown", {
        Title = "Dropdown",
        Description = "You can select multiple values.",
        Values = {"one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen"},
        Multi = true,
        Default = {"seven", "twelve"},
    })

    MultiDropdown:SetValue({
        three = true,
        five = true,
        seven = false
    })

    MultiDropdown:OnChanged(function(Value)
        local Values = {}
        for Value, State in next, Value do
            table.insert(Values, Value)
        end
        print("Mutlidropdown changed:", table.concat(Values, ", "))
    end)



    local Colorpicker = Tabs.Main:AddColorpicker("Colorpicker", {
        Title = "Colorpicker",
        Default = Color3.fromRGB(96, 205, 255)
    })

    Colorpicker:OnChanged(function()
        print("Colorpicker changed:", Colorpicker.Value)
    end)
    
    Colorpicker:SetValueRGB(Color3.fromRGB(0, 255, 140))



    local TColorpicker = Tabs.Main:AddColorpicker("TransparencyColorpicker", {
        Title = "Colorpicker",
        Description = "but you can change the transparency.",
        Transparency = 0,
        Default = Color3.fromRGB(96, 205, 255)
    })

    TColorpicker:OnChanged(function()
        print(
            "TColorpicker changed:", TColorpicker.Value,
            "Transparency:", TColorpicker.Transparency
        )
    end)



    local Keybind = Tabs.Main:AddKeybind("Keybind", {
        Title = "KeyBind",
        Mode = "Toggle", -- Always, Toggle, Hold
        Default = "LeftControl", -- String as the name of the keybind (MB1, MB2 for mouse buttons)

        -- Occurs when the keybind is clicked, Value is `true`/`false`
        Callback = function(Value)
            print("Keybind clicked!", Value)
        end,

        -- Occurs when the keybind itself is changed, `New` is a KeyCode Enum OR a UserInputType Enum
        ChangedCallback = function(New)
            print("Keybind changed!", New)
        end
    })

    -- OnClick is only fired when you press the keybind and the mode is Toggle
    -- Otherwise, you will have to use Keybind:GetState()
    Keybind:OnClick(function()
        print("Keybind clicked:", Keybind:GetState())
    end)

    Keybind:OnChanged(function()
        print("Keybind changed:", Keybind.Value)
    end)

    task.spawn(function()
        while true do
            wait(1)

            -- example for checking if a keybind is being pressed
            local state = Keybind:GetState()
            if state then
                print("Keybind is being held down")
            end

            if Fluent.Unloaded then break end
        end
    end)

    Keybind:SetValue("MB2", "Toggle") -- Sets keybind to MB2, mode to Hold


    local Input = Tabs.Main:AddInput("Input", {
        Title = "Input",
        Default = "Default",
        Placeholder = "Placeholder",
        Numeric = false, -- Only allows numbers
        Finished = false, -- Only calls callback when you press enter
        Callback = function(Value)
            print("Input changed:", Value)
        end
    })

    Input:OnChanged(function()
        print("Input updated:", Input.Value)
    end)

    --DEVELOPER
    Tabs.Developer:AddSection("Developer Anti Cheat Detector")
    Tabs.Main:AddButton({
        Title = "Teleport V1",
        Description = "Instance | Normal | Front",
        Callback = function()
            if Far then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(100, 0, 0)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(10, 0, 0)
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V1",
        Description = "Instance | Normal | Up",
        Callback = function()
            if Far then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 100, 0)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0, 10, 0)
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V1",
        Description = "Instance | Normal | X, Y",
        Callback = function()
            if Far then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(100, 100, 0)
            else
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(10, 10, 0)
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V2",
        Description = "Tween | Unique | Front",
        Callback = function()
            if Far then
                if UFast then
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                else
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                end
            else
                if UFast then
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                else
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                end
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V2",
        Description = "Tween | Unique | Up",
        Callback = function()
            if Far then
                if UFast then
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                else
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                end
            else
                if UFast then
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                else
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                end
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V2",
        Description = "Tween | Unique | X, Y",
        Callback = function()
            if Far then
                if UFast then
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                else
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                end
            else
                if UFast then
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                else
                    UniqueTp(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                end
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V3",
        Description = "Tween | Normal | Front",
        Callback = function()
            if Far then
                if UFast then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                end
            else
                if UFast then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                end
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V3",
        Description = "Tween | Normal | Up",
        Callback = function()
            if Far then
                if UFast then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                end
            else
                if UFast then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                end
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Teleport V3",
        Description = "Tween | Normal | X, Y",
        Callback = function()
            if Far then
                if UFast then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 100, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                end
            else
                if UFast then
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 1)
                else
                    Tween(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z, 10)
                end
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Gravity",
        Description = "0 | Notify",
        Callback = function()
            game.workSpace.Gravity = 0
            task.wait(2)
            if game.workSpace.Gravity == 0 then
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "No Anti Cheat Found For Gravity",
                    SubContent = "",
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "Anti Cheat Found For Gravity",
                    SubContent = "",
                    Duration = 5
                })
            end
            task.wait()
            game.workSpace.Gravity = originalGravity
        end
    })
    Tabs.Main:AddButton({
        Title = "WalkSpeed",
        Description = "1000 | Notify",
        Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 1000
            task.wait(2)
            if game.Players.LocalPlayer.Character.Humanoid.WalkSpeed == 1000 then
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "No Anti Cheat Found For WalkSpeed",
                    SubContent = "",
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "Anti Cheat Found For WalkSpeed",
                    SubContent = "",
                    Duration = 5
                })
            end
            task.wait()
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = originalWalkSpeed
        end
    })
    Tabs.Main:AddButton({
        Title = "JumpPower",
        Description = "1000 | Notify",
        Callback = function()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = 1000
            task.wait(2)
            if game.Players.LocalPlayer.Character.Humanoid.JumpPower == 1000 then
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "No Anti Cheat Found For JumpPower",
                    SubContent = "",
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "Anti Cheat Found For JumpPower",
                    SubContent = "",
                    Duration = 5
                })
            end
            task.wait()
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = originalJumpPower
        end
    })
    Tabs.Main:AddButton({
        Title = "Create Part",
        Description = "WorkSpace | Notify | Near",
        Callback = function()
            local PartWST = Instance.new("Part")
            PartWST.Size = Vector3.new(2, 0.2, 1.5)
            PartWST.Material = Enum.Material.Grass
            PartWST.Anchored = true
            PartWST.Transparency = 0
            PartWST.CFrame = CFrame.new(game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.X + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Y + 10, game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.Position.Z)
            PartWST.Parent = workspace
        end
    })
    Tabs.Main:AddButton({
        Title = "Create ScreenGui V1",
        Description = "PlayerGui | Notify | Kickable",
        Callback = function()
            local SGui = Instance.new("ScreenGui")
            SGui.Parent = game.Players.LocalPlayer.PlayerGui
            task.wait(5)
            if SGui then
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "No Anti Cheat Found",
                    SubContent = "",
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "Anti Cheat Found | ScreenGui being delete from the PlayerGui",
                    SubContent = "",
                    Duration = 5
                })
            end
        end
    })
    Tabs.Main:AddButton({
        Title = "Create ScreenGui V2",
        Description = "CoreGui | Notify | Kickable",
        Callback = function()
            local SGui2 = Instance.new("ScreenGui")
            SGui2.Parent = game.CoreGui
            task.wait(5)
            if SGui2 then
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "No Anti Cheat Found",
                    SubContent = "",
                    Duration = 5
                })
            else
                Fluent:Notify({
                    Title = "Anti Cheat Detector",
                    Content = "Anti Cheat Found | ScreenGui being delete from the CoreGui",
                    SubContent = "",
                    Duration = 5
                })
            end
        end
    })
    Tabs.Developer:AddSection("Developer Bypass")
    Tabs.Developer:AddSection("Developer Clipboard")
    Tabs.Developer:AddSection("Developer Tools")
    Tabs.Developer:AddSection("Setting")
    local Toggle = Tabs.Developer:AddToggle("MyToggle", {Title = "Far", Default = false })

    Toggle:OnChanged(function()
        Far = Options.MyToggle.Value
    end)
    local Toggle = Tabs.Developer:AddToggle("MyToggle2", {Title = "UFast", Default = false })

    Toggle:OnChanged(function()
        UFast = Options.MyToggle2.Value
    end)
    local Toggle = Tabs.Developer:AddToggle("MyToggle3", {Title = "Float", Default = false })

    Toggle:OnChanged(function()
        Float = Options.MyToggle3.Value
    end)
    local Toggle = Tabs.Developer:AddToggle("MyToggle4", {Title = "Gravity 0", Default = false })

    Toggle:OnChanged(function()
        Gravity = Options.MyToggle3.Value
    end)
end
-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- InterfaceManager (Allows you to have a interface managment system)

-- Hand the library over to our managers
SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)

-- Ignore keys that are used by ThemeManager.
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings()

-- You can add indexes of elements the save manager should ignore
SaveManager:SetIgnoreIndexes({})

-- use case for doing it this way:
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
InterfaceManager:SetFolder("FluentScriptHub")
SaveManager:SetFolder("FluentScriptHub/specific-game")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)
SaveManager:BuildConfigSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})

-- You can use the SaveManager:LoadAutoloadConfig() to load a config
-- which has been marked to be one that auto loads!
SaveManager:LoadAutoloadConfig()
