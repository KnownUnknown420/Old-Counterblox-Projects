--UnknownSoultions

local Config = {
	WindowName = "Inbound.XYZ",
	Color = Color3.fromRGB(255, 0, 0),
	Keybind = Enum.KeyCode.Insert
}

local ESP = loadstring(game:HttpGet("https://raw.githubusercontent.com/Pawel12d/hexagon/main/scripts/ESP.lua"))()
Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

----Rage Tab
local RageTab = Window:CreateTab("Rage")

local Ragebot = RageTab:CreateSection("Rage bot")

local RageBotEnable = false
 RageToggle = Ragebot:CreateToggle("Enable", false, function(State)
	RageBotEnable = State
end)

local Nospread = false
 NospreadToggle = Ragebot:CreateToggle("Nospread", false, function(State)
	Nospread = State
end)

local DTEnable = false
 RageToggle = Ragebot:CreateToggle("Enable DoubleTap", false, function(State)
	DTEnable = State
end)

local TargetType = "Closest from Mouse"
TargetSelect = Ragebot:CreateDropdown("Targeting Method", {"Closest from Mouse","Closest from player"}, function(String)
	TargetType = String
end)
TargetSelect:SetOption("Closest from Mouse")

local HitpartSelectOption = "Head"
HitpartSelect = Ragebot:CreateDropdown("Hit Boxes", {"Head","UpperTorso"}, function(String)
	HitpartSelectOption = String
end)
HitpartSelect:SetOption("Head")

local BodyAimSelectOption = "None"
BodyAimSelect = Ragebot:CreateDropdown("Baim Conditions", {"None","Every Other shot",}, function(String)
	BodyAimSelectOption = String
end)
BodyAimSelect:SetOption("None")

local KillallEnable = false
KillallEnableToggle = Ragebot:CreateToggle("Kill all", false, function(State)
	KillallEnable = State
end)

local AntiAimSection = RageTab:CreateSection("Anti Aim")

local AntiAimEnable = false
AntiAimToggle = AntiAimSection:CreateToggle("Enable Antiaim", false, function(State)
	AntiAimEnable = State
end)

local HeadDisable = false
HeadDisableToggle = AntiAimSection:CreateToggle("Break Head", false, function(State)
	HeadDisable = State
end)

local EnableDownScale = false
AntiAimToggle = AntiAimSection:CreateToggle("Enable DownScale", false, function(State)
	EnableDownScale = State
end)

local PitchSelectOption = "Default"
PitchSlect = AntiAimSection:CreateDropdown("Pitch", {"Jitter", "Reversed", "Keybind", "Spin"}, function(String)
	PitchSelectOption = String
end)
PitchSlect:SetOption("Default")

local Downscale = 0
YawManualSlider = AntiAimSection:CreateSlider("DownScale", 0,15, 0 ,true, function(Value)
	Downscale = Value
end)

local aaspeed = 0
AASpeedSlider = AntiAimSection:CreateSlider("Spin Speed", 0,100, 50 ,true, function(Value)
	aaspeed = Value
end)

local aasmooth = 0
AAsmoothSlider = AntiAimSection:CreateSlider("Turn Smoothness", 0,100, 50 ,true, function(Value)
	aasmooth = Value
end)

local Main = Instance.new("ScreenGui")
local Left = Instance.new("ImageLabel")
local Right = Instance.new("ImageLabel")
local Down = Instance.new("ImageLabel")

Main.Parent = game.CoreGui

Left.Name = "Left"
Left.Parent = Main
Left.BackgroundColor3 = Color3.fromRGB(172, 172, 172)
Left.BackgroundTransparency = 1.000
Left.Position = UDim2.new(0.458395243, -28, 0.490184069, -31)
Left.Size = UDim2.new(0, 56, 0, 63)
Left.Image = "http://www.roblox.com/asset/?id=255515174"

Right.Name = "Right"
Right.Parent = Main
Right.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Right.BackgroundTransparency = 1.000
Right.Position = UDim2.new(0.541604757, -28, 0.490184069, -31)
Right.Rotation = 180.000
Right.Size = UDim2.new(0, 56, 0, 63)
Right.Image = "http://www.roblox.com/asset/?id=255515174"

Down.Name = "Down"
Down.Parent = Main
Down.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
Down.BackgroundTransparency = 1.000
Down.Position = UDim2.new(0.5, -28, 0.567484677, -31)
Down.Rotation = 90.000
Down.Size = UDim2.new(0, 56, 0, 63)
Down.Image = "http://www.roblox.com/asset/?id=255515174"
Down.ImageColor3 = Color3.fromRGB(247, 0, 255)



IndicatorToggle = AntiAimSection:CreateToggle("Indicators", false, function(State)
	Main.Enabled = State
end)


local ArrowColor = Color3.fromHSV(0, 0, 1)
ArrowColorPicker = AntiAimSection:CreateColorpicker("Arrow Color", function(Color)
	ArrowColor = Color
end)

--[[local Crimwalk = AntiAimSection:CreateButton("CrimWalk ;)", function()
	local lplr = game:GetService("Players").LocalPlayer
if lplr.Character and not lplr:FindFirstChild('XDDLA') then
	Instance.new('Sky',lplr.Character).Name = 'XDDLA'
	local baby = lplr.Character
	while baby.Parent == workspace do 
		delay(0,function()
			game.Players.LocalPlayer.Character.HumanoidRootPart.Position = game.Players.LocalPlayer.Character.Head.Position + Vector3.new(0,-30,0)
			cameraoffset = false
		end)
		wait()
	end
end
end)--]]

----ESP Tab
local ESPTab = Window:CreateTab("ESP")

local BoxESP = ESPTab:CreateSection("ESP Settings")

ESP.Tracers = false
ESP.ShowTeam = false
ESP.UseTeamColor = false
ESP.Enabled = false
local EspToggle = BoxESP:CreateToggle("Enable", false, function(State)
	ESP.Enabled = State
end)

ESP.ShowTeam = false
local EspTeamToggle =	BoxESP:CreateToggle("Show Team", false, function(State)
	ESP.ShowTeam = State
end)

ESP.Boxes = false
local EspBoxesToggle =	BoxESP:CreateToggle("Show Boxes", false, function(State)
	ESP.Boxes = State
end)

ESP.EnemyColor = Color3.fromHSV(0, 0, 1)
local ESPColorPicker = BoxESP:CreateColorpicker("Enemy Color", function(Color)
	ESP.EnemyColor= Color
end)

ESP.TeamColor = Color3.fromHSV(0, 0, 1)
local ESPColorPickerTeam = BoxESP:CreateColorpicker("Team Color", function(Color)
	ESP.TeamColor = Color
end)

local InfoSection = ESPTab:CreateSection("Player Info")

ESP.ShowInfo = false
local EspInfoToggle = InfoSection:CreateToggle("Enable Info", false, function(State)
	ESP.ShowInfo = State
end)

local NameToggle = InfoSection:CreateToggle("Show Name", false, function(State)
	ESP.Info.Name = State
end)

local HealthToggle = InfoSection:CreateToggle("Show Health", false, function(State)
	ESP.Info.Health = State
end)

local WeaponsToggle = InfoSection:CreateToggle("Show Weapons", false, function(State)
	ESP.Info.Weapons = State
end)

local DistanceToggle = InfoSection:CreateToggle("Show Distance", false, function(State)
	ESP.Info.Distance = State
end)

local Chams = ESPTab:CreateSection("Chams")

local ChamsEnabled = false
local ChamsToggle = Chams:CreateToggle("Enable", nil, function(State)
	ChamsEnabled = State
end)

