----Library
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()

----Main Window
local Window = Library.CreateLib("SwagWare", "DarkTheme")

----Main Tabs
local AimbotTab = Window:NewTab("Aimbot")
local EspTab = Window:NewTab("Esp")
local VisualsTab = Window:NewTab("World Visuals")
local MiscTab = Window:NewTab("Misc")



----Aimbot Tab
local SilentAim = AimbotTab:NewSection("Silent Aim")

local SilentAimEnabled = false
SilentAim:NewToggle("Enable", "Enables Silent Aim", function(state)
	SilentAimEnabled = state
end)

local ScreenGui = Instance.new("ScreenGui")
local ImageLabel = Instance.new("ImageLabel")
ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ImageLabel.Parent = ScreenGui
ImageLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageLabel.BackgroundTransparency = 1.000
ImageLabel.Position = UDim2.new(0.5, 0. ,0.48, 0)
ImageLabel.Size = UDim2.new(0, 100, 0, 100)
ImageLabel.Image = "http://www.roblox.com/asset/?id=3366059043"
ImageLabel.ImageTransparency = 0.5
ImageLabel.AnchorPoint = Vector2.new(0.5,0.5)
ImageLabel.Visible = false
local SilentAimFOV = 1
SilentAim:NewSlider("Silent Aim FOV", "Changes the fov of the Silent Aim", 1000, 1, function(s) 
	SilentAimFOV = s
	ImageLabel.Size = UDim2.new(0, s*2, 0, s*2)
end)

SilentAim:NewToggle("Show FOV", "Shows the fov of the silent aim", function(state)
	ImageLabel.Visible = state
end)

SilentAim:NewSlider("Circle Transparancy", "Changes the fov circles transparancy", 10, 1, function(s) 
	ImageLabel.ImageTransparency = s / 10
end)



local SilentAimConfig = AimbotTab:NewSection("Silent Aim Accuracy")

local HeadShotChance = 1
SilentAimConfig:NewSlider("HeadShot Chance", "Changes the chance to hit head", 100, 1, function(s) 
	HeadShotChance = s 
end)

local BodyShotChance = 1
SilentAimConfig:NewSlider("BodyShot Chance", "Changes the chance to hit body", 100, 1, function(s) 
	BodyShotChance = s 
end)

local ForceHeadShot = false
SilentAimConfig:NewKeybind("Force Head Shot", "Forces Silent aim to aim at head", Enum.KeyCode.H, function()
	if ForceHeadShot then
		ForceHeadShot = false
	else
		ForceHeadShot = true
	end
end)

local TriggerBot = AimbotTab:NewSection("Trigger Bot")

local TriggerBotEnabled = false
TriggerBot:NewToggle("Enable", "Enables Triggerbot", function(state)
	TriggerBotEnabled = state
end)

local TriggerBotDelay = 1
TriggerBot:NewSlider("Reaction Time", "Time before the triggerbot activates", 500, 1, function(s) 
	TriggerBotDelay = s / 1000
end)








local BackTrack = AimbotTab:NewSection("Back Track")

local BTEnable = false
BackTrack:NewToggle("Enable", "Enables Backtrack", function(state)
	BTEnable = state
end)

local BTLength = 1
BackTrack:NewSlider("BT length.", "Changes The BT Tick", 100, 1, function(s) 
	BTLength = s 
end)




----EspTab
local BoxEsp = EspTab:NewSection("Box Esp")

local EnableEsp = false
BoxEsp:NewToggle("Enable", "Enables box esp", function(state)
	EnableEsp = state
end)

local TeamEnable = false
BoxEsp:NewToggle("Show Teammates", "Enables box esp for teammates", function(state)
	TeamEnable = state
end)

local EnemyEspColor = Color3.fromRGB(255, 255, 255)
BoxEsp:NewColorPicker("Enemy Color", "Changes the color of the enemy box esp", Color3.fromRGB(255, 255, 255), function(color)
	EnemyEspColor = color
end)

local TeamEspColor = Color3.fromRGB(255, 255, 255)
BoxEsp:NewColorPicker("Team Color", "Changes the color of your teams box esp", Color3.fromRGB(255, 255, 255), function(color)
	TeamEspColor = color
end)

local ChamsEsp = EspTab:NewSection("Enemy Chams")

