
local OrionLib = loadstring(game:HttpGet(('https://raw.githubusercontent.com/shlexware/Orion/main/source')))()

local Window = OrionLib:MakeWindow({Name = "Ghost Hub", HidePremium = false, SaveConfig = true, ConfigFolder = "OrionTest"})
local Tab = Window:MakeTab({
	Name = "Cheats",
	Icon = "rbxassetid://524119279",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "Cheats"
})

OrionLib:MakeNotification({
	Name = "Hi exploiter!",
	Content = "Script loaded have fun reaking havoc on town",
	Image = "rbxassetid://524119279",
	Time = 5
})

Tab:AddButton({
	Name = "aimbot",
	Callback = function()
      		print("button pressed")
      		local dwCamera = workspace.CurrentCamera
local dwRunService = game:GetService("RunService")
local dwUIS = game:GetService("UserInputService")
local dwEntities = game:GetService("Players")
local dwLocalPlayer = dwEntities.LocalPlayer
local dwMouse = dwLocalPlayer:GetMouse()

local settings = {
    Aimbot = true,
    Aiming = false,
    Aimbot_AimPart = "Head",
    Aimbot_TeamCheck = false,
    Aimbot_Draw_FOV = true,
    Aimbot_FOV_Radius = 200,
    Aimbot_FOV_Color = Color3.fromRGB(255,255,255)
}

local fovcircle = Drawing.new("Circle")
fovcircle.Visible = settings.Aimbot_Draw_FOV
fovcircle.Radius = settings.Aimbot_FOV_Radius
fovcircle.Color = settings.Aimbot_FOV_Color
fovcircle.Thickness = 1
fovcircle.Filled = false
fovcircle.Transparency = 1

fovcircle.Position = Vector2.new(dwCamera.ViewportSize.X / 2, dwCamera.ViewportSize.Y / 2)

dwUIS.InputBegan:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        settings.Aiming = true
    end
end)

dwUIS.InputEnded:Connect(function(i)
    if i.UserInputType == Enum.UserInputType.MouseButton2 then
        settings.Aiming = false
    end
end)

dwRunService.RenderStepped:Connect(function()
    
    local dist = math.huge
    local closest_char = nil

    if settings.Aiming then

        for i,v in next, dwEntities:GetChildren() do 

            if v ~= dwLocalPlayer and
            v.Character and
            v.Character:FindFirstChild("HumanoidRootPart") and
            v.Character:FindFirstChild("Humanoid") and
            v.Character:FindFirstChild("Humanoid").Health > 0 then

                if settings.Aimbot_TeamCheck == true and
                v.Team ~= dwLocalPlayer.Team or
                settings.Aimbot_TeamCheck == false then

                    local char = v.Character
                    local char_part_pos, is_onscreen = dwCamera:WorldToViewportPoint(char[settings.Aimbot_AimPart].Position)

                    if is_onscreen then

                        local mag = (Vector2.new(dwMouse.X, dwMouse.Y) - Vector2.new(char_part_pos.X, char_part_pos.Y)).Magnitude

                        if mag < dist and mag < settings.Aimbot_FOV_Radius then

                            dist = mag
                            closest_char = char

                        end
                    end
                end
            end
        end

        if closest_char ~= nil and
        closest_char:FindFirstChild("HumanoidRootPart") and
        closest_char:FindFirstChild("Humanoid") and
        closest_char:FindFirstChild("Humanoid").Health > 0 then

            dwCamera.CFrame = CFrame.new(dwCamera.CFrame.Position, closest_char[settings.Aimbot_AimPart].Position)
        end
    end
end)
  	end    
})