local EnemyEnableChams = false
local ChamsEnemyToggle = Chams:CreateToggle("Enemy", nil, function(State)
	EnemyEnableChams = State
end)

local TeamEnableChams = false
local ChamsTeamToggle = Chams:CreateToggle("Teammmates", nil, function(State)
	TeamEnableChams = State
end)

local EnemyChamsColor = Color3.fromHSV(0, 0, 1)
local ChamsColorPicker = Chams:CreateColorpicker("Enemy Color", function(Color)
	EnemyChamsColor = Color
end)

local TeamChamsColor = Color3.fromHSV(0, 0, 1)
local ChamsColorPickerTeam = Chams:CreateColorpicker("Team Color", function(Color)
	TeamChamsColor = Color
end)

local BombEsp = ESPTab:CreateSection("Bomb Esp")

local DroppedBombEspEnabled = false
local DroppedBomb = BombEsp:CreateToggle("Enable", nil, function(State)
	DroppedBombEspEnabled = State
end)

local DroppedBombTimer = false
local BombTimmer = BombEsp:CreateToggle("Bomb Timer", nil, function(State)
	DroppedBombTimer = State
end)

local DroppedBombColor = Color3.fromHSV(0, 0, 1)
local BombColor = BombEsp:CreateColorpicker("Color", function(Color)
	DroppedBombColor = Color
end)

--Presest
ESPColorPicker:UpdateColor(Color3.fromRGB(255, 255, 255))
ESPColorPickerTeam:UpdateColor(Color3.fromRGB(255, 255, 255))
ChamsColorPickerTeam:UpdateColor(Color3.fromRGB(255,255,255))
ChamsColorPicker:UpdateColor(Color3.fromRGB(255,255,255))

----World Tab
local WorldTab = Window:CreateTab("World")

local WorldSettings = WorldTab:CreateSection("World Lighting")

local ColorCorrectionText = WorldSettings:CreateLabel("WorldTint")

local ColorCorrectionEnabled = false
local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
local ColorCorrectionColor  = Color3.fromRGB(255,255,255)
local ColorCorrectionEffectToggle = WorldSettings:CreateToggle("Enabled", nil, function(State)
	ColorCorrectionEnabled = State
	ColorCorrection.Enabled = ColorCorrectionEnabled
end)

local ColorEffectColor = WorldSettings:CreateColorpicker("Color", function(Color)
	ColorCorrection.TintColor = Color
end)

local AmbientLighting = WorldSettings:CreateLabel("World Ambient")

local AmbientLighting = false
local AmbientColorToggle = WorldSettings:CreateToggle("Enabled", nil, function(State)
	AmbientLighting = State
end)

local AmbientColor = Color3.fromRGB(127, 127, 127)
local AimbientColorPicker = WorldSettings:CreateColorpicker("Color", function(Color)
	AmbientColor = Color
end)

local SelfVisuals = WorldTab:CreateSection("Local Visuals")

local FovEnabled = false
local FovToggle= SelfVisuals:CreateToggle("Enabled", nil, function(State)
	FovEnabled = State
end)

local DefualtFovValue = game.Workspace.CurrentCamera.FieldOfView
local FovValue = DefualtFovValue
local FovSlider = SelfVisuals:CreateSlider("Amount", 0,120, math.floor(DefualtFovValue),true, function(Value)
	FovValue = Value
end)

local ThirdPerson = false
local ThirdPersonToggle= SelfVisuals:CreateToggle("Enable ThirdPerson", nil, function(State)
	ThirdPerson = State
end)

ThirdPersonToggle:CreateKeybind("V", function(Key)
end)

local TPAmount = 0
TPSlider = SelfVisuals:CreateSlider("Amount", 0,50,15,true, function(Value)
	TPAmount = Value
end)

local ScopeDisable = false
BulletHoleToggle = SelfVisuals:CreateToggle("Disable Scope", nil, function(State)
	ScopeDisable = State
	if State then
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.ImageTransparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame1.BackgroundTransparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame2.BackgroundTransparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame3.BackgroundTransparency = 1
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame4.BackgroundTransparency = 1
	else
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Scope.ImageTransparency = 0
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame1.BackgroundTransparency = 0
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame2.BackgroundTransparency = 0
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame3.BackgroundTransparency = 0
		game:GetService("Players").LocalPlayer.PlayerGui.GUI.Crosshairs.Frame4.BackgroundTransparency = 0
	end
end)

local ArmsEnable = true
TPArms = SelfVisuals:CreateToggle("Enable Arms", nil, function(State)
	ArmsEnable = not State
end)

local Tracers = WorldTab:CreateSection("Tracers")

local EnableMarker = false
MarkerToggleButton = Tracers:CreateToggle("HitMarker", false, function(State)
	EnableMarker = State
end)

local EnableTracer = false
MarkerToggleButton = Tracers:CreateToggle("On Shot Tracer", false, function(State)
	EnableTracer = State
end)

local TracerColor = Color3.fromRGB(255, 0, 0)
local TracerColorPicker = Tracers:CreateColorpicker("Color", function(Color)
	TracerColor = Color
end)

local HitSounds = WorldTab:CreateSection("Sounds")

local EnableHitSound = false
EnableHitSoundToggle= HitSounds:CreateToggle("Enable Hit Sound", nil, function(State)
	EnableHitSound = State
end)

local EnableKillSound = false
EnableKillSoundToggle= HitSounds:CreateToggle("Enable Kill Sound", nil, function(State)
	EnableKillSound  = State
end)

local Optimastion = WorldTab:CreateSection("Optimastion")

local BloodEnabled = false
BloodToggle = Optimastion:CreateToggle("Disable Blood", nil, function(State)
	BloodEnabled = State
end)

local BulletHolesEnabled = false
BulletHoleToggle = Optimastion:CreateToggle("Disable Bullet holes", nil, function(State)
	BulletHolesEnabled = State
end)

local WorldShadowsEnable = false
WorldShadows = Optimastion:CreateToggle("Disable Global Shadows", nil, function(State)
	WorldShadowsEnable = State
	game.Lighting.GlobalShadows = not State
end)

----MiscTab
local MiscTab = Window:CreateTab("Misc")

local BhopSettings = MiscTab:CreateSection("Bhop")

local EnableBhop = false
local BhopToggle = BhopSettings:CreateToggle("Enable", nil, function(State)
	EnableBhop = State
end)

local BhopAmount = 25
local BhopAmountSlider = BhopSettings:CreateSlider("Amount", 0,50,25,true, function(Value)
	BhopAmount = Value

end)

local UiSettings = MiscTab:CreateSection("Ui Settings")

local ToggleButtonUI = UiSettings:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
ToggleButtonUI:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
ToggleButtonUI:SetState(true)

local MiscFeatues = MiscTab:CreateSection("Misc Features")

local DisableFiler = false
local ChatFilterToggle = MiscFeatues:CreateToggle("Disable Chat Filter", nil, function(State)
	DisableFiler = State
end)

----Scripts

local function IsAlive(plr)
	if plr and plr.Character and plr.Character.FindFirstChild(plr.Character, "Humanoid") and plr.Character.Humanoid.Health > 0 then
		return true
	end

	return false
end

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
			if v.TeamColor ~= player.TeamColor then
				if EnemyEnableChams then  -- enemy
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
									adorn.AlwaysOnTop =  true
									adorn.ZIndex = 5
									adorn.Transparency = 0.4
									adorn.Color = BrickColor.new(EnemyChamsColor) -- the most RETARDED thing 	
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
			else
				if TeamEnableChams then --team
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
									adorn.AlwaysOnTop = true
									adorn.ZIndex = 5
									adorn.Transparency = 0.4
									adorn.Color = BrickColor.new(TeamChamsColor) -- the most RETARDED thing 	
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