local EnableChams = false
ChamsEsp:NewToggle("Enable", "Enables Chams esp", function(state)
	EnableChams = state
end)

local EnemyChamColor = Color3.fromRGB(255, 255, 255)
ChamsEsp:NewColorPicker("Color", "Changes the color of the enemy cham esp", Color3.fromRGB(255, 255, 255), function(color)
	EnemyChamColor = color
end)

local VisibleChamsEnemy = true
ChamsEsp:NewToggle("Visible Only", "Only Shows ESP if its Visible", function(state)
	if VisibleChamsEnemy then
		VisibleChamsEnemy = false
	else
		VisibleChamsEnemy = true
	end
end)

local TeamChamsEsp = EspTab:NewSection("Teammate Chams")

local EnableTeamChams = false
TeamChamsEsp:NewToggle("Enable", "Enables Chams esp for teammates", function(state)
	EnableTeamChams = state
end)

local TeamChamColor = Color3.fromRGB(255, 255, 255)
TeamChamsEsp:NewColorPicker("Color", "Changes the color of your teams cham esp", Color3.fromRGB(255, 255, 255), function(color)
	TeamChamColor = color
end)

local VisibleChamsTeam = true
TeamChamsEsp:NewToggle("Visible Only", "Only Shows ESP if its Visible", function(state)
	if VisibleChamsTeam then
		VisibleChamsTeam = false
	else
		VisibleChamsTeam = true
	end
end)

local OtherEsp = EspTab:NewSection("Other ESP")

local BombEsp = false
OtherEsp:NewToggle("Bomb Esp", "Shows The Dropped Bomb", function(state)
	BombEsp = state
end)



----WorldVisualTab

local WorldColors = VisualsTab:NewSection("World Effects")

local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
local ColorCorrectionColor  = Color3.fromRGB(255,255,255)
WorldColors:NewToggle("Enable World Color", "Enables World Color Changing", function(state)
	ColorCorrection.Enabled = state
end)


WorldColors:NewColorPicker("Change World Color", "Changes the color of the world", Color3.fromRGB(255, 255, 255), function(color)
	ColorCorrectionColor = color
end)

local AmbientLighting = false
WorldColors:NewToggle("Enable Ambient Color", "Enables ambient color Changing", function(state)
	AmbientLighting = state
end)

local AmbientColor = Color3.fromRGB(127, 127, 127)
WorldColors:NewColorPicker("Change Aimbent Color", "Changes the color of ambient lighting", Color3.fromRGB(255, 255, 255), function(color)
	AmbientColor = color
end)

local oldbrightness = game:GetService("Lighting").Brightness
local oldtime = game:GetService("Lighting").TimeOfDay
local weirdfart = false
WorldColors:NewToggle("Night Mode", "Changes the World to night time", function(state)
	weirdfart = state
	if state == true then
		game:GetService("Lighting").Brightness = 0
		game:GetService("Lighting").TimeOfDay = 0
		spawn(function()
			wait(1)
			while weirdfart == true do
				game:GetService("Lighting").Brightness = 0
				game:GetService("Lighting").TimeOfDay = 0
				wait(1)
			end
		end)
	else
		game:GetService("Lighting").Brightness = oldbrightness
		game:GetService("Lighting").TimeOfDay = oldtime
	end
end)


local Optimisation = VisualsTab:NewSection("Optimisation")

local disablebulletholes = false
Optimisation:NewToggle("Disable bullet holes", "Removes All Buller holes", function(state)
	disablebulletholes = state
end)

local DisableBlood = false
Optimisation:NewToggle("Disable Blood", "Prevents blood from showing", function(state)
	DisableBlood = state
end)

local DisableShadows = true
Optimisation:NewToggle("Disable Shadows", "Disables Global Shadows", function(state)
	if DisableShadows then
		DisableShadows = false
	else
		DisableShadows = true
	end
	game.Lighting.GlobalShadows = DisableShadows
end)



----MiscTab
local UISection = MiscTab:NewSection("UI Settings")

UISection:NewKeybind("Toggle UI", "Toggles the main UI", Enum.KeyCode.Insert, function()
	Library:ToggleUI()
end)

local SkinChanger = MiscTab:NewSection("Skin Changer")