Tab:AddButton({
	Name = "ESP",
	Callback = function()
       --[[
Script: ESP Script
Details: Nothing much. Its ESP Chams and the different colors are for different teams.
Creds: idk
]]
-- -----------------------------------
--  ___      _   _   _              --
-- / __| ___| |_| |_(_)_ _  __ _ ___--
-- \__ \/ -_)  _|  _| | ' \/ _` (_-<--
-- |___/\___|\__|\__|_|_||_\__, /__/--
--                         |___/    --
-- -----------------------------------
-- -----------------------------------
                                ALLYCOLOR = {0,255,255}     --//Color of the ESP  of people on the same team
                                ENEMYCOLOR =  {255,0,0}     --//Color of the ESP  of people on NOT the same team
                                TRANSPARENCY = 0.5          --//Transparency of the ESP
                                HEALTHBAR_ACTIVATED = true  --//Renders the Healthbar
--
--
 
--                          !!!Don't Change Anything Below Here Unless You Know What You're Doing!!!
 
function createFlex()
-- -----------------------------------------------------------------------------------
--[VARIABLES] //Changing may result in Errors!
players = game:GetService("Players") --//Required for PF
faces = {"Front","Back","Bottom","Left","Right","Top"} --//Every possible Enum face
currentPlayer = nil --//Used for the Team-Check
lplayer = players.LocalPlayer --//The LocalPlayer
-- -----------------------------------------------------------------------------------
players.PlayerAdded:Connect(function(p)
    currentPlayer = p
        p.CharacterAdded:Connect(function(character) --//For when a new Player joins the game 
            createESP(character)            
        end)        
end)
-- -----------------------------------------------------------------------------------
function checkPart(obj)  if (obj:IsA("Part") or obj:IsA("MeshPart")) and obj.Name~="HumanoidRootPart" then return true end end --//Check if the Part is suitable 
-- -----------------------------------------------------------------------------------
function actualESP(obj) 
    
    for i=0,5 do
        surface = Instance.new("SurfaceGui",obj) --//Creates the SurfaceGui
        surface.Face = Enum.NormalId[faces[i+1]] --//Adjusts the Face and chooses from the face table
        surface.AlwaysOnTop = true
 
        frame = Instance.new("Frame",surface)   --//Creates the viewable Frame
        frame.Size = UDim2.new(1,0,1,0)
        frame.BorderSizePixel = 0                                               
        frame.BackgroundTransparency = TRANSPARENCY
            if currentPlayer.Team == players.LocalPlayer.Team then --//Checks the Players Team
                    frame.BackgroundColor3 = Color3.new(ALLYCOLOR[1],ALLYCOLOR[2],ALLYCOLOR[3]) --//If in same Team                                         
            else
                frame.BackgroundColor3 = Color3.new(ENEMYCOLOR[1],ENEMYCOLOR[2],ENEMYCOLOR[3])  --//If in another Team
            end
                                                            
    end
end
-- -----------------------------------------------------------------------------------
function createHealthbar(hrp) 
    board =Instance.new("BillboardGui",hrp) --//Creates the BillboardGui with HumanoidRootPart as the Parent
    board.Name = "total"
    board.Size = UDim2.new(1,0,1,0)
    board.StudsOffset = Vector3.new(3,1,0)
    board.AlwaysOnTop = true
 
    bar = Instance.new("Frame",board) --//Creates the red background
    bar.BackgroundColor3 = Color3.new(255,0,0)
    bar.BorderSizePixel = 0
    bar.Size = UDim2.new(0.2,0,4,0)
    bar.Name = "total2"
                                                
    health = Instance.new("Frame",bar) --//Creates the changing green Frame
    health.BackgroundColor3 = Color3.new(0,255,0)
    health.BorderSizePixel = 0
    health.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0)
        hrp.Parent.Humanoid.Changed:Connect(function(property) --//Triggers when any Property changed
            hrp.total.total2.Frame.Size = UDim2.new(1,0,hrp.Parent.Humanoid.Health/100,0) --//Adjusts the size of the green Frame                               
        end)
end
-- -----------------------------------------------------------------------------------
function createESP(c) --//Checks and calls the proper function
    bugfix = c:WaitForChild("Head") --// *Used so the children of the character arent nil.
    for i,v in pairs(c:GetChildren()) do
        if checkPart(v) then
        actualESP(v)
        end
    end
    if HEALTHBAR_ACTIVATED then --//If the user decided to
        createHealthbar(c:WaitForChild("HumanoidRootPart")) --//Calls the function of the creation
    end
end
-- -----------------------------------------------------------------------------------
for i,people in pairs(players:GetChildren())do
    if people ~= players.LocalPlayer then
        currentPlayer = people
                                                                --//Used for Players already in the Game
        createESP(people.Character)
            people.CharacterAdded:Connect(function(character)
                createESP(character)            
            end)
    end
end
-- -----------------------------------------------------------------------------------
end --//End of the entire function
 
createFlex() --// Does exactly that :)

  	end    
})