function checkdebris(obj)
	spawn(function()
		if obj.Name == 'Bullet' then
			if BulletHolesEnabled == true then
				obj:Destroy()
			end
		elseif obj.Name == 'C4' then
			if DroppedBombEspEnabled == true then
				boxespweapon(obj)
			end
		elseif obj.Name == 'Blood' then
			if BloodEnabled == true then
				obj:Destroy()
			end
		end
	end)
end

game:GetService("Workspace").Debris.ChildAdded:connect(function(obj)
	checkdebris(obj)
end)

workspace.ChildAdded:Connect(function(new)
	if new.Name == "C4" and new:IsA("Model") and DroppedBombEspEnabled == true then
		local BombTimer = 40

		local BillboardGui = Instance.new("BillboardGui")
		BillboardGui.Parent = new
		BillboardGui.Adornee = new
		BillboardGui.Active = true
		BillboardGui.AlwaysOnTop = true
		BillboardGui.LightInfluence = 1
		BillboardGui.Size = UDim2.new(0, 50, 0, 50)



		if DroppedBombEspEnabled then
			local ImageLabel = Instance.new("ImageLabel")
			ImageLabel.Parent = BillboardGui
			ImageLabel.ZIndex = 1
			ImageLabel.BackgroundTransparency = 1
			ImageLabel.Size = UDim2.new(1, 0, 1, 0)
			ImageLabel.ImageColor3 = DroppedBombColor
			ImageLabel.Image = tostring(require(game.ReplicatedStorage.GetIcon).getWeaponOfKiller(new.Name))
			ImageLabel.ScaleType = Enum.ScaleType.Fit
		end

		if BombTimer then
			local TextLabelBombTimer = Instance.new("TextLabel")
			TextLabelBombTimer.Parent = BillboardGui
			TextLabelBombTimer.ZIndex = 2
			TextLabelBombTimer.BackgroundTransparency = 1
			TextLabelBombTimer.Size = UDim2.new(1, 0, 1, 0)
			TextLabelBombTimer.Font = Enum.Font.SourceSansBold
			TextLabelBombTimer.TextColor3 = DroppedBombColor
			TextLabelBombTimer.TextSize = 14
			TextLabelBombTimer.TextYAlignment = Enum.TextYAlignment.Bottom
			TextLabelBombTimer.Text = tostring(BombTimer.. "/40")

			spawn(function()
				repeat
					wait(1)
					BombTimer = BombTimer - 1
					TextLabelBombTimer.Text = tostring(BombTimer.. "/40")
				until BombTimer == 0 or workspace.Status.RoundOver.Value == true
			end)
		end
	end
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
								backtrackPART.Color = BacktrackColor 
								backtrackPART.CanCollide = false
								backtrackPART.Anchored = true
								backtrackPART.Material = Enum.Material.Metal
								backtrackPART.Transparency = 0.5
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


local RageTarget
local Camera = workspace.CurrentCamera
local library = {}
local TweenService = game:GetService("TweenService")
function library:Tween(...) TweenService:Create(...):Play() end

----Loops

local UserInputService = game:GetService("UserInputService")

----On start scripts

-- Viewmodels fix
for i,v in pairs(game.ReplicatedStorage.Viewmodels:GetChildren()) do
    if v:FindFirstChild("HumanoidRootPart") and v.HumanoidRootPart.Transparency ~= 1 then
        v.HumanoidRootPart.Transparency = 1
    end
end

game.ReplicatedStorage.Viewmodels["v_oldM4A1-S"].Silencer.Transparency = 1
local fix = game.ReplicatedStorage.Viewmodels["v_oldM4A1-S"].Silencer:Clone()
fix.Parent = game.ReplicatedStorage.Viewmodels["v_oldM4A1-S"]
fix.Name = "Silencer2"
fix.Transparency = 0

local Camera = workspace.CurrentCamera
local FindFirstChild = game.FindFirstChild
local WaitForChild = game.WaitForChild
local IsDescendantOf = game.IsDescendantOf
local FindPartOnRayWithWhitelist = workspace.FindPartOnRayWithWhitelist
local LocalPlayer = game.Players.LocalPlayer
local Client = getsenv(LocalPlayer.PlayerGui.Client)

local function BulletCheck(Character)
    repeat
        wait()
    until Client.gun ~= "none" or typeof(Client.gun) == "Instance"
    local IgnoreList = {Camera, LocalPlayer.Character, workspace.Debris, workspace.Ray_Ignore, WaitForChild(workspace.Map, "Clips"), WaitForChild(workspace.Map, "SpawnPoints")}
    local GunPen, GunRange
    GunPen = FindFirstChild(Client.gun, "Penetration") and Client.gun.Penetration.Value * 0.01 or GunPen
    GunRange = FindFirstChild(Client.gun, "Range") and Client.gun.Range.Value or GunRange
    local Direction = CFrame.new(Camera.CFrame.Position, Character.Head.Position).LookVector.Unit * GunRange * 0.0694
    local RayCasted = Ray.new(Camera.CFrame.Position, Direction)
    local NegativeCasted = Ray.new(Character.Head.Position, -Direction)
    local Limit = 0
    local Depth = 0
    for I,V in pairs(Camera:GetPartsObscuringTarget({Character.Head.Position}, IgnoreList)) do
        local PartModifier = 1
        if V.Material == Enum.Material.DiamondPlate then
            PartModifier = 3
        end
        if V.Material == Enum.Material.CorrodedMetal or V.Material == Enum.Material.Metal or V.Material == V.Material == Enum.Material.Concrete or V.Material == Enum.Material.Brick then
            PartModifier = 2
        end
        if V.Name == "Grate" or V.Material == Enum.Material.Wood or V.Material == Enum.Material.WoodPlanks or V.Parent and FindFirstChild(V.Parent, "Humanoid") then
            PartModifier = 0.1
        end
        if V.Transparency == 1 or not V.CanCollide or V.Name == "Glass" or V.Name == "Cardboard" or IsDescendantOf(V, workspace.Ray_Ignore) or IsDescendantOf(V, workspace.Debris) or V.Parent and V.Parent.Name == "Hitboxes" then
            PartModifier = 0
        end
        if V.Name == "nowallbang" then
            PartModifier = 100
        end
        if FindFirstChild(V, "PartModifier") then
            PartModifier = V.PartModifier.Value
        end
        local _, Pos1 = FindPartOnRayWithWhitelist(workspace, RayCasted, {V})
        local _, Pos2 = FindPartOnRayWithWhitelist(workspace, NegativeCasted, {V})
        if Pos1 and Pos2 then
            local Magnitude = (Pos2 - Pos1).Magnitude
            Magnitude = Magnitude * PartModifier
            Limit = math.min(GunPen, Limit + Magnitude)
            Depth = Depth + Magnitude
        end
    end
    return Depth <= Limit
end
local dist

function gettargetrage()
	local nearestmag = math.huge
	local nearestcharacter = nil
	pcall(function()
		local lplr = game:GetService("Players").LocalPlayer
		local t = nil
		local m = lplr:GetMouse()
		for _, plr in pairs(game.Players:GetPlayers()) do
			if plr.Character and plr.Character:FindFirstChild("Head") then
				if plr ~= lplr then
					if plr.TeamColor ~= lplr.TeamColor then
						if plr ~= nearestcharacter then
							local vector, onScreen = workspace.CurrentCamera:WorldToScreenPoint(plr.Character.Head.CFrame.p)
							if TargetType == "Closest from Mouse" then
								dist = (Vector2.new(vector.X, vector.Y) - Vector2.new(m.X,m.Y)).Magnitude
							else
								dist = (plr.Character.HumanoidRootPart.Position - lplr.Character.HumanoidRootPart.Position).magnitude
							end
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
	end)
	return nearestcharacter
end


local canshoot = true
local CrouchFix = false

mt.__namecall = newClose(function(...)
	local method = namecallMethod()
	local args = {...}
	if method == "FindPartOnRayWithIgnoreList" then
		table.insert(args[3],backtrackfolder)
		if RageTarget and RageBotEnable and CrouchFix then 
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (RageTarget[HitpartSelectOption].CFrame.p - workspace.CurrentCamera.CFrame.Position).unit * 500)
		end
	end
	if tostring(method) == "InvokeServer" and tostring(args[1]) == "Hugh" then
		return wait(99e99)
	elseif tostring(method) == "FireServer" and string.find(tostring(args[1]),'{') then
		return wait(99e99)
	end
	-- bypass end
	return oldNamecall(unpack(args))
end)