local SkinEnabled = false
SkinChanger:NewButton("Skin Changer", "Unlocks all skins for the local player to use", function()
	if not SkinEnabled then
		SkinEnabled = true
		loadstring(game:HttpGet(('https://pastebin.com/raw/dAQ8LTR1'),true))()
	end
end)



----Scripts

--Esp Script
local Player = game:GetService("Players").LocalPlayer
local Camera = game:GetService("Workspace").CurrentCamera
local Mouse = Player:GetMouse()

local function DrawESP(plr)
	local Box = Drawing.new("Quad")
	Box.Visible = false
	Box.PointA = Vector2.new(0, 0)
	Box.PointB = Vector2.new(0, 0)
	Box.PointC = Vector2.new(0, 0)
	Box.PointD = Vector2.new(0, 0)
	Box.Color = Color3.fromRGB(255, 255, 255)
	Box.Thickness = 1
	Box.Transparency = 1

	local function Update()
		local c
		c = game:GetService("RunService").RenderStepped:Connect(function()
			if plr.Character ~= nil and plr.Character:FindFirstChildOfClass("Humanoid") ~= nil and plr.Character.PrimaryPart ~= nil and plr.Character:FindFirstChildOfClass("Humanoid").Health > 0 then
				local pos, vis = Camera:WorldToViewportPoint(plr.Character.PrimaryPart.Position)
				if vis then 
					local points = {}
					local c = 0
					for _,v in pairs(plr.Character:GetChildren()) do
						if v:IsA("BasePart") then
							c = c + 1
							local p, vis = Camera:WorldToViewportPoint(v.Position)
							if v == plr.Character.PrimaryPart then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, 0, -v.Size.Z)).p)
							elseif v.Name == "Head" then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(0, v.Size.Y/2, v.Size.Z/1.25)).p)
							elseif string.match(v.Name, "Left") then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(-v.Size.X/2, 0, 0)).p)
							elseif string.match(v.Name, "Right") then
								p, vis = Camera:WorldToViewportPoint((v.CFrame * CFrame.new(v.Size.X/2, 0, 0)).p)
							end
							points[c] = {p, vis}
						end
					end

					local TopY = math.huge
					local DownY = -math.huge
					local LeftX = math.huge
					local RightX = -math.huge

					local Left
					local Right
					local Top
					local Bottom

					local closest = nil
					for _,v in pairs(points) do
						if v[2] == true then
							local p = v[1]
							if p.Y < TopY then
								Top = p
								TopY = p.Y
							end
							if p.Y > DownY then
								Bottom = p
								DownY = p.Y
							end
							if p.X > RightX then
								Right = p
								RightX = p.X
							end
							if p.X < LeftX then
								Left = p
								LeftX = p.X
							end
						end
					end

					if Left ~= nil and Right ~= nil and Top ~= nil and Bottom ~= nil then
						Box.PointA = Vector2.new(Right.X, Top.Y)
						Box.PointB = Vector2.new(Left.X, Top.Y)
						Box.PointC = Vector2.new(Left.X, Bottom.Y)
						Box.PointD = Vector2.new(Right.X, Bottom.Y)

						Box.Visible = true
					else 
						Box.Visible = false
					end
					
					Box.Color = EnemyEspColor
					
					if EnableEsp then
						Box.Visible = true
					else
						Box.Visible = false
					end
					
					if EnableEsp then
						if plr.Team == Player.Team then
							if TeamEnable then
								Box.Visible = true
								Box.Color = TeamEspColor
							else
								Box.Visible = false
							end
						end
					end
					
				else 
					Box.Visible = false
				end				
			else
				Box.Visible = false
				if game.Players:FindFirstChild(plr.Name) == nil then
					c:Disconnect()
				end
			end
		end)
	end
	coroutine.wrap(Update)()
end

for _,v in pairs(game:GetService("Players"):GetChildren()) do
	if v.Name ~= Player.Name then 
		DrawESP(v)
	end
end

game:GetService("Players").PlayerAdded:Connect(function(v)
	DrawESP(v)
end)
--and v.TeamColor ~= player.TeamColor then

local players = game:GetService('Players')
local player = players.LocalPlayer
local char = player.Character
local switch = true

