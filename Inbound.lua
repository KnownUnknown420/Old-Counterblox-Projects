--UnknownSoultions

local Config = {
	WindowName = "Inbound.XYZ",
	Color = Color3.fromRGB(255, 0, 0),
	Keybind = Enum.KeyCode.Insert
}


local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

----Aimbot Tab
local AimbotTab = Window:CreateTab("Aimbot")

local Ragebot = AimbotTab:CreateSection("Rage bot")

local RageBotEnable = false
local FovCircleToggle =	Ragebot:CreateToggle("Enable", false, function(State)
	RageBotEnable = State
end)

local SilentAimSection = AimbotTab:CreateSection("Silent Aim")

local SilentAimEnabled = false
local SilentAimToggle =	SilentAimSection:CreateToggle("Enable", nil, function(State)
	SilentAimEnabled = State
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
local SilentAimFOVSlider = SilentAimSection:CreateSlider("FOV amount", 0,500, 5 ,true, function(Value)
	SilentAimFOV = Value
	ImageLabel.Size = UDim2.new(0, Value*2, 0, Value*2)
end)

local FovCircleEnable = false
local FovCircleToggle =	SilentAimSection:CreateToggle("Enable FOV Circle", false, function(State)
	ImageLabel.Visible = State
end)

local HeadShotChance = 1
local HeadShotSlider = SilentAimSection:CreateSlider("Headshot chance", 0,100, nil ,true, function(Value)
	HeadShotChance = Value
end)

local BodyShotChance = 1
local BodyShotSlider = SilentAimSection:CreateSlider("Bodyshot chance", 0,100, nil ,true, function(Value)
	BodyShotChance = Value
end)

local triggerbotsection = AimbotTab:CreateSection("Triggerbot")

local TriggerbotEnable = false
local triggerbottoggle = triggerbotsection:CreateToggle("Enable", false, function(State)
	TriggerbotEnable = State
end)

local Triggerdelay = 0
local triggerdelayslider = triggerbotsection:CreateSlider("Delay (MS)", 0,100, nil ,true, function(Value)
	Triggerdelay = Value / 10000
end)

local BacktrackSection = AimbotTab:CreateSection("Backtrack")

local BTEnable = false
local Backtracktoggle= BacktrackSection:CreateToggle("Enable",  false, function(State)
	BTEnable = State
end)

local BTLength = 1
local Backtrackslider = BacktrackSection:CreateSlider("Backtrack Tick", 0,100, 5 ,true, function(Value)
	BTLength = Value
end)

local BacktrackReset = BacktrackSection:CreateButton("Reset Backtrack", function()
	local OrginalState = BTEnable
	BTEnable = false
	wait(0.7)
	BTEnable = OrginalState
end)

local BacktrackColor = Color3.fromHSV(0, 0, 1)
local BTcolorpicker = BacktrackSection:CreateColorpicker("Color", function(Color)
	BacktrackColor = Color
end)



----ESP Tab
local ESPTab = Window:CreateTab("ESP")

local BoxESP = ESPTab:CreateSection("Box ESP")

local EnableEsp = false
local EspToggle = BoxESP:CreateToggle("Enable", nil, function(State)
	EnableEsp = State
end)

local EnemyEnable = false
local EspEnemyToggle =	BoxESP:CreateToggle("Enemy", nil, function(State)
	EnemyEnable = State
end)

local TeamEnable = false
local EspTeamToggle =	BoxESP:CreateToggle("Teammates", nil, function(State)
	TeamEnable = State
end)

local EnemyEspColor = Color3.fromHSV(0, 0, 1)
local ESPColorPicker = BoxESP:CreateColorpicker("Enemy Color", function(Color)
	EnemyEspColor = Color
end)

local TeamEspColor = Color3.fromHSV(0, 0, 1)
local ESPColorPickerTeam = BoxESP:CreateColorpicker("Team Color", function(Color)
	TeamEspColor = Color

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

local ColorCorrection = Instance.new("ColorCorrectionEffect", game.Lighting)
local ColorCorrectionColor  = Color3.fromRGB(255,255,255)
local ColorCorrectionEffectToggle = WorldSettings:CreateToggle("Enabled", nil, function(State)
	ColorCorrection.Enabled = State
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

ThirdPersonToggle:CreateKeybind("Y", function(Key)
end)

local TPAmount = 0
local TPSlider = SelfVisuals:CreateSlider("Amount", 0,50,nil,true, function(Value)
	TPAmount = Value
end)

local BulletHoleToggle = SelfVisuals:CreateToggle("Disable Scope", nil, function(State)
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
local TPArms = SelfVisuals:CreateToggle("Enable Arms", nil, function(State)
	ArmsEnable = not State
end)

local Optimastion = WorldTab:CreateSection("Optimastion")

local BloodEnabled = false
local BloodToggle = Optimastion:CreateToggle("Disable Blood", nil, function(State)
	BloodEnabled = State
end)

local BulletHolesEnabled = false
local BulletHoleToggle = Optimastion:CreateToggle("Disable Bullet holes", nil, function(State)
	BulletHolesEnabled = State
end)

local WorldShadows = Optimastion:CreateToggle("Disable Global Shadows", nil, function(State)
	game.Lighting.GlobalShadows = not State
end)

----MiscTab
local MiscTab = Window:CreateTab("Misc")

local UiSettings = MiscTab:CreateSection("Ui Settings")

local ToggleButtonUI = UiSettings:CreateToggle("UI Toggle", nil, function(State)
	Window:Toggle(State)
end)
ToggleButtonUI:CreateKeybind(tostring(Config.Keybind):gsub("Enum.KeyCode.", ""), function(Key)
	Config.Keybind = Enum.KeyCode[Key]
end)
ToggleButtonUI:SetState(true)



----Scripts

--ESP
local Player  = game:GetService("Players").LocalPlayer
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
						if EnemyEnable then
							Box.Visible = true
						else
							Box.Visible = false
						end
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




----Loops
spawn(function() --Triggerbot
	while wait(0.1) do
		if TriggerbotEnable then
			if lplr.Character then
				if m.Target then
					if m.Target.Parent:FindFirstChild("Humanoid") then
						pcall(function()
							if game.Players[m.Target.Parent.Name].Team ~= lplr.Team then
								spawn(function()
									wait(Triggerdelay)
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

spawn(function() --bt and breakhead
	while wait(0.7) do
		for _,player in pairs(game.Players:GetPlayers()) do
			if player.Character then
				if player ~= game.Players.LocalPlayer then
					if player.Team ~= lplr.Team then
						if BTEnable == true then
							backtrack(player.Character)
						elseif player.Character:FindFirstChild("backtrack") then
							player.Character:FindFirstChild("backtrack"):Destroy()
							backtrackfolder:ClearAllChildren()
						end
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

game:GetService("RunService").RenderStepped:Connect(function() ----MAIN LOOP (PLEASE KEEP IT FORMATED AND NOT MAKING RANDOM RENDERSTEP FUNCTIONS <3)
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


function gettarget()
	local nearestmag = 5000
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

local Nospread = true
mt.__namecall = newClose(function(...)
	local method = namecallMethod()
	local args = {...}
	if method == "FindPartOnRayWithIgnoreList" then
		if target and lplr.Character and RageBotEnable == true then 
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (target.Head.CFrame.p - workspace.CurrentCamera.CFrame.Position).unit * 500)
		elseif Nospread == true then
			args[2] = Ray.new(workspace.CurrentCamera.CFrame.Position, (m.Hit.p - workspace.CurrentCamera.CFrame.Position).unit * 500)
		end
	elseif tostring(method) == "InvokeServer" and tostring(args[1]) == "Hugh" then
		return wait(99e99)
	elseif tostring(method) == "FireServer" and string.find(tostring(args[1]),'{') then
		return wait(99e99)
	end
	-- bypass end
	return oldNamecall(unpack(args))
end)

canshoot = true
local cbClient = getsenv(LocalPlayer.PlayerGui:WaitForChild("Client"))
game:GetService("RunService").RenderStepped:Connect(function() 
local yeet = gettarget()
	if yeet then
		target = yeet
	else
		target = nil
	end
	if RageBotEnable then
		if BulletCheck(target) then
			if canshoot then
			canshoot = false
			local Arguments = {
				[1] = workspace[target.Name]["Head"],
				[2] = workspace[target.Name]["Head"].Position,
				[3] = workspace[game.Players.LocalPlayer.Name].EquippedTool.Value,
				[4] = 100,
				[5] = workspace[game.Players.LocalPlayer.Name].Gun,
				[8] = 1,
				[9] = false,
				[10] = false,
				[11] = Vector3.new(),
				[12] = 100,
				[13] = Vector3.new()
				}
			game.ReplicatedStorage.Events.HitPart:FireServer(unpack(Arguments))
			cbClient.firebullet()
			print("shot")
			local gun=workspace[game.Players.LocalPlayer.Name].EquippedTool.Value
			wait(game.ReplicatedStorage.Weapons[gun].FireRate.Value)
			print("waited")
			canshoot = true
			end
		end
	end
end)