local Arguments
local LastShot = "Head"

local curVel = 16
local isBhopping = false

local Minvalue = BhopAmount
local MaxValue = BhopAmount
local Acceleration = BhopAmount


local function CharacterAdded()
	wait(0.5)
 	Minvalue = BhopAmount
 	MaxValue = BhopAmount
 	Acceleration = BhopAmount
	wait(0.5)
	if IsAlive(LocalPlayer) then
		LocalPlayer.Character.Humanoid.StateChanged:Connect(function(state)
			if EnableBhop == true then
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) == false then
					isBhopping = false
					curVel = Minvalue
				elseif state == Enum.HumanoidStateType.Landed and UserInputService:IsKeyDown(Enum.KeyCode.Space) then
					LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				elseif state == Enum.HumanoidStateType.Jumping then
					isBhopping = true
					curVel = (curVel + Acceleration) >= MaxValue and MaxValue or curVel + Acceleration
				end
			end
		end)
	else
		isBhopping = false
	end
end

function characterrotate(pos)
	pcall(function()
		if game.Players.LocalPlayer.Character then
			game.Players.LocalPlayer.Character.Humanoid.AutoRotate = false
			local gyro = Instance.new('BodyGyro')
			gyro.D = (aasmooth or 0)
			gyro.P = 1000000
			gyro.MaxTorque = Vector3.new(0, 1000000, 0)
			gyro.Parent = game.Players.LocalPlayer.Character.UpperTorso
			gyro.CFrame = CFrame.new(gyro.Parent.Position,  pos)
			wait()
			gyro:Destroy()
		end
	end)
end

function beam(pos,yeeet)
	local player = game:GetService("Players").LocalPlayer
	local ray = Ray.new(yeeet, (pos - yeeet).unit * 300)
	local part, position = workspace:FindPartOnRay(ray, player.Character, false, true)
	local beam = Instance.new("Part", workspace)
	beam.BrickColor = BrickColor.new(TracerColor)
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

oldNewIndex = hookfunc(getrawmetatable(game.Players.LocalPlayer.PlayerGui.Client).__newindex, newcclosure(function(self, idx, val)
	if not checkcaller() then
		if self.Name == "Humanoid" and idx == "WalkSpeed" and val ~= 0 and isBhopping == true then 
			val = curVel
		end
	end
    return oldNewIndex(self, idx, val)
end))

game.Players.LocalPlayer.Additionals.TotalDamage.Changed:Connect(function(val)
	if EnableHitSound and val ~= 0 then
		local marker = Instance.new("Sound")
		marker.Parent = game:GetService("SoundService")
		marker.SoundId = "rbxassetid://7149336668"
		marker.Volume = 3
		marker:Play()
	end
end)

game.Players.LocalPlayer.Status.Kills.Changed:Connect(function(val)
	if EnableKillSound and val ~= 0 then
		local marker = Instance.new("Sound")
		marker.Parent = game:GetService("SoundService")
		marker.SoundId = "rbxassetid://5043539486"
		marker.Volume = 3
		marker:Play()
	end
end)



LocalPlayer.Additionals.TotalDamage:GetPropertyChangedSignal("Value"):Connect(function(current)
	if current == 0 then return end
	coroutine.wrap(function()
		if EnableMarker then
			local Line = Drawing.new("Line")
			local Line2 = Drawing.new("Line")
			local Line3 = Drawing.new("Line")
			local Line4 = Drawing.new("Line")

			local x, y = Camera.ViewportSize.X/2, Camera.ViewportSize.Y/2

			Line.From = Vector2.new(x + 4, y + 4)
			Line.To = Vector2.new(x + 10, y + 10)
			Line.Color = Color3.fromRGB(255,255,255)
			Line.Visible = true 

			Line2.From = Vector2.new(x + 4, y - 4)
			Line2.To = Vector2.new(x + 10, y - 10)
			Line2.Color = Color3.fromRGB(255,255,255)
			Line2.Visible = true 

			Line3.From = Vector2.new(x - 4, y - 4)
			Line3.To = Vector2.new(x - 10, y - 10)
			Line3.Color = Color3.fromRGB(255,255,255)
			Line3.Visible = true 

			Line4.From = Vector2.new(x - 4, y + 4)
			Line4.To = Vector2.new(x - 10, y + 10)
			Line4.Color = Color3.fromRGB(255,255,255)
			Line4.Visible = true

			Line.Transparency = 1
			Line2.Transparency = 1
			Line3.Transparency = 1
			Line4.Transparency = 1

			Line.Thickness = 1
			Line2.Thickness = 1
			Line3.Thickness = 1
			Line4.Thickness = 1

			wait(0.3)
			for i = 1,0,-0.1 do
				wait()
				Line.Transparency = i 
				Line2.Transparency = i
				Line3.Transparency = i
				Line4.Transparency = i
			end
			Line:Remove()
			Line2:Remove()
			Line3:Remove()
			Line4:Remove()
		end
	end)()
end)