Tab:AddToggle({
	Name = "Fullbright!",
	Callback = function()
        if not _G.FullBrightExecuted then

            _G.FullBrightEnabled = false
        
            _G.NormalLightingSettings = {
                Brightness = game:GetService("Lighting").Brightness,
                ClockTime = game:GetService("Lighting").ClockTime,
                FogEnd = game:GetService("Lighting").FogEnd,
                GlobalShadows = game:GetService("Lighting").GlobalShadows,
                Ambient = game:GetService("Lighting").Ambient
            }
        
            game:GetService("Lighting"):GetPropertyChangedSignal("Brightness"):Connect(function()
                if game:GetService("Lighting").Brightness ~= 1 and game:GetService("Lighting").Brightness ~= _G.NormalLightingSettings.Brightness then
                    _G.NormalLightingSettings.Brightness = game:GetService("Lighting").Brightness
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Brightness = 1
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("ClockTime"):Connect(function()
                if game:GetService("Lighting").ClockTime ~= 12 and game:GetService("Lighting").ClockTime ~= _G.NormalLightingSettings.ClockTime then
                    _G.NormalLightingSettings.ClockTime = game:GetService("Lighting").ClockTime
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").ClockTime = 12
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("FogEnd"):Connect(function()
                if game:GetService("Lighting").FogEnd ~= 786543 and game:GetService("Lighting").FogEnd ~= _G.NormalLightingSettings.FogEnd then
                    _G.NormalLightingSettings.FogEnd = game:GetService("Lighting").FogEnd
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").FogEnd = 786543
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("GlobalShadows"):Connect(function()
                if game:GetService("Lighting").GlobalShadows ~= false and game:GetService("Lighting").GlobalShadows ~= _G.NormalLightingSettings.GlobalShadows then
                    _G.NormalLightingSettings.GlobalShadows = game:GetService("Lighting").GlobalShadows
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").GlobalShadows = false
                end
            end)
        
            game:GetService("Lighting"):GetPropertyChangedSignal("Ambient"):Connect(function()
                if game:GetService("Lighting").Ambient ~= Color3.fromRGB(178, 178, 178) and game:GetService("Lighting").Ambient ~= _G.NormalLightingSettings.Ambient then
                    _G.NormalLightingSettings.Ambient = game:GetService("Lighting").Ambient
                    if not _G.FullBrightEnabled then
                        repeat
                            wait()
                        until _G.FullBrightEnabled
                    end
                    game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                end
            end)
        
            game:GetService("Lighting").Brightness = 1
            game:GetService("Lighting").ClockTime = 12
            game:GetService("Lighting").FogEnd = 786543
            game:GetService("Lighting").GlobalShadows = false
            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
        
            local LatestValue = true
            spawn(function()
                repeat
                    wait()
                until _G.FullBrightEnabled
                while wait() do
                    if _G.FullBrightEnabled ~= LatestValue then
                        if not _G.FullBrightEnabled then
                            game:GetService("Lighting").Brightness = _G.NormalLightingSettings.Brightness
                            game:GetService("Lighting").ClockTime = _G.NormalLightingSettings.ClockTime
                            game:GetService("Lighting").FogEnd = _G.NormalLightingSettings.FogEnd
                            game:GetService("Lighting").GlobalShadows = _G.NormalLightingSettings.GlobalShadows
                            game:GetService("Lighting").Ambient = _G.NormalLightingSettings.Ambient
                        else
                            game:GetService("Lighting").Brightness = 1
                            game:GetService("Lighting").ClockTime = 12
                            game:GetService("Lighting").FogEnd = 786543
                            game:GetService("Lighting").GlobalShadows = false
                            game:GetService("Lighting").Ambient = Color3.fromRGB(178, 178, 178)
                        end
                        LatestValue = not LatestValue
                    end
                end
            end)
        end
        
        _G.FullBrightExecuted = true
        _G.FullBrightEnabled = not _G.FullBrightEnabled  
        
    end    
})
        
        Tab:AddButton({
	Name = "Crosshair",
	Callback = function()
      		print("button pressed")
      		    getgenv().CrosshairSettings = {
    Color = Color3.fromRGB(255,0,0),
    RainbowColor = false,
    Opacity = 1,
    Length = 6, -- Length of each line
    Thickness = 1.2, -- Thickness of each line
    Offset = 3, -- Offset from the middle point
    Dot = false, -- not recommended
    FollowCursor = true, -- Crosshair follows the cursor
    HideMouseIcon = true, -- Hides the mouse icon, set to 0 to ignore
    HideGameCrosshair = true, -- Hides the current game's crosshair (if its supported)
    ToggleKey = Enum.KeyCode.RightAlt, -- Toggles crosshair visibility
} -- v1.2.1
loadstring(game:HttpGet("https://raw.githubusercontent.com/zzerexx/scripts/main/CustomCrosshair.lua", true))()
  end    
})

Tab:AddButton({
	Name = "Rejoin server",
	Callback = function()
      		print("button pressed")
      		local TeleportService = game:GetService("TeleportService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
     
    local Rejoin = coroutine.create(function()
        local Success, ErrorMessage = pcall(function()
            TeleportService:Teleport(game.PlaceId, LocalPlayer)
        end)
     
        if ErrorMessage and not Success then
            warn(ErrorMessage)
        end
    end)
     
    coroutine.resume(Rejoin)
  	end    
})

Tab:AddButton({
	Name = "Invisble (reset to disable",
	Callback = function()
      		print("button pressed")
      		char = game.Players.LocalPlayer.Character
    hum = char:FindFirstChildWhichIsA("Humanoid")
     
    function scan(p)
        for i,v in pairs(p:GetChildren()) do
            if v:IsA("BasePart") then
                v.Transparency = 1
            end
            if v:IsA("Decal") then
                v.Transparency = 1
            end
            scan(v)
        end
    end
     
    while true do
        if hum.Health <= 0 then break end
        scan(char)
        wait()
    end
end    
})

local Tab = Window:MakeTab({
	Name = "Trolling",
	Icon = "rbxassetid://524119279",
	PremiumOnly = false
})

local Section = Tab:AddSection({
	Name = "FE Stuff"
})

Tab:AddButton({
	Name = "Make your character N4Z1",
	Callback = function()
      		print("button pressed")
      		local Player = game.Players.LocalPlayer
    local RenderStepped = game.RunService.RenderStepped
    local HumanoidRootPart = Player.Character:WaitForChild("HumanoidRootPart", 5)
     
    function CharacterPosition(p, a, b, c, x, y, z)
        local BodyForce = Instance.new("BodyForce")
        BodyForce.Force = Vector3.new(0, 196.2, 0) * p:GetMass()
        BodyForce.Parent = p
        
        RenderStepped:Connect(function()
            p.CFrame = HumanoidRootPart.CFrame * CFrame.new(a, b, c) * CFrame.Angles(x, y, z)
        end)
        
        p:BreakJoints()
    end
     
    CharacterPosition(Player.Character["Left Arm"], -1, 1.5, 0, 0, 0, math.rad(-90))
    CharacterPosition(Player.Character["Right Arm"], 1.5, 1, 0, 0, 0, math.rad(180))
    CharacterPosition(Player.Character["Left Leg"], -1.5, -1, 0, 0, 0, math.rad(0))
    CharacterPosition(Player.Character["Right Leg"], 1, -1.5, 0, 0, 0, math.rad(90))
  	end    
})



Tab:AddButton({
	Name = "Silent aim (idk if it works)",
	Callback = function() print("button pressed")
      		
       	local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local mouse = LocalPlayer:GetMouse()
local Camera = workspace.CurrentCamera
local Debris = game:GetService("Debris")
local UserInputService = game:GetService("UserInputService")
local target = false
local RunService = game:GetService("RunService")
 
 
getfenv().lock = "Head" -- Head or Hitbox or Random
 
fov = 250;
local fovCircle = true;
local st = tonumber(tick());
warn("Loading script...")
 
if fovCircle then
	function createcircle()
	    local a=Drawing.new('Circle');a.Transparency=1;a.Thickness=1.5;a.Visible=true;a.Color=Color3.fromRGB(0,255,149);a.Filled=false;a.Radius=fov;
	    return a;
	end;  
	local fovc = createcircle();
	spawn(function()
	    RunService:BindToRenderStep("FovCircle",1,function()
	        fovc.Position = Vector2.new(mouse.X,mouse.Y)
	    end);
	end);
end;
 
function isFfa()
	local am = #Players:GetChildren();
	local amm = 0;
	for i , v in pairs(Players:GetChildren()) do
		if v.Team == LocalPlayer.Team then
			amm = amm + 1;
		end;
	end;
	return am == amm;
end;
function getnearest()
	local nearestmagnitude = math.huge
	local nearestenemy = nil
	local vector = nil
	local ffa = isFfa();
	for i,v in next, Players:GetChildren() do
		if ffa == false and v.Team ~= LocalPlayer.Team or ffa == true then
			if v.Character and  v.Character:FindFirstChild("HumanoidRootPart") and v.Character:FindFirstChild("Humanoid") and v.Character.Humanoid.Health > 0 then
				local vector, onScreen = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position)
				if onScreen then
					local ray = Ray.new(
					Camera.CFrame.p,
					(v.Character["Head"].Position-Camera.CFrame.p).unit*500
					)
					local ignore = {
					LocalPlayer.Character,
					}
					local hit,position,normal=workspace:FindPartOnRayWithIgnoreList(ray,ignore)
					if hit and hit:FindFirstAncestorOfClass("Model") and Players:FindFirstChild(hit:FindFirstAncestorOfClass("Model").Name)then
						local magnitude = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
						if magnitude < nearestmagnitude and magnitude <= fov then
							nearestenemy = v
							nearestmagnitude = magnitude
						end
					end
				end
			end
		end
	end
	return nearestenemy
end
 
 
local meta = getrawmetatable(game)
setreadonly(meta, false)
local oldNamecall = meta.__namecall
meta.__namecall = newcclosure(function(...)
 
	local method = getnamecallmethod()
	local args = {...}
	if string.find(method,'Ray') then
		if target then
		    if args[1].Name ~= "Workspace" then
   		        print(args[1])
   		    end;
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target.Position + Vector3.new(0,(workspace.CurrentCamera.CFrame.Position-target.Position).Magnitude/500,0) - workspace.CurrentCamera.CFrame.Position).unit * 5000)
		end
	end
	return oldNamecall(unpack(args))
end)
 
warn("Script loaded!\nTime taken: "..math.abs(tonumber(tick())-st))
RunService:BindToRenderStep("SilentAim",1,function()
	if UserInputService:IsMouseButtonPressed(0) and Players.LocalPlayer.Character and Players.LocalPlayer.Character:FindFirstChild("Humanoid") and Players.LocalPlayer.Character.Humanoid.Health > 0 then
		local enemy = getnearest()
		if enemy and enemy.Character and enemy.Character:FindFirstChild("Humanoid") and enemy.Character.Humanoid.Health > 0 then                
			local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character["Head"].Position)
			local head = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
			local vector, onScreen = Camera:WorldToScreenPoint(enemy.Character["HumanoidRootPart"].Position)
			local hitbox = (Vector2.new(mouse.X, mouse.Y) - Vector2.new(vector.X, vector.Y)).magnitude
			if head <= hitbox then
				magnitude = head
			else
				magnitude = hitbox;
			end;
			if getfenv().lock == "Head" then
				target = workspace[enemy.Name]["Head"]
			else
				if getfenv().lock == "Random" then
					if magnitude == hitbox then
						target = workspace[enemy.Name]["HumanoidRootPart"];
					else
						target = workspace[enemy.Name]["Head"]
					end;
				else
					target = workspace[enemy.Name]["HumanoidRootPart"];
				end;
 
			end;
		else
			target = nil
		end
	end
end)
      		
    end    
})