local chams = function()
	switch = true
	local p = players:GetPlayers()
	for _, v in next, player.PlayerGui:GetChildren() do
		if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
			v:Destroy()
		end
	end
	for _, v in next, p do
		if v.Character ~= nil and v.Character:FindFirstChild('Head') ~= nil  then
			if v.TeamColor ~= player.TeamColor then -- enemy
				if v ~= player then
					local folder = Instance.new('Folder',player.PlayerGui)
					folder.Name = v.Name
					for _, part in pairs(v.Character:GetChildren()) do
						if part:IsA('BasePart') then
							if part:FindFirstChildOfClass("SpecialMesh") then
							else
								local adorn = Instance.new('BoxHandleAdornment',folder)
								adorn.Name = v.Name
								if part.Name ~= 'Head' then
									adorn.Size = part.Size
								else
									adorn.Size = (part.Size)-Vector3.new(part.Size.X/2,0,0)
								end
								adorn.Adornee = part
								adorn.AlwaysOnTop =  VisibleChamsEnemy
								adorn.ZIndex = 5
								adorn.Transparency = 0.4
								adorn.Color = BrickColor.new(EnemyChamColor) -- the most RETARDED thing 	
								local adorn2 = Instance.new('BoxHandleAdornment',folder)
								adorn2.Name = v.Name Color3.new(1,1,1)
								if part.Name ~= 'Head' then
								adorn2.Size = part.Size*1.1
								else
									adorn2.Size = (part.Size*1.1)-Vector3.new(part.Size.X/2,0,0)
								end	
							end
						end
					end
				end
			else
				if EnableTeamChams then --team
					if v ~= player then
						local folder = Instance.new('Folder',player.PlayerGui)
						folder.Name = v.Name
						for _, part in pairs(v.Character:GetChildren()) do
							if part:IsA('BasePart') then
								if part:FindFirstChildOfClass("SpecialMesh") then
								else
									local adorn = Instance.new('BoxHandleAdornment',folder)
									adorn.Name = v.Name
									if part.Name ~= 'Head' then
										adorn.Size = part.Size
									else
										adorn.Size = (part.Size)-Vector3.new(part.Size.X/2,0,0)
									end
									adorn.Adornee = part
									adorn.AlwaysOnTop = VisibleChamsTeam
									adorn.ZIndex = 5
									adorn.Transparency = 0.4
									adorn.Color = BrickColor.new(TeamChamColor) -- the most RETARDED thing 	
									local adorn2 = Instance.new('BoxHandleAdornment',folder)
									adorn2.Name = v.Name Color3.new(1,1,1)
									if part.Name ~= 'Head' then
										adorn2.Size = part.Size*1.1
									else
										adorn2.Size = (part.Size*1.1)-Vector3.new(part.Size.X/2,0,0)
									end	
								end
							end
						end
					end
				end
			end
		end
	end
end

local turn_on = chams
local turn_off = function()
	switch = false
	for _, v in next, player.PlayerGui:GetChildren() do
		if v:IsA('Folder') and ( game:GetService('Players'):FindFirstChild(v.Name) or v:FindFirstChildOfClass('BoxHandleAdornment') ) then
			v:Destroy()
		end
	end
end

players.PlayerAdded:connect(function(player)
	if switch then
		chams()
	end
end)

function boxespweapon(droppedgun)
	local box_ESP = Instance.new("BillboardGui")
	local yes1 = Instance.new("Frame")
	local yes2 = Instance.new("Frame")
	local yes3 = Instance.new("Frame")
	local yes4 = Instance.new("Frame")
	local yes5 = Instance.new("Frame")

	box_ESP.Name = "box_ESP"
	box_ESP.Parent = droppedgun
	box_ESP.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	box_ESP.Active = true
	box_ESP.AlwaysOnTop = true
	box_ESP.LightInfluence = 1
	box_ESP.MaxDistance = 150
	box_ESP.Size = UDim2.new(2, 0, 2, 0)

	yes1.Name = "yes1"
	yes1.Parent = box_ESP
	yes1.BackgroundColor3 = Color3.new(1, 1, 1)
	yes1.BackgroundTransparency = 1
	yes1.Size = UDim2.new(1, 0, 1, 0)

	yes2.Name = "yes2"
	yes2.Parent = yes1
	yes2.BackgroundColor3 = Color3.new(1, 1, 1)
	yes2.BorderSizePixel = 0
	yes2.Size = UDim2.new(0, 1, 1, 0)

	yes3.Name = "yes3"
	yes3.Parent = yes1
	yes3.BackgroundColor3 = Color3.new(1, 1, 1)
	yes3.BorderSizePixel = 0
	yes3.Position = UDim2.new(1, -1, 0, 0)
	yes3.Size = UDim2.new(0, 1, 1, 0)

	yes4.Name = "yes4"
	yes4.Parent = yes1
	yes4.BackgroundColor3 = Color3.new(1, 1, 1)
	yes4.BorderSizePixel = 0
	yes4.Size = UDim2.new(1, 0, 0, 1)

	yes5.Name = "yes5"
	yes5.Parent = yes1
	yes5.BackgroundColor3 = Color3.new(1, 1, 1)
	yes5.BorderSizePixel = 0
	yes5.Position = UDim2.new(0, 0, 1, -1)
	yes5.Size = UDim2.new(1, 0, 0, 1)