spawn(function()
	while true do
		wait(0.3)
		CharacterAdded()
	end
end)

		local Client = getsenv(game.Players.LocalPlayer.PlayerGui.Client)
		local ReplicatedStorage = game:GetService("ReplicatedStorage")
	
		local allSkins = {
			{'AK47_Ace'},
			{'AK47_Bloodboom'},
			{'AK47_Clown'},
			{'AK47_Code Orange'},
			{'AK47_Eve'},
			{'AK47_Gifted'},
			{'AK47_Glo'},
			{'AK47_Godess'},
			{'AK47_Hallows'},
			{'AK47_Halo'},
			{'AK47_Hypersonic'},
			{'AK47_Inversion'},
			{'AK47_Jester'},
			{'AK47_Maker'},
			{'AK47_Mean Green'},
			{'AK47_Outlaws'},
			{'AK47_Outrunner'},
			{'AK47_Patch'},
			{'AK47_Plated'},
			{'AK47_Precision'},
			{'AK47_Quantum'},
			{'AK47_Quicktime'},
			{'AK47_Scapter'},
			{'AK47_Secret Santa'},
			{'AK47_Shooting Star'},
			{'AK47_Skin Committee'},
			{'AK47_Survivor'},
			{'AK47_Ugly Sweater'},
			{'AK47_VAV'},
			{'AK47_Variant Camo'},
			{'AK47_Yltude'},
			{'AUG_Chilly Night'},
			{'AUG_Dream Hound'},
			{'AUG_Enlisted'},
			{'AUG_Graffiti'},
			{'AUG_Homestead'},
			{'AUG_Maker'},
			{'AUG_NightHawk'},
			{'AUG_Phoenix'},
			{'AUG_Sunsthetic'},
			{'AWP_Abaddon'},
			{'AWP_Autumness'},
			{'AWP_Blastech'},
			{'AWP_Bloodborne'},
			{'AWP_Coffin Biter'},
			{'AWP_Desert Camo'},
			{'AWP_Difference'},
			{'AWP_Dragon'},
			{'AWP_Forever'},
			{'AWP_Grepkin'},
			{'AWP_Hika'},
			{'AWP_Illusion'},
			{'AWP_Instinct'},
			{'AWP_JTF2'},
			{'AWP_Lunar'},
			{'AWP_Nerf'},
			{'AWP_Northern Lights'},
			{'AWP_Pear Tree'},
			{'AWP_Pink Vision'},
			{'AWP_Pinkie'},
			{'AWP_Quicktime'},
			{'AWP_Racer'},
			{'AWP_Regina'},
			{'AWP_Retroactive'},
			{'AWP_Scapter'},
			{'AWP_Silence'},
			{'AWP_Venomus'},
			{'AWP_Weeb'},
			{'Banana_Stock'},
			{'Bayonet_Aequalis'},
			{'Bayonet_Banner'},
			{'Bayonet_Candy Cane'},
			{'Bayonet_Consumed'},
			{'Bayonet_Cosmos'},
			{'Bayonet_Crimson Tiger'},
			{'Bayonet_Crow'},
			{'Bayonet_Delinquent'},
			{'Bayonet_Digital'},
			{'Bayonet_Easy-Bake'},
			{'Bayonet_Egg Shell'},
			{'Bayonet_Festive'},
			{'Bayonet_Frozen Dream'},
			{'Bayonet_Geo Blade'},
			{'Bayonet_Ghastly'},
			{'Bayonet_Goo'},
			{'Bayonet_Hallows'},
			{'Bayonet_Intertwine'},
			{'Bayonet_Marbleized'},
			{'Bayonet_Mariposa'},
			{'Bayonet_Naval'},
			{'Bayonet_Neonic'},
			{'Bayonet_RSL'},
			{'Bayonet_Racer'},
			{'Bayonet_Sapphire'},
			{'Bayonet_Silent Night'},
			{'Bayonet_Splattered'},
			{'Bayonet_Stock'},
			{'Bayonet_Topaz'},
			{'Bayonet_Tropical'},
			{'Bayonet_Twitch'},
			{'Bayonet_UFO'},
			{'Bayonet_Wetland'},
			{'Bayonet_Worn'},
			{'Bayonet_Wrapped'},
			{'Bearded Axe_Beast'},
			{'Bearded Axe_Splattered'},
			{'Bizon_Autumic'},
			{'Bizon_Festive'},
			{'Bizon_Oblivion'},
			{'Bizon_Saint Nick'},
			{'Bizon_Sergeant'},
			{'Bizon_Shattered'},
			{'Butterfly Knife_Aurora'},
			{'Butterfly Knife_Bloodwidow'},
			{'Butterfly Knife_Consumed'},
			{'Butterfly Knife_Cosmos'},
			{'Butterfly Knife_Crimson Tiger'},
			{'Butterfly Knife_Crippled Fade'},
			{'Butterfly Knife_Digital'},
			{'Butterfly Knife_Egg Shell'},
			{'Butterfly Knife_Freedom'},
			{'Butterfly Knife_Frozen Dream'},
			{'Butterfly Knife_Goo'},
			{'Butterfly Knife_Hallows'},
			{'Butterfly Knife_Icicle'},
			{'Butterfly Knife_Inversion'},
			{'Butterfly Knife_Jade Dream'},
			{'Butterfly Knife_Marbleized'},
			{'Butterfly Knife_Naval'},
			{'Butterfly Knife_Neonic'},
			{'Butterfly Knife_Reaper'},
			{'Butterfly Knife_Ruby'},
			{'Butterfly Knife_Scapter'},
			{'Butterfly Knife_Splattered'},
			{'Butterfly Knife_Stock'},
			{'Butterfly Knife_Topaz'},
			{'Butterfly Knife_Tropical'},
			{'Butterfly Knife_Twitch'},
			{'Butterfly Knife_Wetland'},
			{'Butterfly Knife_White Boss'},
			{'Butterfly Knife_Worn'},
			{'Butterfly Knife_Wrapped'},
			{'CZ_Designed'},
			{'CZ_Festive'},
			{'CZ_Holidays'},
			{'CZ_Lightning'},
			{'CZ_Orange Web'},
			{'CZ_Spectre'},
			{'Cleaver_Spider'},
			{'Cleaver_Splattered'},
			{'DesertEagle_Cold Truth'},
			{'DesertEagle_Cool Blue'},
			{'DesertEagle_DropX'},
			{'DesertEagle_Glittery'},
			{'DesertEagle_Grim'},
			{'DesertEagle_Heat'},
			{'DesertEagle_Honor-bound'},
			{'DesertEagle_Independence'},
			{'DesertEagle_Krystallos'},
			{'DesertEagle_Pumpkin Buster'},
			{'DesertEagle_ROLVe'},
			{'DesertEagle_Cringe'},
			{'DesertEagle_Racer'},
			{'DesertEagle_Scapter'},
			{'DesertEagle_Skin Committee'},
			{'DesertEagle_Survivor'},
			{'DesertEagle_Weeb'},
			{'DesertEagle_Xmas'},
			{'DualBerettas_Carbonized'},
			{'DualBerettas_Dusty Manor'},
			{'DualBerettas_Floral'},
			{'DualBerettas_Hexline'},
			{'DualBerettas_Neon web'},
			{'DualBerettas_Old Fashioned'},
			{'DualBerettas_Xmas'},
			{'Falchion Knife_Bloodwidow'},
			{'Falchion Knife_Chosen'},
			{'Falchion Knife_Coal'},
			{'Falchion Knife_Consumed'},
			{'Falchion Knife_Cosmos'},
			{'Falchion Knife_Crimson Tiger'},
			{'Falchion Knife_Crippled Fade'},
			{'Falchion Knife_Digital'},
			{'Falchion Knife_Egg Shell'},
			{'Falchion Knife_Festive'},
			{'Falchion Knife_Freedom'},
			{'Falchion Knife_Frozen Dream'},
			{'Falchion Knife_Goo'},
			{'Falchion Knife_Hallows'},
			{'Falchion Knife_Inversion'},
			{'Falchion Knife_Late Night'},
			{'Falchion Knife_Marbleized'},
			{'Falchion Knife_Naval'},
			{'Falchion Knife_Neonic'},
			{'Falchion Knife_Racer'},
			{'Falchion Knife_Ruby'},
			{'Falchion Knife_Splattered'},
			{'Falchion Knife_Stock'},
			{'Falchion Knife_Topaz'},
			{'Falchion Knife_Tropical'},
			{'Falchion Knife_Wetland'},
			{'Falchion Knife_Worn'},
			{'Falchion Knife_Wrapped'},
			{'Falchion Knife_Zombie'},
			{'Famas_Abstract'},
			{'Famas_Centipede'},
			{'Famas_Cogged'},
			{'Famas_Goliath'},
			{'Famas_Haunted Forest'},
			{'Famas_KugaX'},
			{'Famas_MK11'},
			{'Famas_Medic'},
			{'Famas_Redux'},
			{'Famas_Shocker'},
			{'Famas_Toxic Rain'},
			{'FiveSeven_Autumn Fade'},
			{'FiveSeven_Danjo'},
			{'FiveSeven_Fluid'},
			{'FiveSeven_Gifted'},
			{'FiveSeven_Midnight Ride'},
			{'FiveSeven_Mr. Anatomy'},
			{'FiveSeven_Stigma'},
			{'FiveSeven_Sub Zero'},
			{'FiveSeven_Summer'},
			{'Flip Knife_Stock'},
			{'G3SG1_Amethyst'},
			{'G3SG1_Autumn'},
			{'G3SG1_Foliage'},
			{'G3SG1_Hex'},
			{'G3SG1_Holly Bound'},
			{'G3SG1_Mahogany'},
			{'Galil_Frosted'},
			{'Galil_Hardware 2'},
			{'Galil_Hardware'},
			{'Galil_Toxicity'},
			{'Galil_Worn'},
			{'Glock_Angler'},
			{'Glock_Anubis'},
			{'Glock_Biotrip'},
			{'Glock_Day Dreamer'},
			{'Glock_Desert Camo'},
			{'Glock_Gravestomper'},
			{'Glock_Midnight Tiger'},
			{'Glock_Money Maker'},
			{'Glock_RSL'},
			{'Glock_Rush'},
			{'Glock_Scapter'},
			{'Glock_Spacedust'},
			{'Glock_Tarnish'},
			{'Glock_Underwater'},
			{'Glock_Wetland'},
			{'Glock_White Sauce'},
			{'Gut Knife_Banner'},
			{'Gut Knife_Bloodwidow'},
			{'Gut Knife_Consumed'},
			{'Gut Knife_Cosmos'},
			{'Gut Knife_Crimson Tiger'},
			{'Gut Knife_Crippled Fade'},
			{'Gut Knife_Digital'},
			{'Gut Knife_Egg Shell'},
			{'Gut Knife_Frozen Dream'},
			{'Gut Knife_Geo Blade'},
			{'Gut Knife_Goo'},
			{'Gut Knife_Hallows'},
			{'Gut Knife_Lurker'},
			{'Gut Knife_Marbleized'},
			{'Gut Knife_Naval'},
			{'Gut Knife_Neonic'},
			{'Gut Knife_Present'},
			{'Gut Knife_Ruby'},
			{'Gut Knife_Rusty'},
			{'Gut Knife_Splattered'},
			{'Gut Knife_Topaz'},
			{'Gut Knife_Tropical'},
			{'Gut Knife_Wetland'},
			{'Gut Knife_Worn'},
			{'Gut Knife_Wrapped'},
			{'Huntsman Knife_Aurora'},
			{'Huntsman Knife_Bloodwidow'},
			{'Huntsman Knife_Consumed'},
			{'Huntsman Knife_Cosmos'},
			{'Huntsman Knife_Cozy'},
			{'Huntsman Knife_Crimson Tiger'},
			{'Huntsman Knife_Crippled Fade'},
			{'Huntsman Knife_Digital'},
			{'Huntsman Knife_Egg Shell'},
			{'Huntsman Knife_Frozen Dream'},
			{'Huntsman Knife_Geo Blade'},
			{'Huntsman Knife_Goo'},
			{'Huntsman Knife_Hallows'},
			{'Huntsman Knife_Honor Fade'},
			{'Huntsman Knife_Marbleized'},
			{'Huntsman Knife_Monster'},
			{'Huntsman Knife_Naval'},
			{'Huntsman Knife_Ruby'},
			{'Huntsman Knife_Splattered'},
			{'Huntsman Knife_Stock'},
			{'Huntsman Knife_Tropical'},
			{'Huntsman Knife_Twitch'},
			{'Huntsman Knife_Wetland'},
			{'Huntsman Knife_Worn'},
			{'Huntsman Knife_Wrapped'},
			{'Karambit_Bloodwidow'},
			{'Karambit_Consumed'},
			{'Karambit_Cosmos'},
			{'Karambit_Crimson Tiger'},
			{'Karambit_Crippled Fade'},
			{'Karambit_Death Wish'},
			{'Karambit_Digital'},
			{'Karambit_Egg Shell'},
			{'Karambit_Festive'},
			{'Karambit_Frozen Dream'},
			{'Karambit_Glossed'},
			{'Karambit_Gold'},
			{'Karambit_Goo'},
			{'Karambit_Hallows'},
			{'Karambit_Jade Dream'},
			{'Karambit_Jester'},
			{'Karambit_Lantern'},
			{'Karambit_Liberty Camo'},
			{'Karambit_Marbleized'},
			{'Karambit_Naval'},
			{'Karambit_Neonic'},
			{'Karambit_Pizza'},
			{'Karambit_Quicktime'},
			{'Karambit_Racer'},
			{'Karambit_Ruby'},
			{'Karambit_Scapter'},
			{'Karambit_Splattered'},
			{'Karambit_Stock'},
			{'Karambit_Topaz'},
			{'Karambit_Tropical'},
			{'Karambit_Twitch'},
			{'Karambit_Wetland'},
			{'Karambit_Worn'},
			{'M249_Aggressor'},
			{'M249_P2020'},
			{'M249_Spooky'},
			{'M249_Wolf'},
			{'M4A1_Animatic'},
			{'M4A1_Burning'},
			{'M4A1_Desert Camo'},
			{'M4A1_Heavens Gate'},
			{'M4A1_Impulse'},
			{'M4A1_Jester'},
			{'M4A1_Lunar'},
			{'M4A1_Necropolis'},
			{'M4A1_Tecnician'},
			{'M4A1_Toucan'},
			{'M4A1_Wastelander'},
			{'M4A4_BOT[S]'},
			{'M4A4_Candyskull'},
			{'M4A4_Delinquent'},
			{'M4A4_Desert Camo'},
			{'M4A4_Devil'},
			{'M4A4_Endline'},
			{'M4A4_Flashy Ride'},
			{'M4A4_Ice Cap'},
			{'M4A4_Jester'},
			{'M4A4_King'},
			{'M4A4_Mistletoe'},
			{'M4A4_Pinkie'},
			{'M4A4_Pinkvision'},
			{'M4A4_Pondside'},
			{'M4A4_Precision'},
			{'M4A4_Quicktime'},
			{'M4A4_Racer'},
			{'M4A4_RayTrack'},
			{'M4A4_Scapter'},
			{'M4A4_Stardust'},
			{'M4A4_Toy Soldier'},
			{'MAC10_Artists Intent'},
			{'MAC10_Blaze'},
			{'MAC10_Golden Rings'},
			{'MAC10_Pimpin'},
			{'MAC10_Skeleboney'},
			{'MAC10_Toxic'},
			{'MAC10_Turbo'},
			{'MAC10_Wetland'},
			{'MAG7_Bombshell'},
			{'MAG7_C4UTION'},
			{'MAG7_Frosty'},
			{'MAG7_Molten'},
			{'MAG7_Outbreak'},
			{'MAG7_Striped'},
			{'MP7_Calaxian'},
			{'MP7_Cogged'},
			{'MP7_Goo'},
			{'MP7_Holiday'},
			{'MP7_Industrial'},
			{'MP7_Reindeer'},
			{'MP7_Silent Ops'},
			{'MP7_Sunshot'},
			{'MP9_Blueroyal'},
			{'MP9_Cob Web'},
			{'MP9_Cookie Man'},
			{'MP9_Decked Halls'},
			{'MP9_SnowTime'},
			{'MP9_Vaporwave'},
			{'MP9_Velvita'},
			{'MP9_Wilderness'},
			{'Negev_Default'},
			{'Negev_Midnightbones'},
			{'Negev_Quazar'},
			{'Negev_Striped'},
			{'Negev_Wetland'},
			{'Negev_Winterfell'},
			{'Nova_Black Ice'},
			{'Nova_Cookie'},
			{'Nova_Paradise'},
			{'Nova_Sharkesh'},
			{'Nova_Starry Night'},
			{'Nova_Terraformer'},
			{'Nova_Tiger'},
			{'P2000_Apathy'},
			{'P2000_Camo Dipped'},
			{'P2000_Candycorn'},
			{'P2000_Comet'},
			{'P2000_Dark Beast'},
			{'P2000_Golden Age'},
			{'P2000_Lunar'},
			{'P2000_Pinkie'},
			{'P2000_Ruby'},
			{'P2000_Silence'},
			{'P250_Amber'},
			{'P250_Bomber'},
			{'P250_Equinox'},
			{'P250_Frosted'},
			{'P250_Goldish'},
			{'P250_Green Web'},
			{'P250_Shark'},
			{'P250_Solstice'},
			{'P250_TC250'},
			{'P90_Demon Within'},
			{'P90_Elegant'},
			{'P90_Krampus'},
			{'P90_Northern Lights'},
			{'P90_P-Chan'},
			{'P90_Pine'},
			{'P90_Redcopy'},
			{'P90_Skulls'},
			{'R8_Exquisite'},
			{'R8_Hunter'},
			{'R8_Spades'},
			{'R8_TG'},
			{'R8_Violet'},
			{'SG_DropX'},
			{'SG_Dummy'},
			{'SG_Kitty Cat'},
			{'SG_Knighthood'},
			{'SG_Magma'},
			{'SG_Variant Camo'},
			{'SG_Yltude'},
			{'SawedOff_Casino'},
			{'SawedOff_Colorboom'},
			{'SawedOff_Executioner'},
			{'SawedOff_Opal'},
			{'SawedOff_Spooky'},
			{'SawedOff_Sullys Blacklight'},
			{'Scout_Coffin Biter'},
			{'Scout_Flowing Mists'},
			{'Scout_Hellborn'},
			{'Scout_Hot Cocoa'},
			{'Scout_Monstruo'},
			{'Scout_Neon Regulation'},
			{'Scout_Posh'},
			{'Scout_Pulse'},
			{'Scout_Railgun'},
			{'Scout_Theory'},
			{'Scout_Xmas'},
			{'Sickle_Mummy'},
			{'Sickle_Splattered'},
			{'Tec9_Charger'},
			{'Tec9_Gift Wrapped'},
			{'Tec9_Ironline'},
			{'Tec9_Performer'},
			{'Tec9_Phol'},
			{'Tec9_Samurai'},
			{'Tec9_Skintech'},
			{'Tec9_Stocking Stuffer'},
			{'UMP_Death Grip'},
			{'UMP_Gum Drop'},
			{'UMP_Magma'},
			{'UMP_Militia Camo'},
			{'UMP_Molten'},
			{'UMP_Redline'},
			{'USP_Crimson'},
			{'USP_Dizzy'},
			{'USP_Frostbite'},
			{'USP_Holiday'},
			{'USP_Jade Dream'},
			{'USP_Kraken'},
			{'USP_Nighttown'},
			{'USP_Paradise'},
			{'USP_Racing'},
			{'USP_Skull'},
			{'USP_Unseen'},
			{'USP_Worlds Away'},
			{'USP_Yellowbelly'},
			{'XM_Artic'},
			{'XM_Atomic'},
			{'XM_Campfire'},
			{'XM_Endless Night'},
			{'XM_MK11'},
			{'XM_Predator'},
			{'XM_Red'},
			{'XM_Spectrum'},
			{'Handwraps_Wraps'},
			{'Sports Glove_Hazard'},
			{'Sports Glove_Hallows'},
			{'Sports Glove_Majesty'},
			{'Strapped Glove_Racer'},
			{'Strapped Glove_Grim'},
			{'Strapped Glove_Wisk'},
			{'Fingerless Glove_Scapter'},
			{'Fingerless Glove_Digital'},
			{'Fingerless Glove_Patch'},
			{'Handwraps_Guts'},
			{'Handwraps_Wetland'},
			{'Strapped Glove_Molten'},
			{'Fingerless Glove_Crystal'},
			{'Sports Glove_Royal'},
			{'Strapped Glove_Kringle'},
			{'Handwraps_MMA'},
			{'Sports Glove_Weeb'},
			{'Sports Glove_CottonTail'},
			{'Sports Glove_RSL'},
			{'Handwraps_Ghoul Hex'},
			{'Handwraps_Phantom Hex'},
			{'Handwraps_Spector Hex'},
			{'Handwraps_Orange Hex'},
			{'Handwraps_Purple Hex'},
			{'Handwraps_Green Hex'},
		}
	
		local mt = getrawmetatable(game)
		local oldNamecall = mt.__namecall
		setreadonly(mt, false)
	
		local isUnlocked
	
		mt.__namecall = newcclosure(function(self, ...)
			local args = {...}
			if getnamecallmethod() == "InvokeServer" and tostring(self) == "Hugh" then
				return
			end
			if getnamecallmethod() == "FireServer" then
				if args[1] == LocalPlayer.UserId then
					return
				end
				if string.len(tostring(self)) == 38 then
					if not isUnlocked then
						isUnlocked = true
						for i,v in pairs(allSkins) do
							local doSkip
							for i2,v2 in pairs(args[1]) do
								if v[1] == v2[1] then
									doSkip = true
								end
							end
							if not doSkip then
								table.insert(args[1], v)
							end
						end
					end
					return
				end
				if tostring(self) == "DataEvent" and args[1][4] then
					local currentSkin = string.split(args[1][4][1], "_")[2]
					if args[1][2] == "Both" then
						LocalPlayer["SkinFolder"]["CTFolder"][args[1][3]].Value = currentSkin
						LocalPlayer["SkinFolder"]["TFolder"][args[1][3]].Value = currentSkin
					else
						LocalPlayer["SkinFolder"][args[1][2] .. "Folder"][args[1][3]].Value = currentSkin
					end
				end
			end
			return oldNamecall(self, ...)
		end)
	
		setreadonly(mt, true)
	
		Client.CurrentInventory = allSkins
	
