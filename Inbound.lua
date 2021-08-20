--UnknownSoultions

local Config = {
	WindowName = "UnknownSoultions",
	Color = Color3.fromRGB(255, 0, 0),
	Keybind = Enum.KeyCode.Insert
}

local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/AlexR32/Roblox/main/BracketV3.lua"))()
local Window = Library:CreateWindow(Config, game:GetService("CoreGui"))

----Aimbot Tab
local AimbotTab = Window:CreateTab("Aimbot")


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

local FovChanger = WorldTab:CreateSection("Fov Changer")

local FovEnabled = false
local FovToggle= FovChanger:CreateToggle("Enabled", nil, function(State)
	FovEnabled = State
end)

local DefualtFovValue = game.Workspace.CurrentCamera.FieldOfView
local FovValue = DefualtFovValue
local FovSlider = FovChanger:CreateSlider("Amount", 0,120,nil,true, function(Value)
	FovValue = Value
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




print("esp loaded")

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
									print("")
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
			--[[
			if disablebulletholes == true then
				obj:Destroy()
			end--]]
		elseif obj.Name == 'C4' then
			if DroppedBombEspEnabled == true then
				boxespweapon(obj)
			end
		elseif obj.Name == 'Blood' then
			--[[if DisableBlood == true then
				obj:Destroy()
			end--]]
		end
	end)
end

game:GetService("Workspace").Debris.ChildAdded:connect(function(obj)
	checkdebris(obj)
end)

game:GetService("RunService").RenderStepped:Connect(function() --RunService for stupid loops!
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