Tab:AddButton({
	Name = "Fly (alt to disable)",
	Callback = function()
      		print("button pressed")
              local Settings = {
	
                Speed = 3,
                SprintSpeed = 30,
                ToggleKey = Enum.KeyCode.LeftAlt,
                SprintKey = Enum.KeyCode.LeftControl,
                
                ForwardKey = Enum.KeyCode.W,
                LeftKey = Enum.KeyCode.A,
                BackwardKey = Enum.KeyCode.S,
                RightKey = Enum.KeyCode.D,
                UpKey = Enum.KeyCode.E,
                DownKey = Enum.KeyCode.Q,
                
            }
            
            local Screen = Instance.new("ScreenGui",game.CoreGui)
            local Distance = Instance.new("TextLabel",Screen)
            Distance.BackgroundTransparency = 1
            Distance.Size = UDim2.new(0,10,0,10)
            Distance.ZIndex = 2
            Distance.Text = "0"
            Distance.TextStrokeTransparency = .5
            Distance.TextSize = 20
            Distance.TextStrokeColor3 = Color3.fromRGB(33, 33, 33)
            Distance.Font = Enum.Font.Gotham
            Distance.TextColor3 = Color3.new(1,1,1)
            Distance.TextXAlignment = Enum.TextXAlignment.Left
            Distance.TextYAlignment = Enum.TextYAlignment.Top
            
            
            local Mouse = game.Players.LocalPlayer:GetMouse()
            local Direction = Vector3.new(0,0,0)
            local InterpolatedDir = Direction
            local Tilt = 0
            local InterpolatedTilt = Tilt
            local RunService = game:GetService("RunService")
            local Toggled = false
            local Sprinting = false
            local CameraPos = game.Workspace.CurrentCamera.CFrame.Position
            
            pcall(function()
                game.Players.LocalPlayer.DevCameraOcclusionMode = Enum.DevCameraOcclusionMode.Invisicam	
            end)
            
            function Lerp(a, b, t)
                return a + (b - a) * t
            end
            
            local LastPos = nil
            
            function KeyHandler(actionName, userInputState)
                if true and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    if actionName == "Toggle" and userInputState == Enum.UserInputState.Begin then
                        Toggled = not Toggled
                        if Toggled then
                            LastPos = game.Players.LocalPlayer.Character.HumanoidRootPart.Position
                            --game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
                            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = true 
                        else
                            LastPos = nil
                            game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false
                            --game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                        end
                    elseif actionName == "Forward" then
                        Tilt = userInputState == Enum.UserInputState.Begin and -20 or 0
                        Direction = Vector3.new(Direction.x,Direction.y,userInputState == Enum.UserInputState.Begin and -1 or 0)
                    elseif actionName == "Left" then
                        Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and -1 or 0,Direction.y,Direction.z)
                    elseif actionName == "Backward" then
                        Tilt = userInputState == Enum.UserInputState.Begin and 20 or 0
                        Direction = Vector3.new(Direction.x,Direction.y,userInputState == Enum.UserInputState.Begin and 1 or 0)
                    elseif actionName == "Right" then
                        Direction = Vector3.new(userInputState == Enum.UserInputState.Begin and 1 or 0,Direction.y,Direction.z)
                    elseif actionName == "Up" then
                        Direction = Vector3.new(Direction.x,userInputState == Enum.UserInputState.Begin and 1 or 0,Direction.z)
                    elseif actionName == "Down" then
                        Direction = Vector3.new(Direction.x,userInputState == Enum.UserInputState.Begin and -1 or 0,Direction.z)
                    elseif actionName == "Sprint" then
                        Sprinting = userInputState == Enum.UserInputState.Begin
                    end
                end
            end
            
            
            
            game:GetService("UserInputService").InputBegan:connect(function(inputObject, gameProcessedEvent)
                
                if inputObject.KeyCode == Settings.ToggleKey then
                    KeyHandler("Toggle", Enum.UserInputState.Begin, inputObject)
                elseif inputObject.KeyCode == Settings.ForwardKey then
                    KeyHandler("Forward", Enum.UserInputState.Begin, inputObject)
                elseif inputObject.KeyCode == Settings.LeftKey then
                    KeyHandler("Left", Enum.UserInputState.Begin, inputObject)
                elseif inputObject.KeyCode == Settings.BackwardKey then
                    KeyHandler("Backward", Enum.UserInputState.Begin, inputObject)
                elseif inputObject.KeyCode == Settings.RightKey then
                    KeyHandler("Right", Enum.UserInputState.Begin, inputObject)
                elseif inputObject.KeyCode == Settings.UpKey then	
                    KeyHandler("Up", Enum.UserInputState.Begin, inputObject)
                elseif inputObject.KeyCode == Settings.DownKey then
                    KeyHandler("Down", Enum.UserInputState.Begin, inputObject)
                elseif inputObject.KeyCode == Settings.SprintKey then
                    KeyHandler("Sprint", Enum.UserInputState.Begin, inputObject)
                end
                
                
            end)
            
            
            game:GetService("UserInputService").InputEnded:connect(function(inputObject, gameProcessedEvent)
                
                if inputObject.KeyCode == Settings.ToggleKey then
                    KeyHandler("Toggle", Enum.UserInputState.End, inputObject)
                elseif inputObject.KeyCode == Settings.ForwardKey then
                    KeyHandler("Forward", Enum.UserInputState.End, inputObject)
                elseif inputObject.KeyCode == Settings.LeftKey then
                    KeyHandler("Left", Enum.UserInputState.End, inputObject)
                elseif inputObject.KeyCode == Settings.BackwardKey then
                    KeyHandler("Backward", Enum.UserInputState.End, inputObject)
                elseif inputObject.KeyCode == Settings.RightKey then
                    KeyHandler("Right", Enum.UserInputState.End, inputObject)
                elseif inputObject.KeyCode == Settings.UpKey then	
                    KeyHandler("Up", Enum.UserInputState.End, inputObject)
                elseif inputObject.KeyCode == Settings.DownKey then
                    KeyHandler("Down", Enum.UserInputState.End, inputObject)
                elseif inputObject.KeyCode == Settings.SprintKey then
                    KeyHandler("Sprint", Enum.UserInputState.End, inputObject)
                end
                
                
            end)
            
            
            RunService.RenderStepped:Connect(function()
                if Toggled and game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")  then
                    for i,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                        if v:IsA("BasePart") then
                            v.Velocity = Vector3.new(0,0,0)
                        end
                    end
                    local RootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
                    if LastPos then
                        Distance.Text = math.floor((LastPos-RootPart.Position).Magnitude+.5)
                        if (LastPos-RootPart.Position).Magnitude >= 350 then
                            Distance.TextColor3 = Color3.new(1,0,0)
                        else
                            Distance.TextColor3 = Color3.new(1,1,1)	
                        end
                    else
                        Distance.TextColor3 = Color3.new(1,1,1)
                        Distance.Text = 0
                    end
                    InterpolatedDir = InterpolatedDir:Lerp((Direction * (Sprinting and Settings.SprintSpeed or Settings.Speed)),.2)
                    InterpolatedTilt = Lerp(InterpolatedTilt ,Tilt* (Sprinting and 2 or 1),Tilt == 0 and .2 or .1)
                    RootPart.CFrame = RootPart.CFrame:Lerp(CFrame.new(RootPart.Position,RootPart.Position + Mouse.UnitRay.Direction) * CFrame.Angles(0,math.rad(00),0) * CFrame.new(InterpolatedDir)  * CFrame.Angles(math.rad(InterpolatedTilt),0,0),.2)
                else
                    Distance.TextColor3 = Color3.new(1,1,1)
                    Distance.Text = 0
                end	
            end)
             
  	end    
})