local TClone, CTClone = LocalPlayer.SkinFolder.TFolder:Clone(), game.Players.LocalPlayer.SkinFolder.CTFolder:Clone()
LocalPlayer.SkinFolder.TFolder:Destroy()
LocalPlayer.SkinFolder.CTFolder:Destroy()
TClone.Parent = LocalPlayer.SkinFolder
CTClone.Parent = LocalPlayer.SkinFolder

local leftrotation = CFrame.new(-150,0,0)
local rightrotation = CFrame.new(150,0,0)
local backrotation = CFrame.new(-4,0,0)
local bypassthing =  string.rep(game:HttpGet('https://pastebin.com/raw/pNDkmBz7',true),2)

local inputser = game:GetService("UserInputService")
_G.keydownawsd = 'a'
game:GetService("RunService").RenderStepped:Connect(function()
	if AntiAimEnable == true then
			if  PitchSelectOption == 'Keybind' then
				if _G.keydownawsd == 'd' then
					characterrotate((workspace.CurrentCamera.CFrame * rightrotation).p)
					Main.Right.ImageColor3 = ArrowColor
					Main.Left.ImageColor3 = Color3.fromRGB(255, 255, 255)
					Main.Down.ImageColor3 = Color3.fromRGB(255, 255, 255)
				elseif _G.keydownawsd == 's' then
					characterrotate((workspace.CurrentCamera.CFrame * backrotation).p)
					Main.Right.ImageColor3 = Color3.fromRGB(255, 255, 255)
					Main.Left.ImageColor3 = Color3.fromRGB(255, 255, 255)
					Main.Down.ImageColor3 = ArrowColor
				elseif _G.keydownawsd == 'a' then
					characterrotate((workspace.CurrentCamera.CFrame * leftrotation).p)
					Main.Right.ImageColor3 = Color3.fromRGB(255, 255, 255)
					Main.Left.ImageColor3 = ArrowColor
					Main.Down.ImageColor3 = Color3.fromRGB(255, 255, 255)
				end
			elseif PitchSelectOption== 'Reversed' then
				characterrotate((workspace.CurrentCamera.CFrame * backrotation).p)
			elseif PitchSelectOption == 'Jitter' then
				if game.Players.LocalPlayer.Character then
					game.Players.LocalPlayer.Character:WaitForChild("Humanoid").AutoRotate = false
					local spin = Instance.new('BodyAngularVelocity',game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart'))
					spin.AngularVelocity = Vector3.new(0, math.random(-60000,55000), 0)
					spin.MaxTorque = Vector3.new(0, 35000, 0)
					wait()
					spin:Destroy()
				end
			elseif PitchSelectOption == 'Spin' then
				if game.Players.LocalPlayer.Character then
					game.Players.LocalPlayer.Character:WaitForChild("Humanoid").AutoRotate = false
					local spin = Instance.new('BodyAngularVelocity',game.Players.LocalPlayer.Character:FindFirstChild('HumanoidRootPart'))
					spin.AngularVelocity = Vector3.new(0, aaspeed , 0)
					spin.MaxTorque = Vector3.new(0, 50000, 0)
					wait()
					spin:Destroy()
				end
			end
		elseif game.Players.LocalPlayer.Character then
			game.Players.LocalPlayer.Character:WaitForChild("Humanoid").AutoRotate = true
		end
	
		if EnableDownScale then
			game.ReplicatedStorage.Events.ControlTurn:FireServer(-((Downscale*0.05) + 0.96247750520706))
		end
	
		if inputser:IsKeyDown(Enum.KeyCode.Left) then
			_G.keydownawsd = 'a'
		elseif inputser:IsKeyDown(Enum.KeyCode.Right) then
			_G.keydownawsd = 'd'
		elseif inputser:IsKeyDown(Enum.KeyCode.Down) then
			_G.keydownawsd = 's'
		end	
		if ChamsEnabled then
			turn_on()
		else
			turn_off()
		end
		if AmbientLighting then
			game.Lighting.Ambient = AmbientColor
		else
			game.Lighting.Ambient = Color3.fromRGB(127, 127, 127)
		end
		if FovEnabled then
			game.Workspace.CurrentCamera.FieldOfView = FovValue  
		else
			game.Workspace.CurrentCamera.FieldOfView  = DefualtFovValue
		end
		if ThirdPerson then
			game.Players.LocalPlayer.CameraMaxZoomDistance = TPAmount
			game.Players.LocalPlayer.CameraMinZoomDistance = TPAmount
			if ArmsEnable then
				for _,v in pairs(workspace.Camera:GetDescendants()) do 
					pcall(function() 
					v.Transparency=1
					end)
				end
			end
		else
			game.Players.LocalPlayer.CameraMaxZoomDistance = 0
			game.Players.LocalPlayer.CameraMinZoomDistance = 0
		end
		local yeet = gettarget()
		if yeet then
			target = yeet
		else
			target = nil
		end
		local xd = math.random(0,100)
		if (HeadShotChance or 0) <= xd then 
			bodyname = 'UpperTorso'
		elseif (BodyShotChance or 0) >= xd then
			bodyname = 'Head'
		else
			bodyname = 'Head'
		end

		
		if KillallEnable then
			for i,v in pairs(game.Players:GetPlayers()) do 
				if v.Character and v ~= game.Players.LocalPlayer and v.TeamColor ~= game.Players.LocalPlayer.TeamColor then
					local oh1 = v.Character.Head
					local oh2 = v.Character.Head.CFrame.p
					local oh3 = "AWP"
					local oh4 = 4096
					local oh5 = game.Players.LocalPlayer.Character.Gun
					local oh8 = 15
					local oh9 = false
					local oh10 = false
					local oh11 = Vector3.new(-126.878326, 353.474854, 49.3892708)
					local oh12 = 16868
					local oh13 = Vector3.new(0, 0, -1)
					game:GetService("ReplicatedStorage").Events.HitPart:FireServer(oh1, oh2, oh3, oh4, oh5, oh6, oh7, oh8, oh9, oh10, oh11, oh12, oh13)
				end
			end
		end

		local yeet = gettargetrage()
		if yeet then
			RageTarget = yeet
		else
			RageTarget = nil
		end
		if RageBotEnable then
			if IsAlive(LocalPlayer) then
				if BulletCheck(RageTarget) then
					if not Client.gun:FindFirstChild("Melee") then
						if canshoot then
							canshoot = false
							if BodyAimSelectOption == "Every Other shot" then
							Arguments = {
							[1] = workspace[RageTarget.Name][LastShot],
							[2] = workspace[RageTarget.Name][LastShot].Position,
							[3] = workspace[game.Players.LocalPlayer.Name].EquippedTool.Value,
							[4] = 100,
							[5] = "Awp",
							[8] = 1,
							[9] = false,
							[10] = true,
							[11] = Vector3.new(),
							[12] = 100,
							[13] = Vector3.new()
							}
							else
								Arguments = {
									[1] = workspace[RageTarget.Name][HitpartSelectOption],
									[2] = workspace[RageTarget.Name][HitpartSelectOption].Position,
									[3] = workspace[game.Players.LocalPlayer.Name].EquippedTool.Value,
									[4] = 100,
									[5] = "Awp",
									[8] = 1,
									[9] = false,
									[10] = true,
									[11] = Vector3.new(),
									[12] = 100,
									[13] = Vector3.new()
									}
							end

							CrouchFix = true
							Client.firebullet()
							game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))
							if EnableTracer then
								beam(workspace[RageTarget.Name][HitpartSelectOption].Position,lplr.Character.Head.CFrame.p)
							end


							if DTEnable then 
								Client.firebullet()
								game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))
								if EnableTracer then
									beam(workspace[RageTarget.Name][HitpartSelectOption].Position,lplr.Character.Head.CFrame.p)
								end
							end 

							CrouchFix = false
	
							if BodyAimSelectOption ~= "None" then
								if BodyAimSelectOption == "Every Other shot" then
									if LastShot == "Head" then
										LastShot = "UpperTorso" 
									else
										LastShot = "Head"
									end
								end
							end


							local gun=workspace[game.Players.LocalPlayer.Name].EquippedTool.Value
							wait(game.ReplicatedStorage.Weapons[gun].FireRate.Value)
							canshoot = true
					end
				else
					canshoot = true
				end
			else
				canshoot = true
			end
		else
			canshoot = true
		end
	end
	if workspace.Status.RoundOver.Value == true then
		canshoot = true
	end

	if IsAlive(LocalPlayer) == false then
		canshoot = true
	end

	if RageTarget == nil then
		canshoot = true
	end

	if RageBotEnable == false then
		canshoot = true
	end

end)
print("Loaded!")