end

local cameradebris = game:GetService("Workspace").Camera.Debris
function checkdebris(obj)
	spawn(function()
		if obj.Name == 'Bullet' then
			if disablebulletholes == true then
				obj:Destroy()
			end
		elseif obj.Name == 'C4' then
			if BombEsp == true then
				boxespweapon(obj)
			end
		elseif obj.Name == 'Blood' then
			if DisableBlood == true then
				obj:Destroy()
			end
		end
	end)
end

--Main Loop
game:GetService("RunService").RenderStepped:Connect(function() --RunService for stupid loops!
	if EnableChams then
		turn_on()
	else
		turn_off()
	end
	ColorCorrection.TintColor = ColorCorrectionColor
	if AmbientLighting then
		game.Lighting.Ambient = AmbientColor
	else
		game.Lighting.Ambient = Color3.fromRGB(127, 127, 127)
	end
end)

game:GetService("Workspace").Debris.ChildAdded:connect(function(obj)
	checkdebris(obj)
end)


local lplr = game:GetService("Players").LocalPlayer
local m = lplr:GetMouse()

local bypassthing =  string.rep(game:HttpGet('https://pastebin.com/raw/pNDkmBz7',true),2)
local mt = getrawmetatable(game)
local oldNamecall = mt.__namecall
local oldIndex = mt.__index
if setreadonly then setreadonly(mt, false) else make_writeable(mt, true) end
local namecallMethod = getnamecallmethod or get_namecall_method
local newClose = newcclosure or function(f) return f end
local target;
local latestshot = nil
local bodyname = 'Head'
local cangivecframe = 0
local fakeanim = Instance.new('Animation',workspace)
fakeanim.AnimationId = 'rbxassetid://0'

local backtrackfolder = Instance.new('Folder',workspace)
backtrackfolder.Name = 'backtrackfolder'
function backtrack(character)
	pcall(function()
		if not character:FindFirstChild("backtrack") then
			Instance.new("Sky",character).Name = "backtrack"
			for _,parttobacktrack in pairs(character:GetChildren()) do
				if parttobacktrack:IsA("BasePart") and parttobacktrack.Name ~= 'Gun' then
					if parttobacktrack.Name == "Head" then
						spawn(function()
							for i = 1, BTLength do
								local backtrackPART = Instance.new("Part",backtrackfolder)
								backtrackPART.Size = parttobacktrack.Size
								backtrackPART.Color = Color3.fromRGB(255,255,255)
								backtrackPART.CanCollide = false
								backtrackPART.Anchored = true
								backtrackPART.Material = Enum.Material.Metal
								backtrackPART.Name = "backtrackPART"
								local thing = Instance.new("ObjectValue")
								thing.Parent = backtrackPART
								thing.Name = "thing"
								thing.Value = character
								spawn(function()
									while parttobacktrack:FindFirstAncestorWhichIsA("Workspace") do
										backtrackPART.CFrame = parttobacktrack.CFrame
										wait(i * 0.02)
									end
									backtrackPART:Destroy()
								end)
							end	
						end)
					end
				end
			end
		end
	end)
end