Tab:AddButton({
	Name = "BHop (not toggleable)",
	Callback = function()
      		print("button pressed")
              getgenv().bhopinfo = {
                CurrentVel = 0, -- DONT TOUCH
                VelCap = 3,
                JumpBoostAmt=3/5,
                groundamt=4,
                RolvePatch=false, -- enables autojumping
                JPatch=false, -- if game somehow does not fire JumpRequest causing it to break
                evpatch=true, --stops disabling jumping
              }
              if not funcs then
              loadstring(game:HttpGet("https://raw.githubusercontent.com/exceptional0/scr/main/funcs.lua"))()
              end
              
              if bhopinfo.evpatch then
              getgenv().bhopinfo.jp=getchar():WaitForChild("Humanoid",10).JumpPower
              getgenv().bhopinfo.jh=getchar():WaitForChild("Humanoid",10).JumpHeight
              end
              getgenv().bhopinfo.JumpBoostAmt=getgenv().bhopinfo.VelCap/5
              
              local function checkOnGround(char,setg)
                local ray = Ray.new(char:WaitForChild("HumanoidRootPart",5).Position,-(char:WaitForChild("HumanoidRootPart",5).CFrame.UpVector * 100))
                local part, pos = workspace:FindPartOnRay(ray,char)
               
                if part then
                    if pos then
                        local farness = math.ceil((char:WaitForChild("HumanoidRootPart",10).Position - pos).Magnitude)
                        if setg then        
                return farness        
                end
                       
              if farness > getgenv().bhopinfo.groundamt then    -- works with normal blocky r15 avatars.. sooo :l
                            --print(farness,"False")
              return false
                        elseif farness <= getgenv().bhopinfo.groundamt then
                          --print(farness,"true")    
              return true
                        end
                    end
                end
              end
              
              
              getgenv().bhopinfo.setg=function()
              getgenv().bhopinfo.groundamt=checkOnGround(getchar(),true)
              end
              
              
              
              funcs.uip.JumpRequest:Connect(function()
              
              if getgenv().bhopinfo.CurrentVel < getgenv().bhopinfo.VelCap then
                  getgenv().bhopinfo.CurrentVel = getgenv().bhopinfo.CurrentVel + getgenv().bhopinfo.JumpBoostAmt
                  end
                --print("jreq")
              end)
              
              
              -- patchs games like restrict jumping honestly really any other game --
              local hum
              local sttyp=Enum.HumanoidStateType.Jumping
              local function stt(thech)
              hum=thech:WaitForChild("Humanoid",20)
              if hum and hum:IsA("Humanoid") then
              if bhopinfo.evpatch then
              bhopinfo.jp=hum.JumpPower>0 and hum.JumpPower
              bhopinfo.jh=hum.JumpHeight>0 and hum.JumpHeight
              hum:GetPropertyChangedSignal("JumpPower"):Connect(function(num)
              if num and num >0 then bhopinfo.jp=num else hum.JumpPower=bhopinfo.jp end
              end)
              hum:GetPropertyChangedSignal("JumpHeight"):Connect(function(num)
              if num and num >0 then bhopinfo.jh=num else hum.JumpHeight=bhopinfo.jh end
              end)
              
              end
              
              hum.StateChanged:Connect(function(oldstate,newstate)
                if newstate == Enum.HumanoidStateType.Landed then -- if we've landed after we've jumped then allow us to jump again, essentially breaking the jump cooldown
                    hum:SetStateEnabled(sttyp,true)
              
                    --print("resetting jump cd")
                end
              end)
              end
              end
              stt(getchar())
              funcs.lplr.CharacterAdded:Connect(stt)
              
              if bhopinfo.evpatch then
              local oldst_typ=hum:GetStateEnabled(sttyp)
              local md
              md=hookmetamethod(game,"__namecall",newcclosure(function(ins,...)
              if not checkcaller() and hum then
              local nmc=getnamecallmethod()
              local args={...}
              --local scr=getcallingscript()
              if nmc=="GetStateEnabled" and ins==hum then
              return oldst_typ
              elseif #args>=1 and nmc=="SetStateEnabled" and ins==hum and args[1]==sttyp then
              oldst_typ=not args[2] and false or true
              return
              elseif #args>=1 and nmc=="GetAttribute" and args[1]=="JumpingEnabled" then
              return true
              end
              
              end
              
              return md(ins,...)
              end))
              
              end
              
              ----------------------------------------
              if bhopinfo.JPatch then
              funcs.uip.InputBegan:Connect(function(inp)
              if inp.UserInputType == Enum.UserInputType.Keyboard then
              if inp.KeyCode == Enum.KeyCode.Space then
              while funcs.uip:IsKeyDown(Enum.KeyCode.Space) do
              if not getchar():WaitForChild("Humanoid",10).Jump then
              firesignal(funcs.uip.JumpRequest)
              end
              task.wait(.0033333333333333)
              end
              
              end
              end
              end)
              
              end
              local function theroundabout()
              
                    if checkOnGround(getchar()) == false and getgenv().bhopinfo.CurrentVel ~= 0 then
                        getchar():PivotTo(getchar():GetPivot() + (getchar():GetPivot().LookVector * getgenv().bhopinfo.CurrentVel/6))
                        --print('hopping')
              else
              --print(funcs.uip:IsKeyDown(Enum.KeyCode.Space),funcs.uip:IsKeyDown(Enum.KeyCode.W),getgenv().bhopinfo.CurrentVel,checkOnGround(getchar()) )
                    end
              
                    if funcs.uip:IsKeyDown(Enum.KeyCode.Space) == false then
                        getgenv().bhopinfo.CurrentVel = 0
                   -- elseif funcs.uip:IsKeyDown(Enum.KeyCode.Space) == true and funcs.uip:IsKeyDown(Enum.KeyCode.W) then
                   --    getgenv().bhopinfo.CurrentVel = math.clamp(getgenv().bhopinfo.CurrentVel - 0.01,0,getgenv().bhopinfo.VelCap)
                    elseif bhopinfo.RolvePatch then
                     getchar():WaitForChild("Humanoid",10).Jump = true -- patches rolve games
                    end
              end
              task.spawn(function() -- spawn, wait, delay, and Debris are ALL SO BAD. NEVER RELY ON THEM. I am relying on them though because this is a exploit script, not much effort put into it
                while true do
                pcall(theroundabout)
                    task.wait()
                end
              end)
              bhopinfo.setg()  
  	end    
})














--NOT OUR DISCORD LINK GIVER I CAN FIND ORIGINAL



local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Discord%20Inviter/Source.lua"))()

Module.Prompt({ invite = "https://discord.com/invite/nbdhfJrT", name = "GhostWare" }) 

Module.Join("https://discord.com/invite/nbdhfJrT")