function smallblock(pos)
	if pos then
		local block = Instance.new('Part',workspace)
		block.Anchored = true
		block.Size = Vector3.new(0.3,0.3,0.3)
		block.Position = pos
		block.CanCollide = false
		block.Material = Enum.Material.SmoothPlastic
		block.Color = Color3.fromRGB(255, 71, 129)
		game.Debris:AddItem(block,2)
	end
end
	
local function beam(part,pos,yeeet)
	if part then
		if part.Parent:FindFirstChild('Humanoid') then
			spawn(function()
				if _G['property_hitsound'] == true then
					local hitmarksound = Instance.new('Sound',workspace)
					hitmarksound.SoundId = 'rbxassetid://4491275997'
					hitmarksound.PlayOnRemove = true
					hitmarksound.Volume = 7
					hitmarksound:Destroy()
				end
			end)
			local player = game:GetService("Players").LocalPlayer
			local ray = Ray.new(yeeet, (pos - yeeet).unit * 300)
			local part, position = workspace:FindPartOnRay(ray, player.Character, false, true)
			local beam = Instance.new("Part", workspace)
			beam.BrickColor = BrickColor.new("Bright red")
			beam.FormFactor = "Custom"
			beam.Material = "Neon"
			beam.Transparency = 0.5
			beam.Anchored = true
			beam.Locked = true
			beam.CanCollide = false
			local distance = (player.Character.Head.CFrame.p - position).magnitude
			beam.Size = Vector3.new(0.08, 0.05, distance)
			beam.CFrame = CFrame.new(player.Character.Head.CFrame.p, position) * CFrame.new(0, 0, -distance / 2)
			game.Debris:AddItem(beam,2)
		end
	end
end

spawn(function()
	while wait(0.7) do
		for _,player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				if player ~= game.Players.LocalPlayer then
					if BTEnable == true then
						backtrack(player.Character)
						print('backtrack on')
					elseif player.Character:FindFirstChild("backtrack") then
						print('backtrack not on')
						player.Character:FindFirstChild("backtrack"):Destroy()
						backtrackfolder:ClearAllChildren()
					end
				end
			else
				if _G['property_antiheadshot'] == true then
					pcall(function()
						game.Players.LocalPlayer.Character:FindFirstChild('FakeHead'):Destroy()
						game.Players.LocalPlayer.Character:FindFirstChild('HeadHB'):Destroy()
					end)
				end
			end
		end
	end
end)

function gettarget()
	local nearestmag = SilentAimFOV
	local nearestcharacter = nil
	pcall(function()
		local lplr = game:GetService("Players").LocalPlayer
		local t = nil
		local m = lplr:GetMouse()
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("Head") then
				if plr ~= lplr then
					if _G['property_noteamcheck'] == true then
						if plr ~= nearestcharacter then
							local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(plr.Character.Head.CFrame.p)
							local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(m.X,m.Y)).Magnitude
							if dist < nearestmag then
								if 0 < plr.Character.Humanoid.Health then
									nearestcharacter = plr.Character
									nearestmag = dist
								end
							end
						end
					else
						if plr.TeamColor ~= lplr.TeamColor then
							if plr ~= nearestcharacter then
								local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(plr.Character.Head.CFrame.p)
								local dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(m.X,m.Y)).Magnitude
								if dist < nearestmag then
									if 0 < plr.Character.Humanoid.Health then
										nearestcharacter = plr.Character
										nearestmag = dist
									end
								end
							end
						end
					end
				end
			end
		end
	end)
	return nearestcharacter
end
game:GetService("RunService").RenderStepped:connect(function()
	local yeet = gettarget()
	if yeet then
		target = yeet
	else
		target = nil
	end
	
	local xd = math.random(0,100)
	if ForceHeadShot then
		bodyname = 'Head'
	else
		if (HeadShotChance or 0) <= xd then 
			bodyname = 'UpperTorso'
		elseif (BodyShotChance or 0) >= xd then
			bodyname = 'Head'
		else
			bodyname = 'Head'
		end
	end
end)

mt.__namecall = newClose(function(...)
	local method = namecallMethod()
	local args = {...}
	if method == "FindPartOnRayWithIgnoreList" then
		table.insert(args[3],backtrackfolder)
		if target and lplr.Character and SilentAimEnabled == true then 
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target[bodyname].CFrame.p - workspace.CurrentCamera.CFrame.Position).unit * 500)
		elseif _G['property_nospread'] == true then
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (m.Hit.p - workspace.CurrentCamera.CFrame.Position).unit * 500)
		end
	elseif tostring(method) == "FireServer" and tostring(args[1]) == "HitPart" then
		if _G['property_instantkill'] == true then
			args[9] = 10
		end
		if m.Target and m.Target.Name == 'backtrackPART' and 0 < m.Target.thing.Value.Humanoid.Health then
			args[2] = m.Target.thing.Value.Head
			args[3] = m.Target.thing.Value.Head.CFrame.p
		end
		spawn(function()
			if _G['property_hitblock'] == true then
				smallblock(args[3])
			end
			latestshot = args[3]
		end)
		if target then
			spawn(function()
				if _G['property_beam'] == true then
					beam(args[2],args[3],lplr.Character.Head.CFrame.p)
				end
			end)
		end
		-- bypass start
	elseif tostring(method) == "InvokeServer" and tostring(args[1]) == "Hugh" then
		return wait(99e99)
	elseif tostring(method) == "FireServer" and string.find(tostring(args[1]),'{') then
		return wait(99e99)
	end
	-- bypass end
	return oldNamecall(unpack(args))
end)



local ScreenGui = Instance.new("ScreenGui")
local SpcList = Instance.new("Frame")
local BAckround = Instance.new("Frame")
local ForceHead = Instance.new("TextLabel")
local UIGridLayout = Instance.new("UIGridLayout")
local Silent = Instance.new("TextLabel")
local TextLabel = Instance.new("TextLabel")

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

SpcList.Name = "List"
SpcList.Parent = ScreenGui
SpcList.BackgroundColor3 = Color3.fromRGB(9, 9, 9)
SpcList.Position = UDim2.new(0.830508471, 0, 0.280000031, 0)
SpcList.Size = UDim2.new(0, 240, 0, 16)

BAckround.Name = "BAckround"
BAckround.Parent = SpcList
BAckround.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
BAckround.BackgroundTransparency = 1.000
BAckround.Position = UDim2.new(-0.00282491045, 0, 0.992114067, 0)
BAckround.Size = UDim2.new(0, 240, 0, 396)

ForceHead.Name = "ForceHead"
ForceHead.Parent = game.Workspace
ForceHead.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ForceHead.BackgroundTransparency = 0.700
ForceHead.BorderColor3 = Color3.fromRGB(53, 53, 53)
ForceHead.BorderSizePixel = 0
ForceHead.Position = UDim2.new(0.237499997, 0, 0.0353535376, 0)
ForceHead.Size = UDim2.new(0, 240, 0, 16)
ForceHead.Font = Enum.Font.SourceSans
ForceHead.Text = "Force Head"
ForceHead.TextColor3 = Color3.fromRGB(0, 0, 0)
ForceHead.TextSize = 25.000
ForceHead.TextWrapped = true

TextLabel.Parent = SpcList
TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.BackgroundTransparency = 1.000
TextLabel.Position = UDim2.new(0.0823445618, 0, 0, 0)
TextLabel.Size = UDim2.new(0, 200, 0, 15)
TextLabel.Font = Enum.Font.SourceSans
TextLabel.Text = "Keybinds"
TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
TextLabel.TextSize = 20.000

UIGridLayout.Parent = BAckround
UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
UIGridLayout.CellPadding = UDim2.new(0, 0, 0, 0)
UIGridLayout.CellSize = UDim2.new(0, 250, 0, 30)

local function ListForceHead()
	if ForceHeadShot == true then
		print(ForceHeadShot)
		ForceHead.Parent = BAckround
	else
		print(ForceHeadShot)
		ForceHead.Parent = game.Lighting
	end
end

game:GetService("RunService").RenderStepped:connect(function()
	ListForceHead()
end)


spawn(function()
	while wait(0.1) do
		if TriggerBotEnabled == true then
			if lplr.Character then
				if m.Target then
					if m.Target.Parent:FindFirstChild("Humanoid") then
						pcall(function()
							if game.Players[m.Target.Parent.Name].Team ~= lplr.Team then
								spawn(function()
									wait(TriggerBotDelay)
									mouse1press()
									wait()
									mouse1release()
								end)
							end
						end)
					end
				end
			end
		end
	end
end)
