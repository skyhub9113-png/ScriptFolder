setfpscap(999)

print([[

		░██████╗██╗░░██╗██╗██████╗░
		██╔════╝██║░██╔╝██║██╔══██╗
		╚█████╗░█████═╝░██║██║░░██║
		░╚═══██╗██╔═██╗░██║██║░░██║
		██████╔╝██║░╚██╗██║██████╔╝
		╚═════╝░╚═╝░░╚═╝╚═╝╚═════╝░
]])

P = game:GetService("Players")
ReplicatedStorage = game:GetService("ReplicatedStorage")
RunService = game:GetService("RunService")
UserInputService = game:GetService("UserInputService")
TweenService = game:GetService("TweenService")
TextChatService = game:GetService("TextChatService")
CharacterEvents = ReplicatedStorage:WaitForChild("CharacterEvents")
Struggle = CharacterEvents:WaitForChild("Struggle")
GrabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
PlayerEvents = ReplicatedStorage:WaitForChild("PlayerEvents")
StickyPartEvent = PlayerEvents:WaitForChild("StickyPartEvent")
SetNetworkOwner = GrabEvents:WaitForChild("SetNetworkOwner")
GameCorrectionEvents = ReplicatedStorage:WaitForChild("GameCorrectionEvents")
AC = GameCorrectionEvents:WaitForChild("GameCorrectionsNotify")
AutoBreakPCL = false
AntiPaintEnabled = false
Deaths = 0
LocalPlayer = P.LocalPlayer
char = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
toysFolder = workspace:FindFirstChild(LocalPlayer.Name .. "SpawnedInToys")
AntiBlobman = false

LocalPlayer.CharacterAdded:Connect(function(character)
	char = character
	Deaths = Deaths + 1

	if Deaths < 2 and AutoBreakPCL then
		task.wait(0.25)
		character:WaitForChild("Humanoid").Health = 0
	else
		Deaths = 0
	end

	if AntiPaintEnabled then
		if character:WaitForChild("HumanoidRootPart", 5) then
			for _, v26 in character:GetChildren() do
				if v26:IsA("Part") then
					v26.CanTouch = false
				end
			end
		end
	end

	if AntiBlobman then
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)

		if humanoidRootPart then
			if humanoidRootPart:FindFirstChild("RootAttachment") then
				task.wait(0.1)
				humanoidRootPart.RootAttachment:Destroy()
				Instance.new("Folder", humanoidRootPart).Name = "RootAttachment"
			end
		end
	end
end)

SpawnToy = function(arg, arg2)
	task.spawn(function()
		ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(arg, arg2, Vector3.zero)
	end)
end

GetPlot = function()
	if not workspace.PlotItems.PlayersInPlots:FindFirstChild(LocalPlayer.Name) then
		return false
	end

	for _, v26 in workspace.Plots:GetChildren() do
		local thisPlotsOwners = v26:FindFirstChild("PlotSign"):FindFirstChild("ThisPlotsOwners")

		if thisPlotsOwners then
			for _, v27 in thisPlotsOwners:GetChildren() do
				if v27.Value ~= LocalPlayer.Name then
					continue
				end
				local v28 = workspace.PlotItems:FindFirstChild(v26.Name)
				if v28 then
					return true, v28
				end
			end
		end
	end

	return false
end

NewToy = function(arg, arg2)
	if not arg or not arg2 then
		return nil
	end

	repeat
		task.wait()
	until LocalPlayer.CanSpawnToy.Value

	local now2 = tick()
	local v26 = nil

	task.spawn(function()
		while true do
			task.spawn(function()
				ReplicatedStorage.MenuToys.SpawnToyRemoteFunction:InvokeServer(arg, arg2, Vector3.zero)
			end)

			task.wait(0.1)
			if not (v26 or tick() - now2 > 1.5) then
				continue
			end
			break
		end
	end)

	local v27, v28 = GetPlot()
	if v27 and v28 then
		v26 = v28:WaitForChild(arg, 1.5)
		return v26
	end
	v26 = toysFolder:WaitForChild(arg, 1.5)
	return v26
end

DestroyT = function(arg)
	ReplicatedStorage.MenuToys.DestroyToy:FireServer(arg or toysFolder:FindFirstChildWhichIsA("Model"))
end

GetCharPart = function(arg, arg2)
	if arg and arg2 then
		local v26 = arg:WaitForChild(arg2, 1)
		if v26 then
			return v26
		end
		return nil
	end

	return nil
end

GetHRH = function(arg)
	if arg then
		return arg:FindFirstChild("Head"), arg:FindFirstChild("HumanoidRootPart"), (arg:FindFirstChild("Humanoid"))
	end
end

Teleport = function(arg, arg2, arg3)
	if arg and arg2 and arg3 then
		arg.CFrame = arg2 * arg3
		arg.Velocity = Vector3.zero
		arg.RotVelocity = Vector3.zero
	end
end

Ownerboat = function(arg)
	if not arg then
		return nil
	end
	SetNetworkOwner:FireServer(arg, arg.CFrame)
	if arg:FindFirstChild("PartOwner") and arg.PartOwner.Value == LocalPlayer.Name then
		return arg.PartOwner
	end
	return nil
end

UnGrab = function(arg)
	GrabEvents.DestroyGrabLine:FireServer(arg)
end

WhoGrabbinMeConn = nil
WhitelistedPlayer = nil
PC = nil
KC = nil
local clone = LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MenuGui"):WaitForChild("TopRight"):WaitForChild(
"CoinsFrame"):Clone()
clone.Parent = LocalPlayer.PlayerGui.MenuGui.TopRight
clone.Name = "InfoFrame"
clone.LayoutOrder = -21
clone.CoinsDisplay.Coins.TextXAlignment = Enum.TextXAlignment.Left
clone.CoinsDisplay.Coins.LineHeight = 0.85
clone.CoinsDisplay.Coins.Text = " FPS:67 \n Ping:67 "
clone.CoinsButton:Destroy()
clone.CoinsDisplay.CoinImage:Destroy()
clone.CoinsDisplay.Blank:Destroy()

task.spawn(function()
	local endGrabEarly = GrabEvents:FindFirstChild("EndGrabEarly")
	local parent = endGrabEarly.Parent
	endGrabEarly:Clone().Parent = parent
	endGrabEarly:Destroy()
end)

if workspace:FindFirstChild("VoidPlatform") then
	workspace:FindFirstChild("VoidPlatform"):Destroy()
end

local part2 = Instance.new("Part", workspace)
part2.Name = "VoidPlatform"
part2.Shape = 2
part2.Material = Enum.Material.Air
part2.CFrame = CFrame.new(0, -522.5, 0) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966)
part2.Size = Vector3.new(50, 500, 500)
part2.Color = Color3.fromRGB(0, 0, 0)
part2.Anchored = true
part2.Transparency = 0.25
workspace.SpawnLocation.Position = Vector3.new(game.workspace.SpawnLocation.Position, -10.85,
	game.workspace.SpawnLocation.Position)
workspace.SpawnLocation.Decal.Texture = "rbxassetid://9920612764"
workspace.SpawnLocation.Decal.Transparency = 0.8

for _, v26 in workspace.Plots:GetChildren() do
	if v26.Name == "Plot1" then
		for _, v27 in v26.Barrier:GetChildren() do
			v27.CFrame = v27.CFrame * CFrame.new(0, -81.99999, 0)
			v27.CanCollide = false
			v27.CanQuery = false
		end
	end

	if v26.Name == "Plot2" then
		for _, v27 in v26.Barrier:GetChildren() do
			v27.CFrame = v27.CFrame * CFrame.new(0, -75.99999, 0)
			v27.CanCollide = false
			v27.CanQuery = false
		end
	end

	if v26.Name == "Plot3" then
		for _, v27 in v26.Barrier:GetChildren() do
			v27.CFrame = v27.CFrame * CFrame.new(0, -75.9, 0)
			v27.CanCollide = false
			v27.CanQuery = false
		end
	end

	if v26.Name == "Plot4" then
		for _, v27 in v26.Barrier:GetChildren() do
			v27.CFrame = v27.CFrame * CFrame.new(0, -65.94, 0)
			v27.CanCollide = false
			v27.CanQuery = false
		end
	end

	if v26.Name == "Plot5" then
		for _, v27 in v26.Barrier:GetChildren() do
			v27.CFrame = v27.CFrame * CFrame.new(0, -69.935, 0)
			v27.CanCollide = false
			v27.CanQuery = false
		end
	end

	v26.PlotArea.CanQuery = false
end

local function fn16()
	if char and char:FindFirstChild("HumanoidRootPart") then
		local n13 = math.random(1, 2)

		if not char.HumanoidRootPart:FindFirstChild("TeleportSound") then
			TeleportSound = Instance.new("Sound", char.HumanoidRootPart)
			TeleportSound.Name = "TeleportSound"

			if n13 == 1 then
				TeleportSound.SoundId = "rbxassetid://74715602103425"
				TeleportSound.TimePosition = 0.15
			elseif n13 == 2 then
				TeleportSound.SoundId = "rbxassetid://128943714557220"
				TeleportSound.TimePosition = 0
			end

			TeleportSound:Play()
		else
			TeleportSound = char.HumanoidRootPart:FindFirstChild("TeleportSound")

			if n13 == 1 then
				TeleportSound.SoundId = "rbxassetid://74715602103425"
				TeleportSound.TimePosition = 0.15
			elseif n13 == 2 then
				TeleportSound.SoundId = "rbxassetid://128943714557220"
				TeleportSound.TimePosition = 0
			end

			TeleportSound:Play()
		end
	end
end

Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/ludicious-claw/sssss/refs/heads/main/Librarya.lua"))()
ThemeManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/ludicious-claw/sssss/refs/heads/main/ThemeManager.lua"))()
SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/ludicious-claw/sssss/refs/heads/main/SaveManager.lua"))()
Options = Library.Options
Toggles = Library.Toggles
Library.ForceCheckbox = false
Library.ShowToggleFrameInKeybinds = true

Window = Library:CreateWindow({
	Title = "Nil'e",
	CornerRadius = 8,
	Footer = "print(" .. "\"Hello " .. LocalPlayer.DisplayName .. "!\")",
	NotifySide = "Right",
	EnableSidebarResize = true,
	ShowCustomCursor = false,
	BackgroundImage = nil,
	Size = UDim2.fromOffset(600, 510),
})

Window:SetSidebarWidth(125)
Tabs = nil 
Admins = {
	"lokk345678",
	"geroi345678",
	"kmqv3",
	"lIlIlIIlIIIllliii",
	"82882739"
}

if table.find(Admins, LocalPlayer.Name) then
	Tabs = {
		Main = Window:AddTab({
			Name = "Main",
			Description = "LocalPlayer and Grabline Settings",
			Icon = "layout-dashboard",
		}),
		Defense = Window:AddTab({
			Name = "Defense",
			Description = "Defend Yourself and Whitlisted Players",
			Icon = "shield-cog-corner",
		}),
		Target = Window:AddTab({ Name = "Targets", Description = "Target or Whitelist Players", Icon = "locate-fixed" }),
		Poses = Window:AddTab({ Name = "Poses", Description = "Make and Pose Players", Icon = "clapperboard" }),
		Auras = Window:AddTab({
			Name = "Auras",
			Description = "Interact With Nearby Objects and Players",
			Icon = "rotate-3d",
		}),
		Toys = Window:AddTab({ Name = "Toys", Description = "Interaction With Toys", Icon = "blocks" }),
		Visual = Window:AddTab({ Name = "Visuals", Description = "ESP, Camera and Map Settings", Icon = "bubbles" }),
		Keybinds = Window:AddTab({
			Name = "Keybinds",
			Description = "Bind Teleport and Other Functions",
			Icon = "keyboard",
		}),
		Server = Window:AddTab({ Name = "Server", Description = "Interaction and Server Lag", Icon = "server" }),
		["UI Settings"] = Window:AddTab({ Name = "Settings", Description = "UI and Config", Icon = "cog" }),
		Admin = Window:AddTab({ Name = "Admin", Description = "Control Script Users", Icon = "network" }),
	}
else
	Tabs = {
		Main = Window:AddTab({
			Name = "Main",
			Description = "LocalPlayer and Grabline Settings",
			Icon = "layout-dashboard",
		}),
		Defense = Window:AddTab({
			Name = "Defense",
			Description = "Defend Yourself and Whitlisted Players",
			Icon = "shield-cog-corner",
		}),
		Target = Window:AddTab({ Name = "Targets", Description = "Target or Whitelist Players", Icon = "locate-fixed" }),
		Poses = Window:AddTab({ Name = "Poses", Description = "Make and Pose Players", Icon = "clapperboard" }),
		Auras = Window:AddTab({
			Name = "Auras",
			Description = "Interact With Nearby Objects and Players",
			Icon = "rotate-3d",
		}),
		Toys = Window:AddTab({ Name = "Toys", Description = "Interaction With Toys", Icon = "blocks" }),
		Visual = Window:AddTab({ Name = "Visuals", Description = "ESP, Camera and Map Settings", Icon = "bubbles" }),
		Keybinds = Window:AddTab({
			Name = "Keybinds",
			Description = "Bind Teleport and Other Functions",
			Icon = "keyboard",
		}),
		Server = Window:AddTab({ Name = "Server", Description = "Interaction and Server Lag", Icon = "server" }),
		["UI Settings"] = Window:AddTab({ Name = "Settings", Description = "UI and Config", Icon = "cog" }),
	}
end

LP = Tabs.Main:AddLeftGroupbox("Local Player", "person-standing")
GB = Tabs.Main:AddRightTabbox("GrabLine")
GBM = GB:AddTab("Grab Mods", "sliders-horizontal")
GBS = GB:AddTab("Line Settings", "wrench")
ANIM = Tabs.Main:AddRightGroupbox("Animations", "film")
DISC = Tabs.Main:AddRightGroupbox("Discord Server", "external-link")
DF = Tabs.Defense:AddLeftGroupbox("Main Defense", "shield-check")
CDF = Tabs.Defense:AddLeftGroupbox("Gucci [Anti Grab]", "shield-plus")
DFA = Tabs.Defense:AddLeftGroupbox("Auto Attacker", "shield-alert")
DFK = Tabs.Defense:AddRightTabbox("AntiKick")
DFKT = DFK:AddTab("Toggles", "pickaxe")
DFKS = DFK:AddTab("Settings", "wrench")
DFB = Tabs.Defense:AddRightGroupbox("Anti Network", "hamburger")
DFM = Tabs.Defense:AddRightGroupbox("Misc", "shield-ellipsis")
TR = Tabs.Target:AddLeftGroupbox("Target List", "users")
WLS = Tabs.Target:AddLeftGroupbox("Whitelist", "user-star")
LTR = Tabs.Target:AddRightTabbox("Loop Targets")
LTRNB = LTR:AddTab("Non Blobman", "bot-off")
LTRB = LTR:AddTab("Blobman", "bot")
TRTB = Tabs.Target:AddRightTabbox("TargetInteraction")
CTR = TRTB:AddTab("Interaction", "gamepad")
TRT = TRTB:AddTab("Target Toys", "tool-case")
PSP = Tabs.Poses:AddLeftGroupbox("Player", "user-plus")
PSS = Tabs.Poses:AddRightGroupbox("Settings", "user-cog")
PAU = Tabs.Auras:AddLeftGroupbox("Players Aura", "tornado")
TAU = Tabs.Auras:AddLeftGroupbox("Toys Aura", "list-filter-plus")
BAU = Tabs.Auras:AddLeftGroupbox("Blobman Auras", "bot")
AUS = Tabs.Auras:AddRightGroupbox("Aura Settings", "wrench")
BoomboxTabbox = Tabs.Toys:AddLeftTabbox("BoomboxTabbox")
BoomboxFunc = BoomboxTabbox:AddTab("Toggle", "boom-box")
BoomboxSettings = BoomboxTabbox:AddTab("Settings", "wrench")
ESPP = Tabs.Visual:AddLeftGroupbox("PCLD", "cuboid")
ESP = Tabs.Visual:AddLeftGroupbox("ESP Players", "user-search")
ESPT = Tabs.Visual:AddLeftGroupbox("ESP Toys", "balloon")
CM = Tabs.Visual:AddLeftGroupbox("Camera", "camera")
ESPB = Tabs.Visual:AddRightGroupbox("BlackHole", "moon-star")
MP = Tabs.Visual:AddRightGroupbox("Map", "map")
SND = Tabs.Visual:AddRightGroupbox("Game Sounds", "volume-2")
KB = Tabs.Keybinds:AddLeftGroupbox("Teleports", "plane")
FKB = Tabs.Keybinds:AddRightGroupbox("Functions", "gamepad-directional")
DLTLMBS = Tabs.Keybinds:AddRightGroupbox("Delete Limbs", "trash-2")
KBFB = Tabs.Keybinds:AddLeftGroupbox("Mobile Buttons", "square-stack")
INFO = Tabs.Server:AddLeftGroupbox("Server Info", "badge-info")
SL = Tabs.Server:AddLeftGroupbox("Slots", "coins")
BR = Tabs.Server:AddLeftGroupbox("Plots", "brick-wall-shield")
SRVINTTB = Tabs.Server:AddLeftTabbox("Interaction")
SRVFNB = SRVINTTB:AddTab("Non Blobman", "bot-off")
SRVFB = SRVINTTB:AddTab("Blobman", "bot")
SRVF = Tabs.Server:AddLeftGroupbox("Interaction", "bug-play")
SRV = Tabs.Server:AddRightTabbox("LagsTabbox")
SRVL = SRV:AddTab("Lags", "screen-share-off")
SRVP = SRV:AddTab("Packets", "database-zap")
MSGSPAM = Tabs.Server:AddRightGroupbox("Sound Spam", "messages-square")
MO = Tabs.Server:AddRightGroupbox("Map Objects", "file-box")
BG = Tabs["UI Settings"]:AddRightGroupbox("Background", "image-up")
CONFIG = Tabs["UI Settings"]:AddRightTabbox("ConfigTabbox")
IMPORT = CONFIG:AddTab("Import", "file-down")
EXPORT = CONFIG:AddTab("Export", "file-up")

GrabEvents.ExtendGrabLine.OnClientEvent:Connect(function(arg, arg2)
	if not table.find(Admins, arg.Name) or not arg2 or typeof(arg2) ~= "table" then
		return
	end

	if arg2.CheatersCheck and not table.find(Admins, LocalPlayer.Name) then
		GrabEvents.ExtendGrabLine:FireServer({ ImNileCheater = LocalPlayer.Name })
	elseif arg2.ImNileCheater and table.find(Admins, LocalPlayer.Name) then
		CheatersDropdown:AddValues(arg2.ImNileCheater)
	elseif arg2.CheaterYap and arg2.SelectedCheater and arg2.Cheater == LocalPlayer then
		TextChatService.TextChannels.RBXGeneral:SendAsync("Im Use Nile!")
	elseif arg2.CheaterKill and arg2.Cheater and arg2.Cheater == LocalPlayer then
		if char and char:FindFirstChild("Humanoid") then
			char.Humanoid.Health = 0
		end
	elseif arg2.CheaterBring and arg2.Cheater and arg2.Cheater == LocalPlayer then
		local v26 = P:FindFirstChild(arg.Name)

		if v26 and v26.Character and char then
			local v27, v28, v29 = GetHRH(char)
			local v30, v31, v32 = GetHRH(v26.Character)

			if v28 and v29 and v29.Health > 0 and v31 and v32 and v32.Health > 0 then
				Teleport(CheaterRoot, AdminRoot.CFrame, CFrame.new(0, 0, -1.5))
			end
		end
	elseif arg2.CheaterKick and arg2.Cheater and arg2.Cheater == LocalPlayer then
		LocalPlayer:Kick(
		"Fling Things and People thinks you may be exploiting (hacking). As a result, a black hole appeared and took away.")
	elseif arg2.CheaterCrash and arg2.Cheater and arg2.Cheater == LocalPlayer then
		while true do
		end
	end
end)

CheatersDropdown = nil
LIST = nil
INT = nil

if Tabs.Admin then
	LIST = Tabs.Admin:AddLeftGroupbox("Cheaters List", "scroll-text")
	INT = Tabs.Admin:AddRightGroupbox("Interact", "send")
	SelectedCheater = nil

	CheatersDropdown = LIST:AddDropdown("AllMyCheaters", {
		Text = "Cheaters",
		Values = {},
		Default = "None",
		Multi = false,
		AllowNull = true,
		Callback = function(arg)
			SelectedCheater = arg
			print(Options.AllMyCheaters:GetActiveValues())
		end,
	})

	LIST:AddButton("FindMyCheaters", {
		Text = "Find Cheaters",
		Func = function()
			Options.AllMyCheaters:SetValues({})
			GrabEvents.ExtendGrabLine:FireServer({ CheatersCheck = true })
		end,
	})

	INT:AddButton("YapMyCheater", {
		Text = "Yap",
		Func = function()
			GrabEvents.ExtendGrabLine:FireServer({ CheaterYap = true, Cheater = SelectedCheater })
		end,
	})

	INT:AddButton("BringMyCheater", {
		Text = "Bring",
		Func = function()
			GrabEvents.ExtendGrabLine:FireServer({ CheaterBring = true, Cheater = SelectedCheater })
		end,
	})

	INT:AddButton("KillMyCheater", {
		Text = "Kill",
		Func = function()
			GrabEvents.ExtendGrabLine:FireServer({ CheaterKill = true, Cheater = SelectedCheater })
		end,
	})

	INT:AddButton("KickMyCheater", {
		Text = "Kick",
		Func = function()
			GrabEvents.ExtendGrabLine:FireServer({ CheaterKick = true, Cheater = SelectedCheater })
		end,
	})

	INT:AddButton("CrashMyCheater", {
		Text = "Chash",
		Func = function()
			GrabEvents.ExtendGrabLine:FireServer({ CheaterCrash = true, Cheater = SelectedCheater })
		end,
	})
end

LP:AddImage("LocalPlayerHeadshot", {
	Image = P:GetUserThumbnailAsync(LocalPlayer.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size420x420),
	Height = 235,
})

local v26 = LP:AddLabel("Last Grabber: -", true)

LocalPlayer.CharacterAdded:Connect(function(character)
	local head = character:WaitForChild("Head", 5)

	if head then
		if WhoGrabbinMeConn then
			WhoGrabbinMeConn:Disconnect()
		end

		WhoGrabbinMeConn = head.ChildAdded:Connect(function(child)
			if child.Name == "PartOwner" then
				local v27 = P:FindFirstChild(child.Value)

				if v27 then
					v26:SetText("Last Grabber: " .. v27.DisplayName .. "(" .. v27.Name .. ")")
				end
			end
		end)
	end
end)

SessionTimer = LP:AddLabel("Session Time: 00:00", true)
LP:AddDivider()
WalkSpeedEnabled = false
WalkSpeedValue = 1
JumpPowerEnabled = false
JumpPowerValue = 24
FlyEnabled = false
FlySpeed = 5

LP:AddSlider("WalkSpeedSlider", {
	Text = "WalkSpeed",
	Default = 1,
	Min = 1,
	Max = 50,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		WalkSpeedValue = arg
	end,
})

LP:AddSlider("JumpPowerSlider", {
	Text = "JumpPower",
	Default = 24,
	Min = 24,
	Max = 300,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		JumpPowerValue = arg
	end,
})

LP:AddSlider("FlySpeedSlider", {
	Text = "Fly Speed",
	Default = 5,
	Min = 1,
	Max = 50,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		FlySpeed = arg * 10
	end,
})

LP:AddToggle("WalkSpeedToggle", {
	Text = "WalkSpeed",
	Default = false,
	Callback = function(arg)
		if arg then
			WalkSpeedEnabled = true

			ModifyWalkSpeed = RunService.Stepped:Connect(function()
				if char and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") then
					char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame +
					char:FindFirstChild("Humanoid").MoveDirection * 16 * WalkSpeedValue / 150
				end
			end)
		elseif ModifyWalkSpeed then
			ModifyWalkSpeed:Disconnect()
			WalkSpeedEnabled = false
		end
	end,
}):AddKeyPicker("ToggleWalkSpeed", {
	Default = "None",
	Callback = function()
		if WalkSpeedEnabled then
			Library:Notify({ Title = "Nil'e", Description = "WalkSpeedToggle Off", Time = 1.5, BigIcon = "info" })
			Toggles.WalkSpeedToggle:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "WalkSpeedToggle On", Time = 1.5, BigIcon = "info" })
			Toggles.WalkSpeedToggle:SetValue(true)
		end
	end,
})

LP:AddToggle("JumpPowerToggle", {
	Text = "JumpPower",
	Default = false,
	Callback = function(arg)
		if arg then
			JumpPowerEnabled = true

			ModifyJumpPower = RunService.RenderStepped:Connect(function()
				if char and char:FindFirstChild("Humanoid") then
					local v27 = JumpPowerValue
					char:FindFirstChild("Humanoid").JumpPower = v27
				end
			end)
		elseif ModifyJumpPower then
			ModifyJumpPower:Disconnect()
			JumpPowerEnabled = false

			if char and char:FindFirstChild("Humanoid") then
				char:FindFirstChild("Humanoid").JumpPower = 24
			end
		end
	end,
}):AddKeyPicker("ToggleJumpPower", {
	Default = "None",
	Callback = function()
		if JumpPowerEnabled then
			Library:Notify({ Title = "Nil'e", Description = "JumpPower Off", Time = 1.5, BigIcon = "info" })
			Toggles.JumpPowerToggle:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "JumpPower On", Time = 1.5, BigIcon = "info" })
			Toggles.JumpPowerToggle:SetValue(true)
		end
	end,
})

LP:AddToggle("FlyToggle", {
	Text = "Fly",
	Default = false,
	Callback = function(arg)
		FlyEnabled = arg

		while FlyEnabled and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					local flyBodyVelocity = v28:FindFirstChild("FlyBodyVelocity")

					if not v28:FindFirstChild("FlyBodyVelocity") then
						flyBodyVelocity = Instance.new("BodyVelocity", v28)
						flyBodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						flyBodyVelocity.Velocity = Vector3.zero
						flyBodyVelocity.Name = "FlyBodyVelocity"
					end

					if UserInputService:IsKeyDown(Enum.KeyCode.W) then
						flyBodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * FlySpeed
					elseif UserInputService:IsKeyDown(Enum.KeyCode.A) then
						flyBodyVelocity.Velocity = -workspace.CurrentCamera.CFrame.RightVector * FlySpeed
					elseif UserInputService:IsKeyDown(Enum.KeyCode.S) then
						flyBodyVelocity.Velocity = -workspace.CurrentCamera.CFrame.LookVector * FlySpeed
					elseif UserInputService:IsKeyDown(Enum.KeyCode.D) then
						flyBodyVelocity.Velocity = workspace.CurrentCamera.CFrame.RightVector * FlySpeed
					else
						flyBodyVelocity.Velocity = Vector3.zero
					end

					local flyBodyGyro = v28:FindFirstChild("FlyBodyGyro")

					if not v28:FindFirstChild("FlyBodyGyro") then
						flyBodyGyro = Instance.new("BodyGyro", v28)
						flyBodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
						flyBodyGyro.D = 1000
						flyBodyGyro.P = 90000
						flyBodyGyro.Name = "FlyBodyGyro"
					end

					flyBodyGyro.CFrame = workspace.CurrentCamera.CFrame
				end
			end
		end

		task.wait(0.01)
		local v27, v28, v29 = GetHRH(char)

		if v28 and v29 and v29.Health > 0 then
			if v28:FindFirstChild("FlyBodyGyro") then
				v28.FlyBodyGyro:Destroy()
			end

			if v28:FindFirstChild("FlyBodyVelocity") then
				v28.FlyBodyVelocity:Destroy()
			end
		end
	end,
}):AddKeyPicker("ToggleFly", {
	Default = "None",
	Callback = function()
		if FlyEnabled then
			Library:Notify({ Title = "Nil'e", Description = "Fly Off", Time = 1.5, BigIcon = "info" })
			Toggles.FlyToggle:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Fly On", Time = 1.5, BigIcon = "info" })
			Toggles.FlyToggle:SetValue(true)
		end
	end,
})

InfJump = false

LP:AddToggle("InfiniteJump", {
	Text = "Infinite Jump",
	Default = false,
	Callback = function(arg)
		InfJump = arg
	end,
})

UserInputService.JumpRequest:Connect(function()
	if InfJump and char:FindFirstChild("Humanoid") then
		char:FindFirstChild("Humanoid"):ChangeState(Enum.HumanoidStateType.Jumping)
	end
end)

LP:AddToggle("Noclip", {
	Text = "Noclip",
	Default = false,
	Callback = function(arg)
		if arg then
			noclip = RunService.RenderStepped:Connect(function()
				if char and char:FindFirstChild("Torso") and char:FindFirstChild("Head") then
					char:FindFirstChild("Torso").CanCollide = false
					char:FindFirstChild("Head").CanCollide = false
				end
			end)
		elseif noclip then
			noclip:Disconnect()
			noclip = nil

			if char and char:FindFirstChild("Torso") and char:FindFirstChild("Head") then
				char:FindFirstChild("Torso").CanCollide = true
				char:FindFirstChild("Head").CanCollide = true
			end
		end
	end,
})

LP:AddToggle("NoclipToysAndPlayersToggle", {
	Text = "Anti Fling",
	Default = false,
	Callback = function(arg)
		if arg then
			NoclipToysAndPlayers = RunService.RenderStepped:Connect(function()
				if char and char:FindFirstChild("Torso") and char:FindFirstChild("Head") and char:FindFirstChild("HumanoidRootPart") then
					char.Torso.CollisionGroupId = 5
					char.Head.CollisionGroupId = 5
					char.HumanoidRootPart.CollisionGroupId = 5
				end
			end)
		elseif NoclipToysAndPlayers then
			NoclipToysAndPlayers:Disconnect()
			NoclipToysAndPlayers = nil

			if char and char:FindFirstChild("Torso") and char:FindFirstChild("Head") and char:FindFirstChild("HumanoidRootPart") then
				char.Torso.CollisionGroupId = 3
				char.Head.CollisionGroupId = 3
				char.HumanoidRootPart.CollisionGroupId = 5
			end
		end
	end,
})

ClearInventoryButton = LP:AddButton("ClearInventory", {
	Text = "Clear Inventory",
	Func = function()
		for _, v27 in toysFolder:GetChildren() do
			if v27:IsA("Model") then
				DestroyT(v27)
			end
		end
	end,
})

ClearInventoryButton:AddKeyPicker("ClearInventoryBind", { Default = "None", Mode = "Press" })

DISC:AddButton("CopyDiscordServerLink", {
	Text = "Copy Link",
	Func = function()
		setclipboard("https://discord.gg/rbnrqm99GA")
		Library:Notify({ Title = "Nil'e", Description = "Link Сopied", Time = 1.5, BigIcon = "info" })
	end,
})

power = 300

GBM:AddSlider("StrengthPower", {
	Text = "Throw Power",
	Default = 300,
	Min = 300,
	Max = 100000,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		power = arg
	end,
})

GBM:AddToggle("Strength", {
	Text = "Use Power [PC Only]",
	Default = false,
	Callback = function(arg)
		if arg then
			Sstrght = game.workspace.ChildAdded:Connect(function(child)
				if child.Name == "GrabParts" then
					local part1 = child.GrabPart.WeldConstraint.Part1

					if part1 then
						local bodyVelocity = Instance.new("BodyVelocity", part1)

						child:GetPropertyChangedSignal("Parent"):Connect(function()
							if not child.Parent then
								if UserInputService:GetLastInputType() == Enum.UserInputType.MouseButton2 then
									bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyVelocity.Velocity = game.workspace.CurrentCamera.CFrame.LookVector * power
									task.wait(0.01)
									bodyVelocity:Destroy()
								else
									bodyVelocity:Destroy()
								end
							end
						end)
					end
				end
			end)
		elseif Sstrght then
			Sstrght:Disconnect()
		end
	end,
})

MouseWheelConn = nil
InfiniteExtendConn = nil
CurrentDistance = 8

GBM:AddToggle("InfiniteExtendToggle", {
	Text = "Infinite Extend [PC Only]",
	Default = false,
	Callback = function(arg)
		if arg then
			MouseWheelConn = UserInputService.InputChanged:Connect(function(input)
				if input.UserInputType ~= Enum.UserInputType.MouseWheel then
					return
				end

				if CurrentDistance <= 8 then
					CurrentDistance = 8
				end

				if input.Position.Z > 0 then
					CurrentDistance = CurrentDistance + 5
				elseif input.Position.Z < 0 then
					CurrentDistance = CurrentDistance - 5
				end
			end)

			InfiniteExtendConn = game.workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "GrabParts" then
					return
				end
				local dragPart = child:FindFirstChild("DragPart")
				if not dragPart then
					return
				end
				CurrentDistance = (workspace.CurrentCamera.CFrame.Position - dragPart.Position).Magnitude
				local clone2 = dragPart:Clone()
				clone2.Parent = dragPart.Parent
				dragPart.AlignPosition.Enabled = false
				clone2.AlignOrientation.Enabled = false

				while workspace:FindFirstChild("GrabParts") and task.wait() do
					clone2.Position = workspace.CurrentCamera.CFrame.Position +
					workspace.CurrentCamera.CFrame.LookVector * CurrentDistance
				end
			end)
		elseif MouseWheelConn and InfiniteExtendConn then
			MouseWheelConn:Disconnect()
			InfiniteExtendConn:Disconnect()
		end
	end,
})

AutoGamepass = nil
FurtherReachBoughtNotifier = ReplicatedStorage.GamepassEvents.FurtherReachBoughtNotifier
LimitedTimeToyEvent = ReplicatedStorage.MenuToys.LimitedTimeToyEvent

GBM:AddToggle("FartherReachToggle", {
	Text = "Farther Reach",
	Default = false,
	Callback = function(arg)
		if arg then
			if LocalPlayer:FindFirstChild("FartherReach") then
				LocalPlayer:FindFirstChild("FartherReach"):Destroy()
			end

			local boolValue = Instance.new("BoolValue", LocalPlayer)
			boolValue.Name = "FartherReach"
			boolValue.Value = true
			FurtherReachBoughtNotifier.Parent = nil
			LimitedTimeToyEvent.Parent = ReplicatedStorage.GamepassEvents
			LimitedTimeToyEvent.Name = "FurtherReachBoughtNotifier"
			local grabbingScript = char:FindFirstChild("GrabbingScript")

			if grabbingScript then
				grabbingScript.Enabled = false
				grabbingScript.Enabled = true
				task.wait(0.1)
				LimitedTimeToyEvent:FireServer()
				FurtherReachBoughtNotifier.Parent = ReplicatedStorage.GamepassEvents
				LimitedTimeToyEvent.Parent = ReplicatedStorage.MenuToys
				LimitedTimeToyEvent.Name = "LimitedTimeToyEvent"
			else
				Toggles.FartherReachToggle:SetValue(false)
			end

			AutoGamepass = LocalPlayer.CharacterAdded:Connect(function(character)
				FurtherReachBoughtNotifier.Parent = nil
				LimitedTimeToyEvent.Parent = ReplicatedStorage.GamepassEvents
				LimitedTimeToyEvent.Name = "FurtherReachBoughtNotifier"
				local grabbingScript2 = character:WaitForChild("GrabbingScript", 1)

				if grabbingScript2 then
					grabbingScript2.Enabled = false
					grabbingScript2.Enabled = true
					task.wait(0.1)
					LimitedTimeToyEvent:FireServer()
				end

				FurtherReachBoughtNotifier.Parent = ReplicatedStorage.GamepassEvents
				LimitedTimeToyEvent.Parent = ReplicatedStorage.MenuToys
				LimitedTimeToyEvent.Name = "LimitedTimeToyEvent"
			end)
		else
			FurtherReachBoughtNotifier.Parent = ReplicatedStorage.GamepassEvents
			LimitedTimeToyEvent.Parent = ReplicatedStorage.MenuToys
			LimitedTimeToyEvent.Name = "LimitedTimeToyEvent"

			if LocalPlayer:FindFirstChild("FartherReach") then
				LocalPlayer:FindFirstChild("FartherReach"):Destroy()
			end

			local grabbingScript = char:FindFirstChild("GrabbingScript")

			if grabbingScript then
				grabbingScript.Enabled = false
				grabbingScript.Enabled = true
			end

			AutoGamepass:Disconnect()
			AutoGamepass = nil
		end
	end,
})

KillGrabConn = nil

GBM:AddToggle("KillGrabToggle", {
	Text = "Kill Grab",
	Default = false,
	Callback = function(arg)
		if arg then
			KillGrabConn = game.workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "GrabParts" or not child:IsA("Model") then
					return
				end
				local grabPart = child:WaitForChild("GrabPart", 1)
				if not grabPart then
					return
				end
				local weldConstraint = grabPart:WaitForChild("WeldConstraint")
				if not weldConstraint or not weldConstraint.Part1 or not weldConstraint.Part1.Parent or not P:FindFirstChild(weldConstraint.Part1.Parent.Name) then
					return
				end
				local v27, v28, v29 = GetHRH(weldConstraint.Part1.Parent)
				if not v27 or not v29 or v29.Health <= 0 then
					return
				end
				local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
				local v30

				while true do
					task.wait()
					v30 = Ownerboat(v27)
					if not (not child.Parent or not v27 or not v29 or v29.Health <= 0 or v30) then
						continue
					end
					break
				end

				if v30 then
					local cframe = CFrame.new
					Teleport(v27, CFrame.new(0, -50000, 0), cframe(0, 0, 0))
					task.wait(0.1)
					workspace.FallenPartsDestroyHeight = -45000
					task.wait()
					workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
				end

				child:Destroy()
			end)
		elseif KillGrabConn then
			KillGrabConn:Disconnect()
		end
	end,
})

GBM:AddToggle("Strong", {
	Text = "Massless Grab",
	Default = false,
	Callback = function(arg)
		local dragPart = game.ReplicatedFirst.GrabParts.DragPart

		if arg then
			dragPart.AlignPosition.ForceLimitMode = 1
			dragPart.AlignPosition.Responsiveness = 200
			dragPart.AlignPosition.MaxAxesForce = Vector3.new(math.huge, math.huge, math.huge)
			dragPart.AlignOrientation.Responsiveness = 200
			dragPart.AlignOrientation.MaxTorque = math.huge
		else
			dragPart.AlignPosition.ForceLimitMode = 0
			dragPart.AlignPosition.Responsiveness = 40
			dragPart.AlignPosition.MaxAxesForce = Vector3.new(10000, 10000, 10000)
			dragPart.AlignOrientation.Responsiveness = 30
			dragPart.AlignOrientation.MaxTorque = 600000
		end
	end,
})

GBM:AddToggle("RagdollGrab", {
	Text = "Ragdoll Grab",
	Default = false,
	Callback = function(arg)
		if arg then
			RagdollGrabCycle = true

			while RagdollGrabCycle and RunService.RenderStepped:Wait() do
				if char then
					local humanoidRootPart = char:WaitForChild("HumanoidRootPart", 3)
					local humanoid = char:WaitForChild("Humanoid", 3)

					if humanoidRootPart and humanoid and humanoid.Health > 0 then
						while true do
							RunService.RenderStepped:Wait()
							if not (LocalPlayer.CanSpawnToy.Value or not arg) then
								continue
							end
							break
						end

						SpawnToy("FoodPlate", humanoidRootPart.CFrame * CFrame.new(0, 5, 20))
						local foodPlate = toysFolder:WaitForChild("FoodPlate", 1)

						if foodPlate then
							foodPlate.Name = "RAGDOLLGRAB"

							task.spawn(function()
								local foodPlate2 = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
								:WaitForChild("FoodPlate", 1)

								if foodPlate2 then
									foodPlate2.Name = "Ragdoll Grab"
									foodPlate2.ViewItemButton.Season.Visible = true
									foodPlate2.ViewItemButton.Season.Text = "Ragdoll Grab"
								end
							end)

							local soundPart = foodPlate:WaitForChild("SoundPart", 1)

							if soundPart then
								if not soundPart:FindFirstChild("PartOwner") or soundPart.PartOwner.Value ~= LocalPlayer.Name then
									while true do
										RunService.RenderStepped:Wait()
										SetNetworkOwner:FireServer(soundPart, soundPart.CFrame)
										local partOwner = soundPart:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = soundPart:FindFirstChild("PartOwner").Value == name
										end

										if not (partOwner or not soundPart or not RagdollGrabCycle) then
											continue
										end
										break
									end
								end

								if soundPart and not soundPart:FindFirstChild("BodyPosition") then
									local bodyPosition = Instance.new("BodyPosition", soundPart)
									bodyPosition.Position = Vector3.new(0, 67167, 0)
									bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyPosition.D = 100
								end

								soundPart.CanCollide = false
								soundPart.CanQuery = false
								soundPart.Transparency = 1

								while true do
									local partOwner = RunService.RenderStepped:Wait() and RagdollGrabCycle and soundPart and
									soundPart:FindFirstChild("PartOwner")

									if partOwner then
										local name = LocalPlayer.Name
										partOwner = soundPart:FindFirstChild("PartOwner").Value == name
									end

									if partOwner then
										pcall(function()
											if workspace:FindFirstChild("GrabParts") and not workspace:FindFirstChild("GrabParts").GrabPart.WeldConstraint.Part1.Parent.Humanoid.Ragdolled.Value then
												soundPart.CFrame = workspace:FindFirstChild("GrabParts").GrabPart
												.WeldConstraint.Part1.Parent.HumanoidRootPart.CFrame
												RunService.RenderStepped:Wait()
												soundPart.CFrame = CFrame.new(0, 67167, 0)
												task.wait(0.01)
											end
										end)

										continue
									end

									break
								end

								DestroyT(foodPlate)
							end
						end
					end
				end
			end
		else
			RagdollGrabCycle = false

			if toysFolder:FindFirstChild("RAGDOLLGRAB") then
				DestroyT(toysFolder:FindFirstChild("RAGDOLLGRAB"))
			end
		end
	end,
})

local tbl5 = {}

GBM:AddToggle("NoclipGrab", {
	Text = "Noclip Grab",
	Default = false,
	Callback = function(arg)
		if arg then
			NoclipCon = game.workspace.ChildAdded:Connect(function(child)
				if child.Name == "GrabParts" then
					local parent = child.GrabPart.WeldConstraint.Part1.Parent

					if parent then
						while workspace:FindFirstChild("GrabParts") and task.wait() do
							for _, v27 in parent:GetChildren() do
								if (v27:IsA("Part") or v27:IsA("MeshPart") or v27:IsA("TrussPart")) and not v27.Anchored and v27.CanCollide then
									v27.CanCollide = false
									table.insert(tbl5, v27)
								end
							end
						end

						for _, v27 in tbl5, nil, nil do
							v27.CanCollide = true
						end

						table.clear(tbl5)
					end
				end
			end)
		elseif NoclipCon then
			NoclipCon:Disconnect()
		end
	end,
})

GBM:AddToggle("SpamGrab", {
	Text = "Kick Grab",
	Default = false,
	Callback = function(arg)
		if arg then
			SpamCon = game.workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "GrabParts" then
					return
				end
				local parent = child.GrabPart.WeldConstraint.Part1.Parent
				if not parent then
					return
				end
				local v27, v28, v29 = GetHRH(parent)
				if not v27 or not v29 or v29.Health <= 0 then
					return
				end

				while workspace:FindFirstChild("GrabParts") and task.wait() do
					Ownerboat(v27)

					for i = 1, 2 do
						UnGrab(v27)
					end
				end
			end)
		elseif SpamCon then
			SpamCon:Disconnect()
		end
	end,
})

AnchoredParts = {}
AnchorESPOutlineColor = Color3.fromRGB(255, 255, 255)
AnchorESPOutlineTransparency = 0
AnchorESPFillColor = Color3.fromRGB(0, 0, 0)
AnchorESPFillTransparency = 0.75
AutoRepairEnabled = false

AnchorToy = function(arg)
	local flag7 = not arg

	if not flag7 then
		flag7 = not (arg:FindFirstChild("Main") or arg:FindFirstChild("SoundPart"))
	end

	if flag7 then
		return
	end
	local main = arg:FindFirstChild("Main") or arg:FindFirstChild("SoundPart")

	if arg:FindFirstChild("AnchoredToyESP") then
		arg.AnchoredToyESP:Destroy()
	end

	for _, v27 in main:GetChildren() do
		if v27:IsA("BodyPosition") or v27:IsA("BodyGyro") then
			v27:Destroy()
		end
	end

	local highlight = Instance.new("Highlight", arg)
	highlight.OutlineColor = AnchorESPOutlineColor
	highlight.OutlineTransparency = AnchorESPOutlineTransparency
	highlight.FillColor = AnchorESPFillColor
	highlight.FillTransparency = AnchorESPFillTransparency
	highlight.Name = "AnchoredToyESP"

	if not table.find(AnchoredParts, arg) then
		table.insert(AnchoredParts, arg)
	end

	task.spawn(function()
		while workspace:FindFirstChild("GrabParts") do
			task.wait()
		end

		local bodyPosition = Instance.new("BodyPosition", main)
		bodyPosition.Position = main.Position
		bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
		bodyPosition.D = 100
		local bodyGyro = Instance.new("BodyGyro", main)
		bodyGyro.CFrame = main.CFrame
		bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
		bodyGyro.D = 100
	end)
end

GBM:AddToggle("AnchorGrab", {
	Text = "Anchor Grab",
	Default = false,
	Callback = function(arg)
		if arg then
			AnchorCon = game.workspace.ChildAdded:Connect(function(child)
				if child.Name == "GrabParts" then
					local parent = child.GrabPart.WeldConstraint.Part1.Parent

					if parent then
						AnchorToy(parent)
					end
				end
			end)
		elseif AnchorCon then
			AnchorCon:Disconnect()
		end
	end,
}):AddColorPicker("AnchorESPFillColorPicker", {
	Default = Color3.fromRGB(0, 0, 0),
	Transparency = 0.75,
	Callback = function(arg)
		AnchorESPFillColor = arg
		AnchorESPFillTransparency = Options.AnchorESPFillColorPicker.Transparency
	end,
}):AddColorPicker("AnchorESPOutlineColorPicker", {
	Default = Color3.fromRGB(255, 255, 255),
	Transparency = 0,
	Callback = function(arg)
		AnchorESPOutlineColor = arg
		AnchorESPOutlineTransparency = Options.AnchorESPOutlineColorPicker.Transparency
	end,
})

GBM:AddCheckbox("AutoRepairToggle", {
	Text = "Auto Repair",
	Default = false,
	Callback = function(arg)
		AutoRepairEnabled = arg

		while AutoRepairEnabled and task.wait() do
			for _, v27 in AnchoredParts, nil, nil do
				local flag7 = not v27:FindFirstChild("PartOwner", true)

				if not flag7 then
					local name = LocalPlayer.Name
					flag7 = v27:FindFirstChild("PartOwner", true).Value ~= name
				end

				if flag7 and (not workspace:FindFirstChild("GrabParts") or workspace:FindFirstChild("GrabParts") and workspace.GrabParts.GrabPart.WeldConstraint.Part1.Parent ~= v27) then
					local v28, v29, v30 = GetHRH(char)

					if v29 and v30 and v30.Health > 0 then
						local v31 = nil

						for _, v32 in v27:GetChildren() do
							if (v32:IsA("Part") or v32:IsA("MeshPart")) and v32.CanQuery then
								v31 = v32
								break
							else
								v31 = nil
							end
						end

						if v31 then
							local cFrame = nil

							if (v29.Position - v31.Position).Magnitude > 20 then
								cFrame = v29.CFrame
							end

							local now2 = tick()

							while true do
								task.wait()

								if cFrame then
									Teleport(v29, v31.CFrame, CFrame.new(0, 0, 0))
								end

								local v32 = Ownerboat(v31)
								if not (not AutoRepairEnabled or not v31 or not v31.Parent or not v30 or v30.Health <= 0 or v32 or tick() - now2 > 2) then
									continue
								end
								break
							end

							if v29 and cFrame then
								Teleport(v29, cFrame, CFrame.new(0, 0, 0))
							end
						end
					end
				end
			end
		end
	end,
})

GBM:AddLabel("Anchor Toy"):AddKeyPicker("AnchorBind", {
	Default = "None",
	Callback = function()
		if workspace:FindFirstChild("GrabParts") and workspace.GrabParts:FindFirstChild("GrabPart") then
			local parent = workspace.GrabParts.GrabPart.WeldConstraint.Part1.Parent

			if parent then
				AnchorToy(parent)
			end
		end
	end,
})

GBM:AddLabel("Remove Anchor"):AddKeyPicker("RemoveAnchorBind", {
	Default = "None",
	Callback = function()
		if workspace:FindFirstChild("GrabParts") and workspace.GrabParts:FindFirstChild("GrabPart") then
			local parent = workspace.GrabParts.GrabPart.WeldConstraint.Part1.Parent

			if parent then
				for _, v27 in parent:GetChildren() do
					if v27:FindFirstChild("BodyPosition") then
						v27.BodyPosition:Destroy()
					end

					if v27:FindFirstChild("BodyGyro") then
						v27.BodyGyro:Destroy()
					end

					if v27 and v27.Parent and v27.Parent:FindFirstChild("AnchoredToyESP") then
						v27.Parent.AnchoredToyESP:Destroy()
					end
				end

				for k, v27 in AnchoredParts, nil, nil do
					if v27 == parent then
						table.remove(AnchoredParts, k)
					end
				end
			end
		end
	end,
})

UnAnchorAllButton = GBM:AddButton("UnAnchorAll", {
	Text = "Remove Anchor For All Toys",
	Func = function()
		for _, v27 in AnchoredParts, nil, nil do
			for _, v28 in v27:GetChildren() do
				if v28:FindFirstChild("BodyPosition") then
					v28.BodyPosition:Destroy()
				end

				if v28:FindFirstChild("BodyGyro") then
					v28.BodyGyro:Destroy()
				end

				if v28.Parent and v28.Parent:FindFirstChild("AnchoredToyESP") then
					v28.Parent.AnchoredToyESP:Destroy()
				end
			end
		end

		table.clear(AnchoredParts)
	end,
})

UnAnchorAllButton:AddKeyPicker("UnAnchorAllBind", { Default = "None", Mode = "Press" })
LineColor1 = Color3.fromRGB(0, 57, 33)
LineColor2 = Color3.fromRGB(0, 94, 57)
LineColor3 = Color3.fromRGB(0, 197, 114)
LineColor4 = Color3.fromRGB(116, 215, 167)
LineColor5 = Color3.fromRGB(255, 255, 255)
LineColor6 = Color3.fromRGB(98, 137, 225)
LineColor7 = Color3.fromRGB(37, 38, 172)
LineColor8 = Color3.fromRGB(27, 0, 95)
LineColor9 = Color3.fromRGB(17, 0, 77)

GBS:AddLabel("Color 1"):AddColorPicker("LineColor1Picker", {
	Default = Color3.fromRGB(0, 57, 33),
	Callback = function(arg)
		LineColor1 = arg
	end,
})

GBS:AddLabel("Color 2"):AddColorPicker("LineColor2Picker", {
	Default = Color3.fromRGB(0, 94, 57),
	Callback = function(arg)
		LineColor2 = arg
	end,
})

GBS:AddLabel("Color 3"):AddColorPicker("LineColor3Picker", {
	Default = Color3.fromRGB(0, 197, 114),
	Callback = function(arg)
		LineColor3 = arg
	end,
})

GBS:AddLabel("Color 4"):AddColorPicker("LineColor4Picker", {
	Default = Color3.fromRGB(116, 215, 167),
	Callback = function(arg)
		LineColor4 = arg
	end,
})

GBS:AddLabel("Color 5"):AddColorPicker("LineColor5Picker", {
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(arg)
		LineColor5 = arg
	end,
})

GBS:AddLabel("Color 6"):AddColorPicker("LineColor6Picker", {
	Default = Color3.fromRGB(98, 137, 225),
	Callback = function(arg)
		LineColor6 = arg
	end,
})

GBS:AddLabel("Color 7"):AddColorPicker("LineColor7Picker", {
	Default = Color3.fromRGB(37, 38, 172),
	Callback = function(arg)
		LineColor7 = arg
	end,
})

GBS:AddLabel("Color 8"):AddColorPicker("LineColor8Picker", {
	Default = Color3.fromRGB(27, 0, 95),
	Callback = function(arg)
		LineColor8 = arg
	end,
})

GBS:AddLabel("Color 9"):AddColorPicker("LineColor9Picker", {
	Default = Color3.fromRGB(17, 0, 77),
	Callback = function(arg)
		LineColor9 = arg
	end,
})

InvisLineEnabled = false

GBS:AddCheckbox("InvisibleLine", {
	Text = "Invisible Line",
	Default = false,
	Callback = function(arg)
		InvisLineEnabled = arg
	end,
})

GBS:AddDivider()
SelLineSkin = "Default"
Skin = "rbxassetid://103833941356941"
SelLineSound = "Default"
SoundPoint = "rbxassetid://26723422"
SoundLine = "rbxassetid://18426149"
SelectedHand = "Right Arm"
HandLineView = false

workspace.ChildAdded:Connect(function(child)
	if child:IsA("Model") and child.Name == "GrabParts" then
		local updateLineColorsEvent = ReplicatedStorage.DataEvents.UpdateLineColorsEvent
		local fireServer = updateLineColorsEvent.FireServer
		local colorSequence = ColorSequence.new
		local tbl6 = {}
		local v27 = ColorSequenceKeypoint.new(0, LineColor1)
		local v28 = ColorSequenceKeypoint.new(0.125, LineColor2)
		local v29 = ColorSequenceKeypoint.new(0.25, LineColor3)
		local v30 = ColorSequenceKeypoint.new(0.375, LineColor4)
		local v31 = ColorSequenceKeypoint.new(0.5, LineColor5)
		local v32 = ColorSequenceKeypoint.new(0.625, LineColor6)
		local v33 = ColorSequenceKeypoint.new(0.75, LineColor7)
		local v34 = ColorSequenceKeypoint.new(0.875, LineColor8)
		local new = ColorSequenceKeypoint.new
		local v35 = LineColor9
		tbl6[1] = v27
		tbl6[2] = v28
		tbl6[3] = v29
		tbl6[4] = v30
		tbl6[5] = v31
		tbl6[6] = v32
		tbl6[7] = v33
		tbl6[8] = v34

		do
			local values = table.pack(new(1, v35))
			table.move(values, 1, values.n, 9, tbl6)
		end

		fireServer(updateLineColorsEvent, colorSequence(tbl6))

		if InvisLineEnabled then
			GrabEvents.CreateGrabLine:FireServer()
		end

		if SelLineSound == "Old" then
			child.GrabPart.AttachSound.Name = "AttachSound2"
			child.GrabPart.BeamSound.Name = "BeamSound2"
			child.GrabPart.AttachSound1.Name = "AttachSound"
			child.GrabPart.BeamSound1.Name = "BeamSound"
		end

		if HandLineView and char:FindFirstChild(SelectedHand) then
			if not char[SelectedHand]:FindFirstChild("HandModeAttachment") then
				local attachment = Instance.new("Attachment", char[SelectedHand])
				attachment.CFrame = CFrame.new(0, -1, 0)
				attachment.Name = "HandModeAttachment"
			end

			child.BeamPart.GrabBeam.Attachment0 = char[SelectedHand].HandModeAttachment
		end

		child.BeamPart.GrabBeam.Texture = Skin
	end
end)

GBS:AddDropdown("LineSkin", {
	Text = "Line Texture",
	Values = {
		"Default",
		"Gamepass",
		"Wave",
		"Fire",
		"Chain",
		"Pyramid",
		"Dots",
		"Audio Visualizer",
		"No Texture",
	},
	ValueImages = {
		Default = "line-dot-right-horizontal",
		Gamepass = "chevrons-up",
		Wave = "spline",
		Fire = "flame",
		Chain = "link",
		Pyramid = "pyramid",
		Dots = "ellipsis",
		["Audio Visualizer"] = "audio-lines",
		["No Texture"] = "minus",
	},
	Default = "Default",
	MaxVisibleDropdownItems = 10,
	Multi = false,
	Callback = function(arg)
		SelLineSkin = arg

		if SelLineSkin == "Default" then
			Skin = "rbxassetid://103833941356941"
		elseif SelLineSkin == "Gamepass" then
			Skin = "rbxassetid://90641888604848"
		elseif SelLineSkin == "Wave" then
			Skin = "rbxassetid://133861607819149"
		elseif SelLineSkin == "Fire" then
			Skin = "rbxassetid://91741727165537"
		elseif SelLineSkin == "Chain" then
			Skin = "rbxassetid://81358145120405"
		elseif SelLineSkin == "Pyramid" then
			Skin = "rbxassetid://135934660517255"
		elseif SelLineSkin == "Dots" then
			Skin = "rbxassetid://9169659357"
		elseif SelLineSkin == "Audio Visualizer" then
			Skin = "rbxassetid://81588563590679"
		elseif SelLineSkin == "No Texture" then
			Skin = "sixseven"
		end
	end,
})

GBS:AddDropdown("LineSound", {
	Text = "Line Sounds",
	Values = { "Default", "Old" },
	Default = "Default",
	Multi = false,
	Callback = function(arg)
		SelLineSound = arg

		if SelLineSound == "Default" then
			SoundPoint = "rbxassetid://26723422"
			SoundLine = "rbxassetid://18426149"
		elseif SelLineSound == "Old" then
			SoundPoint = "rbxassetid://12221944"
			SoundLine = "rbxassetid://12221944"
		end
	end,
})

GBS:AddDropdown("LineHand", {
	Text = "Arm",
	Values = { "Right Arm", "Left Arm" },
	Default = "Right Arm",
	Multi = false,
	Callback = function(arg)
		SelectedHand = arg
	end,
})

GBS:AddCheckbox("HandLine", {
	Text = "Realistic Line",
	Default = false,
	Callback = function(arg)
		HandLineView = arg
	end,
})

Animations = {
	Dance = "rbxassetid://248263260",
	["Dance 2"] = "rbxassetid://35654637",
	["Head Drop"] = "rbxassetid://35154961",
	Zombie = "rbxassetid://33796059",
	Struggle = "rbxassetid://7047322890",
	["Floating Head"] = "rbxassetid://121572214",
	Crouch = "rbxassetid://182724289",
	["Floor Claw"] = "rbxassetid://282574440",
	["Dino Walk"] = "rbxassetid://204328711",
	["Jumping Jacks"] = "rbxassetid://429681631",
	["Hero Jump"] = "rbxassetid://184574340",
	Faint = "rbxassetid://181526230",
	["Floor Faint"] = "rbxassetid://181525546",
	Levitate = "rbxassetid://313762630",
	Dab = "rbxassetid://183412246",
	Spin = "rbxassetid://188632011",
	["Float Sit"] = "rbxassetid://179224234",
	["Moving Dance"] = "rbxassetid://429703734",
	["Weird Move"] = "rbxassetid://215384594",
	["Spin Dance"] = "rbxassetid://429730430",
	["Moon Dance"] = "rbxassetid://45834924",
	["Full Punch"] = "rbxassetid://204062532",
	["Spin Dance 2"] = "rbxassetid://186934910",
	["Bow Down"] = "rbxassetid://204292303",
	["Sword Slam"] = "rbxassetid://204295235",
	["Super Punch"] = "rbxassetid://126753849",
	["Full Swing"] = "rbxassetid://218504594",
	["Arm Turbine"] = "rbxassetid://259438880",
	["Barrel Roll"] = "rbxassetid://136801964",
	Scared = "rbxassetid://180612465",
	["Arm Detach"] = "rbxassetid://33169583",
	["Sword Slice"] = "rbxassetid://35978879",
	["Insane Arms"] = "rbxassetid://27432691",
}

SelectedAnimation = nil
AnimationSpeed = 1
ApplyAnimation = false

ANIM:AddDropdown("SelectAnimationDropdown", {
	Text = "Select Animation",
	Values = {
		"Dance",
		"Dance 2",
		"Head Drop",
		"Zombie",
		"Struggle",
		"Floating Head",
		"Crouch",
		"Floor Claw",
		"Dino Walk",
		"Jumping Jacks",
		"Hero Jump",
		"Faint",
		"Floor Faint",
		"Levitate",
		"Dab",
		"Spin",
		"Float Sit",
		"Moving Dance",
		"Weird Move",
		"Spin Dance",
		"Moon Dance",
		"Full Punch",
		"Spin Dance 2",
		"Bow Down",
		"Sword Slam",
		"Super Punch",
		"Full Swing",
		"Arm Turbine",
		"Barrel Roll",
		"Scared",
		"Arm Detach",
		"Sword Slice",
		"Insane Arms",
	},
	Multi = false,
	Callback = function(arg)
		SelectedAnimation = arg
	end,
})

ANIM:AddSlider("AnimationSpeedSlider", {
	Text = "Animation Speed",
	Default = 1,
	Min = 0,
	Max = 5,
	Rounding = 1,
	Compact = true,
	Callback = function(arg)
		AnimationSpeed = arg
	end,
})

ANIM:AddToggle("ApplyAnimationToggle", {
	Text = "Apply Animation",
	Default = false,
	Callback = function(arg)
		if arg then
			ApplyAnimation = true

			if char then
				local humanoid = char:WaitForChild("Humanoid", 1)

				if humanoid then
					local animator = humanoid:WaitForChild("Animator", 1)

					if animator then
						local animation = Instance.new("Animation", humanoid)
						animation.AnimationId = Animations[SelectedAnimation]
						local v27 = animator:LoadAnimation(animation)
						v27.Looped = true
						v27:Play()

						while ApplyAnimation and task.wait() do
							v27:AdjustSpeed(AnimationSpeed)
						end

						v27:Stop()
						animation:Destroy()
					end
				end
			end
		else
			ApplyAnimation = false
		end
	end,
})

AntiGrabEnabled = false
AntiExplodeEnabled = false
AntiSnowballEnabled = false
ADL = false

RunService.Heartbeat:Connect(function()
	local v27 = char

	if v27 then
		v27 = AntiGrabEnabled or AntiExplodeEnabled or AntiSnowballEnabled
	end

	if v27 then
		local v28, v29, v30 = GetHRH(char)
		if not v28 or not v29 or not v30 or v30.Health <= 0 or not v30:FindFirstChild("Ragdolled") or not v30.Ragdolled.Value then
			return
		end

		if not v30.SeatPart then
			v30:ChangeState(2)
		end

		v29.CFrame = CFrame.new(v29.Position + v30.MoveDirection * 0.1,
			v29.Position +
			Vector3.new(workspace.CurrentCamera.CFrame.LookVector.X, 0, workspace.CurrentCamera.CFrame.LookVector.Z))

		for _, v31 in char:GetChildren() do
			if v31.Name == "Head" and v29 then
				v31.CFrame = v29.CFrame * CFrame.new(0, 1.5, 0)
				v31.CanCollide = false
				v31.Velocity = Vector3.zero
			elseif v31.Name == "Left Arm" and v29 then
				v31.CFrame = v29.CFrame * CFrame.new(-1.5, 0, 0)
				v31.Velocity = Vector3.zero

				if v31:FindFirstChild("RagdollLimbPart") then
					v31.RagdollLimbPart.CanCollide = false
				end
			elseif v31.Name == "Right Arm" and v29 then
				v31.CFrame = v29.CFrame * CFrame.new(1.5, 0, 0)
				v31.Velocity = Vector3.zero

				if v31:FindFirstChild("RagdollLimbPart") then
					v31.RagdollLimbPart.CanCollide = false
				end
			elseif v31.Name == "Left Leg" and v29 and not ADL then
				v31.CFrame = v29.CFrame * CFrame.new(-0.5, -2, 0)
				v31.Velocity = Vector3.zero

				if v31:FindFirstChild("RagdollLimbPart") then
					v31.RagdollLimbPart.CanCollide = false
				end
			elseif v31.Name == "Right Leg" and v29 and not ADL then
				v31.CFrame = v29.CFrame * CFrame.new(0.5, -2, 0)
				v31.Velocity = Vector3.zero

				if v31:FindFirstChild("RagdollLimbPart") then
					v31.RagdollLimbPart.CanCollide = false
				end
			end
		end
	end
end)

AntiGrabMode = "Ragdoll"

DF:AddDropdown("AntiGrabModeDropdown", {
	Text = "Anti Grab Mode",
	Values = { "No Ragdoll", "Ragdoll", "Tractor Escape" },
	Default = "Ragdoll",
	Multi = false,
	Callback = function(arg)
		AntiGrabMode = arg
	end,
})

AntiGrabConn = nil

DF:AddToggle("AntiGrabToggle", {
	Text = "Anti Grab",
	Default = false,
	Callback = function(arg)
		AntiGrabEnabled = arg

		if AntiGrabEnabled then
			AntiGrabConn = RunService.Stepped:Connect(function()
				if not LocalPlayer:FindFirstChild("IsHeld") or not LocalPlayer.IsHeld.Value then
					return
				end

				if not char then
					return
				end
				local v27, v28, v29 = GetHRH(char)
				if not v27 or not v28 or not v29 or v29.Health <= 0 then
					return
				end
				v28.Anchored = true
				Struggle:FireServer()
				task.wait()
				v28.Anchored = false

				if AntiGrabMode == "Ragdoll" and v29:FindFirstChild("Ragdolled") and not v29.Ragdolled.Value then
					ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(v28, 0)
				elseif AntiGrabMode == "Tractor Escape" then
					local tractorGreen = toysFolder:FindFirstChild("TractorGreen") or
					NewToy("TractorGreen", CFrame.new(300, 30, 500))

					if tractorGreen then
						local vehicleSeat = tractorGreen:WaitForChild("VehicleSeat", 1)

						if vehicleSeat and vehicleSeat.Parent and not vehicleSeat.Occupant and v29 and v29.Health > 0 then
							while task.wait() and AntiGrabEnabled and AntiGrabMode == "Tractor Escape" and vehicleSeat and vehicleSeat.Parent and not vehicleSeat.Occupant and v29 and v29.Parent and v29.Health > 0 do
								vehicleSeat:Sit(v29)
							end

							if v29 and v29.Parent and v29.Health > 0 and vehicleSeat and vehicleSeat.Parent and vehicleSeat.Occupant and vehicleSeat.Occupant == v29 then
								DestroyT(tractorGreen)
								v29.Sit = true
							end
						else
							DestroyT(tractorGreen)
						end
					end
				end
			end)
		elseif AntiGrabConn then
			AntiGrabConn:Disconnect()
		end
	end,
}):AddKeyPicker("ToggleAntiGrab", {
	Default = "None",
	Callback = function()
		if AntiGrabEnabled then
			Library:Notify({ Title = "Nil'e", Description = "Anti Grab Off", Time = 1.5, BigIcon = "info" })
			Toggles.AntiGrab:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Anti Grab On", Time = 1.5, BigIcon = "info" })
			Toggles.AntiGrab:SetValue(true)
		end
	end,
})

DF:AddToggle("AntiBlob", {
	Text = "Anti Blob",
	Default = false,
	Callback = function(arg)
		AntiBlobman = arg
		if not char then
			return
		end
		local v27, v28, v29 = GetHRH(char)
		if not v28 or not v29 or v29.Health <= 0 then
			return
		end

		if v28 and v28:FindFirstChild("RootAttachment") then
			task.wait(0.1)
			v28.RootAttachment:Destroy()
			Instance.new("Folder", v28).Name = "RootAttachment"
		end
	end,
})

AntiBurnConn = nil

DF:AddToggle("AntiBurn", {
	Text = "Anti Burn",
	Default = false,
	Callback = function(arg)
		if arg then
			local plotBarrier = workspace.Plots.Plot3.Barrier.PlotBarrier
			local cFrame = plotBarrier.CFrame

			AntiBurnConn = RunService.Heartbeat:Connect(function()
				if char and char:FindFirstChild("HumanoidRootPart") and char.HumanoidRootPart:FindFirstChild("FirePlayerPart") and char.HumanoidRootPart.FirePlayerPart:FindFirstChild("CanBurn") and char.HumanoidRootPart.FirePlayerPart.CanBurn.Value then
					plotBarrier.CFrame = char.HumanoidRootPart.CFrame
					task.wait()
					plotBarrier.CFrame = cFrame
				end
			end)
		elseif AntiBurnConn then
			AntiBurnConn:Disconnect()
		end
	end,
})

workspace.ChildAdded:Connect(function(child)
	if AntiExplodeEnabled and char and child.Name == "Part" and child:IsA("Part") then
		local v27, v28, v29 = GetHRH(char)
		if not v28 or not v29 or v29.Health <= 0 then
			return
		end

		if (child.Position - v28.Position).Magnitude <= 20 then
			v28.Anchored = true
			v28.Velocity = Vector3.zero
			task.wait()
			v28.Anchored = false
		end
	end
end)

DF:AddToggle("AntiExplode", {
	Text = "Anti Explode",
	Default = false,
	Callback = function(arg)
		AntiExplodeEnabled = arg
	end,
})

DF:AddToggle("LoopRagdoll", {
	Text = "Anti Snowball",
	Default = false,
	Callback = function(arg)
		AntiSnowballEnabled = arg

		while AntiSnowballEnabled and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(v28, 0.75)
				end
			end
		end
	end,
}):AddKeyPicker("ToggleLoopRagdoll", {
	Default = "None",
	Callback = function()
		if AntiSnowballEnabled then
			Library:Notify({ Title = "Nil'e", Description = "Anti Snowball Off", Time = 1.5, BigIcon = "info" })
			Toggles.LoopRagdoll:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Anti Snowball On", Time = 1.5, BigIcon = "info" })
			Toggles.LoopRagdoll:SetValue(true)
		end
	end,
})

AntiVoidEnabled = false

DF:AddToggle("AntiVoid", {
	Text = "Anti Void",
	Default = false,
	Callback = function(arg)
		AntiVoidEnabled = arg

		if AntiVoidEnabled then
			game.Workspace.FallenPartsDestroyHeight = (0 / 0)
		else
			game.Workspace.FallenPartsDestroyHeight = -100
		end
	end,
})

AntiPaintEnabled = false
AntiStickyWDEnabled = false

DF:AddToggle("AntiPoisonAndPaintAndSticky", {
	Text = "Anti Poison & Paint & Sticky",
	Default = false,
	Callback = function(arg)
		AntiPaintEnabled = arg

		if AntiPaintEnabled then
			if AntiStickyWDEnabled then
				Toggles.AntiStickyWD:SetValue(false)
			end

			Toggles.AntiStickyWD:SetDisabled(true)
		else
			Toggles.AntiStickyWD:SetDisabled(false)
		end

		if AntiPaintEnabled then
			if char:WaitForChild("HumanoidRootPart", 5) then
				for _, v27 in char:GetChildren() do
					if v27:IsA("Part") then
						v27.CanTouch = false
					end
				end
			end
		elseif char:WaitForChild("HumanoidRootPart", 5) then
			for _, v27 in char:GetChildren() do
				if v27:IsA("Part") then
					v27.CanTouch = true
				end
			end
		end
	end,
})

DF:AddToggle("AntiStickyWD", {
	Text = "Anti Sticky (WD)",
	Default = false,
	Callback = function(arg)
		AntiStickyWDEnabled = arg

		if AntiStickyWDEnabled then
			if AntiPaintEnabled then
				Toggles.AntiPoisonAndPaintAndSticky:SetValue(false)
			end

			Toggles.AntiPoisonAndPaintAndSticky:SetDisabled(true)
		else
			Toggles.AntiPoisonAndPaintAndSticky:SetDisabled(false)
		end

		local v27

		while AntiStickyWDEnabled and task.wait() do
			if char then
				local v28 = GetCharPart(char, "HumanoidRootPart")
				local v29 = GetCharPart(char, "Humanoid")

				if v28 and v29 then
					local SprayCanWD = NewToy("SprayCanWD", v28.CFrame * CFrame.new(0, 10, 20))

					if SprayCanWD then
						SprayCanWD.Name = "AntiSticky(WD)"
						local hitbox = SprayCanWD:WaitForChild("Hitbox", 1)
						local straw = SprayCanWD:WaitForChild("Straw", 1)

						if hitbox and straw then
							while true do
								task.wait()
								v27 = Ownerboat(hitbox)
								if not (not AntiStickyWDEnabled or not hitbox or v27) then
									continue
								end
								break
							end

							if v27 then
								task.spawn(function()
									if SprayCanWD.Parent == toysFolder then
										local sprayCanWD = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy
										.Contents:WaitForChild("SprayCanWD", 1)

										if sprayCanWD then
											sprayCanWD.Name = "AntiSticky"
											sprayCanWD.ViewItemButton.Season.Visible = true
											sprayCanWD.ViewItemButton.Season.Text = "Anti Sticky"
										end
									end
								end)

								for _, v30 in SprayCanWD:GetChildren() do
									if v30:IsA("Part") or v30:IsA("MeshPart") then
										v30.Transparency = 1
										v30.CanCollide = false
										v30.CanQuery = false
									end
								end

								SprayCanWD:FindFirstChild("Attachment0", true):Destroy()
								SprayCanWD:FindFirstChild("SurfaceGui", true):Destroy()
								hitbox.CFrame = CFrame.new(0, 676767, 0)
								hitbox.Velocity = Vector3.zero
								hitbox.RotVelocity = Vector3.zero
								local bodyPosition = Instance.new("BodyPosition", hitbox)
								bodyPosition.Position = Vector3.new(0, 676767, 0)
								bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyPosition.D = 100

								while AntiStickyWDEnabled and hitbox and hitbox.Parent and hitbox:FindFirstChild("PartOwner") and hitbox.PartOwner.Value == LocalPlayer.Name and task.wait() do
									if char then
										local v30 = GetCharPart(char, "HumanoidRootPart")

										if v30 and hitbox then
											hitbox.CFrame = v30.CFrame * CFrame.new(-3, 0, 3)
											hitbox.Velocity = Vector3.zero
											hitbox.RotVelocity = Vector3.zero
											task.wait(0.05)

											if hitbox then
												hitbox.CFrame = CFrame.new(0, 676767, 0)
												hitbox.Velocity = Vector3.zero
												hitbox.RotVelocity = Vector3.zero
											end
										end
									end
								end

								if toysFolder:FindFirstChild("AntiSticky(WD)") then
									DestroyT(toysFolder["AntiSticky(WD)"])
								end
							else
								DestroyT(SprayCanWD)
							end
						else
							DestroyT(SprayCanWD)
						end
					end
				end
			end
		end
	end,
})

DF:AddToggle("AutoDeleteLegs", {
	Text = "Anti Banana",
	Tooltip = "Auto Delete Legs",
	Default = false,
	Callback = function(arg)
		ADL = arg

		while ADL and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					if (char:FindFirstChild("Left Leg") or char:FindFirstChild("Right Leg")) and not LocalPlayer.IsHeld.Value then
						while true do
							ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(v28, 0.5)
							task.wait(0.1)
							if not (not v28 or not v29 or v29.Health <= 0 or v29:FindFirstChild("Ragdolled") and v29.Ragdolled.Value or not ADL) then
								continue
							end
							break
						end

						if v28 and v29 and v29.Health > 0 and v29:FindFirstChild("Ragdolled") and v29.Ragdolled.Value and not LocalPlayer.IsHeld.Value then
							if char:FindFirstChild("Left Leg") then
								char["Left Leg"].CFrame = CFrame.new(100000, -100000, 100000)
							end

							if char:FindFirstChild("Right Leg") then
								char["Right Leg"].CFrame = CFrame.new(100000, -100000, 100000)
							end

							task.wait(0.1)

							if v28 and v29 and v29.Health > 0 then
								SetNetworkOwner:FireServer(v28, v28.CFrame)
							end

							task.wait(0.5)
						end
					end

					if v28 and v29 and v29.Health > 0 then
						if LocalPlayer.PlayerGui.ControlsGui.PCFrame.Crouch.Visible then
							v29.HipHeight = 2
						elseif LocalPlayer.PlayerGui.ControlsGui.PCFrame.Stand.Visible then
							v29.HipHeight = 0
						end
					end
				end
			end
		end
	end,
})

AntiLagg = false

DF:AddToggle("AntiLag", {
	Text = "Anti Lag",
	Tooltip = "Off Other Lines",
	Default = false,
	Callback = function(arg)
		if arg then
			AntiLagg = true
			LocalPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = true

			for _, v27 in P:GetPlayers() do
				if v27 ~= LocalPlayer and v27.Character and v27.Character:FindFirstChild("GrabParts") then
					v27.Character:FindFirstChild("GrabParts"):Destroy()
				end
			end
		else
			AntiLagg = false
			LocalPlayer.PlayerScripts.CharacterAndBeamMove.Disabled = false
		end
	end,
}):AddKeyPicker("ToggleAntiLag", {
	Default = "None",
	Callback = function()
		if AntiLagg then
			Library:Notify({ Title = "Nil'e", Description = "Anti Lag Off", Time = 1.5, BigIcon = "info" })
			Toggles.AntiLag:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Anti Lag On", Time = 1.5, BigIcon = "info" })
			Toggles.AntiLag:SetValue(true)
		end
	end,
})

AutoAntiLagg = true

DF:AddCheckbox("AutoAntiLag", {
	Text = "Auto Anti Lag",
	Default = true,
	Callback = function(arg)
		AutoAntiLagg = arg
	end,
})

GrabEvents.CreateGrabLine.OnClientEvent:Connect(function(arg, arg2, arg3)
	local flag7 = AutoAntiLagg and not AntiLagg and typeof(arg3) == "CFrame" and
	(workspace.SpawnLocation.Position - arg3.Position).Magnitude > 100000 and P:FindFirstChild(tostring(arg))

	if flag7 then
		local v27 = LocalPlayer
		flag7 = P:FindFirstChild(tostring(arg)) ~= v27
	end

	if flag7 then
		Library:Notify({ Title = "Nil'e", Description = "Anti Lag On", Time = 1.5, BigIcon = "info" })
		Toggles.AntiLag:SetValue(true)
	end
end)

GucciMethod = "Blobman"
WhoSatOnMyGucci = nil
AutoGucciEnabled = false

RemoveGucci = function()
	for _, v27 in toysFolder:GetChildren() do
		if v27.Name == "guchi" or v27.Name == "CreatureBlobman" or v27.Name == "TractorGreen" then
			v27.Name = "иди нахуй отсюда"
			DestroyT(v27)
		end
	end

	if char then
		local v27, v28, v29 = GetHRH(char)

		if v28 and v29 and v29.Health > 0 then
			v28.Anchored = fasle
			v28.Velocity = Vector3.zero
			v29.Sit = true
			task.wait(0.05)
			v29.Sit = false
		end
	end
end

Gucci = function()
	RemoveGucci()

	if char then
		local v27, v28, v29 = GetHRH(char)

		if v28 and v29 and v29.Health > 0 then
			if GucciMethod == "Blobman" and v28 and v29 and v29.Health > 0 and v29:FindFirstChild("Ragdolled") and not v29.Ragdolled.Value then
				local CreatureBlobman = NewToy("CreatureBlobman", CFrame.new(0, 1000000, 20))

				if CreatureBlobman then
					CreatureBlobman.Name = "guchi"

					task.spawn(function()
						if CreatureBlobman.Parent == toysFolder then
							local creatureBlobman = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
							:WaitForChild("CreatureBlobman", 1)

							if creatureBlobman then
								creatureBlobman.ViewItemButton.Season.Visible = true
								creatureBlobman.ViewItemButton.Season.Text = "Gucci [Anti Grab]"
							end
						end
					end)

					local vehicleSeat = CreatureBlobman:WaitForChild("VehicleSeat", 1)
					local head = CreatureBlobman:WaitForChild("Head", 1)
					local humanoidRootPart = CreatureBlobman:WaitForChild("HumanoidRootPart", 1)

					if vehicleSeat and head and humanoidRootPart then
						vehicleSeat.Anchored = true
						local flag7 = true

						task.spawn(function()
							while task.wait() and flag7 and vehicleSeat and vehicleSeat.Parent and v28 and v29 and v29.Health > 0 do
								v28.Anchored = true
								ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(v28, 0)

								for _, v30 in char:GetChildren() do
									if v30.Name == "LocalCreatureControl" then
										v30.Enabled = false
									end
								end
							end
						end)

						while v29 and v29.Health > 0 and vehicleSeat and vehicleSeat.Parent and not vehicleSeat.Occupant do
							vehicleSeat:Sit(v29)
							task.wait()
						end

						if v29 and v29.Health > 0 and vehicleSeat and vehicleSeat.Parent and vehicleSeat.Occupant == v29 then
							v29.Sit = false
						end

						local now2 = tick()

						while true do
							Ownerboat(humanoidRootPart)
							task.wait()
							if not (not head or not head.Parent or head:FindFirstChild("PartOwner") and head.PartOwner.Value == LocalPlayer.Name or not v29 or v29.Health < 0 or tick() - now2 > 1) then
								continue
							end
							break
						end

						flag7 = false

						if v28 and v29 and v29.Health > 0 then
							v28.Velocity = Vector3.zero
							v28.Anchored = false
						end

						if vehicleSeat and vehicleSeat.Parent then
							return vehicleSeat
						end
					end
				end
			elseif GucciMethod == "Tractor [Invisible]" and v28 and v29 and v29.Health > 0 and v29:FindFirstChild("Ragdolled") and not v29.Ragdolled.Value then
				local TractorGreen = NewToy("TractorGreen", CFrame.new(0, 1000000, 20))

				if TractorGreen then
					TractorGreen.Name = "guchi"

					task.spawn(function()
						if TractorGreen.Parent == toysFolder then
							local tractorGreen = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
							:WaitForChild("TractorGreen", 1)

							if tractorGreen then
								tractorGreen.ViewItemButton.Season.Visible = true
								tractorGreen.ViewItemButton.Season.Text = "Gucci [Anti Grab]"
							end
						end
					end)

					local vehicleSeat = TractorGreen:WaitForChild("VehicleSeat", 1)
					local axel1 = TractorGreen:WaitForChild("Axel1", 1)

					if vehicleSeat and axel1 then
						vehicleSeat.Anchored = true
						local flag7 = true

						task.spawn(function()
							while task.wait() and flag7 and vehicleSeat and vehicleSeat.Parent and v28 and v29 and v29.Health > 0 do
								v28.Anchored = true
								ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(v28, 0)
							end
						end)

						vehicleSeat:Sit(v29)

						while v29 and v29.Health > 0 and vehicleSeat and vehicleSeat.Parent and not vehicleSeat.Occupant do
							vehicleSeat:Sit(v29)
							task.wait()
						end

						if v29 and v29.Health > 0 and vehicleSeat and vehicleSeat.Parent and vehicleSeat.Occupant == v29 then
							v29.Sit = false
						end

						local now2 = tick()

						while true do
							local v30 = Ownerboat(GucciRoot)
							task.wait()
							if not (not GucciHead or not GucciHead.Parent or v30 or not v29 or v29.Health < 0 or tick() - now2 > 1) then
								continue
							end
							break
						end

						task.wait(0.1)
						flag7 = false

						if v28 and v29 and v29.Health > 0 then
							v28.Velocity = Vector3.zero
							v28.Anchored = false
						end

						if vehicleSeat and vehicleSeat.Parent then
							return vehicleSeat
						end
					end
				end
			elseif GucciMethod == "Train [Invisible]" and v28 and v29 and v29.Health > 0 and v29:FindFirstChild("Ragdolled") and not v29.Ragdolled.Value then
				local objectModel = workspace.Map.AlwaysHereTweenedObjects.Train.Object:FindFirstChild("ObjectModel")

				if objectModel then
					local tbl6 = {}
					local v30 = nil

					for _, v31 in objectModel:GetChildren() do
						if v31.Name == "Seat" and not v31.Occupant then
							table.insert(tbl6, v31)
						end
					end

					local n13 = math.random(1, #tbl6)

					for k, v31 in tbl6, nil, nil do
						if k == n13 then
							v30 = v31
						end
					end

					if v30 then
						local cFrame = v28.CFrame
						local connection = nil

						connection = RunService.Heartbeat:Connect(function()
							task.wait(0.1)
							v30:Sit(v29)
							ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(v28, 0)
							connection:Disconnect()
							v30:Sit(v29)
						end)

						task.wait(0.3)

						if v28 and v29 and v29.Health > 0 then
							Teleport(v28, cFrame, CFrame.new(0, 0, 0))
						end

						if v30 and v30.Parent then
							return v30
						end
					end
				elseif AutoGucciEnabled then
					Library:Notify({
						Title = "Nil'e",
						Description = "Train Deleted, Gucci Off",
						Time = 1.5,
						BigIcon = "info",
					})

					Toggles.AutoGucci:SetValue(false)
				end
			end
		end
	end
end

CDF:AddDropdown("GucciMethodDropdown", {
	Text = "Gucci Method",
	Values = { "Blobman", "Tractor [Invisible]", "Train [Invisible]" },
	ValueImages = {
		Blobman = "bot",
		["Tractor [Invisible]"] = "tractor",
		["Train [Invisible]"] = "train-front-tunnel",
	},
	Default = "Blobman",
	Multi = false,
	Callback = function(arg)
		GucciMethod = arg
	end,
})

CDF:AddToggle("AutoGucci", {
	Text = "Gucci",
	Default = false,
	Callback = function(arg)
		AutoGucciEnabled = arg

		while AutoGucciEnabled and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 and v29:FindFirstChild("Ragdolled") and not v29.Ragdolled.Value and not LocalPlayer.IsHeld.Value then
					local v30 = Gucci()

					if v30 and v28 then
						WhoSatOnMyGucci = v30:GetPropertyChangedSignal("Occupant"):Connect(function()
							if v30 and v30.Parent and v30.Occupant and v30.Occupant.Parent and P:FindFirstChild(v30.Occupant.Parent.Name) then
								local v31 = P:FindFirstChild(v30.Occupant.Parent.Name)

								Library:Notify({
									Title = "Nil'e",
									Description = v31.DisplayName .. " [" .. v31.Name .. "] Broke Your Gucci",
									Time = 3,
									BigIcon = "triangle-alert",
								})
							end
						end)

						ReplicatedStorage.CharacterEvents.RagdollRemote:FireServer(v28, 0.1)

						while AutoGucciEnabled and v29 and v29.Health > 0 and v29:FindFirstChild("Ragdolled") and not v29.Ragdolled.Value and not LocalPlayer.IsHeld.Value and v30 and v30.Parent do
							task.wait()
						end

						if WhoSatOnMyGucci then
							WhoSatOnMyGucci:Disconnect()
						end
					end

					RemoveGucci()
				end
			end
		end
	end,
}):AddKeyPicker("ToggleAutoGucci", {
	Default = "None",
	Callback = function()
		if AutoGucciEnabled then
			Library:Notify({ Title = "Nil'e", Description = "Gucci Off", Time = 1.5, BigIcon = "info" })
			Toggles.AutoGucci:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Gucci On", Time = 1.5, BigIcon = "info" })
			Toggles.AutoGucci:SetValue(true)
		end
	end,
})

CounterattackEnabled = false
TypeOfCounterattack = "Fling"

DFA:AddDropdown("TypeOfCounterattackDropdown", {
	Text = "What Should Do",
	Values = { "Grab", "Fling", "Kill", "Send To The Heaven", "Void" },
	ValueImages = {
		Grab = "hand-grab",
		Fling = "expand",
		Kill = "skull",
		["Send To The Heaven"] = "cloud-upload",
		Void = "arrow-down-from-line",
	},
	Default = "Fling",
	Multi = false,
	Callback = function(arg)
		TypeOfCounterattack = arg
	end,
})

DFA:AddToggle("Counterattack", {
	Text = "Auto Attack",
	Default = false,
	Callback = function(arg)
		CounterattackEnabled = arg
		local v27

		while CounterattackEnabled and task.wait() do
			if char then
				local v28 = GetCharPart(char, "Head")

				if v28 and v28:FindFirstChild("PartOwner") then
					local v29 = P:WaitForChild(v28.PartOwner.Value, 1)

					if v29 and v29.Character and not table.find(AllWhitelisted, v29) then
						local v30, v31, v32 = GetHRH(v29.Character)

						if v30 and v32 then
							local now2, v33 = tick()

							while true do
								task.wait()
								v27 = Ownerboat(v30)
								if not (not v28 or not v30 or (v28.Position - v30.Position).Magnitude > 20 or v27 or tick() - now2 > 0.5) then
									continue
								end
								break
							end

							v27 = v27 and v28

							if v27 and v32 then
								if TypeOfCounterattack == "Fling" then
									v30.Velocity = (vector.normalize(v30.Position - v28.Position) + Vector3.new(0, 0.5, 0)) *
									100
									UnGrab(v30)
								elseif TypeOfCounterattack == "Kill" then
									local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
									local cframe = CFrame.new
									Teleport(v30, CFrame.new(0, -50000, 0), cframe(0, 0, 0))
									task.wait(0.1)
									workspace.FallenPartsDestroyHeight = -45000
									task.wait()
									workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
								elseif TypeOfCounterattack == "Send To The Heaven" then
									local bodyVelocity = Instance.new("BodyVelocity", v30)
									bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyVelocity.Velocity = Vector3.new(0, 50, 0)
									bodyVelocity.Name = "Send To The Heaven"

									while v30 and v30.Parent and v30:FindFirstChild("PartOwner") and v30.PartOwner.Value == LocalPlayer.Name do
										task.wait()
									end

									if bodyVelocity then
										bodyVelocity:Destroy()
									end
								elseif TypeOfCounterattack == "Void" then
									v30.Velocity = Vector3.new(0, -100000000, 0)
									UnGrab(v30)
								end
							end
						end
					end
				end
			end
		end
	end,
})

MyPCLD = nil
AntiKickItem = "NinjaShuriken"
AntiKickEnabled = false
AntiKickSticked = false
AutoReset = false
Warnings = {}
AutoLeave = false
AutoLeaveSensitivity = 3
AntiKickRotationX = 90
AntiKickRotationY = 111
AntiKickRotationZ = 0
AntiKickOffsetX = 0
AntiKickOffsetY = 0
AntiKickOffsetZ = 0.1
AntiKickTransparency = 0

FindMyPCLD = function()
	while task.wait() and AntiKickEnabled do
		if char and char:FindFirstChild("HumanoidRootPart") then
			for _, v27 in workspace:GetChildren() do
				if v27.Name == "PlayerCharacterLocationDetector" and (v27.Position - char.HumanoidRootPart.Position).Magnitude < 0.75 then
					return v27
				end
			end
		end
	end
end

DFKT:AddToggle("AntiKickToggle", {
	Text = "Anti Kick",
	Default = false,
	Callback = function(arg)
		AntiKickEnabled = arg
		local v27

		while AntiKickEnabled and task.wait() do
			if not MyPCLD or not MyPCLD.Parent then
				MyPCLD = FindMyPCLD()
			end

			if char and MyPCLD then
				local v28, v29, v30 = GetHRH(char)

				if v29 and v29:FindFirstChild("FirePlayerPart") and v30 and v30.Health > 0 then
					local firePlayerPart = v29:FindFirstChild("FirePlayerPart")
					local antiKick = toysFolder:FindFirstChild("AntiKick") or
					NewToy(AntiKickItem, MyPCLD.CFrame * CFrame.new(0, 0, 20))

					if antiKick then
						task.spawn(function()
							if antiKick.Parent == toysFolder then
								local v31 = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
								:WaitForChild(AntiKickItem, 1)

								if v31 then
									v31.Name = "AntiKick"
									v31.ViewItemButton.Season.Visible = true
									v31.ViewItemButton.Season.Text = "Anti Kick"
								end
							end
						end)

						antiKick.Name = "AntiKick"
						local stickyPart = antiKick:WaitForChild("StickyPart", 1)

						if stickyPart then
							local stickyWeld = stickyPart:WaitForChild("StickyWeld", 1)
							local v31 = nil

							for _, v32 in antiKick:GetChildren() do
								if v32:IsA("Part") and v32.CanQuery then
									v31 = v32
									break
								else
									v31 = nil
								end
							end

							if stickyWeld and v31 and (MyPCLD.Position - v31.Position).Magnitude < 20 then
								local now2 = tick()

								while true do
									v27 = Ownerboat(v31)
									task.wait()
									if not (not AntiKickEnabled or not v29 or not v30 or v30.Health <= 0 or not v31 or not v31.Parent or (MyPCLD.Position - v31.Position).Magnitude > 20 or tick() - now2 > 1 or v27) then
										continue
									end
									break
								end

								if v27 and stickyPart and stickyPart.Parent and firePlayerPart and v30 and v30.Health > 0 then
									local now3 = tick()

									while true do
										task.wait(0.1)
										local cframe = CFrame.Angles
										local rad = math.rad
										local v32 = AntiKickRotationZ
										StickyPartEvent:FireServer(stickyPart, firePlayerPart,
											CFrame.new(AntiKickOffsetX, AntiKickOffsetY, AntiKickOffsetZ) *
											cframe(math.rad(AntiKickRotationX), math.rad(AntiKickRotationY), rad(v32)))
										local flag7 = not AntiKickEnabled or not v30 or v30.Health <= 0 or
										not firePlayerPart or not v27 or (MyPCLD.Position - v31.Position).Magnitude > 20 or
										not stickyWeld or not stickyWeld.Parent
										local flag8

										if flag7 then
											flag8 = flag7
										else
											flag8 = stickyWeld.Part1 and stickyWeld.Part1 == firePlayerPart
										end

										flag8 = flag8 or tick() - now3 > 1
										if not flag8 then
											continue
										end
										break
									end

									if firePlayerPart and v30 and v30.Health > 0 and stickyWeld and stickyWeld.Part1 and stickyWeld.Part1 == firePlayerPart then
										while AntiKickEnabled and task.wait() and v30 and v30.Health > 0 and stickyWeld and stickyWeld.Parent and stickyWeld.Part1 and stickyWeld.Part1 == firePlayerPart do
											AntiKickSticked = true

											for _, v32 in antiKick:GetChildren() do
												if v32:IsA("Part") or v32:IsA("MeshPart") then
													if v32.Transparency ~= 1 then
														v32.Transparency = AntiKickTransparency
													end

													v32.CanCollide = false
												end
											end
										end

										AntiKickSticked = false
										local partOwner = antiKick:FindFirstChild("PartOwner", true)

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = antiKick:FindFirstChild("PartOwner", true).Value ~= name
										end

										if partOwner and P:FindFirstChild(antiKick:FindFirstChild("PartOwner", true).Value) then
											local v32 = P:FindFirstChild(antiKick:FindFirstChild("PartOwner", true)
											.Value)

											Library:Notify({
												Title = "Nil'e",
												Description = v32.DisplayName ..
												" [" .. v32.Name .. "] Touched Your Anti Kick",
												Time = 1,
												BigIcon = "triangle-alert",
											})
										end
									end
								end
							else
								DestroyT(antiKick)
							end
						else
							DestroyT(antiKick)
						end
					end
				end
			end
		end
	end,
})

DFKT:AddToggle("AutoBreakPCLD", {
	Text = "Break PCLD",
	Default = false,
	Callback = function(arg)
		AutoBreakPCL = arg

		if AutoBreakPCL then
			if AntiKickEnabled then
				Toggles.AntiKickToggle:SetValue(false)
			end

			Toggles.AntiKickToggle:SetDisabled(true)
		else
			Toggles.AntiKickToggle:SetDisabled(false)
		end

		if AutoBreakPCL and char then
			task.wait(0.25)
			char:WaitForChild("Humanoid").Health = 0
		end
	end,
})

AC.OnClientEvent:Connect(function(arg)
	if arg == "Flying" then
		if AutoLeave then
			local now2 = tick()
			table.insert(Warnings, now2)

			for i = #Warnings, 1, -1 do
				if now2 - Warnings[i] > 1 then
					table.remove(Warnings, i)
				end
			end

			if #Warnings >= AutoLeaveSensitivity then
				LocalPlayer:Kick("Auto Leave")
			end
		end

		if AutoReset then
			Struggle:FireServer()
			char.Humanoid.Health = 0

			Library:Notify({
				Title = "Nil'e",
				Description = "Anti Cheat Warning",
				Time = 5,
				BigIcon = "triangle-alert",
			})
		end
	end
end)

DFKT:AddToggle("AutoRespawn", {
	Text = "Auto Reset",
	Tooltip = "Resets If An Anti Cheat Warning Is Received",
	Default = false,
	Callback = function(arg)
		AutoReset = arg
	end,
})

DFKT:AddToggle("AutoLeaveToggle", {
	Text = "Auto Leave",
	Default = false,
	Callback = function(arg)
		AutoLeave = arg
	end,
})

DFKS:AddDropdown("AntiKickItemDropdown", {
	Text = "Anti Kick Item",
	Values = {
		"NinjaShuriken",
		"NinjaKunai",
		"NinjaKatana",
		"ToolCleaver",
		"ToolPickaxe",
		"ToolPencil",
		"ToolDiggingForkRusty",
	},
	Default = "NinjaShuriken",
	Multi = false,
	Callback = function(arg)
		AntiKickItem = arg
	end,
})

DFKS:AddInput("AntiKickRotationXInput", {
	Text = "Rotation X",
	Default = 90,
	Numeric = true,
	ClearTextOnFocus = false,
	Callback = function(arg)
		AntiKickRotationX = arg or 0
	end,
})

DFKS:AddInput("AntiKickRotationYInput", {
	Text = "Rotation Y",
	Default = 111,
	Numeric = true,
	ClearTextOnFocus = false,
	Callback = function(arg)
		AntiKickRotationY = arg or 0
	end,
})

DFKS:AddInput("AntiKickRotationZInput", {
	Text = "Rotation Z",
	Default = 0,
	ClearTextOnFocus = false,
	Callback = function(arg)
		AntiKickRotationZ = arg or 0
	end,
})

DFKS:AddInput("AntiKickOffsetXInput", {
	Text = "Offset X",
	Default = 0,
	ClearTextOnFocus = false,
	Callback = function(arg)
		AntiKickOffsetX = arg or 0
	end,
})

DFKS:AddInput("AntiKickOffsetYInput", {
	Text = "Offset Y",
	Default = 0,
	ClearTextOnFocus = false,
	Callback = function(arg)
		AntiKickOffsetY = arg or 0
	end,
})

DFKS:AddInput("AntiKickOffsetZInput", {
	Text = "Offset Z",
	Default = 0.1,
	ClearTextOnFocus = false,
	Callback = function(arg)
		AntiKickOffsetZ = arg or 0
	end,
})

DFKS:AddSlider("AntiKickTransparencySlider", {
	Text = "Transparency",
	Default = 0,
	Min = 0,
	Max = 0.9,
	Rounding = 2,
	Compact = true,
	Callback = function(arg)
		AntiKickTransparency = arg
	end,
})

DFKS:AddDivider()

DFKS:AddSlider("AutoLeaveSensitivitySlider", {
	Text = "Auto Leave Sensitivity",
	Default = 3,
	Min = 1,
	Max = 5,
	Rounding = 0,
	Suffix = " Warns",
	Compact = true,
	Callback = function(arg)
		AutoLeaveSensitivity = arg
	end,
})

AntiNet = false
AntiNetDelay = 0.08
selectedItem = "FoodHamburger"
AntiNetTransparency = 0
local antiNetwork = nil

DFB:AddDropdown("AntiInputLagItem", {
	Text = "Anti Network Item",
	Values = {
		"PoopPileSparkle",
		"FoodHamburger",
		"CupMugWhite",
		"FoodBanana",
		"FoodCoconut",
		"FoodSodaCan",
		"CupMugBrown",
		"FoodBread",
		"FoodBroccoli",
		"FoodDippyEgg",
		"FoodDonut",
		"FoodHotdog",
		"FoodMayonnaise",
		"FoodMeatStick",
		"FoodMushroomPoison",
		"FoodPizzaCheese",
		"PoopPile",
		"FoodPizzaPepperoni",
		"FoodFrenchFries",
		"FoodCakePink",
		"InstrumentBrassBugle",
		"InstrumentBrassTrumpet",
		"InstrumentBrassVuvuzela",
		"InstrumentDrumBongos",
		"InstrumentDrumSnare",
		"InstrumentGuitarAcoustic",
		"InstrumentGuitarBanjo",
		"InstrumentGuitarLyre",
		"InstrumentGuitarUkulele",
		"InstrumentGuitarViolin",
		"InstrumentPianoKeyboard",
		"InstrumentPianoMelodica",
		"InstrumentVoiceMicrophone",
		"InstrumentWoodwindOcarina",
		"InstrumentWoodwindSaxophone",
	},
	Default = "FoodHamburger",
	Multi = false,
	MaxVisibleDropdownItems = 10,
	Callback = function(arg)
		selectedItem = arg
	end,
})

DFB:AddSlider("AntiNetDelay", {
	Text = "Anti Network Delay",
	Default = 0.08,
	Min = 0.03,
	Max = 0.1,
	Rounding = 3,
	Compact = true,
	Callback = function(arg)
		AntiNetDelay = arg
	end,
})

DFB:AddLabel("Value less than 0.05 may cause ping problems!", true)

DFB:AddSlider("AntiNetTransparencySlider", {
	Text = "Transparency",
	Default = 0,
	Min = 0,
	Max = 0.9,
	Rounding = 2,
	Compact = true,
	Callback = function(arg)
		AntiNetTransparency = arg
	end,
})

DFB:AddToggle("AntiNetwork", {
	Text = "Anti Network",
	Default = false,
	Callback = function(arg)
		if arg then
			AntiNet = true

			while AntiNet and task.wait(AntiNetDelay) do
				local v27 = selectedItem
				antiNetwork = toysFolder:FindFirstChild("AntiNetwork")

				if not antiNetwork and not LocalPlayer.InPlot.Value and LocalPlayer.CanSpawnToy.Value then
					SpawnToy(v27, CFrame.new(52, 228, 67))
					antiNetwork = toysFolder:WaitForChild(v27, 1)
				end

				if antiNetwork then
					task.spawn(function()
						if antiNetwork.Parent == toysFolder then
							local v28 = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents:WaitForChild(
							v27, 1)

							if v28 then
								v28.ViewItemButton.Season.Visible = true
								v28.ViewItemButton.Season.Text = "Anti Network"
							end
						end
					end)

					antiNetwork.Name = "AntiNetwork"
					local holdPart = antiNetwork:WaitForChild("HoldPart", 1)

					if holdPart then
						for _, v28 in antiNetwork:GetChildren() do
							if (v28:IsA("Part") or v28:IsA("MeshPart")) and v28.Transparency ~= 1 then
								v28.Transparency = AntiNetTransparency
							end
						end

						local rigidConstraint = holdPart:WaitForChild("RigidConstraint", 1)
						local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 1)
						local dropItemRemoteFunction = holdPart:WaitForChild("DropItemRemoteFunction", 1)

						if rigidConstraint and holdItemRemoteFunction and dropItemRemoteFunction then
							if rigidConstraint.Attachment1 ~= nil and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name ~= LocalPlayer.Name then
								if toysFolder:FindFirstChild("AntiNetwork") then
									DestroyT(toysFolder:FindFirstChild("AntiNetwork"))
								end
							else
								task.spawn(function()
									holdItemRemoteFunction:InvokeServer(antiNetwork, char)
								end)

								task.spawn(function()
									task.wait(AntiNetDelay)
									dropItemRemoteFunction:InvokeServer(antiNetwork, CFrame.new(52, 1488, 67),
										Vector3.zero)
								end)
							end
						elseif toysFolder:FindFirstChild("AntiNetwork") then
							DestroyT(toysFolder:FindFirstChild("AntiNetwork"))
						end
					elseif toysFolder:FindFirstChild("AntiNetwork") then
						DestroyT(toysFolder:FindFirstChild("AntiNetwork"))
					end
				elseif toysFolder:FindFirstChild("AntiNetwork") then
					DestroyT(toysFolder:FindFirstChild("AntiNetwork"))
				end
			end
		else
			AntiNet = false

			if toysFolder:FindFirstChild("AntiNetwork") then
				DestroyT(toysFolder:FindFirstChild("AntiNetwork"))
			end
		end
	end,
}):AddKeyPicker("ToggleAntiNetwork", {
	Default = "None",
	Callback = function()
		if AntiNet then
			Library:Notify({ Title = "Nil'e", Description = "Anti Network Off", Time = 1.5, BigIcon = "info" })
			Toggles.AntiNetwork:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Anti Network On", Time = 1.5, BigIcon = "info" })
			Toggles.AntiNetwork:SetValue(true)
		end
	end,
})

GetPlotToRespawn = function()
	for _, v27 in workspace.Plots:GetChildren() do
		for _, v28 in v27:GetChildren() do
			if v28.Name ~= "PlotSign" then
				continue
			end

			for _, v29 in v28:GetChildren() do
				if v29.Name ~= "ThisPlotsOwners" then
					continue
				end

				for _, v30 in v29:GetChildren() do
					if v30.Name == "Value" and v30.Value == LocalPlayer.Name then
						return v27.Name
					end
				end
			end
		end
	end
end

SelectedSpawnPoint = "Owned Plot"
CustomSpawnPoint = false
LastPositionConn = nil
MyLastPosition = nil

DFM:AddDropdown("selplot", {
	Text = "Select Spawn Point",
	Values = { "Owned Plot", "Last Position" },
	ValueImages = { ["Owned Plot"] = "map-pin-house", ["Last Position"] = "map-pinned" },
	Default = "Owned Plot",
	Multi = false,
	Callback = function(arg)
		SelectedSpawnPoint = arg

		if SelectedSpawnPoint == "Last Position" and char and char:FindFirstChild("Humanoid") and char.Humanoid.Health > 0 then
			if LastPositionConn then
				LastPositionConn:Disconnect()
			end

			LastPositionConn = char.Humanoid:GetPropertyChangedSignal("Health"):Connect(function()
				if char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char.Humanoid.Health <= 0 then
					MyLastPosition = char.HumanoidRootPart.CFrame
				end
			end)
		end
	end,
})

DFM:AddToggle("AntiLoopKill", {
	Text = "Custom Spawn Point",
	Default = false,
	Callback = function(arg)
		CustomSpawnPoint = arg
	end,
})

LocalPlayer.CharacterAdded:Connect(function(character)
	if CustomSpawnPoint then
		local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 1)
		local humanoid = character:WaitForChild("Humanoid", 1)

		if humanoidRootPart and humanoid and humanoid.Health > 0 then
			if SelectedSpawnPoint == "Owned Plot" then
				local v27 = GetPlotToRespawn()

				if v27 == "Plot1" then
					humanoidRootPart.CFrame = CFrame.new(-535, 5, 90)
				elseif v27 == "Plot2" then
					humanoidRootPart.CFrame = CFrame.new(-492, 5, -167)
				elseif v27 == "Plot3" then
					humanoidRootPart.CFrame = CFrame.new(250, 1, 460)
				elseif v27 == "Plot4" then
					humanoidRootPart.CFrame = CFrame.new(512, 89, -340)
				elseif v27 == "Plot5" then
					humanoidRootPart.CFrame = CFrame.new(553, 129, -75)
				end
			elseif SelectedSpawnPoint == "Last Position" then
				humanoidRootPart.CFrame = MyLastPosition

				if LastPositionConn then
					LastPositionConn:Disconnect()
				end

				LastPositionConn = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
					if humanoidRootPart and humanoid and humanoid.Health <= 0 then
						MyLastPosition = humanoidRootPart.CFrame
					end
				end)
			end
		end
	end
end)

DFM:AddDivider()
LoopTP = false
SelectedTPPlaces = "Map"

DFM:AddDropdown("PlacesForTP", {
	Text = "TP Places",
	Values = { "Map", "Plots", "Void" },
	ValueImages = { Map = "map", Plots = "house", Void = "arrow-down-from-line" },
	Default = "Map",
	Multi = false,
	Callback = function(arg)
		SelectedTPPlaces = arg
	end,
})

DFM:AddToggle("LoopTp", {
	Text = "Loop TP",
	Default = false,
	Callback = function(arg)
		LoopTP = arg

		while LoopTP and task.wait(0.01) do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					local cFrame = v28.CFrame

					while LoopTP and task.wait() and v28 and v29 and v29.Health > 0 do
						if SelectedTPPlaces == "Map" then
							local n13 = math.random(-500, 500)
							local v30 = Teleport
							local cframe = CFrame.new
							local n14 = math.random(-500, 500)
							local cframe2 = CFrame.new
							v30(v28, cframe(n13, -8, n14), cframe2(0, 0, 0))
						elseif SelectedTPPlaces == "Plots" then
							for _, v30 in workspace.Waypoints:GetChildren() do
								if v30.Name ~= "Barn" and v30.Name ~= "Factory" and v30.Name ~= "GlassHouse" and v30.Name ~= "Train" and v30.Name ~= "CharacterWaypoint" then
									Teleport(v28, v30.CFrame, CFrame.new(0, 0, 0))
									task.wait(0.01)
								end
							end
						elseif SelectedTPPlaces == "Void" then
							local n13 = math.random(-500000, 500000)
							local v30 = Teleport
							local cframe = CFrame.new
							local n14 = math.random(-500000, 500000)
							v30(v28, cframe(n13, -5000, n14), CFrame.new(0, 0, 0))
						end
					end

					if v28 and v29 and v29.Health > 0 then
						Teleport(v28, cFrame, CFrame.new(0, 0, 0))
					end
				end
			end
		end
	end,
}):AddKeyPicker("ToggleLoopTP", {
	Default = "None",
	Callback = function()
		if LoopTP then
			Library:Notify({ Title = "Nil'e", Description = "Loop TP Off", Time = 1.5, BigIcon = "info" })
			Toggles.LoopTp:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Loop TP On", Time = 1.5, BigIcon = "info" })
			Toggles.LoopTp:SetValue(true)
		end
	end,
})

UpdateTable = function()
	local tbl6 = {}

	for _, v27 in P:GetPlayers() do
		if v27 ~= LocalPlayer then
			table.insert(tbl6, v27.DisplayName .. " [" .. v27.Name .. "]")
		end
	end

	return tbl6
end

GetFirstTarget = function()
	local v27 = table.pack(O_1())
	if v27[1] then
		return v27[3]
	end
end

AllTargets = {}
AllWhitelisted = {}
WhitelistedPlayer = nil
AutoLineLagEnabled = false
AutoWhitelistFriendsEnabled = false

P.PlayerAdded:Connect(function(player)
	PC:SetText("Players: " .. #P:GetPlayers() .. "/25")
	Options.SelectPosePlayer:SetValues(UpdateTable())
	Options.TargetsDropdown:SetValues(UpdateTable())
	Options.TargetsDropdown:SetValue(Options.TargetsDropdown:GetActiveValues())

	for _, v27 in AllTargets, nil, nil do
		if v27 == player then
			Library:Notify({
				Title = "Nil'e",
				Description = "Target " .. v27.DisplayName .. " [" .. v27.Name .. "] Joined",
				Time = 3,
				BigIcon = "locate",
			})

			if AutoLineLagEnabled then
				Toggles.LagServer:SetValue(true)
			end
		end
	end

	Options.WhitelistedPlayersDropdown:SetValues(UpdateTable())
	Options.WhitelistedPlayersDropdown:SetValue(Options.WhitelistedPlayersDropdown:GetActiveValues())

	for _, v27 in AllWhitelisted, nil, nil do
		if v27 == player then
			Library:Notify({
				Title = "Nil'e",
				Description = "Whitelisted " .. v27.DisplayName .. " [" .. v27.Name .. "] Joined",
				Time = 3,
				BigIcon = "user-star",
			})
		end
	end

	if AutoWhitelistFriendsEnabled and LocalPlayer:IsFriendsWithAsync(player.UserId) then
		local tbl6 = {}
		table.insert(tbl6, player.DisplayName .. " [" .. player.Name .. "]")

		for _, v27 in AllWhitelisted, nil, nil do
			table.insert(tbl6, v27.DisplayName .. " [" .. v27.Name .. "]")
		end

		Library:Notify({
			Title = "Nil'e",
			Description = "Friend: " .. player.DisplayName .. " [" .. player.Name .. "] Joined",
			Time = 3,
			BigIcon = "user-star",
		})

		Options.WhitelistedPlayersDropdown:SetValue(tbl6)
	end
end)

P.PlayerRemoving:Connect(function(player)
	PC:SetText("Players: " .. #P:GetPlayers() .. "/25")
	Options.SelectPosePlayer:SetValues(UpdateTable())
	Options.TargetsDropdown:SetValues(UpdateTable())

	for _, v27 in AllTargets, nil, nil do
		if v27 == player then
			Library:Notify({
				Title = "Nil'e",
				Description = "Target " .. v27.DisplayName .. " [" .. v27.Name .. "] Left",
				Time = 3,
				BigIcon = "locate-off",
			})
		end
	end

	Options.WhitelistedPlayersDropdown:SetValues(UpdateTable())

	for _, v27 in AllWhitelisted, nil, nil do
		if v27 == player then
			Library:Notify({
				Title = "Nil'e",
				Description = "Whitelisted " .. v27.DisplayName .. " [" .. v27.Name .. "] Left",
				Time = 3,
				BigIcon = "user-x",
			})
		end
	end
end)

TR:AddDropdown("TargetsDropdown", {
	Text = "Select Targets",
	Values = UpdateTable(),
	Default = nil,
	Multi = true,
	AllowNull = true,
	MaxVisibleDropdownItems = 15,
	Callback = function(arg)
		table.clear(AllTargets)

		for k in arg, nil, nil do
			local match = k:match("%[(.-)%]")
			local v27 = nil

			if match then
				v27 = P:FindFirstChild(match)
			end

			table.insert(AllTargets, v27)
		end
	end,
})

TR:AddCheckbox("AutoLineLagToggle", {
	Text = "Auto Line Lag",
	Default = false,
	Callback = function(arg)
		AutoLineLagEnabled = arg
	end,
})

TR:AddLabel("Add To Target List"):AddKeyPicker("STOM", {
	Default = "None",
	Callback = function()
		local mouse = LocalPlayer:GetMouse()
		local parent = mouse.Target and mouse.Target.Parent and P:FindFirstChild(mouse.Target.Parent.Name)

		if parent then
			local v27 = LocalPlayer
			parent = P:FindFirstChild(mouse.Target.Parent.Name) ~= v27
		end

		if parent then
			local v27 = P:FindFirstChild(mouse.Target.Parent.Name)
			local tbl6 = {}
			table.insert(tbl6, v27.DisplayName .. " [" .. v27.Name .. "]")

			for _, v28 in AllTargets, nil, nil do
				table.insert(tbl6, v28.DisplayName .. " [" .. v28.Name .. "]")
			end

			Library:Notify({
				Title = "Nil'e",
				Description = "New Target: " .. v27.DisplayName .. " [" .. v27.Name .. "]",
				Time = 3,
				BigIcon = "locate-fixed",
			})

			Options.TargetsDropdown:SetValue(tbl6)
		end
	end,
})

ViewTarget = false

TR:AddToggle("ViewTargetToggle", {
	Text = "View Target",
	Default = false,
	Callback = function(arg)
		ViewTarget = arg

		if ViewTarget then
			while ViewTarget and task.wait() do
				local v27 = GetFirstTarget()

				if v27 and v27.Character then
					local v28 = GetCharPart(v27.Character, "Humanoid")

					if v28 then
						workspace.CurrentCamera.CameraSubject = v28
					end
				end
			end
		else
			task.wait(0.01)

			if char then
				local v27 = GetCharPart(char, "Humanoid")

				if v27 then
					workspace.CurrentCamera.CameraSubject = v27
				end
			end
		end
	end,
}):AddKeyPicker("ViewTargetBind", {
	Default = "None",
	Callback = function()
		if ViewTarget then
			Library:Notify({ Title = "Nil'e", Description = "View Target Off", Time = 1.5, BigIcon = "info" })
			Toggles.ViewTargetToggle:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "View Target On", Time = 1.5, BigIcon = "info" })
			Toggles.ViewTargetToggle:SetValue(true)
		end
	end,
})

TPToTargetButton = TR:AddButton({
	Text = "TP To Target",
	Func = function()
		local v27 = GetFirstTarget()

		if char and v27 and v27.Character then
			local v28 = GetCharPart(char, "HumanoidRootPart")
			local v29 = GetCharPart(v27.Character, "HumanoidRootPart")

			if v28 and v29 then
				v28.CFrame = v29.CFrame * CFrame.new(0, 0, 3)
			end
		end
	end,
})

TPToTargetButton:AddKeyPicker("TPToTargetBind", { Default = "None", Mode = "Press" })

TR:AddButton({
	Text = "Clear Target List",
	Func = function()
		Options.TargetsDropdown:SetValue({})
	end,
})

WLS:AddDropdown("WhitelistedPlayersDropdown", {
	Text = "Select Players",
	Values = UpdateTable(),
	Default = nil,
	Multi = true,
	AllowNull = true,
	MaxVisibleDropdownItems = 15,
	Callback = function(arg)
		table.clear(AllWhitelisted)

		for k in arg, nil, nil do
			local match = k:match("%[(.-)%]")
			local v27 = nil

			if match then
				v27 = P:FindFirstChild(match)
			end

			table.insert(AllWhitelisted, v27)
		end
	end,
})

WLS:AddCheckbox("AutoWhitelistFriendsToggle", {
	Text = "Auto Whitelist Friends",
	Default = false,
	Callback = function(arg)
		AutoWhitelistFriendsEnabled = arg
	end,
})

WLS:AddLabel("Add Whitelisted Player"):AddKeyPicker("SWOM", {
	Default = "None",
	Callback = function()
		local mouse = LocalPlayer:GetMouse()
		local parent = mouse.Target and mouse.Target.Parent and P:FindFirstChild(mouse.Target.Parent.Name)

		if parent then
			local v27 = LocalPlayer
			parent = P:FindFirstChild(mouse.Target.Parent.Name) ~= v27
		end

		if parent then
			local v27 = P:FindFirstChild(mouse.Target.Parent.Name)
			local tbl6 = {}
			table.insert(tbl6, v27.DisplayName .. " [" .. v27.Name .. "]")

			for _, v28 in AllWhitelisted, nil, nil do
				table.insert(tbl6, v28.DisplayName .. " [" .. v28.Name .. "]")
			end

			Library:Notify({
				Title = "Nil'e",
				Description = "New Whitelisted: " .. v27.DisplayName .. " [" .. v27.Name .. "]",
				Time = 3,
				BigIcon = "user-star",
			})

			Options.WhitelistedPlayersDropdown:SetValue(tbl6)
		end
	end,
})

WLS:AddButton({
	Text = "Clear Whitelist",
	Func = function()
		Options.WhitelistedPlayersDropdown:SetValue({})
	end,
})

WLS:AddDivider()
WhitelistAntiGrabMode = "Default"
WhitelistAntiGrabEnabled = false
WhitelistAntiBurnEnabled = false
WhitelistAntiKickEnabled = false
WhitelistAntiKickTable = {}

WLS:AddDropdown("WhitelistAntiGrabModeDropdown", {
	Text = "Anti Grab Mode",
	Values = { "Default", "Bring" },
	Default = "Default",
	Multi = false,
	Callback = function(arg)
		WhitelistAntiGrabMode = arg
	end,
})

WLS:AddToggle("WhitelistAntiGrabToggle", {
	Text = "Anti Grab",
	Default = false,
	Callback = function(arg)
		WhitelistAntiGrabEnabled = arg
		local v27

		while WhitelistAntiGrabEnabled and task.wait() do
			for _, v28 in AllWhitelisted, nil, nil do
				if char and v28.Character then
					local v29, v30, v31 = GetHRH(char)
					local v32, v33, v34 = GetHRH(v28.Character)

					if v30 and v31 and v31.Health > 0 and v32 and v34 and v34.Health > 0 then
						if v32:FindFirstChild("PartOwner") and v32.PartOwner.Value ~= LocalPlayer.Name then
							while WhitelistAntiGrabEnabled and task.wait() and v28 and v28:FindFirstChild("IsHeld") and v28.IsHeld.Value and v32 and v34 and v34.Health > 0 and v30 and v31 and v31.Health > 0 do
								if v34 and v34.Health > 0 and v32 and v32:FindFirstChild("PartOwner") and v32.PartOwner.Value ~= LocalPlayer.Name then
									local cFrame = v30.CFrame
									local now2 = tick()

									while true do
										task.wait()

										if (v30.Position - v32.Position).Magnitude > 20 then
											Teleport(v30, v32.CFrame, CFrame.new(0, -8, 0))
										end

										v27 = Ownerboat(v32)
										if not (not WhitelistAntiGrabEnabled or not v32 or not v34 or v34.Health <= 0 or not v30 or not v31 or v31.Health <= 0 or v27 or tick() - now2 > 1.5) then
											continue
										end
										break
									end

									if v30 then
										Teleport(v30, cFrame, CFrame.new(0, 0, 0))
									end

									if v27 then
										if WhitelistAntiGrabMode == "Default" then
											GrabEvents.DestroyGrabLine:FireServer(v32)
										elseif WhitelistAntiGrabMode == "Bring" then
											Teleport(v32, cFrame, CFrame.new(0, 3, -3))
											GrabEvents.DestroyGrabLine:FireServer(v32)
										end

										task.wait(0.01)

										if v34 and v34.Health > 0 then
											v34.Sit = false
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end,
})

WLS:AddToggle("WhitelistAntiBurnToggle", {
	Text = "Anti Burn",
	Default = false,
	Callback = function(arg)
		WhitelistAntiBurnEnabled = arg
		local v27

		while WhitelistAntiBurnEnabled and task.wait() do
			if char then
				local v28, v29, v30 = GetHRH(char)

				if v29 and v30 and v30.Health > 0 then
					for _, v31 in toysFolder:GetChildren() do
						if v31.Name == "WhitelistAntiBurn" then
							v31.Name = "иди нахуй отсюда"
							DestroyT(v31)
						end
					end

					local FireExtinguisher = NewToy("FireExtinguisher", v29.CFrame * CFrame.new(0, 15, 20))

					if FireExtinguisher then
						FireExtinguisher.Name = "WhitelistAntiBurn"

						task.spawn(function()
							if FireExtinguisher.Parent == toysFolder then
								local fireExtinguisher = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy
								.Contents:WaitForChild("FireExtinguisher", 1)

								if fireExtinguisher then
									fireExtinguisher.Name = "WhitelistAntiBurn"
									fireExtinguisher.ViewItemButton.Season.Visible = true
									fireExtinguisher.ViewItemButton.Season.Text = "Whitelist Anti Burn"
								end
							end
						end)

						local soundPart = FireExtinguisher:WaitForChild("SoundPart", 1)
						local fakeButton = FireExtinguisher:WaitForChild("FakeButton", 1)

						if soundPart and fakeButton and fakeButton.Transparency == 1 then
							local now2 = tick()

							while true do
								task.wait()
								v27 = Ownerboat(soundPart)
								if not (not WhitelistAntiBurnEnabled or not v29 or not soundPart or (v29.Position - soundPart.Position).Magnitude > 20 or v27 or tick() - now2 > 1.5) then
									continue
								end
								break
							end

							if v27 then
								local bodyPosition = Instance.new("BodyPosition", soundPart)
								bodyPosition.Position = Vector3.new(0, 676767, 0)
								bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyPosition.D = 100

								while WhitelistAntiBurnEnabled and task.wait() and soundPart and soundPart.Parent and soundPart:FindFirstChild("PartOwner") and soundPart.PartOwner.Value == LocalPlayer.Name do
									for _, v31 in AllWhitelisted, nil, nil do
										if v31.Character then
											local v32, v33, v34 = GetHRH(v31.Character)

											if v33 and v34 and v34.Health > 0 then
												local firePlayerPart = v33:FindFirstChild("FirePlayerPart")

												if firePlayerPart and firePlayerPart:FindFirstChild("CanBurn") and firePlayerPart.CanBurn.Value then
													Teleport(soundPart, v33.CFrame, CFrame.new(-1.4, 5, 0))
													task.wait(0.01)
													local cframe = CFrame.new
													Teleport(soundPart, CFrame.new(0, 676767, 0), cframe(0, 0, 0))
													task.wait(0.01)
												end
											end
										end
									end
								end

								DestroyT(FireExtinguisher)
							else
								DestroyT(FireExtinguisher)
							end
						else
							DestroyT(FireExtinguisher)
						end
					end
				end
			end
		end
	end,
})

WLS:AddToggle("WhitelistAntiKickToggle", {
	Text = "Anti Kick",
	Default = false,
	Callback = function(arg)
		WhitelistAntiKickEnabled = arg
		local v27

		while WhitelistAntiKickEnabled and task.wait() do
			for _, v28 in AllWhitelisted, nil, nil do
				if not (AntiKickEnabled and not AntiKickSticked) then
					if char and v28.Character then
						local v29, v30, v31 = GetHRH(char)
						local v32, v33, v34 = GetHRH(v28.Character)

						if v30 and v31 and v31.Health > 0 and v33 and v33:FindFirstChild("FirePlayerPart") and v34 and v34.Health > 0 then
							local firePlayerPart = v33:FindFirstChild("FirePlayerPart")

							if not table.find(WhitelistAntiKickTable, v28.Name .. "AntiKick") and WhitelistAntiKickEnabled then
								local v35 = NewToy(AntiKickItem, v30.CFrame * CFrame.new(3, 5, 17))

								if v35 then
									task.spawn(function()
										if v35.Parent == toysFolder then
											local v36 = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy
											.Contents:WaitForChild(AntiKickItem, 1)

											if v36 then
												v36.Name = v28.Name .. "AntiKick"
												v36.ViewItemButton.Season.Visible = true
												v36.ViewItemButton.Season.Text = v28.DisplayName
											end
										end
									end)

									v35.Name = v28.Name .. "AntiKick"
									local stickyPart = v35:WaitForChild("StickyPart", 1)

									if stickyPart then
										local stickyWeld = stickyPart:WaitForChild("StickyWeld", 1)
										local v36 = nil

										for _, v37 in v35:GetChildren() do
											if v37:IsA("Part") and v37.CanQuery then
												v36 = v37
												break
											else
												v36 = nil
											end
										end

										if stickyWeld and v36 then
											local now2 = tick()

											while true do
												task.wait()
												v27 = Ownerboat(v36)
												if not (not WhitelistAntiKickEnabled or not v30 or not v31 or v31.Health <= 0 or not v36 or not v36.Parent or (v30.Position - v36.Position).Magnitude > 20 or tick() - now2 > 1 or v27) then
													continue
												end
												break
											end

											if v27 and stickyPart and stickyPart.Parent and firePlayerPart and v34 and v34.Health > 0 then
												local cframe = CFrame.Angles
												local rad = math.rad
												local v37 = AntiKickRotationZ
												StickyPartEvent:FireServer(stickyPart, firePlayerPart,
													CFrame.new(AntiKickOffsetX, AntiKickOffsetY, AntiKickOffsetZ) *
													cframe(math.rad(AntiKickRotationX), math.rad(AntiKickRotationY),
														rad(v37)))
												local now3 = tick()

												while true do
													task.wait()
													if not (not WhitelistAntiKickEnabled or not v34 or v34.Health <= 0 or not firePlayerPart or not v27 or not stickyWeld or not stickyWeld.Parent or stickyWeld.Part1 and stickyWeld.Part1 == firePlayerPart or tick() - now3 > 1) then
														continue
													end
													break
												end

												if v27 and firePlayerPart and v34 and v34.Health > 0 and stickyWeld and stickyWeld.Part1 and stickyWeld.Part1 == firePlayerPart then
													table.insert(WhitelistAntiKickTable, v28.Name .. "AntiKick")

													task.spawn(function()
														while WhitelistAntiKickEnabled and task.wait() and P:FindFirstChild(v28.Name) and v34 and v34.Health > 0 and firePlayerPart and v27 and stickyWeld and stickyWeld.Parent and stickyWeld.Part1 and stickyWeld.Part1 == firePlayerPart do
															for _, v38 in v35:GetChildren() do
																if v38:IsA("Part") or v38:IsA("MeshPart") then
																	v38.CanQuery = false
																end
															end
														end

														for k, v38 in WhitelistAntiKickTable, nil, nil do
															if v38 == v28.Name .. "AntiKick" then
																table.remove(WhitelistAntiKickTable, k)
															end
														end

														if v35 then
															DestroyT(v35)
														end
													end)
												else
													DestroyT(v35)
												end
											else
												DestroyT(v35)
											end
										else
											DestroyT(v35)
										end
									else
										DestroyT(v35)
									end
								end
							end
						end
					end

					continue
				end

				break
			end
		end
	end,
})

TargetsHeightNum = 10
LoopTargetMethod = "Kick [Faster]"
LoopTargetEnabled = false
AutoBreakGucci = false
BreakingNow = false
TargetsWalkSpeed = 16

LTRNB:AddDropdown("LoopTargetMethodDropdown", {
	Text = "Loop Method",
	Values = { "Kick [Faster]", "Kick [Slower]", "Network", "Kill", "Send To The Heaven", "Void" },
	Default = "Kick [Faster]",
	ValueImages = {
		["Kick [Faster]"] = "rabbit",
		["Kick [Slower]"] = "turtle",
		Network = "globe",
		Kill = "skull",
		["Send To The Heaven"] = "cloud-upload",
		Void = "arrow-down-from-line",
	},
	Multi = false,
	Callback = function(arg)
		LoopTargetMethod = arg
		Options.TargetsHeightSlider:SetVisible(false)
		Options.TargetsWalkSpeedSlider:SetVisible(false)

		if LoopTargetMethod ~= "Network" and LoopTargetMethod ~= "Kill" and LoopTargetMethod ~= "Void" and LoopTargetMethod ~= "Send To The Heaven" then
			Options.TargetsHeightSlider:SetVisible(true)
		elseif LoopTargetMethod == "Network" then
			Options.TargetsWalkSpeedSlider:SetVisible(true)
		end
	end,
})

LTRNB:AddSlider("TargetsHeightSlider", {
	Text = "Targets Height",
	Default = 10,
	Min = 5,
	Max = 15,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		TargetsHeightNum = arg
	end,
})

LTRNB:AddSlider("TargetsWalkSpeedSlider", {
	Text = "WalkSpeed",
	Default = 16,
	Min = 16,
	Max = 100,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		TargetsWalkSpeed = arg
	end,
})

LTRNB:AddToggle("LoopTargetToggle", {
	Text = "Loop Target",
	Default = false,
	Callback = function(arg)
		LoopTargetEnabled = arg

		for _, v27 in AllTargets, nil, nil do
			task.spawn(function()
				while LoopTargetEnabled and task.wait() do
					if v27 and v27.Character and LoopTargetMethod ~= "Network" and LoopTargetMethod ~= "Kill" and LoopTargetMethod ~= "Void" and LoopTargetMethod ~= "Send To The Heaven" then
						for _, v28 in v27.Character:GetChildren() do
							if v28:IsA("Part") or v28:IsA("MeshPart") then
								v28.CanCollide = false
								v28.Velocity = Vector3.zero
								v28.RotVelocity = Vector3.zero

								if v27.Character:FindFirstChild("Torso") and v27.Character:FindFirstChild("Humanoid") and v27.Character.Humanoid:FindFirstChild("Ragdolled") and v27.Character.Humanoid.Ragdolled.Value then
									if v28.Name == "Head" then
										v28.CFrame = v27.Character.Torso.CFrame * CFrame.new(0, 1.5, 0)
									elseif v28.Name == "Left Arm" then
										v28.CFrame = v27.Character.Torso.CFrame * CFrame.new(-1.5, 0, 0)
									elseif v28.Name == "Right Arm" then
										v28.CFrame = v27.Character.Torso.CFrame * CFrame.new(1.5, 0, 0)
									elseif v28.Name == "Left Leg" then
										v28.CFrame = v27.Character.Torso.CFrame * CFrame.new(-0.5, -2, 0)
									elseif v28.Name == "Right Leg" then
										v28.CFrame = v27.Character.Torso.CFrame * CFrame.new(0.5, -2, 0)
									end
								end
							end
						end
					end
				end
			end)
		end

		local v27, v28

		while LoopTargetEnabled do
			for k, v29 in AllTargets, nil, nil do
				if char then
					local v30, v31, v32 = GetHRH(char)

					if v30 and v31 and v32 and v32.Health > 0 and v29 and v29.Character and v29.InPlot and not v29.InPlot.Value then
						local v33, v34, v35 = GetHRH(v29.Character)

						if v33 and v34 and v35 and v35.Health > 0 then
							local cFrame = v31.CFrame
							local v36 = nil

							if AutoBreakGucci and not BreakingNow then
								local v37 = workspace:FindFirstChild(v29.Name .. "SpawnedInToys")

								if v37 then
									task.spawn(function()
										BreakingNow = true

										while v37 and LoopTargetEnabled and AutoBreakGucci and not AutoGucciEnabled and not v36 and task.wait() do
											for _, v38 in v37:GetChildren() do
												local vehicleSeat = v38:FindFirstChildOfClass("VehicleSeat")

												if vehicleSeat then
													for _, v39 in v38:GetChildren() do
														if v39:IsA("Part") or v39:IsA("MeshPart") then
															v39.CanCollide = false
															v39.CanTouch = false
														end
													end

													Teleport(vehicleSeat, v31.CFrame, CFrame.new(0, -5, 0))
													v31.Anchored = true
													task.wait()
													vehicleSeat:Sit(v32)

													for i = 1, 10 do
														if v32 and v32.Health > 0 and vehicleSeat and vehicleSeat.Parent and vehicleSeat.Occupant and vehicleSeat.Occupant == v32 then
															for _, v39 in char:GetChildren() do
																if v39.Name == "LocalCreatureControl" then
																	v39.Enabled = false
																end
															end

															if workspace:FindFirstChild("GrabParts") then
																workspace.GrabParts:Destroy()
															end

															if char:FindFirstChild("GrabbingScript") then
																char.GrabbingScript.Enabled = false
																task.wait()
																char.GrabbingScript.Enabled = true
															end

															v32.Sit = true
															task.wait()
															v32.Sit = false
														end
													end

													if v31 then
														v31.Velocity = Vector3.zero
														task.wait()
														v31.Anchored = fasle
													end
												end
											end
										end

										BreakingNow = false
									end)
								end
							end

							if (v31.Position - v34.Position).Magnitude > 20 and LoopTargetMethod ~= "Network" and LoopTargetMethod ~= "Kill" and LoopTargetMethod ~= "Void" and LoopTargetMethod ~= "Send To The Heaven" then
								while true do
									task.wait()
									Teleport(v31, v34.CFrame, CFrame.new(0, -8, 0))
									v36 = Ownerboat(v33)
									if not (not LoopTargetEnabled or not v31 or not v34 or not v33 or not v35 or v35.Health <= 0 or v36) then
										continue
									end
									break
								end

								if v31 then
									Teleport(v31, cFrame, CFrame.new(0, 0, 0))
								end

								if v36 then
									Teleport(v33, v31.CFrame, CFrame.new(0, TargetsHeightNum, 0))
								end
							end

							if LoopTargetMethod ~= "Network" and LoopTargetMethod ~= "Kill" and LoopTargetMethod ~= "Void" and LoopTargetMethod ~= "Send To The Heaven" then
								local n13 = k * 6.2831853071795862 / #AllTargets
								local n14 = math.cos(n13) * 10
								local n15 = math.sin(n13) * 10

								if v31 and v34 and not v34:FindFirstChild("LoopBodyPos") then
									local bodyPosition = Instance.new("BodyPosition", v34)
									bodyPosition.Position = v31.Position + Vector3.new(n14, TargetsHeightNum, n15)
									bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyPosition.D = 100
									bodyPosition.Name = "LoopBodyPos"
								end

								v34.LoopBodyPos.Position = v31.Position + Vector3.new(n14, TargetsHeightNum, n15)

								if v31 and v34 and not v34:FindFirstChild("LoopBodyGyro") then
									local bodyGyro = Instance.new("BodyGyro", v34)
									bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
									bodyGyro.D = 1000
									bodyGyro.P = 90000
									bodyGyro.Name = "LoopBodyGyro"
								end
							elseif v34 and v34:FindFirstChild("LoopBodyPos") and v34:FindFirstChild("LoopBodyGyro") then
								v34.LoopBodyPos:Destroy()
								v34.LoopBodyGyro:Destroy()
							end

							if LoopTargetMethod == "Kick [Faster]" then
								RagdollNow = true

								for i = 1, 2 do
									Ownerboat(v33)
								end

								if v32 and v32.MoveDirection == Vector3.zero then
									UnGrab(v33)
								end
							elseif LoopTargetMethod == "Kick [Slower]" then
								RagdollNow = true

								for i = 1, 2 do
									Ownerboat(v33)
								end

								if v32 and v32.MoveDirection == Vector3.zero then
									for i = 1, 2 do
										UnGrab(v33)
									end

									task.wait()
								end
							elseif LoopTargetMethod == "Network" then
								if not v33:FindFirstChild("PartOwner") or v33.PartOwner.Value ~= LocalPlayer.Name then
									while true do
										task.wait()
										Teleport(v31, v33.CFrame, CFrame.new(0, -1.5, 3))
										local v37 = Ownerboat(v33)
										if not (not LoopTargetEnabled or not v31 or not v33 or not v35 or v35.Health <= 0 or v37) then
											continue
										end
										break
									end

									if v31 then
										Teleport(v31, cFrame, CFrame.new(0, 0, 0))
									end
								end

								v35.Sit = false
								v35.WalkSpeed = TargetsWalkSpeed
								v35.JumpPower = TargetsJumpPower
							elseif LoopTargetMethod == "Kill" then
								local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight

								while true do
									task.wait()
									Teleport(v31, v33.CFrame, CFrame.new(0, -1.5, 3))
									v27 = Ownerboat(v33)
									if not (not LoopTargetEnabled or not v31 or not v33 or not v35 or v35.Health <= 0 or v27) then
										continue
									end
									break
								end

								if v31 then
									Teleport(v31, cFrame, CFrame.new(0, 0, 0))
								end

								if v27 then
									local cframe = CFrame.new
									Teleport(v34, CFrame.new(0, -50000, 0), cframe(0, 0, 0))
									task.wait(0.1)
									workspace.FallenPartsDestroyHeight = -45000
									task.wait()
									workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
								end

								task.wait(0.4)
							elseif LoopTargetMethod == "Send To The Heaven" then
								if not v33:FindFirstChild("PartOwner") or v33.PartOwner.Value ~= LocalPlayer.Name then
									while true do
										task.wait()
										Teleport(v31, v33.CFrame, CFrame.new(0, -1.5, 3))
										local v37 = Ownerboat(v33)
										if not (not LoopTargetEnabled or not v31 or not v33 or not v35 or v35.Health <= 0 or v37) then
											continue
										end
										break
									end

									if v31 then
										Teleport(v31, cFrame, CFrame.new(0, 0, 0))
									end
								end

								if not v33:FindFirstChild("Send To The Heaven") then
									local bodyVelocity = Instance.new("BodyVelocity", v33)
									bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyVelocity.Velocity = Vector3.new(0, 50, 0)
									bodyVelocity.Name = "Send To The Heaven"

									task.spawn(function()
										while v33 and v33.Parent and v33:FindFirstChild("PartOwner") and v33.PartOwner.Value == LocalPlayer.Name do
											task.wait()
										end

										if bodyVelocity then
											bodyVelocity:Destroy()
										end
									end)
								end
							elseif LoopTargetMethod == "Void" then
								if v34 and v34.Position.Y > -100 then
									while true do
										task.wait()
										Teleport(v31, v33.CFrame, CFrame.new(0, -1.5, 3))
										v28 = Ownerboat(v33)
										if not (not LoopTargetEnabled or not v31 or not v33 or not v35 or v35.Health <= 0 or v28) then
											continue
										end
										break
									end

									if v31 then
										Teleport(v31, cFrame, CFrame.new(0, 0, 0))
									end

									v28 = v28 and v34

									if v28 then
										v34.Velocity = Vector3.new(0, -100000000, 0)
										UnGrab(v33)
									end
								end
							end
						end
					end
				end
			end

			if #AllTargets > 1 then
				task.wait(0.01)
			else
				task.wait()
			end
		end

		RagdollNow = false

		for _, v29 in AllTargets, nil, nil do
			if v29 and v29.Character and v29.Character:FindFirstChild("LoopBodyPos", true) and v29.Character:FindFirstChild("LoopBodyGyro", true) then
				v29.Character:FindFirstChild("LoopBodyPos", true):Destroy()
				v29.Character:FindFirstChild("LoopBodyGyro", true):Destroy()
			end
		end
	end,
})

BlobmanLoopMethod = "Kick [Loop]"
AutoSitEnabled = false
BlobmanLoopTargetEnabled = false
RagdollTargetEnabled = false
RagdollNow = false

LTRB:AddDropdown("BlobmanLoopMethodDropdown", {
	Text = "Blobman Loop Method",
	Values = { "Kill", "Lock", "Kick [Instant]", "Kick [Loop]" },
	ValueImages = {
		Kill = "skull",
		Lock = "user-lock",
		["Kick [Instant]"] = "zap",
		["Kick [Loop]"] = "refresh-cw",
	},
	Default = "Kick [Loop]",
	Multi = false,
	Callback = function(arg)
		BlobmanLoopMethod = arg
	end,
})

LTRB:AddCheckbox("AutoSitToggle", {
	Text = "Auto Sit",
	Default = false,
	Callback = function(arg)
		AutoSitEnabled = arg

		while AutoSitEnabled and task.wait(0.05) do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					if toysFolder:FindFirstChild("CreatureBlobman") then
						local vehicleSeat = toysFolder.CreatureBlobman:FindFirstChild("VehicleSeat")

						if vehicleSeat then
							vehicleSeat:Sit(v29)
						else
							DestroyT(toysFolder.CreatureBlobman)
						end
					else
						local CreatureBlobman = NewToy("CreatureBlobman", v28.CFrame * CFrame.new(0, 15, 20))

						if CreatureBlobman then
							local vehicleSeat = toysFolder.CreatureBlobman:WaitForChild("VehicleSeat", 1)

							if vehicleSeat and v29 then
								vehicleSeat:Sit(v29)
							else
								DestroyT(CreatureBlobman)
							end
						end
					end
				end
			end
		end
	end,
})

LTRB:AddToggle("BlobmanLoopTargetToggle", {
	Text = "Loop Target",
	Default = false,
	Callback = function(arg)
		BlobmanLoopTargetEnabled = arg
		local v27 = GetFirstTarget()

		task.spawn(function()
			while BlobmanLoopTargetEnabled and task.wait() do
				if v27 and v27.Character and LoopTargetMethod ~= "Kick [Instant]" then
					for _, v28 in v27.Character:GetChildren() do
						if v28:IsA("Part") or v28:IsA("MeshPart") then
							v28.Velocity = Vector3.zero
							v28.RotVelocity = Vector3.zero
						end
					end
				end
			end
		end)

		local seatPart

		while BlobmanLoopTargetEnabled and task.wait(0.01) do
			local v28 = GetFirstTarget()

			if char then
				local v29, v30, v31 = GetHRH(char)

				if v29 and v30 and v31 and v31.Health > 0 and v31.SeatPart and v31.SeatPart.Parent and v31.SeatPart.Parent:FindFirstChild("HumanoidCreature") then
					local parent = v31.SeatPart.Parent
					parent.HumanoidCreature:ChangeState(2)
					local blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")
					local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
					local leftDetector = parent:FindFirstChild("LeftDetector")

					if blobmanSeatAndOwnerScript and humanoidRootPart and leftDetector then
						local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
						local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
						local leftWeld = leftDetector:FindFirstChild("LeftWeld")

						if creatureGrab and creatureRelease and leftWeld and v28 and v28.Character then
							leftWeld.Enabled = false
							local v32, v33, flag7 = GetHRH(v28.Character)

							if v32 and v33 and flag7 and flag7.Health > 0 then
								if BlobmanLoopMethod ~= "Kill" and BlobmanLoopMethod ~= "Kick [Instant]" then
									if (v30.Position - v33.Position).Magnitude > 27.5 then
										local cFrame = v30.CFrame

										while true do
											Teleport(v30, v33.CFrame, CFrame.new(0, -1.5, 3))
											creatureGrab:FireServer(leftDetector, v33, leftWeld)
											task.wait(0.01)
											local flag8 = not BlobmanLoopTargetEnabled or not v30 or not v33 or not flag7 or
											flag7.Health <= 0 or not leftDetector or not leftWeld
											local flag9

											if flag8 then
												flag9 = flag8
											else
												flag9 = leftWeld.Attachment0 and leftWeld.Attachment0.Parent and
												leftWeld.Attachment0.Parent == v33
											end

											if not flag9 then
												continue
											end
											break
										end

										if v30 then
											Teleport(v30, cFrame, CFrame.new(0, 0, 0))
										end
									end

									if v30 and v33 and not v33:FindFirstChild("BlobmanLoopBodyPos") then
										local bodyPosition = Instance.new("BodyPosition", v33)

										if BlobmanLoopMethod == "Lock" then
											bodyPosition.Position = leftDetector.Position
										else
											bodyPosition.Position = v30.Position + Vector3.new(0, 25, 0)
										end

										bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										bodyPosition.D = 100
										bodyPosition.Name = "BlobmanLoopBodyPos"
									elseif v30 and v33 and v33:FindFirstChild("BlobmanLoopBodyPos") then
										if BlobmanLoopMethod == "Lock" then
											v33.BlobmanLoopBodyPos.Position = leftDetector.Position
										else
											v33.BlobmanLoopBodyPos.Position = v30.Position + Vector3.new(0, 25, 0)
										end
									end
								elseif v33 and v33:FindFirstChild("BlobmanLoopBodyPos") then
									v33.BlobmanLoopBodyPos:Destroy()
								end

								if BlobmanLoopMethod == "Kill" then
									local cFrame = v30.CFrame
									local now2 = tick()

									while true do
										task.wait()
										Teleport(v30, v33.CFrame, CFrame.new(0, 5, 20))
										creatureGrab:FireServer(leftDetector, v33, leftWeld)
										if not (not BlobmanLoopTargetEnabled or not v30 or not v31 or not v31.SeatPart or not v33 or not flag7 or flag7.Health <= 0 or not leftDetector or not leftWeld or leftWeld.Attachment0 and leftWeld.Attachment0.Parent and leftWeld.Attachment0.Parent == v33 or tick() - now2 > 1.5) then
											continue
										end
										break
									end

									if v31 and v31.SeatPart and v31.SeatPart.Parent == parent and leftWeld and leftWeld.Attachment0 and leftWeld.Attachment0.Parent and leftWeld.Attachment0.Parent == v33 and flag7 then
										creatureRelease:FireServer(leftWeld)
										flag7:ChangeState("Dead")
									else
										task.wait(1.5)
									end

									if v30 then
										Teleport(v30, cFrame, CFrame.new(0, 0, 0))
									end
								elseif BlobmanLoopMethod == "Kick [Instant]" then
									local cFrame = v30.CFrame

									while true do
										task.wait()
										Teleport(v30, v32.CFrame, CFrame.new(0, -1.5, 10))
										seatPart = Ownerboat(v32)
										if not (not BlobmanLoopTargetEnabled or not v30 or not v32 or not flag7 or flag7.Health <= 0 or seatPart) then
											continue
										end
										break
									end

									seatPart = seatPart and v33 and v30 and v31 and v31.SeatPart

									if seatPart and v31.SeatPart.Parent == parent then
										UnGrab(v32)
										local bodyPosition = Instance.new("BodyPosition", v33)
										bodyPosition.Position = v33.Position + Vector3.new(0, 30, 0)
										bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										bodyPosition.D = 100
										bodyPosition.Name = "InstantKickBodyPosition"
										local position = bodyPosition.Position

										while true do
											task.wait()
											Teleport(v30, v33.CFrame, CFrame.new(0, 0, 10))
											creatureGrab:FireServer(leftDetector, v33, leftWeld)
											if not (not BlobmanLoopTargetEnabled or not v30 or not v31 or not v31.SeatPart or not v33 or not flag7 or flag7.Health <= 0 or not leftDetector or not leftWeld or leftWeld.Attachment0 and leftWeld.Attachment0.Parent and leftWeld.Attachment0.Parent == v33) then
												continue
											end
											break
										end

										if v30 then
											Teleport(v30, cFrame, CFrame.new(0, 0, 0))

											if parent and parent:FindFirstChild("HumanoidCreature") then
												parent.HumanoidCreature:ChangeState(2)
											end
										end

										flag7 = v31 and v31.SeatPart and v31.SeatPart.Parent == parent and leftWeld and
										leftWeld.Attachment0 and leftWeld.Attachment0.Parent and
										leftWeld.Attachment0.Parent == v33 and flag7
										v32 = flag7 and v32

										if v32 then
											while BlobmanLoopTargetEnabled and v28 and v28.Character and v28.Character:FindFirstChild("HumanoidRootPart") and v28.Character.HumanoidRootPart == v33 and (v33.CFrame.Position - position).Magnitude < 5 do
												task.wait()
											end

											if bodyPosition then
												bodyPosition:Destroy()
											end
										end
									end
								elseif BlobmanLoopMethod == "Lock" then
									creatureGrab:FireServer(leftDetector, v33, leftWeld)
									creatureRelease:FireServer(leftWeld)
									flag7.Sit = true
									task.wait(0.01)
								elseif BlobmanLoopMethod == "Kick [Loop]" then
									RagdollNow = true
									creatureGrab:FireServer(leftDetector, v33, leftWeld)
									Ownerboat(v32)

									for i = 1, 2 do
										UnGrab(v32)
									end

									creatureRelease:FireServer(leftWeld)
									flag7.Sit = true
									task.wait(0.01)
								end
							end
						end
					end
				end
			end
		end

		RagdollNow = false

		if v27 and v27.Character and v27.Character:FindFirstChild("BlobmanLoopBodyPos", true) then
			v27.Character:FindFirstChild("BlobmanLoopBodyPos", true):Destroy()
		end
	end,
})

CTR:AddToggle("RagdollTargetToggle", {
	Text = "Ragdoll Target",
	Default = false,
	Callback = function(arg)
		RagdollTargetEnabled = arg
		local v27

		while RagdollTargetEnabled and task.wait() do
			if char and not LocalPlayer.InPlot.Value then
				local v28, v29, v30 = GetHRH(char)

				if v28 and v29 and v30 and v30.Health > 0 then
					for _, v31 in toysFolder:GetChildren() do
						if v31.Name == "PalletLightBrown" or v31.Name == "RagdollTarget" then
							v31.Name = "иди нахуй отсюда"
							DestroyT(v31)
						end
					end

					local PalletLightBrown = NewToy("PalletLightBrown", v29.CFrame * CFrame.new(0, 15, 20))

					if PalletLightBrown then
						PalletLightBrown.Name = "RagdollTarget"
						local soundPart = PalletLightBrown:WaitForChild("SoundPart", 3)

						if soundPart then
							soundPart.CanCollide = false

							task.spawn(function()
								if PalletLightBrown.Parent == toysFolder then
									local palletLightBrown = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy
									.Contents:WaitForChild("PalletLightBrown", 1)

									if palletLightBrown then
										palletLightBrown.Name = "RagdollTarget"
										palletLightBrown.ViewItemButton.Season.Visible = true
										palletLightBrown.ViewItemButton.Season.Text = "Ragdoll Target"
									end
								end
							end)

							for _, v31 in PalletLightBrown:GetChildren() do
								if v31:IsA("Part") then
									v31.Transparency = 1
								end
							end

							while true do
								task.wait()
								v27 = Ownerboat(soundPart)
								if not (not RagdollTargetEnabled or not soundPart or not v29 or (v29.Position - soundPart.Position).Magnitude > 20 or v27) then
									continue
								end
								break
							end

							if v27 then
								soundPart.CanQuery = false
								local bodyPosition = Instance.new("BodyPosition", soundPart)
								bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyPosition.D = 100
								bodyPosition.Position = Vector3.new(0, 1000000, 0)

								while RagdollTargetEnabled and task.wait() and PalletLightBrown and soundPart do
									PalletLightBrown = toysFolder:FindFirstChild("RagdollTarget")

									for _, v31 in AllTargets, nil, nil do
										if RagdollNow and PalletLightBrown and v31 and v31.Character then
											local v32, v33, v34 = GetHRH(v31.Character)

											if v32 and v33 and v34 and v34.Health > 0 then
												soundPart.CFrame = v33.CFrame
												task.wait()
												soundPart.CFrame = CFrame.new(0, 1000000, 0)
												task.wait(0.075)
											end
										end
									end
								end

								if PalletLightBrown then
									DestroyT(PalletLightBrown)
								end
							end
						end
					end
				end
			end
		end
	end,
})

BananaRagdollEnabled = false

CTR:AddToggle("BananaRagdollToggle", {
	Text = "Banana Ragdoll",
	Default = false,
	Callback = function(arg)
		BananaRagdollEnabled = arg
		local v27

		while BananaRagdollEnabled and task.wait() do
			if char then
				local v28, v29, v30 = GetHRH(char)

				if v29 and v30 and v30.Health > 0 then
					local FoodBanana = NewToy("FoodBanana", v29.CFrame * CFrame.new(0, 15, 20))

					if FoodBanana then
						FoodBanana.Name = "BananaRagdoll"

						task.spawn(function()
							if FoodBanana.Parent == toysFolder then
								local foodBanana = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
								:WaitForChild("FoodBanana", 1)

								if foodBanana then
									foodBanana.Name = "BananaRagdoll"
									foodBanana.ViewItemButton.Season.Visible = true
									foodBanana.ViewItemButton.Season.Text = "Banana Ragdoll"
								end
							end
						end)

						local soundPart = FoodBanana:WaitForChild("SoundPart", 1)
						local holdPart = FoodBanana:WaitForChild("HoldPart", 1)

						if soundPart and holdPart then
							local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 1)
							local dropItemRemoteFunction = holdPart:WaitForChild("DropItemRemoteFunction", 1)
							local rigidConstraint = holdPart:WaitForChild("RigidConstraint", 1)

							if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
								local now2 = tick()

								while true do
									task.wait()
									holdItemRemoteFunction:InvokeServer(FoodBanana, char)
									if not (not BananaRagdollEnabled or not v29 or not v30 or v30.Health <= 0 or not FoodBanana or not holdItemRemoteFunction or not rigidConstraint or rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name or tick() - now2 > 3) then
										continue
									end
									break
								end

								if rigidConstraint and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
									ReplicatedStorage.HoldEvents.Use:FireServer(FoodBanana)

									while true do
										task.wait()
										if not (not FoodBanana or not FoodBanana:FindFirstChild("EdiblePart")) then
											continue
										end
										break
									end

									pcall(function()
										dropItemRemoteFunction:InvokeServer(FoodBanana)
									end)

									local now3 = tick()

									while true do
										task.wait()
										v27 = Ownerboat(soundPart)
										if not (not BananaRagdollEnabled or not soundPart or not v29 or not v30 or v30.Health <= 0 or (v29.Position - soundPart.Position).Magnitude > 20 or tick() - now3 > 3 or v27) then
											continue
										end
										break
									end

									if v27 then
										soundPart.CanCollide = false
										local highlight = Instance.new("Highlight", FoodBanana)
										highlight.FillColor = Color3.fromRGB(0, 0, 0)
										highlight.OutlineColor = Color3.new(255, 255, 255)
										local billboardGui = Instance.new("BillboardGui", FoodBanana)
										billboardGui.AlwaysOnTop = true
										billboardGui.Size = UDim2.new(5, 50, 1, 50)
										local textLabel = Instance.new("TextLabel", billboardGui)
										textLabel.Size = UDim2.new(1, 0, 1, 0)
										textLabel.TextColor3 = Color3.new(255, 255, 255)
										textLabel.TextStrokeTransparency = 0
										textLabel.BackgroundTransparency = 1
										textLabel.Size = UDim2.new(1, 0, 1, 0)
										textLabel.Text = "Banana Ragdoll"
										UnGrab(soundPart)

										while true do
											task.wait()
											if not (not BananaRagdollEnabled or not soundPart or not soundPart:FindFirstChild("PartOwner")) then
												continue
											end
											break
										end

										while BananaRagdollEnabled and task.wait() and soundPart and soundPart.Parent and not soundPart:FindFirstChild("PartOwner") do
											local random = math.random
											Teleport(soundPart, workspace.SpawnLocation.CFrame,
												CFrame.new(math.random(-6767, 6767), 6767, random(-6767, 6767)))

											for _, v31 in AllTargets, nil, nil do
												if v31.Character then
													local v32, v33, v34 = GetHRH(v31.Character)

													if v33 and v34 and v34.Health > 0 and (v31.Character:FindFirstChild("Left Leg") or v31.Character:FindFirstChild("Right Leg")) then
														Teleport(soundPart, v33.CFrame, CFrame.new(0, -1.5, 0))
														task.wait(0.1)
														local random2 = math.random
														Teleport(soundPart, workspace.SpawnLocation.CFrame,
															CFrame.new(math.random(-6767, 6767), 6767,
																random2(-6767, 6767)))
														task.wait(0.05)
													end
												end
											end
										end

										DestroyT(FoodBanana)
									else
										DestroyT(FoodBanana)
									end
								else
									DestroyT(FoodBanana)
								end
							else
								DestroyT(FoodBanana)
							end
						else
							DestroyT(FoodBanana)
						end
					end
				end
			end
		end
	end,
})

CTR:AddDivider()

CTR:AddDropdown("ExplodeType", {
	Text = "Explode Item",
	Values = {
		"BombMissile",
		"BombDarkMatter",
		"BombBalloon",
		"FireworkMissile",
		"PresentBig",
		"PresentSmall",
	},
	Default = nil,
	Multi = false,
	Callback = function(arg)
		ExplodeItem = arg
	end,
})

LoopExploder = false

CTR:AddToggle("LoopExplode", {
	Text = "Loop Explode",
	Default = false,
	Callback = function(arg)
		if arg then
			LoopExploder = true

			while LoopExploder and RunService.RenderStepped:Wait() do
				if char then
					local humanoidRootPart = char:WaitForChild("HumanoidRootPart", 1)

					if humanoidRootPart then
						local v27 = GetFirstTarget()

						if v27 and v27.Character then
							local humanoidRootPart2 = v27.Character:WaitForChild("HumanoidRootPart", 1)
							local humanoid = v27.Character:WaitForChild("Humanoid", 1)

							if humanoidRootPart2 and humanoid and humanoid.Health > 0 then
								for _, v28 in toysFolder:GetChildren() do
									if v28.Name == "BombMissile" or v28.Name == "BombDarkMatter" or v28.Name == "BombBalloon" or v28.Name == "FireworkMissile" or v28.Name == "PresentSmall" or v28.Name == "PresentBig" then
										DestroyT(v28)
									end
								end

								while true do
									RunService.RenderStepped:Wait()
									if not (LocalPlayer.CanSpawnToy.Value == true or arg == false) then
										continue
									end
									break
								end

								SpawnToy(ExplodeItem, humanoidRootPart.CFrame * CFrame.new(0, 10, 20))
								local v28, v29 = GetPlot()
								local v30

								if v28 and v29 then
									v30 = v29:WaitForChild(ExplodeItem, 1)
								else
									v30 = toysFolder:WaitForChild(ExplodeItem, 1)
								end

								if v30 and ExplodeItem == "BombMissile" then
									local part3 = v30:WaitForChild("Part", 1)

									if part3 then
										local now2 = tick()

										while true do
											SetNetworkOwner:FireServer(part3, part3.CFrame)
											RunService.RenderStepped:Wait()
											local partOwner = part3:FindFirstChild("PartOwner")

											if partOwner then
												local name = LocalPlayer.Name
												partOwner = part3:FindFirstChild("PartOwner").Value == name
											end

											if not (partOwner or tick() - now2 > 1 or not v30 or not part3 or not humanoidRootPart) then
												continue
											end
											break
										end

										local partOwner = v30 and part3 and part3:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = part3:FindFirstChild("PartOwner").Value == name
										end

										humanoidRootPart = partOwner and humanoidRootPart and humanoidRootPart2 and
										humanoid and humanoid.Health > 0

										if humanoidRootPart then
											ReplicatedStorage.BombEvents.BombExplode:FireServer(unpack({
												{
													Hitbox = v30:FindFirstChild("PartHitDetector"),
													Model = v30,
													PositionPart = humanoidRootPart2,
												},
												humanoidRootPart2.Position,
											}))
										end
									end
								elseif v30 and ExplodeItem == "FireworkMissile" then
									local part3 = v30:WaitForChild("Part", 1)

									if part3 then
										local now2 = tick()

										while true do
											SetNetworkOwner:FireServer(part3, part3.CFrame)
											RunService.RenderStepped:Wait()
											local partOwner = part3:FindFirstChild("PartOwner")

											if partOwner then
												local name = LocalPlayer.Name
												partOwner = part3:FindFirstChild("PartOwner").Value == name
											end

											if not (partOwner or tick() - now2 > 1 or not v30 or not part3 or not humanoidRootPart) then
												continue
											end
											break
										end

										local partOwner = v30 and part3 and part3:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = part3:FindFirstChild("PartOwner").Value == name
										end

										humanoidRootPart = partOwner and humanoidRootPart and humanoidRootPart2 and
										humanoid and humanoid.Health > 0

										if humanoidRootPart then
											ReplicatedStorage.BombEvents.BombExplode:FireServer(unpack({
												{
													Hitbox = v30:FindFirstChild("PartHitDetector"),
													Model = v30,
													PositionPart = humanoidRootPart2,
												},
												humanoidRootPart2.Position,
											}))
										end
									end
								elseif v30 and ExplodeItem == "BombBalloon" then
									local balloon = v30:WaitForChild("Balloon", 1)

									if balloon then
										local now2 = tick()

										while true do
											SetNetworkOwner:FireServer(balloon, balloon.CFrame)
											RunService.RenderStepped:Wait()
											local partOwner = balloon:FindFirstChild("PartOwner")

											if partOwner then
												local name = LocalPlayer.Name
												partOwner = balloon:FindFirstChild("PartOwner").Value == name
											end

											if not (partOwner or tick() - now2 > 1 or not v30 or not balloon or not humanoidRootPart) then
												continue
											end
											break
										end

										local partOwner = v30 and balloon and balloon:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = balloon:FindFirstChild("PartOwner").Value == name
										end

										humanoidRootPart = partOwner and humanoidRootPart and humanoidRootPart2 and
										humanoid

										if humanoidRootPart and humanoid.Health > 0 then
											ReplicatedStorage.BombEvents.BombExplode:FireServer(unpack({
												{ Hitbox = balloon, Model = v30, PositionPart = humanoidRootPart2 },
												humanoidRootPart2.Position,
											}))
										end
									end
								elseif v30 and ExplodeItem == "BombDarkMatter" then
									local spinner = v30:WaitForChild("Spinner", 1)

									if spinner then
										local now2 = tick()

										while true do
											SetNetworkOwner:FireServer(spinner, spinner.CFrame)
											RunService.RenderStepped:Wait()
											local partOwner = spinner:FindFirstChild("PartOwner")

											if partOwner then
												local name = LocalPlayer.Name
												partOwner = spinner:FindFirstChild("PartOwner").Value == name
											end

											if not (partOwner or tick() - now2 > 1 or not v30 or not spinner or not humanoidRootPart) then
												continue
											end
											break
										end

										local partOwner = v30 and spinner and spinner:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = spinner:FindFirstChild("PartOwner").Value == name
										end

										if partOwner and humanoidRootPart and humanoidRootPart2 and humanoid and humanoid.Health > 0 then
											ReplicatedStorage.BombEvents.BombExplode:FireServer(unpack({
												{
													Hitbox = v30:FindFirstChild("PartHitDetector"),
													Model = v30,
													PositionPart = humanoidRootPart2,
												},
												humanoidRootPart2.Position,
											}))
										end
									end
								elseif v30 and ExplodeItem == "PresentBig" then
									local box = v30:WaitForChild("Box", 1)

									if box then
										local now2 = tick()

										while true do
											SetNetworkOwner:FireServer(box, box.CFrame)
											RunService.RenderStepped:Wait()
											local partOwner = box:FindFirstChild("PartOwner")

											if partOwner then
												local name = LocalPlayer.Name
												partOwner = box:FindFirstChild("PartOwner").Value == name
											end

											if not (partOwner or tick() - now2 > 1 or not v30 or not box or not humanoidRootPart) then
												continue
											end
											break
										end

										local partOwner = v30 and box and box:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = box:FindFirstChild("PartOwner").Value == name
										end

										humanoidRootPart = partOwner and humanoidRootPart

										if humanoidRootPart and humanoidRootPart2 and humanoid and humanoid.Health > 0 then
											ReplicatedStorage.BombEvents.BombExplode:FireServer(unpack({
												{ Hitbox = box, Model = v30, PositionPart = humanoidRootPart2 },
												humanoidRootPart2.Position,
											}))
										end
									end
								elseif v30 and ExplodeItem == "PresentSmall" then
									local box = v30:WaitForChild("Box", 1)

									if box then
										local now2 = tick()

										while true do
											SetNetworkOwner:FireServer(box, box.CFrame)
											RunService.RenderStepped:Wait()
											local partOwner = box:FindFirstChild("PartOwner")

											if partOwner then
												local name = LocalPlayer.Name
												partOwner = box:FindFirstChild("PartOwner").Value == name
											end

											if not (partOwner or tick() - now2 > 1 or not v30 or not box or not humanoidRootPart) then
												continue
											end
											break
										end

										local partOwner = v30 and box and box:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = box:FindFirstChild("PartOwner").Value == name
										end

										if partOwner and humanoidRootPart and humanoidRootPart2 and humanoid and humanoid.Health > 0 then
											ReplicatedStorage.BombEvents.BombExplode:FireServer(unpack({
												{ Hitbox = box, Model = v30, PositionPart = humanoidRootPart2 },
												humanoidRootPart2.Position,
											}))
										end
									end
								end
							end
						end
					end
				end
			end
		else
			LoopExploder = false
		end
	end,
})

CTR:AddToggle("LoopSnowball", {
	Text = "Loop Snowball",
	Default = false,
	Callback = function(arg)
		if arg then
			Lsnowball = true

			while Lsnowball and RunService.RenderStepped:Wait() do
				local v27 = GetFirstTarget()

				if v27 and v27.Character then
					local humanoidRootPart = char:WaitForChild("HumanoidRootPart", 1)
					local humanoidRootPart2 = v27.Character:WaitForChild("HumanoidRootPart", 1)
					local humanoid = v27.Character:WaitForChild("Humanoid", 1)

					if humanoidRootPart and humanoidRootPart2 and humanoid and humanoid.Health > 0 then
						for _, v28 in toysFolder:GetChildren() do
							if v28.Name == "BallSnowball" then
								v28.Name = "иди нахуй отсюда"
								DestroyT(v28)
							end
						end

						while true do
							RunService.RenderStepped:Wait()
							if not (LocalPlayer.CanSpawnToy.Value == true or arg == false) then
								continue
							end
							break
						end

						SpawnToy("BallSnowball", CFrame.new(humanoidRootPart.Position + Vector3.new(-3, 10, 15)))
						local v28, v29 = GetPlot()
						local ballSnowball

						if v28 and v29 then
							ballSnowball = v29:WaitForChild("BallSnowball", 1)
						else
							ballSnowball = toysFolder:WaitForChild("BallSnowball", 1)
						end

						if ballSnowball then
							local soundPart = ballSnowball:WaitForChild("SoundPart", 1)

							if soundPart then
								sW = tick()

								while true do
									SetNetworkOwner:FireServer(soundPart, soundPart.CFrame)
									RunService.RenderStepped:Wait()
									local partOwner = soundPart:FindFirstChild("PartOwner")

									if partOwner then
										local name = LocalPlayer.Name
										partOwner = soundPart:FindFirstChild("PartOwner").Value == name
									end

									partOwner = partOwner or arg == false

									if not partOwner then
										local v30 = sW
										partOwner = tick() - v30 > 0.5
									end

									if not (partOwner or not ballSnowball or not soundPart) then
										continue
									end
									break
								end

								if humanoidRootPart2 and humanoid and humanoid.Health >= 0 and humanoidRootPart then
									Instance.new("BodyVelocity", soundPart).Velocity = Vector3.new(0, 250, 0)
								end

								sW = tick()
								local v30

								repeat
									task.wait(0.01)
									firetouchinterest(soundPart, humanoidRootPart2, 0)
									v30 = sW
								until tick() - v30 > 0.5
							end
						end
					end
				end
			end
		else
			Lsnowball = false

			for _, v27 in toysFolder:GetChildren() do
				if v27.Name == "BallSnowball" then
					DestroyT(v27)
				end
			end
		end
	end,
})

RagdollKillEnabled = false

CTR:AddToggle("RagdollKillToggle", {
	Text = "Ragdoll Kill [Pencil]",
	Default = false,
	Callback = function(arg)
		RagdollKillEnabled = arg
		local v27

		while RagdollKillEnabled and task.wait() do
			local v28 = GetFirstTarget()

			if char and v28 and v28.Character then
				local v29, v30, v31 = GetHRH(char)
				local v32, v33, v34 = GetHRH(v28.Character)

				if v29 and v30 and v31 and v31.Health > 0 and v32 and v33 and v34 and v34.Health > 0 then
					for _, v35 in toysFolder:GetChildren() do
						if v35.Name == "ToolPencil" or v35.Name == "RagdollKill" then
							v35.Name = "иди нахуй отсюда"
							DestroyT(v35)
						end
					end

					local ToolPencil = NewToy("ToolPencil", v30.CFrame * CFrame.new(0, 10, 20))

					if ToolPencil then
						ToolPencil.Name = "RagdollKill"
						local soundPart = ToolPencil:WaitForChild("SoundPart", 1)
						local stickyPart = ToolPencil:WaitForChild("StickyPart", 1)

						if soundPart and stickyPart then
							while true do
								task.wait()
								v27 = Ownerboat(soundPart)
								if not (not RagdollKillEnabled or not v30 or not soundPart or (v30.Position - soundPart.Position).Magnitude > 20 or v27) then
									continue
								end
								break
							end

							if v27 and stickyPart and v32 and v34 and v34.Health > 0 then
								while true do
									task.wait()
									StickyPartEvent:FireServer(stickyPart, v32, CFrame.new(0, (0 / 0), 0))
									local flag7 = not RagdollKillEnabled or not stickyPart or not v32 or not v34 or
									v34.Health <= 0

									if not flag7 then
										flag7 = stickyPart and v32 and stickyPart:FindFirstChild("StickyWeld") and
										stickyPart.StickyWeld.Part1 and stickyPart.StickyWeld.Part1 == v32
									end

									if not (flag7 or not v27) then
										continue
									end
									break
								end

								if stickyPart and v32 and stickyPart:FindFirstChild("StickyWeld") and stickyPart.StickyWeld.Part1 and stickyPart.StickyWeld.Part1 == v32 then
									while RagdollKillEnabled and v34 and v34.Health > 0 and stickyPart and v32 and stickyPart:FindFirstChild("StickyWeld") and stickyPart.StickyWeld.Part1 and stickyPart.StickyWeld.Part1 == v32 do
										task.wait()
									end

									DestroyT(ToolPencil)
								else
									DestroyT(ToolPencil)
								end
							else
								DestroyT(ToolPencil)
							end
						else
							DestroyT(ToolPencil)
						end
					end
				end
			end
		end
	end,
})

StealAntiKickEnabled = false

TRT:AddToggle("RemoveTargetToys", {
	Text = "Steal Anti Kick",
	Default = false,
	Callback = function(arg)
		StealAntiKickEnabled = arg

		while StealAntiKickEnabled and task.wait() do
			for _, v27 in AllTargets, nil, nil do
				local v28, v29, v30 = GetHRH(char)
				local v31 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

				if v28 and v30 and v30.Health > 0 and v31 then
					for _, v32 in v31:GetChildren() do
						if v32:FindFirstChild("StickyPart") and v32.StickyPart:FindFirstChild("StickyWeld") then
							if not v32.StickyPart.StickyWeld.Part1 or v32.StickyPart.StickyWeld.Part1.Parent and v32.StickyPart.StickyWeld.Part1.Parent ~= char then
								for _, v33 in v32:GetChildren() do
									if (v33:IsA("Part") or v33:IsA("MeshPart")) and v33.CanQuery and (v33.Position - v28.Position).Magnitude <= 25 then
										if Ownerboat(v33) and v33.Parent and v33.Parent:FindFirstChild("StickyPart") then
											local cframe = CFrame.new
											StickyPartEvent:FireServer(v33.Parent:FindFirstChild("StickyPart"), v28,
												cframe(0, -4.5, 0))
											task.wait(0.1)
											break
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end,
})

TRT:AddDivider()
StealHodlablesMode = "Hold"
StealHodlablesEnabled = false

TRT:AddDropdown("StealHodlablesModeDropdown", {
	Text = "Steal Mode",
	Values = { "Hold", "Break", "Delete" },
	ValueImages = { Hold = "hand-grab", Break = "bone-fracture", Delete = "trash-2" },
	Default = "Hold",
	Multi = false,
	Callback = function(arg)
		StealMode = arg
	end,
})

TRT:AddToggle("StealHodlablesToggle", {
	Text = "Steal Holdables",
	Default = false,
	Callback = function(arg)
		StealHodlablesEnabled = arg

		while StealHodlablesEnabled and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					for _, v30 in AllTargets, nil, nil do
						if workspace:FindFirstChild(v30.Name .. "SpawnedInToys") then
							local v31 = workspace:FindFirstChild(v30.Name .. "SpawnedInToys")

							for _, v32 in v31:GetChildren() do
								if v32:FindFirstChild("HoldPart") and v32.Name ~= "Broken" then
									local holdPart = v32:FindFirstChild("HoldPart")
									local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")
									local dropItemRemoteFunction = holdPart:FindFirstChild("DropItemRemoteFunction")
									local rigidConstraint = holdPart:FindFirstChild("RigidConstraint")

									if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
										local now2 = tick()

										while true do
											task.wait()
											holdItemRemoteFunction:InvokeServer(v32, char)
											if not (not char or not char.Parent or not v29 or v29.Health <= 0 or not v32 or not v32.Parent or rigidConstraint.Attachment1 or tick() - now2 > 1) then
												continue
											end
											break
										end

										if rigidConstraint and rigidConstraint.Parent and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
											if StealMode == "Hold" then
												v32.Name = "Broken"
											elseif StealMode == "Break" then
												v32.Name = "Broken"

												pcall(function()
													dropItemRemoteFunction:InvokeServer(v32)
												end)
											elseif StealMode == "Delete" then
												dropItemRemoteFunction:InvokeServer(v32, CFrame.new(0, -5000, 0),
													Vector3.zero)
												task.wait(0.1)
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
	end,
})

TRT:AddDivider()

TRT:AddToggle("AutoBreakGucciToggle", {
	Text = "Break Gucci",
	Default = false,
	Callback = function(arg)
		AutoBreakGucci = arg
	end,
})

PSP:AddDropdown("SelectPosePlayer", {
	Text = "Select Player",
	Values = UpdateTable(),
	Default = nil,
	Multi = false,
	AllowNull = true,
	MaxVisibleDropdownItems = 35,
	Callback = function(arg)
		local match = arg:match("%[(.-)%]")

		if match then
			selectedPlayerForPoses = P:FindFirstChild(match)
		end
	end,
})

local tbl6 = {
	HeadRotXSlider,
	HeadRotYSlider,
	HeadRotZSlider,
	TorsoRotXSlider,
	TorsoRotYSlider,
	TorsoRotZSlider,
	LARotXSlider,
	LARotYSlider,
	LARotZSlider,
	RARotXSlider,
	RARotYSlider,
	RARotZSlider,
	LLRotXSlider,
	LLRotYSlider,
	LLRotZSlider,
	RLRotXSlider,
	RLRotYSlider,
	RLRotZSlider,
	HeadOffsetXSlider,
	HeadOffsetYSlider,
	HeadOffsetZSlider,
	TorsoOffsetXSlider,
	TorsoOffsetYSlider,
	TorsoOffsetZSlider,
	LAOffsetXSlider,
	LAOffsetYSlider,
	LAOffsetZSlider,
	RAOffsetXSlider,
	RAOffsetYSlider,
	RAOffsetZSlider,
	LLOffsetXSlider,
	LLOffsetYSlider,
	LLOffsetZSlider,
	RLOffsetXSlider,
	RLOffsetYSlider,
	RLOffsetZSlider,
}

local str4 = "HeadSit"
local n13 = 0
local n14 = 1.5
local n15 = 0
local n16 = 0
local n17 = 10
local n18 = 0
local n19 = -1.5
local n20 = 0
local n21 = 0
local n22 = 1.5
local n23 = 0
local n24 = 0
local n25 = -0.5
local n26 = -2
local n27 = 0
local n28 = 0.5
local n29 = -2
local n30 = 0
local n31 = 0
local n32 = 0
local n33 = 0
local n34 = 0
local n35 = 0
local n36 = 0
local n37 = 0
local n38 = 0
local n39 = 0
local n40 = 0
local n41 = 0
local n42 = 0
local n43 = 0
local n44 = 0
local n45 = 0
local n46 = 0
local n47 = 0
local n48 = 0
local foodPlate = nil
local character = nil
local flag7 = true
local flag8 = false

PSP:AddDropdown("Poses", {
	Text = "Poses",
	Values = { "HeadSit", "Penis", "Blowjob" },
	Default = "HeadSit",
	Multi = false,
	Callback = function(arg)
		str4 = arg

		if str4 == "HeadSit" then
			tbl6.HeadOffsetXSlider:SetValue(0)
			tbl6.HeadOffsetYSlider:SetValue(1.5)
			tbl6.HeadOffsetZSlider:SetValue(-0.2)
			tbl6.TorsoOffsetXSlider:SetValue(0)
			tbl6.TorsoOffsetYSlider:SetValue(2)
			tbl6.TorsoOffsetZSlider:SetValue(0.75)
			tbl6.LAOffsetXSlider:SetValue(-1)
			tbl6.LAOffsetYSlider:SetValue(0.4)
			tbl6.LAOffsetZSlider:SetValue(-0.75)
			tbl6.RAOffsetXSlider:SetValue(1)
			tbl6.RAOffsetYSlider:SetValue(0.3)
			tbl6.RAOffsetZSlider:SetValue(-0.75)
			tbl6.LLOffsetXSlider:SetValue(-0.8)
			tbl6.LLOffsetYSlider:SetValue(-1.2)
			tbl6.LLOffsetZSlider:SetValue(-0.8)
			tbl6.RLOffsetXSlider:SetValue(1)
			tbl6.RLOffsetYSlider:SetValue(-1.2)
			tbl6.RLOffsetZSlider:SetValue(-0.85)
			tbl6.HeadRotXSlider:SetValue(-17)
			tbl6.HeadRotYSlider:SetValue(0)
			tbl6.HeadRotZSlider:SetValue(0)
			tbl6.TorsoRotXSlider:SetValue(0)
			tbl6.TorsoRotYSlider:SetValue(0)
			tbl6.TorsoRotZSlider:SetValue(0)
			tbl6.LARotXSlider:SetValue(69)
			tbl6.LARotYSlider:SetValue(-25)
			tbl6.LARotZSlider:SetValue(34)
			tbl6.RARotXSlider:SetValue(45)
			tbl6.RARotYSlider:SetValue(46)
			tbl6.RARotZSlider:SetValue(-23)
			tbl6.LLRotXSlider:SetValue(-99)
			tbl6.LLRotYSlider:SetValue(180)
			tbl6.LLRotZSlider:SetValue(157)
			tbl6.RLRotXSlider:SetValue(-99)
			tbl6.RLRotYSlider:SetValue(-180)
			tbl6.RLRotZSlider:SetValue(-153)
		elseif str4 == "Penis" then
			tbl6.TorsoOffsetXSlider:SetValue(0)
			tbl6.TorsoOffsetYSlider:SetValue(-0.8)
			tbl6.TorsoOffsetZSlider:SetValue(-6.5)
			tbl6.TorsoRotXSlider:SetValue(-90)
			tbl6.TorsoRotYSlider:SetValue(0)
			tbl6.TorsoRotZSlider:SetValue(0)
			tbl6.HeadOffsetXSlider:SetValue(0)
			tbl6.HeadOffsetYSlider:SetValue(1.5)
			tbl6.HeadOffsetZSlider:SetValue(0)
			tbl6.HeadRotXSlider:SetValue(90)
			tbl6.HeadRotYSlider:SetValue(0)
			tbl6.HeadRotZSlider:SetValue(0)
			tbl6.LAOffsetXSlider:SetValue(0)
			tbl6.LAOffsetYSlider:SetValue(-2)
			tbl6.LAOffsetZSlider:SetValue(0)
			tbl6.RAOffsetXSlider:SetValue(0)
			tbl6.RAOffsetYSlider:SetValue(-4)
			tbl6.RAOffsetZSlider:SetValue(0)
			tbl6.LLOffsetXSlider:SetValue(-1)
			tbl6.LLOffsetYSlider:SetValue(-5.5)
			tbl6.LLOffsetZSlider:SetValue(0)
			tbl6.LLRotXSlider:SetValue(0)
			tbl6.LLRotYSlider:SetValue(0)
			tbl6.LLRotZSlider:SetValue(-90)
			tbl6.RLOffsetXSlider:SetValue(1)
			tbl6.RLOffsetYSlider:SetValue(-5.5)
			tbl6.RLOffsetZSlider:SetValue(0)
			tbl6.RLRotXSlider:SetValue(0)
			tbl6.RLRotYSlider:SetValue(0)
			tbl6.RLRotZSlider:SetValue(90)
			tbl6.LARotXSlider:SetValue(0)
			tbl6.LARotYSlider:SetValue(0)
			tbl6.LARotZSlider:SetValue(0)
			tbl6.RARotXSlider:SetValue(0)
			tbl6.RARotYSlider:SetValue(0)
			tbl6.RARotZSlider:SetValue(0)
		elseif str4 == "Blowjob" then
			tbl6.HeadRotXSlider:SetValue(-1)
			tbl6.HeadRotYSlider:SetValue(0)
			tbl6.HeadRotZSlider:SetValue(9)
			tbl6.TorsoRotXSlider:SetValue(22)
			tbl6.TorsoRotYSlider:SetValue(180)
			tbl6.TorsoRotZSlider:SetValue(0)
			tbl6.LARotXSlider:SetValue(137)
			tbl6.LARotYSlider:SetValue(-21)
			tbl6.LARotZSlider:SetValue(20)
			tbl6.RARotXSlider:SetValue(137)
			tbl6.RARotYSlider:SetValue(3)
			tbl6.RARotZSlider:SetValue(-20)
			tbl6.LLRotXSlider:SetValue(-72)
			tbl6.LLRotYSlider:SetValue(17)
			tbl6.LLRotZSlider:SetValue(-18)
			tbl6.RLRotXSlider:SetValue(-69)
			tbl6.RLRotYSlider:SetValue(-35)
			tbl6.RLRotZSlider:SetValue(20)
			tbl6.HeadOffsetXSlider:SetValue(0)
			tbl6.HeadOffsetYSlider:SetValue(1.5)
			tbl6.HeadOffsetZSlider:SetValue(0)
			tbl6.TorsoOffsetXSlider:SetValue(0)
			tbl6.TorsoOffsetYSlider:SetValue(-1.9)
			tbl6.TorsoOffsetZSlider:SetValue(-2)
			tbl6.LAOffsetXSlider:SetValue(-1.3)
			tbl6.LAOffsetYSlider:SetValue(1.2)
			tbl6.LAOffsetZSlider:SetValue(-0.5)
			tbl6.RAOffsetXSlider:SetValue(1.3)
			tbl6.RAOffsetYSlider:SetValue(1.1)
			tbl6.RAOffsetZSlider:SetValue(-0.4)
			tbl6.LLOffsetXSlider:SetValue(-0.8)
			tbl6.LLOffsetYSlider:SetValue(-1.3)
			tbl6.LLOffsetZSlider:SetValue(0.8)
			tbl6.RLOffsetXSlider:SetValue(0.8)
			tbl6.RLOffsetYSlider:SetValue(-1.2)
			tbl6.RLOffsetZSlider:SetValue(0.8)
		end
	end,
})

PSP:AddCheckbox("CloneOption", {
	Text = "Use Clone",
	Default = false,
	Callback = function(arg)
		flag8 = arg
	end,
})

PSP:AddToggle("LoopPosePlayer", {
	Text = "Apply Pose",
	Default = false,
	Callback = function(arg)
		if arg then
			flag7 = true

			while flag7 and RunService.RenderStepped:Wait() do
				local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
				local humanoid = char:FindFirstChild("Humanoid")

				if not flag8 then
					PlayerForPosing = selectedPlayerForPoses

					if PlayerForPosing then
						character = PlayerForPosing.Character
					end
				elseif toysFolder:FindFirstChild("YouDecoy") and flag8 then
					character = toysFolder:FindFirstChild("YouDecoy")
				else
					Library:Notify({ Title = "Nil'e", Description = "Spawn Clone", Time = 5, BigIcon = "triangle-alert" })
					Toggles.LoopPosePlayer:SetValue(false)
				end

				if character and humanoidRootPart and humanoid and humanoid.Health > 0 and flag7 then
					if not toysFolder:FindFirstChild("RagdollForPoses") then
						for _, v27 in toysFolder:GetChildren() do
							if v27.Name == "FoodPlate" then
								v27.Name = "иди нахуй отсюда"
								DestroyT(v27)
							end
						end

						while true do
							RunService.RenderStepped:Wait()
							if not (LocalPlayer.CanSpawnToy.Value and not LocalPlayer.InPlot.Value) then
								continue
							end
							break
						end

						SpawnToy("FoodPlate", humanoidRootPart.CFrame * CFrame.new(0, 10, 20))
						foodPlate = toysFolder:WaitForChild("FoodPlate", 1)

						if foodPlate then
							local soundPart = foodPlate:WaitForChild("SoundPart", 1)

							if soundPart then
								while true do
									RunService.RenderStepped:Wait()
									SetNetworkOwner:FireServer(soundPart, soundPart.CFrame)
									local flag9 = not foodPlate or not soundPart
									local partOwner

									if flag9 then
										partOwner = flag9
									else
										partOwner = soundPart:FindFirstChild("PartOwner")

										if partOwner then
											local name = LocalPlayer.Name
											partOwner = soundPart:FindFirstChild("PartOwner").Value == name
										end
									end

									if not (partOwner or not humanoidRootPart or not humanoid or humanoid.Health <= 0 or not flag7) then
										continue
									end
									break
								end

								local v27 = foodPlate
								local partOwner

								if foodPlate then
									partOwner = soundPart
								else
									partOwner = v27
								end

								partOwner = partOwner and soundPart:FindFirstChild("PartOwner")

								if partOwner then
									local name = LocalPlayer.Name
									partOwner = soundPart:FindFirstChild("PartOwner").Value == name
								end

								if partOwner then
									soundPart.CanCollide = false
									soundPart.CanQuery = false
									soundPart.Transparency = 1
									soundPart.CFrame = CFrame.new(0, 670000, 0)
									local bodyPosition = Instance.new("BodyPosition", soundPart)
									bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyPosition.D = 100
									bodyPosition.Position = Vector3.new(0, 670000, 0)
									foodPlate.Name = "RagdollForPoses"

									task.spawn(function()
										local foodPlate2 = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy
										.Contents:WaitForChild("FoodPlate", 1)

										if foodPlate2 then
											foodPlate2.Name = "For Poses"
											foodPlate2.ViewItemButton.Season.Visible = true
											foodPlate2.ViewItemButton.Season.Text = "For Poses"
										end
									end)
								end
							end
						end
					else
						local partOwner = toysFolder:FindFirstChild("RagdollForPoses") and
						toysFolder:FindFirstChild("RagdollForPoses"):FindFirstChild("SoundPart") and
						toysFolder:FindFirstChild("RagdollForPoses"):FindFirstChild("SoundPart"):FindFirstChild(
						"PartOwner")

						if partOwner then
							local name = LocalPlayer.Name
							partOwner = toysFolder:FindFirstChild("RagdollForPoses"):FindFirstChild("SoundPart")
							:FindFirstChild("PartOwner").Value == name
						end

						if partOwner then
							local humanoidRootPart2 = character:FindFirstChild("HumanoidRootPart")
							local humanoid2 = character:FindFirstChild("Humanoid")
							local head = character:FindFirstChild("Head")

							if humanoidRootPart2 and humanoid2 and humanoid2.Health > 0 and head and flag7 then
								local cFrame = humanoidRootPart.CFrame

								if (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude > 25 and flag7 then
									while true do
										humanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 0, 1.5)
										humanoidRootPart.Velocity = Vector3.zero
										humanoidRootPart.RotVelocity = Vector3.zero
										RunService.RenderStepped:Wait()
										SetNetworkOwner:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)
										local flag9 = not character or not humanoidRootPart2 or not humanoid2 or
										humanoid2.Health <= 0 or not head

										if not flag9 then
											flag9 = head:FindFirstChild("PartOwner")

											if flag9 then
												local name = LocalPlayer.Name
												flag9 = head:FindFirstChild("PartOwner").Value == name
											end
										end

										if not (flag9 or not humanoidRootPart or not humanoid or humanoid.Health <= 0 or not flag7) then
											continue
										end
										break
									end

									if humanoidRootPart then
										humanoidRootPart.CFrame = cFrame
										humanoidRootPart.Velocity = Vector3.zero
										humanoidRootPart.RotVelocity = Vector3.zero
									end

									if flag7 and humanoidRootPart2 then
										humanoidRootPart2.CFrame = cFrame * CFrame.new(0, 0, -5)
										humanoidRootPart2.Velocity = Vector3.zero
										humanoidRootPart2.RotVelocity = Vector3.zero
									end
								end

								if flag7 and humanoidRootPart and humanoid and humanoid.Health > 0 and humanoidRootPart2 and humanoid2 and humanoid2.Health > 0 then
									local partOwner2 = flag7 and head and head:FindFirstChild("PartOwner")

									if partOwner2 then
										local name = LocalPlayer.Name
										partOwner2 = head:FindFirstChild("PartOwner").Value == name
									end

									if partOwner2 then
										task.spawn(function()
											pcall(function()
												if humanoid2:FindFirstChild("Ragdolled") and not humanoid2:FindFirstChild("Ragdolled").Value then
													task.wait(0.05)
													toysFolder:FindFirstChild("RagdollForPoses"):FindFirstChild("SoundPart").CFrame =
													character:FindFirstChild("Torso").CFrame * CFrame.new(0, 0.5, 0) *
													CFrame.Angles(1.5707963267948966, 0, 0)
													task.wait(0.1)
													toysFolder:FindFirstChild("RagdollForPoses"):FindFirstChild("SoundPart").CFrame =
													CFrame.new(0, 670000, 0)
												end
											end)

											pcall(function()
												humanoidRootPart2.CanCollide = false
												head.CanCollide = false
												character:FindFirstChild("Torso").CanCollide = false
												character:FindFirstChild("Left Arm"):FindFirstChild("RagdollLimbPart").CanCollide = false
												character:FindFirstChild("Right Arm"):FindFirstChild("RagdollLimbPart").CanCollide = false
												character:FindFirstChild("Left Leg"):FindFirstChild("RagdollLimbPart").CanCollide = false
												character:FindFirstChild("Right Leg"):FindFirstChild("RagdollLimbPart").CanCollide = false
											end)
										end)

										pcall(function()
											local cframe = CFrame.Angles
											local rad = math.rad
											character:FindFirstChild("Torso").CFrame = humanoidRootPart.CFrame *
											CFrame.new(n16, n17, n18) * cframe(math.rad(n34), math.rad(n35), rad(n36))
											local cframe2 = CFrame.Angles
											local rad2 = math.rad
											head.CFrame = character:FindFirstChild("Torso").CFrame *
											CFrame.new(n13, n14, n15) * cframe2(math.rad(n31), math.rad(n32), rad2(n33))
											local cframe3 = CFrame.Angles
											local rad3 = math.rad
											character:FindFirstChild("Left Arm").CFrame = character:FindFirstChild(
											"Torso").CFrame * CFrame.new(n19, n20, n21) *
											cframe3(math.rad(n37), math.rad(n38), rad3(n39))
											local cframe4 = CFrame.Angles
											local rad4 = math.rad
											character:FindFirstChild("Right Arm").CFrame = character:FindFirstChild(
											"Torso").CFrame * CFrame.new(n22, n23, n24) *
											cframe4(math.rad(n40), math.rad(n41), rad4(n42))
											local cframe5 = CFrame.Angles
											local rad5 = math.rad
											character:FindFirstChild("Left Leg").CFrame = character:FindFirstChild(
											"Torso").CFrame * CFrame.new(n25, n26, n27) *
											cframe5(math.rad(n43), math.rad(n44), rad5(n45))
											local cframe6 = CFrame.Angles
											local rad6 = math.rad
											character:FindFirstChild("Right Leg").CFrame = character:FindFirstChild(
											"Torso").CFrame * CFrame.new(n28, n29, n30) *
											cframe6(math.rad(n46), math.rad(n47), rad6(n48))
										end)

										pcall(function()
											humanoidRootPart2.Velocity = Vector3.zero
											humanoidRootPart2.Velocity = Vector3.zero
											character["Left Arm"].Velocity = Vector3.zero
											character["Right Arm"].Velocity = Vector3.zero
											character["Left Leg"].Velocity = Vector3.zero
											character["Right Leg"].Velocity = Vector3.zero
										end)
									else
										SetNetworkOwner:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)
									end
								end
							end
						else
							DestroyT(toysFolder:FindFirstChild("RagdollForPoses"))
						end
					end
				end
			end
		else
			flag7 = false

			if not flag8 then
				PlayerForPosing = selectedPlayerForPoses

				if PlayerForPosing then
					character = PlayerForPosing.Character
				end
			elseif toysFolder:FindFirstChild("YouDecoy") and flag8 then
				character = toysFolder:FindFirstChild("YouDecoy")
			end

			if character then
				task.wait(0.1)

				pcall(function()
					GrabEvents.DestroyGrabLine:FireServer(character:FindFirstChild("HumanoidRootPart"))
					character:FindFirstChild("HumanoidRootPart").CanCollide = true
				end)
			end
		end
	end,
})

PSS:AddDropdown("BodyPartsRedactor", {
	Text = "Body Parts",
	Values = { "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
	Default = "Head",
	Multi = false,
	Callback = function(arg)
		SelectedBodyPart = arg

		for _, v27 in tbl6, nil, nil do
			v27:SetVisible(false)
		end

		if SelectedBodyPart == "Head" then
			tbl6.HeadRotXSlider:SetVisible(true)
			tbl6.HeadRotYSlider:SetVisible(true)
			tbl6.HeadRotZSlider:SetVisible(true)
			tbl6.HeadOffsetXSlider:SetVisible(true)
			tbl6.HeadOffsetYSlider:SetVisible(true)
			tbl6.HeadOffsetZSlider:SetVisible(true)
		elseif SelectedBodyPart == "Torso" then
			tbl6.TorsoRotXSlider:SetVisible(true)
			tbl6.TorsoRotYSlider:SetVisible(true)
			tbl6.TorsoRotZSlider:SetVisible(true)
			tbl6.TorsoOffsetXSlider:SetVisible(true)
			tbl6.TorsoOffsetYSlider:SetVisible(true)
			tbl6.TorsoOffsetZSlider:SetVisible(true)
		elseif SelectedBodyPart == "Left Arm" then
			tbl6.LARotXSlider:SetVisible(true)
			tbl6.LARotYSlider:SetVisible(true)
			tbl6.LARotZSlider:SetVisible(true)
			tbl6.LAOffsetXSlider:SetVisible(true)
			tbl6.LAOffsetYSlider:SetVisible(true)
			tbl6.LAOffsetZSlider:SetVisible(true)
		elseif SelectedBodyPart == "Right Arm" then
			tbl6.RARotXSlider:SetVisible(true)
			tbl6.RARotYSlider:SetVisible(true)
			tbl6.RARotZSlider:SetVisible(true)
			tbl6.RAOffsetXSlider:SetVisible(true)
			tbl6.RAOffsetYSlider:SetVisible(true)
			tbl6.RAOffsetZSlider:SetVisible(true)
		elseif SelectedBodyPart == "Left Leg" then
			tbl6.LLRotXSlider:SetVisible(true)
			tbl6.LLRotYSlider:SetVisible(true)
			tbl6.LLRotZSlider:SetVisible(true)
			tbl6.LLOffsetXSlider:SetVisible(true)
			tbl6.LLOffsetYSlider:SetVisible(true)
			tbl6.LLOffsetZSlider:SetVisible(true)
		elseif SelectedBodyPart == "Right Leg" then
			tbl6.RLRotXSlider:SetVisible(true)
			tbl6.RLRotYSlider:SetVisible(true)
			tbl6.RLRotZSlider:SetVisible(true)
			tbl6.RLOffsetXSlider:SetVisible(true)
			tbl6.RLOffsetYSlider:SetVisible(true)
			tbl6.RLOffsetZSlider:SetVisible(true)
		end
	end,
})

tbl6.HeadRotXSlider = PSS:AddSlider("SliderHeadRotX", {
	Text = "Head Rot X",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		n31 = arg
	end,
})

tbl6.HeadRotYSlider = PSS:AddSlider("SliderHeadRotY", {
	Text = "Head Rot Y",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		n32 = arg
	end,
})

tbl6.HeadRotZSlider = PSS:AddSlider("SliderHeadRotZ", {
	Text = "Head Rot Z",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		n33 = arg
	end,
})

tbl6.TorsoRotXSlider = PSS:AddSlider("SliderTorsoRotX", {
	Text = "Torso Rot X",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n34 = arg
	end,
})

tbl6.TorsoRotYSlider = PSS:AddSlider("SliderTorsoRotY", {
	Text = "Torso Rot Y",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n35 = arg
	end,
})

tbl6.TorsoRotZSlider = PSS:AddSlider("SliderTorsoRotZ", {
	Text = "Torso Rot Z",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n36 = arg
	end,
})

tbl6.LARotXSlider = PSS:AddSlider("SliderLARotX", {
	Text = "Left Arm Rotation X",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n37 = arg
	end,
})

tbl6.LARotYSlider = PSS:AddSlider("SliderLARotY", {
	Text = "Left Arm Rotation Y",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n38 = arg
	end,
})

tbl6.LARotZSlider = PSS:AddSlider("SliderLARotZ", {
	Text = "Left Arm Rotation Z",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n39 = arg
	end,
})

tbl6.RARotXSlider = PSS:AddSlider("SliderRARotX", {
	Text = "Right Arm Rotation X",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n40 = arg
	end,
})

tbl6.RARotYSlider = PSS:AddSlider("SliderRARotY", {
	Text = "Right Arm Rotation Y",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n41 = arg
	end,
})

tbl6.RARotZSlider = PSS:AddSlider("SliderRARotZ", {
	Text = "Right Arm Rotation Z",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n42 = arg
	end,
})

tbl6.LLRotXSlider = PSS:AddSlider("SliderLLRotX", {
	Text = "Left Leg Rotation X",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n43 = arg
	end,
})

tbl6.LLRotYSlider = PSS:AddSlider("SliderLLRotY", {
	Text = "Left Leg Rotation Y",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n44 = arg
	end,
})

tbl6.LLRotZSlider = PSS:AddSlider("SliderLLRotZ", {
	Text = "Left Leg Rotation Z",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n45 = arg
	end,
})

tbl6.RLRotXSlider = PSS:AddSlider("SliderRLRotX", {
	Text = "Right Leg Rotation X",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n46 = arg
	end,
})

tbl6.RLRotYSlider = PSS:AddSlider("SliderRLRotY", {
	Text = "Right Leg Rotation Y",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n47 = arg
	end,
})

tbl6.RLRotZSlider = PSS:AddSlider("SliderRLRotZ", {
	Text = "Right Leg Rotation Z",
	Default = 0,
	Min = -180,
	Max = 180,
	Rounding = 0,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n48 = arg
	end,
})

tbl6.HeadOffsetXSlider = PSS:AddSlider("SliderHeadOffsetX", {
	Text = "Head Offset X",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Callback = function(arg)
		n13 = arg
	end,
})

tbl6.HeadOffsetYSlider = PSS:AddSlider("SliderHeadOffsetY", {
	Text = "Head Offset Y",
	Default = 1.5,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Callback = function(arg)
		n14 = arg
	end,
})

tbl6.HeadOffsetZSlider = PSS:AddSlider("SliderHeadOffsetZ", {
	Text = "Head Offset Z",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Callback = function(arg)
		n15 = arg
	end,
})

tbl6.TorsoOffsetXSlider = PSS:AddSlider("SliderTorsoOffsetX", {
	Text = "Torso Offset X",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n16 = arg
	end,
})

tbl6.TorsoOffsetYSlider = PSS:AddSlider("SliderTorsoOffsetY", {
	Text = "Torso Offset Y",
	Default = 10,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n17 = arg
	end,
})

tbl6.TorsoOffsetZSlider = PSS:AddSlider("SliderTorsoOffsetZ", {
	Text = "Torso Offset Z",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n18 = arg
	end,
})

tbl6.LAOffsetXSlider = PSS:AddSlider("SliderLAOffsetX", {
	Text = "Left Arm Offset X",
	Default = -1.5,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n19 = arg
	end,
})

tbl6.LAOffsetYSlider = PSS:AddSlider("SliderLAOffsetY", {
	Text = "Left Arm Offset Y",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n20 = arg
	end,
})

tbl6.LAOffsetZSlider = PSS:AddSlider("SliderLAOffsetZ", {
	Text = "Left Arm Offset Z",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n21 = arg
	end,
})

tbl6.RAOffsetXSlider = PSS:AddSlider("SliderRAOffsetX", {
	Text = "Right Arm Offset X",
	Default = 1.5,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n22 = arg
	end,
})

tbl6.RAOffsetYSlider = PSS:AddSlider("SliderRAOffsetY", {
	Text = "Right Arm Offset Y",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n23 = arg
	end,
})

tbl6.RAOffsetZSlider = PSS:AddSlider("SliderRAOffsetZ", {
	Text = "Right Arm Offset Z",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n24 = arg
	end,
})

tbl6.LLOffsetXSlider = PSS:AddSlider("SliderLLOffsetX", {
	Text = "Left Leg Offset X",
	Default = -0.5,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n25 = arg
	end,
})

tbl6.LLOffsetYSlider = PSS:AddSlider("SliderLLOffsetY", {
	Text = "Left Leg Offset Y",
	Default = -2,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n26 = arg
	end,
})

tbl6.LLOffsetZSlider = PSS:AddSlider("SliderLLOffsetZ", {
	Text = "Left Leg Offset Z",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n27 = arg
	end,
})

tbl6.RLOffsetXSlider = PSS:AddSlider("SliderRLOffsetX", {
	Text = "Right Leg Offset X",
	Default = 0.5,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n28 = arg
	end,
})

tbl6.RLOffsetYSlider = PSS:AddSlider("SliderRLOffsetY", {
	Text = "Right Leg Offset Y",
	Default = -2,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n29 = arg
	end,
})

tbl6.RLOffsetZSlider = PSS:AddSlider("SliderRLOffsetZ", {
	Text = "Right Leg Offset Z",
	Default = 0,
	Min = -10,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Visible = false,
	Callback = function(arg)
		n30 = arg
	end,
})

AllIndexTable = {
	"WalkSpeedSlider",
	"JumpPowerSlider",
	"FlySpeedSlider",
	"WalkSpeedToggle",
	"ToggleWalkSpeed",
	"JumpPowerToggle",
	"ToggleJumpPower",
	"FlyToggle",
	"ToggleFly",
	"InfiniteJump",
	"Noclip",
	"NoclipToysAndPlayersToggle",
	"ClearInventoryBind",
	"StrengthPower",
	"Strength",
	"InfiniteExtendToggle",
	"FartherReachToggle",
	"KillGrabToggle",
	"Strong",
	"RagdollGrab",
	"NoclipGrab",
	"SpamGrab",
	"AnchorGrab",
	"AnchorESPOutlineColorPicker",
	"AnchorESPFillColorPicker",
	"AutoRepairToggle",
	"AnchorBind",
	"RemoveAnchorBind",
	"UnAnchorAllBind",
	"LineColor1Picker",
	"LineColor2Picker",
	"LineColor3Picker",
	"LineColor4Picker",
	"LineColor5Picker",
	"LineColor6Picker",
	"LineColor7Picker",
	"LineColor8Picker",
	"LineColor9Picker",
	"LineSkin",
	"LineSound",
	"LineHand",
	"HandLine",
	"InvisibleLine",
	"SelectAnimationDropdown",
	"AnimationSpeedSlider",
	"ApplyAnimationToggle",
	"AntiGrabModeDropdown",
	"AntiGrabToggle",
	"ToggleAntiGrab",
	"AntiSnowBall",
	"AntiBlob",
	"AntiBurn",
	"AntiExplode",
	"AntiVoid",
	"AntiLag",
	"AutoAntiLag",
	"ToggleAntiLag",
	"AntiPoisonAndPaintAndSticky",
	"AntiStickyWD",
	"AutoDeleteLegs",
	"TypeOfGucciDropdown",
	"AutoGucci",
	"ToggleAutoGucci",
	"TypeOfCounterattackDropdown",
	"Counterattack",
	"AntiKickToggle",
	"AutoBreakPCLD",
	"AutoRespawn",
	"AutoLeaveToggle",
	"AntiKickItemDropdown",
	"StickToDropdown",
	"AntiKickRotationXInput",
	"AntiKickRotationYInput",
	"AntiKickRotationZInput",
	"AntiKickOffsetXInput",
	"AntiKickOffsetYInput",
	"AntiKickOffsetZInput",
	"AntiKickTransparencySlider",
	"AutoLeaveSensitivitySlider",
	"AntiInputLagItem",
	"AntiNetDelay",
	"AntiNetTransparencySlider",
	"AntiNetwork",
	"ToggleAntiNetwork",
	"LoopRagdoll",
	"ToggleLoopRagdoll",
	"selplot",
	"AntiLoopKill",
	"PlacesForTP",
	"LoopTp",
	"ToggleLoopTP",
	"TargetsDropdown",
	"STOM",
	"ViewTargetToggle",
	"ViewTargetBind",
	"TPToTargetBind",
	"WhitelistedPlayersDropdown",
	"SWOM",
	"WhitelistAntiGrabModeDropdown",
	"WhitelistAntiGrabToggle",
	"WhitelistAntiBurnToggle",
	"WLAntiKickToggle",
	"LoopTargetMethodDropdown",
	"TargetsHeightSlider",
	"LoopTargetToggle",
	"BlobmanLoopMethodDropdown",
	"AutoSitToggle",
	"BlobmanLoopTargetToggle",
	"RagdollTargetToggle",
	"RagdollKillToggle",
	"BananaRagdollToggle",
	"ExplodeType",
	"LoopExplode",
	"LoopSnowball",
	"RM",
	"RemoveTargetToys",
	"StealHodlablesModeDropdown",
	"StealHodlablesToggle",
	"AutoBreakGucciToggle",
	"SelectPosePlayer",
	"Poses",
	"CloneOption",
	"LoopPosePlayer",
	"ImportPoseJsonNameInput",
	"ImportPoseJsonInput",
	"EXportPoseJsonNameInput",
	"ImportJsonNameInput",
	"ImportJsonInput",
	"EXportJsonNameInput",
	"GAM",
	"GrabAura",
	"BananaAura",
	"ExtinguishAuraToggle",
	"TAM",
	"ToysAura",
	"BAM",
	"BlobmanAura",
	"AuraRadius",
	"AuraFlingModePower",
	"AuraHeavenModePower",
	"InputPlayersSpeedSlider",
	"InputPlayersPowerSlider",
	"BoomboxToggle",
	"AutoPlayToggle",
	"SoundLinkInput",
	"BoomboxVolumeSlider",
	"PESP",
	"PESPN",
	"PESPT",
	"PColor",
	"TColor",
	"WColor",
	"AntiKickESPToggle",
	"YourAntiKickFillColorPicker",
	"YourAntiKickOutlineColorPicker",
	"AntiKickFillColorPicker",
	"AntiKickOutlineColorPicker",
	"HouseAntiKickFillColorPicker",
	"HouseAntiKickOutlineColorPicker",
	"BlobmanESP",
	"YourBlobmanFillColorPicker",
	"YourBlobmanOutlineColorPicker",
	"BlobmanFillColorPicker",
	"BlobmanOutlineColorPicker",
	"HouseBlobmanFillColorPicker",
	"HouseBlobmanOutlineColorPicker",
	"PLCD",
	"PCLDColor",
	"PLCDTransparency",
	"PCLDSB",
	"SBColor",
	"NotifySound",
	"NotifyTime",
	"KickNotify",
	"BHH",
	"BlackholeHighlightColorPicker",
	"BHN",
	"BlackholeNameColorPicker",
	"BHT",
	"BlackholeTraceColorPicker",
	"HoleColorPicker",
	"BlackholeImageIdInput",
	"BlackholeImageColorPicker",
	"EnableCustomImageToggle",
	"Trd",
	"TrdBind",
	"DisableBlur",
	"FOV",
	"FPBP",
	"AmbienceSlider",
	"ExplosionsSlider",
	"ScreamsSlider",
	"Shaders",
	"WaterWalk",
	"HideMapPropsToggle",
	"Gravity",
	"GC",
	"LGC",
	"WGC",
	"RC",
	"SC",
	"DC",
	"SWC",
	"ResetMapColors",
	"KeyPicker1",
	"KeyPicker2",
	"KeyPicker3",
	"KeyPicker4",
	"KeyPicker5",
	"KeyPicker6",
	"KeyPicker7",
	"KeyPicker8",
	"KeyPicker9",
	"KeyPicker0",
	"Tpbind",
	"MenuKeybind",
	"jerkoffbind",
	"seatblobbind",
	"explodebind",
	"Zoom",
	"StruggleBind",
	"BringBind",
	"AllBindables",
	"AutoSlots",
	"PlotsToBreak",
	"BreakPlotAreaToggle",
	"LoopAllNoBlobmanMethods",
	"LoopAllNoBlobmanToggle",
	"LoopAllBlobmanMethods",
	"LoopAllBlobmanToggle",
	"StealAllModeDrop",
	"gI",
	"RAI",
	"BananaAll",
	"BananaAllESPColorPicker",
	"AutoExplode",
	"OvenESPColorPicker",
	"LinesAmount",
	"LagServer",
	"ToggleLineLag",
	"CrazyLineInterval",
	"CrazyLineToggle",
	"DetectLineLagToggle",
	"ShurikensCountSlider",
	"KeepShurikensToggle",
	"StickAllBind",
	"PacketMSG",
	"PacketStrength",
	"PacketsInterval",
	"AntiDetectToggle",
	"PacketLag",
	"TogglePacketLag",
	"PacketLagDetecctor",
	"ChatSoundsDropdown",
	"SoundSpamIntervalSlider",
	"SoundSpamToggle",
	"BreakMapPartsModeDropdown",
	"BreakMapPartsColor",
	"BreakMapObjectDropdown",
	"UICornerSlider",
	"EnableChatInput",
	"LockMouseToggle",
	"ToggleLockMouse",
	"BackgroundImageIdInput",
}

AuraRadius = 15
AuraFlingPower = 1
AuraHeavenPower = 1
InputPlayersSpeed = 16
InputPlayersPower = 24
SeletedGAM = "Fling"

PAU:AddDropdown("GAM", {
	Text = "Grab Aura Mode",
	Values = { "Network", "Fling", "Kill", "Send To The Heaven", "Void" },
	ValueImages = {
		Network = "globe",
		Fling = "expand",
		Kill = "skull",
		["Send To The Heaven"] = "cloud-upload",
		Void = "arrow-down-from-line",
	},
	Default = "Fling",
	Multi = false,
	Callback = function(arg)
		SeletedGAM = arg
	end,
})

GrabAuraEnabled = false

PAU:AddToggle("GrabAura", {
	Text = "Grab Aura",
	Default = false,
	Callback = function(arg)
		GrabAuraEnabled = arg

		while GrabAuraEnabled and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					for _, v30 in P:GetPlayers() do
						if v30 ~= LocalPlayer and not table.find(AllWhitelisted, v30) and v30.Character then
							local v31, v32, v33 = GetHRH(v30.Character)

							if v31 and v32 and v33 and v33.Health > 0 and (v28.Position - v31.Position).Magnitude <= AuraRadius then
								if SeletedGAM == "Network" then
									if v31:FindFirstChild("PartOwner") and v31.PartOwner.Value == LocalPlayer.Name then
										v33.Sit = false
										v33.WalkSpeed = InputPlayersSpeed
									else
										Ownerboat(v31)
									end
								elseif SeletedGAM == "Fling" then
									if Ownerboat(v31) then
										local v34 = AuraFlingPower
										v31.Velocity = (vector.normalize(v31.Position - v28.Position) + Vector3.new(0, 0.5, 0)) *
										v34
										UnGrab(v31)
									end
								elseif SeletedGAM == "Kill" then
									local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight

									if Ownerboat(v31) then
										local cframe = CFrame.new
										Teleport(v32, CFrame.new(0, -50000, 0), cframe(0, 0, 0))
										task.wait(0.1)
										workspace.FallenPartsDestroyHeight = -45000
										task.wait()
										workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
									end
								elseif SeletedGAM == "Send To The Heaven" then
									if Ownerboat(v31) then
										if not v31:FindFirstChild("Send To The Heaven") then
											local bodyVelocity = Instance.new("BodyVelocity", v31)
											bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
											bodyVelocity.Velocity = Vector3.new(0, 50, 0) * AuraHeavenPower
											bodyVelocity.Name = "Send To The Heaven"

											task.spawn(function()
												while v31 and v31.Parent and v31:FindFirstChild("PartOwner") and v31.PartOwner.Value == LocalPlayer.Name do
													task.wait()
												end

												if bodyVelocity then
													bodyVelocity:Destroy()
												end
											end)
										end
									end
								elseif SeletedGAM == "Void" then
									if Ownerboat(v31) then
										v31.Velocity = Vector3.new(0, -100000000, 0)
										UnGrab(v31)
									end
								end
							end
						end
					end
				end
			end
		end
	end,
})

PAU:AddDivider()
BananaAuraEnabled = false

PAU:AddToggle("BananaAura", {
	Text = "Banana Aura",
	Default = false,
	Callback = function(arg)
		BananaAuraEnabled = arg
		local v27

		while BananaAuraEnabled and task.wait() do
			if char then
				local v28, v29, v30 = GetHRH(char)

				if v29 and v30 and v30.Health > 0 then
					local FoodBanana = NewToy("FoodBanana", v29.CFrame * CFrame.new(0, 15, 20))

					if FoodBanana then
						FoodBanana.Name = "BananaAura"

						task.spawn(function()
							if FoodBanana.Parent == toysFolder then
								local foodBanana = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
								:WaitForChild("FoodBanana", 1)

								if foodBanana then
									foodBanana.Name = "BananaAura"
									foodBanana.ViewItemButton.Season.Visible = true
									foodBanana.ViewItemButton.Season.Text = "Banana Aura"
								end
							end
						end)

						local soundPart = FoodBanana:WaitForChild("SoundPart", 1)
						local holdPart = FoodBanana:WaitForChild("HoldPart", 1)

						if soundPart and holdPart then
							local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 1)
							local dropItemRemoteFunction = holdPart:WaitForChild("DropItemRemoteFunction", 1)
							local rigidConstraint = holdPart:WaitForChild("RigidConstraint", 1)

							if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
								local now2 = tick()

								while true do
									task.wait()
									holdItemRemoteFunction:InvokeServer(FoodBanana, char)
									if not (not BananaAuraEnabled or not v29 or not v30 or v30.Health <= 0 or not FoodBanana or not holdItemRemoteFunction or not rigidConstraint or rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name or tick() - now2 > 3) then
										continue
									end
									break
								end

								if rigidConstraint and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
									ReplicatedStorage.HoldEvents.Use:FireServer(FoodBanana)

									while true do
										task.wait()
										if not (not FoodBanana or not FoodBanana:FindFirstChild("EdiblePart")) then
											continue
										end
										break
									end

									pcall(function()
										dropItemRemoteFunction:InvokeServer(FoodBanana)
									end)

									local now3 = tick()

									while true do
										task.wait()
										v27 = Ownerboat(soundPart)
										if not (not BananaAuraEnabled or not soundPart or not v29 or not v30 or v30.Health <= 0 or (v29.Position - soundPart.Position).Magnitude > 20 or tick() - now3 > 3 or v27) then
											continue
										end
										break
									end

									if v27 then
										soundPart.CanCollide = false
										local highlight = Instance.new("Highlight", FoodBanana)
										highlight.FillColor = Color3.fromRGB(0, 0, 0)
										highlight.OutlineColor = Color3.new(255, 255, 255)
										local billboardGui = Instance.new("BillboardGui", FoodBanana)
										billboardGui.AlwaysOnTop = true
										billboardGui.Size = UDim2.new(5, 50, 1, 50)
										local textLabel = Instance.new("TextLabel", billboardGui)
										textLabel.Size = UDim2.new(1, 0, 1, 0)
										textLabel.TextColor3 = Color3.new(255, 255, 255)
										textLabel.TextStrokeTransparency = 0
										textLabel.BackgroundTransparency = 1
										textLabel.Size = UDim2.new(1, 0, 1, 0)
										textLabel.Text = "Banana Aura"
										UnGrab(soundPart)

										while true do
											task.wait()
											if not (not BananaAuraEnabled or not soundPart or not soundPart:FindFirstChild("PartOwner")) then
												continue
											end
											break
										end

										while BananaAuraEnabled and task.wait() and soundPart and soundPart.Parent and not soundPart:FindFirstChild("PartOwner") do
											Teleport(soundPart, workspace.SpawnLocation.CFrame,
												CFrame.new(math.random(-6767, 6767), 6767, math.random(-6767, 6767)))

											for _, v31 in P:GetPlayers() do
												if v31 ~= LocalPlayer and v31.Character and char then
													local v32, v33 = GetHRH(char)
													local v34, v35, v36 = GetHRH(v31.Character)

													if v33 and v35 and v36 and v36.Health > 0 and v36:FindFirstChild("Ragdolled") and not v36.Ragdolled.Value and (v31.Character:FindFirstChild("Left Leg") or v31.Character:FindFirstChild("Right Leg")) and (v33.Position - v35.Position).Magnitude <= AuraRadius then
														Teleport(soundPart, v35.CFrame, CFrame.new(0, -1.5, 0))
														task.wait(0.05)
														Teleport(soundPart, workspace.SpawnLocation.CFrame,
															CFrame.new(math.random(-6767, 6767), 6767,
																math.random(-6767, 6767)))
														task.wait()
													end
												end
											end
										end

										DestroyT(FoodBanana)
									else
										DestroyT(FoodBanana)
									end
								else
									DestroyT(FoodBanana)
								end
							else
								DestroyT(FoodBanana)
							end
						else
							DestroyT(FoodBanana)
						end
					end
				end
			end
		end
	end,
})

PAU:AddDivider()
ExtinguishAuraEnabled = false

PAU:AddToggle("ExtinguishAuraToggle", {
	Text = "Extinguish Aura",
	Default = false,
	Callback = function(arg)
		ExtinguishAuraEnabled = arg
		local v27

		while ExtinguishAuraEnabled and task.wait() do
			if char then
				local v28 = GetCharPart(char, "HumanoidRootPart")
				local v29 = GetCharPart(char, "Humanoid")

				if v28 and v29 then
					local FireExtinguisher = NewToy("FireExtinguisher", v28.CFrame * CFrame.new(0, 10, 20))

					if FireExtinguisher then
						FireExtinguisher.Name = "ExtinguishAura"
						local soundPart = FireExtinguisher:WaitForChild("SoundPart", 1)
						local extinguishPart = FireExtinguisher:WaitForChild("ExtinguishPart", 1)

						if soundPart and extinguishPart then
							while true do
								task.wait()
								v27 = Ownerboat(soundPart)
								if not (not ExtinguishAuraEnabled or not soundPart or v27) then
									continue
								end
								break
							end

							if v27 then
								task.spawn(function()
									if FireExtinguisher.Parent == toysFolder then
										local fireExtinguisher = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents
										.ToyDestroy.Contents:WaitForChild("FireExtinguisher", 1)

										if fireExtinguisher then
											fireExtinguisher.Name = "ExtinguishAura"
											fireExtinguisher.ViewItemButton.Season.Visible = true
											fireExtinguisher.ViewItemButton.Season.Text = "Extinguish Aura"
										end
									end
								end)

								for _, v30 in FireExtinguisher:GetChildren() do
									if v30:IsA("Part") or v30:IsA("MeshPart") then
										v30.Transparency = 1
										v30.CanCollide = false
										v30.CanQuery = false
									end
								end

								FireExtinguisher:FindFirstChild("Attachment0", true):Destroy()
								soundPart.CFrame = CFrame.new(67, 676767, 67)
								soundPart.Velocity = Vector3.zero
								soundPart.RotVelocity = Vector3.zero
								local bodyPosition = Instance.new("BodyPosition", soundPart)
								bodyPosition.Position = Vector3.new(67, 676767, 67)
								bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyPosition.D = 100

								while ExtinguishAuraEnabled and soundPart and soundPart.Parent and soundPart:FindFirstChild("PartOwner") and soundPart.PartOwner.Value == LocalPlayer.Name and task.wait(0.05) do
									if char then
										local v30 = GetCharPart(char, "HumanoidRootPart")

										if v30 and soundPart and extinguishPart then
											extinguishPart.Size = Vector3.new(AuraRadius, AuraRadius, AuraRadius)
											extinguishPart.CFrame = v30.CFrame
											extinguishPart.Velocity = Vector3.zero
											extinguishPart.RotVelocity = Vector3.zero
											task.wait(0.05)

											if extinguishPart then
												extinguishPart.CFrame = CFrame.new(67, 676767, 67)
												extinguishPart.Velocity = Vector3.zero
												extinguishPart.RotVelocity = Vector3.zero
											end
										end
									end
								end

								if toysFolder:FindFirstChild("ExtinguishAura") then
									DestroyT(toysFolder.ExtinguishAura)
								end
							else
								DestroyT(FireExtinguisher)
							end
						else
							DestroyT(FireExtinguisher)
						end
					end
				end
			end
		end
	end,
})

ToysAuraMode = "Fling"
Params = OverlapParams.new()
Params.FilterType = Enum.RaycastFilterType.Exclude

Params.FilterDescendantsInstances = {
	char,
	toysFolder,
	workspace.Map,
	workspace.Plots,
	workspace.PlotItems,
	workspace.Waypoints,
	workspace.Slots,
}

TAU:AddDropdown("TAM", {
	Text = "Toys Aura Mode",
	Values = { "Noclip", "Fling", "Send To The Heaven", "Void" },
	ValueImages = {
		Noclip = "circle-slash-2",
		Fling = "expand",
		["Send To The Heaven"] = "cloud-upload",
		Void = "arrow-down-from-line",
	},
	Default = "Fling",
	Multi = false,
	Callback = function(arg)
		ToysAuraMode = arg
	end,
})

TAU:AddToggle("ToysAura", {
	Text = "Toys Aura",
	Default = false,
	Callback = function(arg)
		if arg then
			ToysAura = true

			while ToysAura and task.wait(0.1) do
				local humanoidRootPart = char:WaitForChild("HumanoidRootPart", 1)

				if humanoidRootPart then
					for _, v27 in workspace:GetPartBoundsInRadius(humanoidRootPart.Position, AuraRadius * 2, Params), nil, nil do
						if not v27.Parent:FindFirstChildOfClass("Humanoid") then
							if ToysAuraMode == "Fling" then
								local partOwner = v27:FindFirstChild("PartOwner")
								local flag9

								if partOwner then
									local name = LocalPlayer.Name
									flag9 = v27:FindFirstChild("PartOwner").Value == name
								else
									flag9 = partOwner
								end

								if flag9 then
									local v28 = AuraFlingPower
									v27.Velocity = (vector.normalize(v27.Position - humanoidRootPart.Position) + Vector3.new(0, 0.5, 0)) *
									v28
								elseif v27.CanQuery then
									SetNetworkOwner:FireServer(v27, v27.CFrame)
								end
							elseif ToysAuraMode == "Noclip" then
								local partOwner = v27:FindFirstChild("PartOwner")

								if partOwner then
									local name = LocalPlayer.Name
									partOwner = v27:FindFirstChild("PartOwner").Value == name
								end

								if partOwner then
									for _, v28 in v27.Parent:GetChildren() do
										if v28:IsA("Part") or v28:IsA("MeshPart") then
											v28.CanCollide = false
										end
									end
								elseif v27.CanQuery then
									SetNetworkOwner:FireServer(v27, v27.CFrame)
								end
							elseif ToysAuraMode == "Send To The Heaven" then
								local partOwner = v27:FindFirstChild("PartOwner")

								if partOwner then
									local name = LocalPlayer.Name
									partOwner = v27:FindFirstChild("PartOwner").Value == name
								end

								if partOwner then
									if not v27:FindFirstChild("Send To The Heaven") then
										local bodyVelocity = Instance.new("BodyVelocity", v27)
										bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										bodyVelocity.Velocity = Vector3.new(0, 50, 0) * AuraHeavenPower
										bodyVelocity.Name = "Send To The Heaven"

										task.spawn(function()
											while ToysAura and v27 and v27.Parent do
												task.wait()
											end

											if bodyVelocity then
												bodyVelocity:Destroy()
											end
										end)
									end
								elseif v27.CanQuery then
									SetNetworkOwner:FireServer(v27, v27.CFrame)
								end
							elseif ToysAuraMode == "Void" then
								local partOwner = v27:FindFirstChild("PartOwner")

								if partOwner then
									local name = LocalPlayer.Name
									partOwner = v27:FindFirstChild("PartOwner").Value == name
								end

								if partOwner then
									for _, v28 in v27.Parent:GetChildren() do
										if v28:IsA("Part") or v28:IsA("MeshPart") then
											v28.CanCollide = false
										end
									end

									v27.Velocity = Vector3.new(0, -100000000, 0)
								elseif v27.CanQuery then
									SetNetworkOwner:FireServer(v27, v27.CFrame)
								end
							end
						end
					end
				end
			end
		else
			ToysAura = false
		end
	end,
})

BlobmanAuraMode = "Kick"
BlobAuraEnabled = false

BAU:AddDropdown("BAM", {
	Text = "Blobman Aura Mode",
	Values = { "Kick", "Network", "Break Gucci" },
	ValueImages = { Kick = "ban", Network = "globe", ["Break Gucci"] = "bone-fracture" },
	Default = "Kick",
	Multi = false,
	Callback = function(arg)
		BlobmanAuraMode = arg
	end,
})

BAU:AddToggle("BlobmanAura", {
	Text = "Blobman Aura",
	Default = false,
	Callback = function(arg)
		BlobAuraEnabled = arg

		while BlobAuraEnabled and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 and v29.SeatPart and v29.SeatPart.Parent and v29.SeatPart.Parent.Name == "CreatureBlobman" then
					local parent = v29.SeatPart.Parent
					local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
					local humanoidCreature = parent:FindFirstChild("HumanoidCreature")
					local blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")
					local leftDetector = parent:FindFirstChild("LeftDetector")

					if humanoidRootPart and humanoidCreature and blobmanSeatAndOwnerScript and leftDetector then
						local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
						local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
						local leftWeld = leftDetector:FindFirstChild("LeftWeld")

						if creatureGrab and creatureRelease and leftWeld then
							humanoidRootPart.Velocity = Vector3.new(humanoidRootPart.Velocity, 0,
								humanoidRootPart.Velocity)
							humanoidCreature:ChangeState(2)
							leftWeld.Enabled = false

							for _, v30 in P:GetPlayers() do
								if v30 ~= LocalPlayer and not table.find(AllWhitelisted, v30) and v30.Character and parent then
									local v31, v32, v33 = GetHRH(v30.Character)

									if v32 and v33 and v33.Health > 0 and (humanoidRootPart.Position - v32.Position).Magnitude <= AuraRadius then
										if BlobmanAuraMode == "Kick" then
											Ownerboat(v32)
											v32.Velocity = Vector3.new(0, 250, 0)
											UnGrab(v32)
											task.wait(0.05)
											creatureGrab:FireServer(leftDetector, v32, leftWeld)
											task.wait(0.1)
										elseif BlobmanAuraMode == "Network" then
											creatureGrab:FireServer(leftDetector, v32, leftWeld)
											task.wait()
											creatureRelease:FireServer(leftWeld)
											v33.WalkSpeed = InputPlayersSpeed
											v33.JumpPower = InputPlayersPower
											task.wait(0.1)
										elseif BlobmanAuraMode == "Break Gucci" then
											creatureGrab:FireServer(leftDetector, v32, leftWeld)
											creatureRelease:FireServer(leftWeld)
											v33.Sit = true
											task.wait(0.1)
											v33.Sit = false
										end
									end
								end
							end
						end
					end
				end
			end
		end
	end,
})

AUS:AddSlider("AuraRadius", {
	Text = "Aura Radius",
	Default = 15,
	Min = 5,
	Max = 25,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		AuraRadius = arg
	end,
})

AUS:AddDivider()

AUS:AddSlider("AuraFlingModePower", {
	Text = "Fling Mode Power",
	Default = 100,
	Min = 100,
	Max = 1000,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		AuraFlingPower = arg
	end,
})

AUS:AddSlider("AuraHeavenModePower", {
	Text = "Heaven Mode Power",
	Default = 1,
	Min = 1,
	Max = 10,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		AuraHeavenPower = arg
	end,
})

AUS:AddDivider()

AUS:AddSlider("InputPlayersSpeedSlider", {
	Text = "Players WalkSpeed",
	Default = 16,
	Min = 16,
	Max = 100,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		InputPlayersSpeed = arg
	end,
})

AUS:AddSlider("InputPlayersPowerSlider", {
	Text = "Players JumpPower",
	Default = 24,
	Min = 24,
	Max = 250,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		InputPlayersPower = arg
	end,
})

BoomboxGlobal = nil
BoomboxEnabled = false
AutoPlayEnabled = false
SoundLink = nil
SoundVolume = 1

SettingBoombox = function()
	if BoomboxGlobal then
		local speaker = BoomboxGlobal:FindFirstChild("Speaker")

		if speaker then
			local sound = speaker:FindFirstChildOfClass("Sound")

			if sound then
				sound.Volume = 0
			end

			if speaker:FindFirstChild("EZ") then
				local ez = speaker:FindFirstChild("EZ")
				ez.TimePosition = 0
				ez.Pitch = 1
				ez.Volume = SoundVolume
				ez.SoundId = SoundLink
			else
				local sound2 = Instance.new("Sound", speaker)
				sound2.Name = "EZ"
				sound2.Pitch = 1
				sound2.Volume = SoundVolume
				sound2.SoundId = SoundLink
				sound2.Playing = true
				sound2.Looped = true
			end
		end
	end
end

BoomboxFunc:AddToggle("BoomboxToggle", {
	Text = "Boombox",
	Default = false,
	Callback = function(arg)
		BoomboxEnabled = arg
		local v27

		while BoomboxEnabled and task.wait() do
			if char then
				local v28, v29, v30 = GetHRH(char)
				local torso = char:FindFirstChild("Torso")

				if torso and v30 and v30.Health > 0 then
					BoomboxGlobal = NewToy("Boombox", torso.CFrame * CFrame.new(0, 5, 20))

					if BoomboxGlobal then
						BoomboxGlobal.Name = "BackPack"
						local colorPart = BoomboxGlobal:WaitForChild("ColorPart", 1)

						if colorPart then
							local now2 = tick()

							while true do
								task.wait()
								v27 = Ownerboat(colorPart)
								if not (not BoomboxEnabled or not torso or not v30 or v30.Health <= 0 or not colorPart or not colorPart.Parent or (colorPart.Position - torso.Position).Magnitude > 20 or v27 or tick() - now2 > 3) then
									continue
								end
								break
							end

							if v27 then
								for _, v31 in BoomboxGlobal:GetChildren() do
									if v31:IsA("Part") or v31:IsA("MeshPart") then
										v31.CanCollide = false
										v31.CanQuery = false
									end
								end

								if AutoPlayEnabled then
									SettingBoombox()
								end

								while BoomboxEnabled and task.wait() and colorPart and colorPart.Parent and colorPart:FindFirstChild("PartOwner") and colorPart.PartOwner.Value == LocalPlayer.Name and torso and v30 and v30.Health > 0 do
									Teleport(colorPart, torso.CFrame,
										CFrame.new(0, 0, 1) * CFrame.Angles(0, 3.1415926535897931, 0.3490658503988659))
								end

								if BoomboxGlobal then
									DestroyT(BoomboxGlobal)
								end
							elseif BoomboxGlobal then
								DestroyT(BoomboxGlobal)
							end
						elseif BoomboxGlobal then
							DestroyT(BoomboxGlobal)
						end
					end
				end
			end
		end
	end,
})

BoomboxFunc:AddCheckbox("AutoPlayToggle", {
	Text = "Auto Play",
	Default = false,
	Callback = function(arg)
		AutoPlayEnabled = arg
	end,
})

BoomboxSettings:AddInput("SoundLinkInput", {
	Finished = false,
	ClearTextOnFocus = false,
	Text = "Sound Link",
	Placeholder = "Link Here...",
	Default = nil,
	Callback = function(arg)
		local str5 = tostring(os.time())
		writefile(str5 .. ".mp3", game:HttpGet(arg))
		SoundLink = getcustomasset(str5 .. ".mp3")

		if isfile(str5 .. ".mp3") then
			delfile(str5 .. ".mp3")
		end
	end,
})

BoomboxSettings:AddSlider("BoomboxVolumeSlider", {
	Text = "Volume",
	Default = 1,
	Min = 0,
	Max = 10,
	Rounding = 1,
	Compact = true,
	Callback = function(arg)
		SoundVolume = arg
	end,
})

PCLDESPEnabled = false
PCLDColor = Color3.new(0, 0, 0)
TransparencyPCLD = 0.75
SelectionBoxEnabled = false
LineColor = Color3.fromRGB(255, 255, 255)

UpdatePCLD = function(parent)
	if parent.Name ~= "PlayerCharacterLocationDetector" then
		return
	end

	task.spawn(function()
		if parent.Position == Vector3.zero then
			while true do
				task.wait()
				if not (not parent or parent.Position ~= Vector3.zero) then
					continue
				end
				break
			end
		end

		local clonedPCLD = parent:FindFirstChild("ClonedPCLD")

		if PCLDESPEnabled and not clonedPCLD then
			clonedPCLD = parent:Clone()
			clonedPCLD.Name = "ClonedPCLD"
			clonedPCLD.Material = Enum.Material.Neon
			clonedPCLD.Parent = parent

			parent:GetPropertyChangedSignal("CFrame"):Connect(function()
				local tbl7 = { CFrame = parent.CFrame }
				TweenService:Create(clonedPCLD, TweenInfo.new(0.15, Enum.EasingStyle.Linear), tbl7):Play()
			end)
		end

		if clonedPCLD then
			if PCLDESPEnabled then
				clonedPCLD.Transparency = TransparencyPCLD
				clonedPCLD.Color = PCLDColor
				local selectionBox = clonedPCLD:FindFirstChild("SelectionBox")

				if SelectionBoxEnabled then
					if not selectionBox then
						selectionBox = Instance.new("SelectionBox")
						selectionBox.Adornee = clonedPCLD
						selectionBox.Parent = clonedPCLD
					end

					selectionBox.Color3 = LineColor
					selectionBox.LineThickness = 0.01
				elseif selectionBox then
					selectionBox:Destroy()
				end
			else
				clonedPCLD.Transparency = 1
				local selectionBox = clonedPCLD:FindFirstChild("SelectionBox")

				if selectionBox then
					selectionBox:Destroy()
				end
			end
		end
	end)
end

UpdateAllPCLD = function()
	for _, v27 in workspace:GetChildren() do
		UpdatePCLD(v27)
	end
end

workspace.ChildAdded:Connect(function(child)
	if PCLDESPEnabled then
		UpdatePCLD(child)
	end
end)

ESPP:AddToggle("PLCD", {
	Text = "PCLD View",
	Default = false,
	Callback = function(arg)
		PCLDESPEnabled = arg
		UpdateAllPCLD()
	end,
}):AddColorPicker("PCLDColor", {
	Default = Color3.new(0, 0, 0),
	Callback = function(arg)
		PCLDColor = arg
		UpdateAllPCLD()
	end,
})

ESPP:AddCheckbox("PCLDSB", {
	Text = "SelectionBox",
	Default = false,
	Callback = function(arg)
		SelectionBoxEnabled = arg
		UpdateAllPCLD()
	end,
}):AddColorPicker("SBColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(arg)
		LineColor = arg
		UpdateAllPCLD()
	end,
})

ESPP:AddSlider("PLCDTransparency", {
	Text = "Transparency",
	Default = 0.75,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Compact = true,
	Callback = function(arg)
		PCLDTransparency = arg
		UpdateAllPCLD()
	end,
})

PlayersESPEnabled = false
NameOption = false
TraceOption = false
PColor = Color3.fromRGB(237, 198, 255)
WColor = Color3.fromRGB(0, 255, 0)
TColor = Color3.fromRGB(255, 0, 0)

ESP:AddToggle("PlayersESPToggle", {
	Text = "Players ESP",
	Default = false,
	Callback = function(arg)
		PlayersESPEnabled = arg

		while PlayersESPEnabled and task.wait(0.1) do
			for _, v27 in P:GetPlayers() do
				if v27 ~= LocalPlayer and v27.Character then
					if not v27.Character:FindFirstChildOfClass("BillboardGui") and NameOption then
						local billboardGui = Instance.new("BillboardGui", v27.Character)
						billboardGui.Name = "PlayersESPName"
						billboardGui.AlwaysOnTop = true
						billboardGui.Size = UDim2.new(100, 10, 0, 20)
						billboardGui.StudsOffsetWorldSpace = Vector3.new(0, 3.25, 0)
						local textLabel = Instance.new("TextLabel", billboardGui)
						textLabel.Size = UDim2.new(1, 0, 1, 0)
						textLabel.TextScaled = true
						textLabel.BackgroundTransparency = 1
						textLabel.TextColor3 = Color3.new(255, 255, 255)
						textLabel.TextStrokeTransparency = 0

						if table.find(AllTargets, v27) then
							textLabel.Text = v27.DisplayName .. " [" .. v27.Name .. "] [Target]"
						elseif table.find(AllWhitelisted, v27) then
							textLabel.Text = v27.DisplayName .. " [" .. v27.Name .. "] [Whitelisted]"
						else
							textLabel.Text = v27.DisplayName .. " [" .. v27.Name .. "]"
						end
					elseif v27.Character:FindFirstChild("PlayersESPName") and NameOption then
						local playersESPName = v27.Character:FindFirstChild("PlayersESPName")
						local textLabel = playersESPName:FindFirstChild("TextLabel")

						if textLabel then
							textLabel.Size = UDim2.new(1, 0, 1, 0)
							textLabel.TextScaled = true
							textLabel.BackgroundTransparency = 1
							textLabel.TextColor3 = Color3.new(255, 255, 255)
							textLabel.TextStrokeTransparency = 0

							if table.find(AllTargets, v27) then
								textLabel.Text = v27.DisplayName .. " [" .. v27.Name .. "] [Target]"
							elseif table.find(AllWhitelisted, v27) then
								textLabel.Text = v27.DisplayName .. " [" .. v27.Name .. "] [Whitelisted]"
							else
								textLabel.Text = v27.DisplayName .. " [" .. v27.Name .. "]"
							end
						else
							playersESPName:Destroy()
						end
					elseif v27.Character:FindFirstChild("PlayersESPName") and not NameOption then
						v27.Character:FindFirstChild("PlayersESPName"):Destroy()
					end

					if not v27.Character:FindFirstChild("PlayersESPTrace") and TraceOption then
						if char:FindFirstChild("HumanoidRootPart") then
							if not char.HumanoidRootPart:FindFirstChild("KickNotifyAttachment") then
								Instance.new("Attachment", char.HumanoidRootPart).Name = "KickNotifyAttachment"
							end

							local attachment = Instance.new("Attachment", v27.Character)
							local beam = Instance.new("Beam", v27.Character)
							beam.Attachment0 = char.HumanoidRootPart:FindFirstChild("KickNotifyAttachment")
							beam.Attachment1 = attachment
							beam.Transparency = NumberSequence.new(0)
							beam.Texture = "rbxassetid://8933346550"
							beam.FaceCamera = true
							beam.Width0 = 0.05
							beam.Width1 = 0.05
							beam.Name = "PlayersESPTrace"

							if table.find(AllTargets, v27) then
								beam.Color = ColorSequence.new(TColor)
							elseif table.find(AllWhitelisted, v27) then
								beam.Color = ColorSequence.new(WColor)
							else
								beam.Color = ColorSequence.new(PColor)
							end
						end
					elseif v27.Character:FindFirstChild("PlayersESPTrace") and TraceOption then
						local playersESPTrace = v27.Character:FindFirstChild("PlayersESPTrace")

						if table.find(AllTargets, v27) then
							playersESPTrace.Color = ColorSequence.new(TColor)
						elseif table.find(AllWhitelisted, v27) then
							playersESPTrace.Color = ColorSequence.new(WColor)
						else
							playersESPTrace.Color = ColorSequence.new(PColor)
						end
					elseif v27.Character:FindFirstChild("PlayersESPTrace") and not TraceOption then
						v27.Character:FindFirstChild("PlayersESPTrace"):Destroy()
					end
				end
			end
		end

		for _, v27 in P:GetPlayers() do
			if v27 ~= LocalPlayer and v27.Character then
				if v27.Character:FindFirstChild("PlayersESPName") then
					v27.Character:FindFirstChild("PlayersESPName"):Destroy()
				end

				if v27.Character:FindFirstChild("PlayersESPTrace") then
					v27.Character:FindFirstChild("PlayersESPTrace"):Destroy()
				end
			end
		end
	end,
})

ESP:AddCheckbox("PESPN", {
	Text = "Name",
	Default = false,
	Callback = function(arg)
		NameOption = arg

		while NameOption and task.wait(0.1) do
			LocalPlayer.NameDisplayDistance = 100

			if PlayersESPEnabled then
				LocalPlayer.NameDisplayDistance = 0
			end
		end

		LocalPlayer.NameDisplayDistance = 100
	end,
})

ESP:AddCheckbox("PESPT", {
	Text = "Trace",
	Default = false,
	Callback = function(arg)
		TraceOption = arg
	end,
})

ESP:AddLabel("Player Color"):AddColorPicker("PColor", {
	Default = Color3.fromRGB(237, 198, 255),
	Callback = function(arg)
		PColor = arg
	end,
})

ESP:AddLabel("Target Color"):AddColorPicker("TColor", {
	Default = Color3.new(255, 0, 0),
	Callback = function(arg)
		TColor = arg
	end,
})

ESP:AddLabel("Whitelisted Color"):AddColorPicker("WColor", {
	Default = Color3.new(0, 255, 0),
	Callback = function(arg)
		WColor = arg
	end,
})

AntiKickESPEnabled = false
YourAntiKickOutlineColor = Color3.fromRGB(255, 255, 255)
YourAntiKickOutlineTransparency = 0
YourAntiKickFillColor = Color3.fromRGB(255, 255, 255)
YourAntiKickFillTransparency = 0.75
AntiKickOutlineColor = Color3.fromRGB(255, 125, 0)
AntiKickOutlineTransparency = 0
AntiKickFillColor = Color3.fromRGB(255, 125, 0)
AntiKickFillTransparency = 0.75
HouseAntiKickOutlineColor = Color3.fromRGB(255, 0, 0)
HouseAntiKickOutlineTransparency = 0
HouseAntiKickFillColor = Color3.fromRGB(255, 0, 0)
HouseAntiKickFillTransparency = 0.75

ESPT:AddToggle("AntiKickESPToggle", {
	Text = "Sticky Items ESP",
	Default = false,
	Callback = function(arg)
		AntiKickESPEnabled = arg

		while AntiKickESPEnabled and task.wait(0.1) do
			pcall(function()
				for _, v27 in P:GetPlayers() do
					local v28 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

					if v28 then
						for _, v29 in v28:GetChildren() do
							if v29:FindFirstChild("StickyPart") or v29.Name == "PCL anti kik" then
								local stickyItemsESP = v29:FindFirstChild("StickyItemsESP")

								if not stickyItemsESP then
									stickyItemsESP = Instance.new("Highlight", v29)
									stickyItemsESP.Name = "StickyItemsESP"
								end

								if v29.Parent == toysFolder or v29.Name == "PCL anti kik" then
									stickyItemsESP.OutlineColor = YourAntiKickOutlineColor
									stickyItemsESP.OutlineTransparency = YourAntiKickOutlineTransparency
									stickyItemsESP.FillColor = YourAntiKickFillColor
									stickyItemsESP.FillTransparency = YourAntiKickFillTransparency
								else
									stickyItemsESP.OutlineColor = AntiKickOutlineColor
									stickyItemsESP.OutlineTransparency = AntiKickOutlineTransparency
									stickyItemsESP.FillColor = AntiKickFillColor
									stickyItemsESP.FillTransparency = AntiKickFillTransparency
								end
							end
						end
					end
				end
			end)

			pcall(function()
				for _, v27 in workspace.PlotItems:GetChildren() do
					for _, v28 in v27:GetChildren() do
						if v28:FindFirstChild("StickyPart") or v28.Name == "PCL anti kik" then
							local stickyItemsESP = v28:FindFirstChild("StickyItemsESP")

							if not stickyItemsESP then
								stickyItemsESP = Instance.new("Highlight", v28)
								stickyItemsESP.Name = "StickyItemsESP"
							end

							stickyItemsESP.OutlineTransparency = HouseAntiKickOutlineTransparency
							stickyItemsESP.FillTransparency = HouseAntiKickFillTransparency
							stickyItemsESP.OutlineColor = HouseAntiKickOutlineColor
							stickyItemsESP.FillColor = HouseAntiKickFillColor
						end
					end
				end
			end)
		end

		task.wait(0.1)

		for _, v27 in P:GetPlayers() do
			local v28 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

			if v28 then
				for _, v29 in v28:GetChildren() do
					if v29:FindFirstChild("StickyPart") or v29.Name == "PCL anti kik" then
						local stickyItemsESP = v29:FindFirstChild("StickyItemsESP")

						if stickyItemsESP then
							stickyItemsESP:Destroy()
						end
					end
				end
			end
		end

		for _, v27 in workspace.PlotItems:GetChildren() do
			for _, v28 in v27:GetChildren() do
				if v28:FindFirstChild("StickyPart") or v28.Name == "PCL anti kik" then
					local stickyItemsESP = v28:FindFirstChild("StickyItemsESP")

					if stickyItemsESP then
						stickyItemsESP:Destroy()
					end
				end
			end
		end
	end,
})

ESPT:AddLabel("Your Sticky Items Color"):AddColorPicker("YourAntiKickFillColorPicker", {
	Default = Color3.fromRGB(255, 255, 255),
	Transparency = 0.75,
	Callback = function(arg)
		YourAntiKickFillColor = arg
		YourAntiKickFillTransparency = Options.YourAntiKickFillColorPicker.Transparency
	end,
}):AddColorPicker("YourAntiKickOutlineColorPicker", {
	Default = Color3.fromRGB(255, 255, 255),
	Transparency = 0,
	Callback = function(arg)
		YourAntiKickOutlineColor = arg
		YourAntiKickOutlineTransparency = Options.YourAntiKickOutlineColorPicker.Transparency
	end,
})

ESPT:AddLabel("Sticky Items Color"):AddColorPicker("AntiKickFillColorPicker", {
	Default = Color3.fromRGB(255, 125, 0),
	Transparency = 0.75,
	Callback = function(arg)
		AntiKickFillColor = arg
		AntiKickFillTransparency = Options.AntiKickFillColorPicker.Transparency
	end,
}):AddColorPicker("AntiKickOutlineColorPicker", {
	Default = Color3.fromRGB(255, 125, 0),
	Transparency = 0,
	Callback = function(arg)
		AntiKickOutlineColor = arg
		AntiKickOutlineTransparency = Options.AntiKickOutlineColorPicker.Transparency
	end,
})

ESPT:AddLabel("House Sticky Items Color"):AddColorPicker("HouseAntiKickFillColorPicker", {
	Default = Color3.fromRGB(255, 0, 0),
	Transparency = 0.75,
	Callback = function(arg)
		HouseAntiKickFillColor = arg
		HouseAntiKickFillTransparency = Options.HouseAntiKickFillColorPicker.Transparency
	end,
}):AddColorPicker("HouseAntiKickOutlineColorPicker", {
	Default = Color3.fromRGB(255, 0, 0),
	Transparency = 0,
	Callback = function(arg)
		HouseAntiKickOutlineColor = arg
		HouseAntiKickOutlineTransparency = Options.HouseAntiKickOutlineColorPicker.Transparency
	end,
})

ESPT:AddDivider()
BlobmanESPEnabled = false
YourBlobmanOutlineColor = Color3.fromRGB(0, 255, 0)
YourBlobmanOutlineTransparency = 0
YourBlobmanFillColor = Color3.fromRGB(0, 255, 0)
YourBlobmanFillTransparency = 0.75
BlobmanOutlineColor = Color3.fromRGB(255, 125, 0)
BlobmanOutlineTransparency = 0
BlobmanFillColor = Color3.fromRGB(255, 125, 0)
BlobmanFillTransparency = 0.75
HouseBlobmanOutlineColor = Color3.fromRGB(255, 0, 0)
HouseBlobmanOutlineTransparency = 0
HouseBlobmanFillColor = Color3.fromRGB(255, 0, 0)
HouseBlobmanFillTransparency = 0.75

ESPT:AddToggle("BlobmanESPToggle", {
	Text = "Blobman ESP",
	Default = false,
	Callback = function(arg)
		BlobmanESPEnabled = arg

		while BlobmanESPEnabled and task.wait(0.1) do
			pcall(function()
				for _, v27 in P:GetPlayers() do
					local v28 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

					if v28 then
						for _, v29 in v28:GetChildren() do
							if v29:IsA("Model") and v29.Name == "CreatureBlobman" then
								local blobmanESP = v29:FindFirstChild("BlobmanESP")

								if not blobmanESP then
									blobmanESP = Instance.new("Highlight", v29)
									blobmanESP.Name = "BlobmanESP"
								end

								if v29.Parent == toysFolder then
									blobmanESP.OutlineColor = YourBlobmanOutlineColor
									blobmanESP.OutlineTransparency = YourBlobmanOutlineTransparency
									blobmanESP.FillColor = YourBlobmanFillColor
									blobmanESP.FillTransparency = YourBlobmanFillTransparency
								else
									blobmanESP.OutlineColor = BlobmanOutlineColor
									blobmanESP.OutlineTransparency = BlobmanOutlineTransparency
									blobmanESP.FillColor = BlobmanFillColor
									blobmanESP.FillTransparency = BlobmanFillTransparency
								end
							end
						end
					end
				end
			end)

			pcall(function()
				for _, v27 in workspace.PlotItems:GetChildren() do
					for _, v28 in v27:GetChildren() do
						if v28:IsA("Model") and v28.Name == "CreatureBlobman" then
							local blobmanESP = v28:FindFirstChild("BlobmanESP")

							if not blobmanESP then
								blobmanESP = Instance.new("Highlight", v28)
								blobmanESP.Name = "BlobmanESP"
							end

							blobmanESP.OutlineColor = HouseBlobmanOutlineColor
							blobmanESP.OutlineTransparency = HouseBlobmanOutlineTransparency
							blobmanESP.FillColor = HouseBlobmanFillColor
							blobmanESP.FillTransparency = HouseBlobmanFillTransparency
						end
					end
				end
			end)
		end

		task.wait(0.1)

		for _, v27 in P:GetPlayers() do
			local v28 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

			if v28 then
				for _, v29 in v28:GetChildren() do
					if v29:IsA("Model") and v29.Name == "CreatureBlobman" then
						local blobmanESP = v29:FindFirstChild("BlobmanESP")

						if blobmanESP then
							blobmanESP:Destroy()
						end
					end
				end
			end
		end

		for _, v27 in workspace.PlotItems:GetChildren() do
			for _, v28 in v27:GetChildren() do
				if v28:IsA("Model") and v28.Name == "CreatureBlobman" then
					local blobmanESP = v28:FindFirstChild("BlobmanESP")

					if blobmanESP then
						blobmanESP:Destroy()
					end
				end
			end
		end
	end,
})

ESPT:AddLabel("Your Blobman ESP Color"):AddColorPicker("YourBlobmanFillColorPicker", {
	Default = Color3.fromRGB(0, 255, 0),
	Transparency = 0.75,
	Callback = function(arg)
		YourBlobmanFillColor = arg
		YourBlobmanFillTransparency = Options.YourBlobmanFillColorPicker.Transparency
	end,
}):AddColorPicker("YourBlobmanOutlineColorPicker", {
	Default = Color3.fromRGB(0, 255, 0),
	Transparency = 0,
	Callback = function(arg)
		YourBlobmanOutlineColor = arg
		YourBlobmanOutlineTransparency = Options.YourBlobmanOutlineColorPicker.Transparency
	end,
})

ESPT:AddLabel("Blobman ESP Color"):AddColorPicker("BlobmanFillColorPicker", {
	Default = Color3.fromRGB(255, 125, 0),
	Transparency = 0.75,
	Callback = function(arg)
		BlobmanFillColor = arg
		BlobmanFillTransparency = Options.BlobmanFillColorPicker.Transparency
	end,
}):AddColorPicker("BlobmanOutlineColorPicker", {
	Default = Color3.fromRGB(255, 125, 0),
	Transparency = 0,
	Callback = function(arg)
		BlobmanOutlineColor = arg
		BlobmanOutlineTransparency = Options.BlobmanOutlineColorPicker.Transparency
	end,
})

ESPT:AddLabel("House Blobman ESP Color"):AddColorPicker("HouseBlobmanFillColorPicker", {
	Default = Color3.fromRGB(255, 0, 0),
	Transparency = 0.75,
	Callback = function(arg)
		HouseBlobmanFillColor = arg
		HouseBlobmanFillTransparency = Options.HouseBlobmanFillColorPicker.Transparency
	end,
}):AddColorPicker("HouseBlobmanOutlineColorPicker", {
	Default = Color3.fromRGB(255, 0, 0),
	Transparency = 0,
	Callback = function(arg)
		HouseBlobmanOutlineColor = arg
		HouseBlobmanOutlineTransparency = Options.HouseBlobmanOutlineColorPicker.Transparency
	end,
})

ThirdPersonEnabled = false

CM:AddToggle("Trd", {
	Text = "Unlock Third Person",
	Default = false,
	Callback = function(arg)
		ThirdPersonEnabled = arg

		if ThirdPersonEnabled then
			lico = RunService.RenderStepped:Connect(function()
				LocalPlayer.CameraMaxZoomDistance = 500
				LocalPlayer.CameraMode = 0

				if char and char:FindFirstChild("Head") then
					char:FindFirstChild("Head").Transparency = 0

					for _, v27 in char:GetChildren() do
						if v27:IsA("Accessory") and v27.Name ~= "TypingKeyboardMyWorld" then
							v27.Handle.Transparency = 0
						end

						if v27:IsA("Part") and v27.Name ~= "HumanoidRootPart" and v27.Name ~= "CamPart" then
							v27.Transparency = 0
						end
					end
				end
			end)
		elseif lico then
			lico:Disconnect()
			lico = nil
			LocalPlayer.CameraMaxZoomDistance = 0.5
			LocalPlayer.CameraMode = 1
		end
	end,
}):AddKeyPicker("TrdBind", {
	Default = "None",
	Callback = function()
		if ThirdPersonEnabled then
			Library:Notify({ Title = "Nil'e", Description = "Third Person Off", Time = 1.5, BigIcon = "info" })
			Toggles.Trd:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Third Person On", Time = 1.5, BigIcon = "info" })
			Toggles.Trd:SetValue(true)
		end
	end,
})

CM:AddToggle("DisableBlur", {
	Text = "Disable Ragdoll Blur",
	Default = false,
	Callback = function(arg)
		workspace.Camera.Blur.Enabled = not arg
	end,
})

CM:AddToggle("FPBP", {
	Text = "First Person Body Parts",
	Default = false,
	Callback = function(arg)
		if arg then
			FPBPConnection = RunService.RenderStepped:Connect(function()
				if char then
					if char:FindFirstChild("Humanoid") then
						char:FindFirstChild("Humanoid").CameraOffset = Vector3.new(0, -0.25, -1)
					end

					for _, v27 in char:GetChildren() do
						if v27.Name == "Torso" or v27.Name == "Right Arm" or v27.Name == "Left Arm" or v27.Name == "Right Leg" or v27.Name == "Left Leg" then
							v27.Transparency = 0
							v27.LocalTransparencyModifier = 0
						end
					end
				end
			end)
		elseif FPBPConnection then
			FPBPConnection:Disconnect()
		end
	end,
})

CurrentFOV = 100

CM:AddSlider("FOV", {
	Text = "FOV",
	Default = 70,
	Min = 70,
	Max = 120,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		TweenService:Create(workspace.Camera, TweenInfo.new(1, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out),
			{ FieldOfView = arg }):Play()
	end,
})

NotifySounds = {
	["No Sound"] = nil,
	["Apple Pay"] = "rbxassetid://114973877940754",
	["Steam notification"] = "rbxassetid://195868961",
	Resonance = "rbxassetid://97643101798871",
	["CS:GO Kill"] = "rbxassetid://113740359043835",
	["CS:GO HeadShot"] = "rbxassetid://5764885315",
	Bonk = "rbxassetid://137041944943141",
	["The Worst"] = "rbxassetid://96867813755421",
}

KickCount = 0
NotifySound = nil
NotifyTime = 5
KickNotifyEnabled = false
BlackholeHighlightOption = true
BlackholeHighlightColor = Color3.fromRGB(255, 255, 255)
BlackholeNameOption = true
BlackholeNameColor = Color3.fromRGB(255, 255, 255)
BlackholeTraceOption = true
BlackholeTraceColor = Color3.fromRGB(255, 255, 255)
BlackHoleColor = Color3.fromRGB(0, 0, 0)
BlackHoleTransparency = 0
CustomBlackHoleImageEnabled = false
BlackHoleImage = "rbxassetid://9920612764"
BlackHoleImageColor = Color3.fromRGB(0, 0, 0)
BlackHoleImageTransparency = 0

workspace.ChildAdded:Connect(function(child)
	if not KickNotifyEnabled or child.Name ~= "BlackHoleKick" then
		return
	end
	local hole = child:WaitForChild("Hole", 1)
	if not hole then
		return
	end
	hole.Color = BlackHoleColor
	hole.Transparency = BlackHoleTransparency
	local billboardGui = hole:WaitForChild("BillboardGui", 1)
	if not billboardGui then
		return
	end
	local small = billboardGui:WaitForChild("Small", 1)
	local large = billboardGui:WaitForChild("Large", 1)
	if not large or not small then
		return
	end
	small:Destroy()

	if CustomBlackHoleImageEnabled then
		large.Image = BlackHoleImage
		large.ImageColor3 = BlackHoleImageColor
		large.ImageTransparency = BlackHoleImageTransparency
	end

	if BlackholeHighlightOption then
		local highlight = Instance.new("Highlight", child)
		highlight.FillTransparency = 1
		highlight.OutlineColor = BlackholeHighlightColor
	end

	if BlackholeTraceOption and char and char:FindFirstChild("HumanoidRootPart") then
		local kickNotifyAttachment = char.HumanoidRootPart:FindFirstChild("KickNotifyAttachment")

		if not kickNotifyAttachment then
			kickNotifyAttachment = Instance.new("Attachment", char.HumanoidRootPart)
			kickNotifyAttachment.Name = "KickNotifyAttachment"
		end

		local attachment = Instance.new("Attachment", hole)
		local beam = Instance.new("Beam", child)
		beam.Attachment0 = attachment
		beam.Attachment1 = kickNotifyAttachment
		beam.Transparency = NumberSequence.new(0)
		beam.Color = ColorSequence.new(BlackholeTraceColor)
		beam.Texture = "rbxassetid://8933346550"
		beam.FaceCamera = true
		beam.Width0 = 0.05
		beam.Width1 = 0.05
		beam.Name = "BlackHoleTrace"
	end

	for _, v27 in P:GetPlayers() do
		if v27 ~= LocalPlayer and v27.Character and v27.Character:FindFirstChild("HumanoidRootPart") and v27.Character.HumanoidRootPart.Anchored and v27.Character.HumanoidRootPart.Name ~= "Kicked" then
			if BlackholeNameOption then
				local billboardGui2 = Instance.new("BillboardGui", child)
				billboardGui2.Name = "PlayersESPName"
				billboardGui2.AlwaysOnTop = true
				billboardGui2.Size = UDim2.new(5, 50, 1, 50)
				local textLabel = Instance.new("TextLabel", billboardGui2)
				textLabel.Size = UDim2.new(1, 0, 1, 0)
				textLabel.TextScaled = true
				textLabel.BackgroundTransparency = 1
				textLabel.TextColor3 = BlackholeNameColor
				textLabel.TextStrokeTransparency = 0
				textLabel.Text = v27.DisplayName .. " [" .. v27.Name .. "]"
			end

			local partOwner = v27.Character:FindFirstChild("Head") and v27.Character.Head:FindFirstChild("PartOwner")
			local str5 = "\nLast Grabber: Unknown"

			if partOwner then
				local v28 = P:FindFirstChild(v27.Character.Head.PartOwner.Value)

				if v28 then
					str5 = "\nLast Grabber: " .. v28.DisplayName .. " [" .. v28.Name .. "]"
				end
			end

			v27.Character.HumanoidRootPart.Name = "Kicked"
			KickCount = KickCount + 1
			KC:SetText("Total Kicks: " .. KickCount)

			Library:Notify({
				Title = "Nil'e",
				Description = v27.DisplayName ..
				" [" .. v27.Name .. "] " .. "Kicked!" .. str5 .. "\nTotal Kicks: " .. KickCount,
				Time = NotifyTime,
				SoundId = NotifySound,
				BigIcon = "info",
			})
		end
	end
end)

ESPB:AddDropdown("NotifySound", {
	Text = "Notify Sound",
	Values = {
		"No Sound",
		"Apple Pay",
		"Steam notification",
		"Resonance",
		"CS:GO Kill",
		"CS:GO HeadShot",
		"Bonk",
		"The Worst",
	},
	Default = "No Sound",
	Multi = false,
	Callback = function(arg)
		NotifySound = NotifySounds[arg]

		Library:Notify({
			Title = "Nil'e",
			Description = "Sound Check",
			Time = NotifyTime,
			SoundId = NotifySound,
			BigIcon = "bell-ring",
		})
	end,
})

ESPB:AddSlider("NotifyTime", {
	Text = "Notify Time",
	Default = 5,
	Min = 1,
	Max = 10,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		KickNotifyTime = arg
	end,
})

ESPB:AddToggle("KickNotify", {
	Text = "Kick Notify",
	Default = false,
	Callback = function(arg)
		KickNotifyEnabled = arg
	end,
})

ESPB:AddDivider()

ESPB:AddCheckbox("BHH", {
	Text = "Blackhole Highlight",
	DisabledTooltip = "To Enable Set BlackHole Transparency 0",
	Default = true,
	Callback = function(arg)
		BlackholeHighlightOption = arg
	end,
}):AddColorPicker("BlackholeHighlightColorPicker", {
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(arg)
		BlackholeHighlightColor = arg
	end,
})

ESPB:AddCheckbox("BHN", {
	Text = "Blackhole Name",
	Default = true,
	Callback = function(arg)
		BlackholeNameOption = arg
	end,
}):AddColorPicker("BlackholeNameColorPicker", {
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(arg)
		BlackholeNameColor = arg
	end,
})

ESPB:AddCheckbox("BHT", {
	Text = "Blackhole Trace",
	Default = true,
	Callback = function(arg)
		BlackholeTraceOption = arg
	end,
}):AddColorPicker("BlackholeTraceColorPicker", {
	Default = Color3.fromRGB(255, 255, 255),
	Callback = function(arg)
		BlackholeTraceColor = arg
	end,
})

ESPB:AddLabel("Hole Color And Transparency"):AddColorPicker("HoleColorPicker", {
	Default = Color3.new(0, 0, 0),
	Transparency = 0,
	Callback = function(arg)
		BlackHoleColor = arg
		BlackHoleTransparency = Options.HoleColorPicker.Transparency
	end,
})

ESPB:AddDivider()

ESPB:AddInput("BlackholeImageIdInput", {
	Finished = false,
	ClearTextOnFocus = false,
	Text = "Blackhole Image",
	Placeholder = "Image Link Here...",
	Callback = function(arg)
		local str5 = tostring(os.time())
		writefile(str5 .. ".png", game:HttpGet(arg))
		BlackHoleImage = getcustomasset(str5 .. ".png")

		if isfile(str5 .. ".png") then
			delfile(str5 .. ".png")
		end
	end,
})

ESPB:AddLabel("Blackhole Image Color"):AddColorPicker("BlackholeImageColorPicker", {
	Default = Color3.new(0, 0, 0),
	Transparency = 0,
	Callback = function(arg)
		BlackHoleImageColor = arg
		BlackHoleImageTransparency = Options.BlackholeImageColorPicker.Transparency
	end,
})

ESPB:AddToggle("EnableCustomImageToggle", {
	Text = "Enable Custom Image",
	Default = false,
	Callback = function(arg)
		CustomBlackHoleImageEnabled = arg
	end,
})

MP:AddToggle("Shaders", {
	Text = "Enable Shaders",
	Default = false,
	Callback = function(arg)
		local Lighting = game:GetService("Lighting")

		if arg then
			Lighting.ClockTime = 7.5
			Instance.new("BlurEffect", Lighting).Size = 3
			Instance.new("SunRaysEffect", Lighting).Intensity = 0.1
		else
			Lighting.ClockTime = 14
			Lighting.Blur:Destroy()
			Lighting.SunRays:Destroy()
		end
	end,
})

MP:AddToggle("WaterWalk", {
	Text = "Water Walk",
	Default = false,
	Callback = function(canCollide)
		local objectModel = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")

		if objectModel then
			for _, v27 in objectModel:GetChildren() do
				if v27.Name == "Ocean" and v27:IsA("Part") then
					v27.CanCollide = canCollide
				end
			end
		end
	end,
})

MapPropsTable = {}
DeadTreesTable = {}

for _, v27 in workspace.Map.MapProps:GetChildren() do
	table.insert(MapPropsTable, v27)
end

for _, v27 in workspace.Map.BaseGround:GetChildren() do
	if v27.Name == "DeadTree" then
		table.insert(DeadTreesTable, v27)
	end
end

MP:AddToggle("HideMapPropsToggle", {
	Text = "Hide Map Props",
	Default = false,
	Callback = function(arg)
		for _, v27 in MapPropsTable, nil, nil do
			if arg then
				v27.Parent = nil
			else
				v27.Parent = workspace.Map.MapProps
			end
		end

		for _, v27 in DeadTreesTable, nil, nil do
			if arg then
				v27.Parent = nil
			else
				v27.Parent = workspace.Map.BaseGround
			end
		end
	end,
})

MP:AddSlider("Gravity", {
	Text = "Gravity",
	Default = 100,
	Min = 0,
	Max = 100,
	Rounding = 0,
	Compact = true,
	Callback = function(gravity)
		game.workspace.Gravity = gravity
	end,
})

MP:AddDivider()
local color = Color3.fromRGB(124, 156, 107)
local color2 = Color3.fromRGB(163, 161, 165)
local color3 = Color3.fromRGB(175, 147, 131)
local color4 = Color3.fromRGB(240, 230, 198)
local color5 = Color3.fromRGB(84, 63, 84)
local color6 = Color3.fromRGB(61, 100, 54)
local color7 = Color3.fromRGB(248, 248, 248)

SetMapTheme = function()
	for _, v27 in workspace.Map:GetDescendants() do
		if v27.Name == "Grass" then
			v27.Color = color
		elseif v27.Name == "Rock" then
			v27.Color = color2
		elseif v27.Name == "Dirt" then
			v27.Color = color3
		elseif v27.Name == "Sand" then
			v27.Color = color4
		elseif v27.Name == "LushGrass" then
			v27.Color = color6
		elseif v27.Name == "WasteGrass" then
			v27.Color = color5
		elseif v27.Name == "Snow" then
			v27.Color = color7
		end
	end
end

MP:AddLabel("Grass Color"):AddColorPicker("GC", {
	Default = color,
	Transparency = 0,
	Callback = function(arg)
		color = arg
		SetMapTheme()
	end,
})

MP:AddLabel("LushGrass Color"):AddColorPicker("LGC", {
	Default = color6,
	Transparency = 0,
	Callback = function(arg)
		color6 = arg
		SetMapTheme()
	end,
})

MP:AddLabel("WasteGrass Color"):AddColorPicker("WGC", {
	Default = color5,
	Transparency = 0,
	Callback = function(arg)
		color5 = arg
		SetMapTheme()
	end,
})

MP:AddLabel("Rock Color"):AddColorPicker("RC", {
	Default = color2,
	Transparency = 0,
	Callback = function(arg)
		color2 = arg
		SetMapTheme()
	end,
})

MP:AddLabel("Sand Color"):AddColorPicker("SC", {
	Default = color4,
	Transparency = 0,
	Callback = function(arg)
		color4 = arg
		SetMapTheme()
	end,
})

MP:AddLabel("Dirt Color"):AddColorPicker("DC", {
	Default = color3,
	Transparency = 0,
	Callback = function(arg)
		color3 = arg
		SetMapTheme()
	end,
})

MP:AddLabel("Snow Color"):AddColorPicker("SWC", {
	Default = color7,
	Transparency = 0,
	Callback = function(arg)
		color7 = arg
		SetMapTheme()
	end,
})

MP:AddButton("ResetMapColors", {
	Text = "Reset Colors",
	Func = function()
		color = Color3.fromRGB(124, 156, 107)
		color2 = Color3.fromRGB(163, 161, 165)
		color3 = Color3.fromRGB(175, 147, 131)
		color4 = Color3.fromRGB(240, 230, 198)
		color5 = Color3.fromRGB(84, 63, 84)
		color6 = Color3.fromRGB(61, 100, 54)
		color7 = Color3.fromRGB(248, 248, 248)
		SetMapTheme()
	end,
})

ExplosionsVolume = 1
ScreamsVolume = 1

workspace.ChildAdded:Connect(function(child)
	if child:IsA("Part") and child.Name == "Part" then
		for _, v27 in child:GetChildren() do
			if v27:IsA("Sound") then
				v27.Volume = ExplosionsVolume
			end
		end
	end
end)

workspace.ChildAdded:Connect(function(child)
	if child:IsA("Model") then
		local humanoidRootPart = child:WaitForChild("HumanoidRootPart", 5)

		if humanoidRootPart then
			local scream = humanoidRootPart:WaitForChild("Scream", 5)

			if scream then
				task.wait(0.01)
				scream.Volume = ScreamsVolume
			end
		end
	end
end)

SND:AddSlider("AmbienceSlider", {
	Text = "Ambience",
	Default = 0.05,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Callback = function(volume)
		for _, v27 in workspace.Map.MapNoises:GetChildren() do
			v27.Sound1.Volume = volume
		end
	end,
})

SND:AddSlider("ExplosionsSlider", {
	Text = "Explosions",
	Default = 1,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Callback = function(arg)
		ExplosionsVolume = arg
	end,
})

SND:AddSlider("ScreamsSlider", {
	Text = "Screams",
	Default = 1,
	Min = 0,
	Max = 1,
	Rounding = 2,
	Callback = function(arg)
		ScreamsVolume = arg

		for _, v27 in P:GetPlayers() do
			if v27.Character then
				local humanoidRootPart = v27.Character:WaitForChild("HumanoidRootPart", 5)

				if humanoidRootPart then
					local scream = humanoidRootPart:WaitForChild("Scream", 5)

					if scream then
						scream.Volume = ScreamsVolume
					end
				end
			end
		end
	end,
})

Locations = {
	Spawn = CFrame.new(0, -7.5, 0),
	Plot1 = CFrame.new(-535, -7.5, 90),
	Plot2 = CFrame.new(-492, -7.5, -167),
	Plot3 = CFrame.new(250, -7.5, 460),
	Plot4 = CFrame.new(512, 83.5, -340),
	Plot5 = CFrame.new(553, 123.5, -75),
	Barn = CFrame.new(-195, 60, -285),
	House = CFrame.new(-282, 81, 313),
	Island = CFrame.new(72, 346, 341),
	["Void Platform"] = CFrame.new(0, -495, 0),
}

TeleportToLocation = function(cFrame)
	if char and char:FindFirstChild("HumanoidRootPart") then
		char.HumanoidRootPart.CFrame = cFrame
		char.HumanoidRootPart.Velocity = Vector3.zero
		char.HumanoidRootPart.RotVelocity = Vector3.zero
		fn16()
	end
end

KB:AddLabel("Spawn"):AddKeyPicker("KeyPicker1", {
	Default = "One",
	Callback = function()
		TeleportToLocation(Locations.Spawn)
	end,
})

KB:AddLabel("Plot 1"):AddKeyPicker("KeyPicker2", {
	Default = "Two",
	Callback = function()
		TeleportToLocation(Locations.Plot1)
	end,
})

KB:AddLabel("Plot 2"):AddKeyPicker("KeyPicker3", {
	Default = "Three",
	Callback = function()
		TeleportToLocation(Locations.Plot2)
	end,
})

KB:AddLabel("Plot 3"):AddKeyPicker("KeyPicker4", {
	Default = "Four",
	Callback = function()
		TeleportToLocation(Locations.Plot3)
	end,
})

KB:AddLabel("Plot 4"):AddKeyPicker("KeyPicker5", {
	Default = "Five",
	Callback = function()
		TeleportToLocation(Locations.Plot4)
	end,
})

KB:AddLabel("Plot 5"):AddKeyPicker("KeyPicker6", {
	Default = "Six",
	Callback = function()
		TeleportToLocation(Locations.Plot5)
	end,
})

KB:AddLabel("Barn"):AddKeyPicker("KeyPicker7", {
	Default = "Seven",
	Callback = function()
		TeleportToLocation(Locations.Barn)
	end,
})

KB:AddLabel("House"):AddKeyPicker("KeyPicker8", {
	Default = "Eight",
	Callback = function()
		TeleportToLocation(Locations.House)
	end,
})

KB:AddLabel("Island"):AddKeyPicker("KeyPicker9", {
	Default = "Nine",
	Callback = function()
		TeleportToLocation(Locations.Island)
	end,
})

KB:AddLabel("Void Platform"):AddKeyPicker("KeyPicker0", {
	Default = "Zero",
	Callback = function()
		TeleportToLocation(Locations["Void Platform"])
	end,
})

KB:AddLabel("To Mouse"):AddKeyPicker("Tpbind", {
	Default = "None",
	Callback = function()
		local mouse = LocalPlayer:GetMouse()
		local character2 = LocalPlayer.Character

		if character2 and character2:FindFirstChild("HumanoidRootPart") then
			character2.HumanoidRootPart.CFrame = CFrame.new(mouse.Hit.Position + Vector3.new(0, 3, 0))
			character2.HumanoidRootPart.Velocity = Vector3.zero
			character2.HumanoidRootPart.RotVelocity = Vector3.zero
			fn16()
		end
	end,
})

FKB:AddLabel("Toggle UI"):AddKeyPicker("MenuKeybind", { Default = "Q", NoUI = true })

FKB:AddLabel("Jerk Off"):AddKeyPicker("jerkoffbind", {
	Default = "None",
	Callback = function(arg)
		if arg then
			JerkOffBoolean = true

			if char then
				local humanoid = char:WaitForChild("Humanoid", 1)

				if humanoid then
					local animator = humanoid:WaitForChild("Animator", 1)

					if animator then
						local animation = Instance.new("Animation", humanoid)
						animation.Name = "Jerk Off"
						animation.AnimationId = "rbxassetid://168268306"
						local v27 = animator:LoadAnimation(animation)
						v27:Play()

						while JerkOffBoolean and task.wait(0.1) do
							v27.TimePosition = 0.275
						end

						v27.TimePosition = 3
						animation:Destroy()
					end
				end
			end
		else
			JerkOffBoolean = false
		end
	end,
})

FKB:AddLabel("Spawn And Sit Blob"):AddKeyPicker("seatblobbind", {
	Default = "None",
	Callback = function()
		if char then
			local v27 = GetCharPart(char, "HumanoidRootPart")
			local v28 = GetCharPart(char, "Humanoid")

			if v27 and v28 and v28.Health > 0 then
				if toysFolder:FindFirstChild("CreatureBlobman") then
					local vehicleSeat = toysFolder.CreatureBlobman:FindFirstChild("VehicleSeat")

					if vehicleSeat then
						vehicleSeat:Sit(v28)
					else
						DestroyT(toysFolder:FindFirstChild("CreatureBlobman"))
					end
				else
					local CreatureBlobman = NewToy("CreatureBlobman", v27.CFrame * CFrame.new(0, 15, 20))

					if CreatureBlobman then
						local vehicleSeat = toysFolder.CreatureBlobman:WaitForChild("VehicleSeat", 1)

						if vehicleSeat and v28 then
							vehicleSeat:Sit(v28)
						else
							DestroyT(CreatureBlobman)
						end
					end
				end
			end
		end
	end,
})

LaunchRocket = function()
	if char then
		local v27, v28, v29 = GetHRH(char)

		if v28 and v29 and v29.Health > 0 then
			for _, v30 in toysFolder:GetChildren() do
				if v30.Name == "BombMissile" then
					v30.Name = "иди нахуй отсюда"
					DestroyT(v30)
				end
			end

			local BombMissile = NewToy("BombMissile", v28.CFrame * CFrame.new(0, 15, 20))

			if BombMissile then
				local part3 = BombMissile:WaitForChild("Part", 1)
				local orientingPart = BombMissile:WaitForChild("OrientingPart", 1)

				if part3 and orientingPart then
					local now2 = tick()
					local v30

					while true do
						task.wait()
						v30 = Ownerboat(part3)
						if not (not v28 or not v29 or v29.Health <= 0 or not part3 or (v28.Position - part3.Position).Magnitude > 20 or tick() - now2 > 1.5 or v30) then
							continue
						end
						break
					end

					if v30 then
						local bodyVelocity = Instance.new("BodyVelocity", orientingPart)
						bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						local bodyGyro = Instance.new("BodyGyro", orientingPart)
						bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
						bodyGyro.D = 1000
						bodyGyro.P = 90000

						while task.wait() and orientingPart and orientingPart.Parent and v29 and v29.Health > 0 do
							workspace.CurrentCamera.CameraSubject = orientingPart
							bodyVelocity.Velocity = workspace.CurrentCamera.CFrame.LookVector * 150
							bodyGyro.CFrame = workspace.CurrentCamera.CFrame *
							CFrame.Angles(-1.5707963267948966, 0, 1.5707963267948966)
						end

						if v29 then
							workspace.CurrentCamera.CameraSubject = v29
						end
					end
				end
			end
		end
	end
end

FKB:AddLabel("Launch Rocket"):AddKeyPicker("explodebind", {
	Default = "None",
	Callback = function()
		LaunchRocket()
	end,
})

local tweenInfo = TweenInfo.new(0.5, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out, 0, false, 0)
local tween = TweenService:Create(workspace.Camera, tweenInfo, { FieldOfView = 10 })
local tween2 = TweenService:Create(workspace.Camera, tweenInfo, { FieldOfView = 100 })

FKB:AddLabel("Zoom"):AddKeyPicker("Zoom", {
	Default = "None",
	Mode = "Toggle",
	Callback = function(arg)
		if arg then
			tween:Play()
		else
			tween2:Play()
		end
	end,
})

FKB:AddLabel("Struggle"):AddKeyPicker("StruggleBind", {
	Default = "None",
	Mode = "Toggle",
	Callback = function()
		Struggle:FireServer()
	end,
})

FKB:AddLabel("Bring"):AddKeyPicker("BringBind", {
	Default = "None",
	Callback = function()
		local mouse = LocalPlayer:GetMouse()
		local parent = mouse.Target and mouse.Target.Parent and P:FindFirstChild(mouse.Target.Parent.Name)

		if parent then
			local v27 = LocalPlayer
			parent = P:FindFirstChild(mouse.Target.Parent.Name) ~= v27
		end

		if parent then
			local v27 = P:FindFirstChild(mouse.Target.Parent.Name)

			if v27:FindFirstChild("InPlot") and not v27.InPlot.Value and v27.Character and char then
				local v28, v29, v30 = GetHRH(char)
				local v31, v32, v33 = GetHRH(v27.Character)

				if v29 and v30 and v30.Health > 0 and v31 and v33 and v33.Health > 0 then
					local cFrame = v29.CFrame
					local now2 = tick()
					local v34

					while true do
						task.wait()
						Teleport(v29, v31.CFrame, CFrame.new(0, -1.5, 1.5))
						v34 = Ownerboat(v31)
						if not (not v29 or not v30 or v30.Health <= 0 or not v31 or not v33 or v33.Health <= 0 or v34 or tick() - now2 > 1) then
							continue
						end
						break
					end

					if v34 then
						Teleport(v31, cFrame, CFrame.new(0, 1.5, -1.5))
						v33.Sit = false
						UnGrab(v31)
					end

					if v29 then
						Teleport(v29, cFrame, CFrame.new(0, 0, 0))
					end
				end
			end
		end
	end,
})

WhichLimbsNeedToDelete = "All"

DeleteLimbs = function()
	if workspace:FindFirstChild("GrabParts") and workspace.GrabParts.GrabPart.WeldConstraint.Part1 and workspace.GrabParts.GrabPart.WeldConstraint.Part1.Parent and workspace.GrabParts.GrabPart.WeldConstraint.Part1.Parent:FindFirstChild("Humanoid") then
		local parent = workspace.GrabParts.GrabPart.WeldConstraint.Part1.Parent

		if parent:FindFirstChild("Humanoid") and parent.Humanoid:FindFirstChild("Ragdolled") and parent.Humanoid.Ragdolled.Value then
			if WhichLimbsNeedToDelete == "Arms" and parent:FindFirstChild("Torso") then
				local cFrame = parent.Torso.CFrame
				workspace.FallenPartsDestroyHeight = -100

				if parent:FindFirstChild("Left Arm") then
					parent["Left Arm"].CFrame = CFrame.new(0, -1000, 0)
				end

				if parent:FindFirstChild("Right Arm") then
					parent["Right Arm"].CFrame = CFrame.new(0, -1000, 0)
				end

				task.wait(0.1)
				parent.Torso.CFrame = CFrame.new(0, -1000, 0)
				task.wait()
				parent.Torso.CFrame = cFrame
			elseif WhichLimbsNeedToDelete == "Legs" and parent:FindFirstChild("Torso") then
				local cFrame = parent.Torso.CFrame
				workspace.FallenPartsDestroyHeight = -100

				if parent:FindFirstChild("Left Leg") then
					parent["Left Leg"].CFrame = CFrame.new(0, -1000, 0)
				end

				if parent:FindFirstChild("Right Leg") then
					parent["Right Leg"].CFrame = CFrame.new(0, -1000, 0)
				end

				task.wait(0.1)
				parent.Torso.CFrame = CFrame.new(0, -1000, 0)
				task.wait()
				parent.Torso.CFrame = cFrame
			elseif WhichLimbsNeedToDelete == "All" and parent:FindFirstChild("Torso") then
				local cFrame = parent.Torso.CFrame
				workspace.FallenPartsDestroyHeight = -100

				if parent:FindFirstChild("Left Arm") then
					parent["Left Arm"].CFrame = CFrame.new(0, -1000, 0)
				end

				if parent:FindFirstChild("Right Arm") then
					parent["Right Arm"].CFrame = CFrame.new(0, -1000, 0)
				end

				if parent:FindFirstChild("Left Leg") then
					parent["Left Leg"].CFrame = CFrame.new(0, -1000, 0)
				end

				if parent:FindFirstChild("Right Leg") then
					parent["Right Leg"].CFrame = CFrame.new(0, -1000, 0)
				end

				task.wait(0.1)
				parent.Torso.CFrame = CFrame.new(0, -1000, 0)
				task.wait()
				parent.Torso.CFrame = cFrame
			end

			task.wait(0.1)

			if AntiVoidEnabled then
				game.Workspace.FallenPartsDestroyHeight = (0 / 0)
			end
		else
			Library:Notify({ Title = "Nil'e", Description = "Ragdoll Target", Time = 1.5, BigIcon = "triangle-alert" })
		end
	end
end

DLTLMBS:AddDropdown("WhichLimbsNeedToDeleteDropdown", {
	Text = "Which Limbs Need To Delete",
	Values = { "Arms", "Legs", "All" },
	Default = "All",
	Multi = false,
	AllowNull = true,
	Callback = function(arg)
		WhichLimbsNeedToDelete = arg
	end,
})

DLTLMBS:AddLabel("Delete Libms"):AddKeyPicker("RemoveLibmsBind", {
	Default = "None",
	Callback = function()
		DeleteLimbs(WhichLimbsNeedToDelete)
	end,
})

FloatingButtons = {}

KBFB:AddDropdown("AllBindables", {
	Text = "Binds",
	Values = {
		"Spawn",
		"Plot 1",
		"Plot 2",
		"Plot 3",
		"Plot 4",
		"Plot 5",
		"Barn",
		"House",
		"Island",
		"Void Platform",
		"Jerk Off",
		"Spawn And Sit Blob",
		"Launch Rocket",
		"Zoom",
		"Struggle",
		"Anchor",
		"Remove Anchor",
		"Toggle WalkSpeed",
		"Toggle JumpPower",
		"Toggle Anti Grab",
		"Toggle Loop Ragdoll",
		"Toggle Loop TP",
		"Toggle Anti Lag",
		"Toggle Anti Network",
		"Toggle Gucci",
		"Toggle Line Lag",
		"Toggle Packet Lag",
		"Stick All",
		"Delete Limbs",
	},
	Default = nil,
	Multi = true,
	AllowNull = true,
	Callback = function(arg)
		for k in arg, nil, nil do
			if k == "Spawn" and not table.find(FloatingButtons, "Spawn") then
				Library:AddDraggableButton("Spawn", function()
					TeleportToLocation(Locations.Spawn)
				end)

				table.insert(FloatingButtons, "Spawn")
			elseif k == "Plot 1" and not table.find(FloatingButtons, "Plot 1") then
				Library:AddDraggableButton("Plot 1", function()
					TeleportToLocation(Locations.Plot1)
				end)

				table.insert(FloatingButtons, "Plot 1")
			elseif k == "Plot 2" and not table.find(FloatingButtons, "Plot 2") then
				Library:AddDraggableButton("Plot 2", function()
					TeleportToLocation(Locations.Plot2)
				end)

				table.insert(FloatingButtons, "Plot 2")
			elseif k == "Plot 3" and not table.find(FloatingButtons, "Plot 3") then
				Library:AddDraggableButton("Plot 3", function()
					TeleportToLocation(Locations.Plot3)
				end)

				table.insert(FloatingButtons, "Plot 3")
			elseif k == "Plot 4" and not table.find(FloatingButtons, "Plot 4") then
				Library:AddDraggableButton("Plot 4", function()
					TeleportToLocation(Locations.Plot4)
				end)

				table.insert(FloatingButtons, "Plot 4")
			elseif k == "Plot 5" and not table.find(FloatingButtons, "Plot 5") then
				Library:AddDraggableButton("Plot 5", function()
					TeleportToLocation(Locations.Plot5)
				end)

				table.insert(FloatingButtons, "Plot 5")
			elseif k == "Barn" and not table.find(FloatingButtons, "Barn") then
				Library:AddDraggableButton("Barn", function()
					TeleportToLocation(Locations.Barn)
				end)

				table.insert(FloatingButtons, "Barn")
			elseif k == "House" and not table.find(FloatingButtons, "House") then
				Library:AddDraggableButton("House", function()
					TeleportToLocation(Locations.House)
				end)

				table.insert(FloatingButtons, "House")
			elseif k == "Island" and not table.find(FloatingButtons, "Island") then
				Library:AddDraggableButton("Island", function()
					TeleportToLocation(Locations.Island)
				end)

				table.insert(FloatingButtons, "Island")
			elseif k == "Void Platform" and not table.find(FloatingButtons, "Void Platform") then
				Library:AddDraggableButton("Void Platform", function()
					TeleportToLocation(Locations["Void Platform"])
				end)

				table.insert(FloatingButtons, "Void Platform")
			elseif k == "Jerk Off" and not table.find(FloatingButtons, "Jerk Off") then
				Library:AddDraggableButton("Jerk Off", function()
					if not JerkOffBoolean then
						JerkOffBoolean = true

						if char then
							local humanoid = char:WaitForChild("Humanoid", 1)

							if humanoid then
								local animator = humanoid:WaitForChild("Animator", 1)

								if animator then
									local animation = Instance.new("Animation", humanoid)
									animation.Name = "Jerk Off"
									animation.AnimationId = "rbxassetid://168268306"
									local v27 = animator:LoadAnimation(animation)
									v27:Play()

									while JerkOffBoolean and task.wait(0.1) do
										v27.TimePosition = 0.275
									end

									v27.TimePosition = 3
									animation:Destroy()
								end
							end
						end
					else
						JerkOffBoolean = false
					end
				end)

				table.insert(FloatingButtons, "Jerk Off")
			elseif k == "Spawn And Sit Blob" and not table.find(FloatingButtons, "Spawn And Sit Blob") then
				Library:AddDraggableButton("Spawn And Sit Blob", function()
					if char then
						local v27 = GetCharPart(char, "HumanoidRootPart")
						local v28 = GetCharPart(char, "Humanoid")

						if v27 and v28 and v28.Health > 0 then
							if toysFolder:FindFirstChild("CreatureBlobman") then
								local vehicleSeat = toysFolder.CreatureBlobman:FindFirstChild("VehicleSeat")

								if vehicleSeat then
									vehicleSeat:Sit(v28)
								else
									DestroyT(toysFolder:FindFirstChild("CreatureBlobman"))
								end
							else
								local CreatureBlobman = NewToy("CreatureBlobman", v27.CFrame * CFrame.new(0, 15, 20))

								if CreatureBlobman then
									local vehicleSeat = toysFolder.CreatureBlobman:WaitForChild("VehicleSeat", 1)

									if vehicleSeat and v28 then
										vehicleSeat:Sit(v28)
									else
										DestroyT(CreatureBlobman)
									end
								end
							end
						end
					end
				end)

				table.insert(FloatingButtons, "Spawn And Sit Blob")
			elseif k == "Launch Rocket" and not table.find(FloatingButtons, "Launch Rocket") then
				Library:AddDraggableButton("Launch Rocket", function()
					LaunchRocket()
				end)

				table.insert(FloatingButtons, "Launch Rocket")
			elseif k == "Zoom" and not table.find(FloatingButtons, "Zoom") then
				local flag9 = false

				Library:AddDraggableButton("Zoom", function()
					flag9 = not flag9

					if flag9 then
						tween:Play()
					else
						tween2:Play()
					end
				end)

				table.insert(FloatingButtons, "Zoom")
			elseif k == "Struggle" and not table.find(FloatingButtons, "Struggle") then
				Library:AddDraggableButton("Struggle", function()
					Struggle:FireServer()
				end)

				table.insert(FloatingButtons, "Struggle")
			elseif k == "Anchor" and not table.find(FloatingButtons, "Anchor") then
				Library:AddDraggableButton("Anchor", function()
					if workspace:FindFirstChild("GrabParts") and workspace.GrabParts:FindFirstChild("GrabPart") then
						local parent = workspace:FindFirstChild("GrabParts").GrabPart.WeldConstraint.Part1.Parent

						if parent then
							AnchorToy(parent)
						end
					end
				end)

				table.insert(FloatingButtons, "Anchor")
			elseif k == "Remove Anchor" and not table.find(FloatingButtons, "Remove Anchor") then
				Library:AddDraggableButton("Remove Anchor", function()
					if workspace:FindFirstChild("GrabParts") and workspace.GrabParts:FindFirstChild("GrabPart") then
						local parent = workspace:FindFirstChild("GrabParts").GrabPart.WeldConstraint.Part1.Parent

						if parent then
							for _, v27 in parent:GetChildren() do
								if v27 and v27:FindFirstChild("BodyPosition") then
									v27:FindFirstChild("BodyPosition"):Destroy()
								end

								if v27 and v27:FindFirstChild("BodyGyro") then
									v27:FindFirstChild("BodyGyro"):Destroy()
								end

								if v27 and v27.Parent and v27.Parent:FindFirstChild("Anchoredesp") then
									v27.Parent:FindFirstChild("Anchoredesp"):Destroy()
								end
							end
						end
					end
				end)

				table.insert(FloatingButtons, "Remove Anchor")
			elseif k == "Toggle WalkSpeed" and not table.find(FloatingButtons, "Toggle WalkSpeed") then
				Library:AddDraggableButton("Toggle WalkSpeed", function()
					if WalkSpeedEnabled then
						Toggles.WalkSpeedToggle:SetValue(false)
					else
						Toggles.WalkSpeedToggle:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle WalkSpeed")
			elseif k == "Toggle JumpPower" and not table.find(FloatingButtons, "Toggle JumpPower") then
				Library:AddDraggableButton("Toggle JumpPower", function()
					if JumpPowerEnabled then
						Toggles.JumpPowerToggle:SetValue(false)
					else
						Toggles.JumpPowerToggle:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle JumpPower")
			elseif k == "Toggle Anti Grab" and not table.find(FloatingButtons, "Toggle Anti Grab") then
				Library:AddDraggableButton("Toggle Anti Grab", function()
					if antigrab then
						Toggles.AntiGrab:SetValue(false)
					else
						Toggles.AntiGrab:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Anti Grab")
			elseif k == "Toggle Loop Ragdoll" and not table.find(FloatingButtons, "Toggle Loop Ragdoll") then
				Library:AddDraggableButton("Toggle Loop Ragdoll", function()
					if rag then
						Toggles.LoopRagdoll:SetValue(false)
					else
						Toggles.LoopRagdoll:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Loop Ragdoll")
			elseif k == "Toggle Loop TP" and not table.find(FloatingButtons, "Toggle Loop TP") then
				Library:AddDraggableButton("Toggle Loop TP", function()
					if LoopTP then
						Toggles.LoopTp:SetValue(false)
					else
						Toggles.LoopTp:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Loop TP")
			elseif k == "Toggle Anti Lag" and not table.find(FloatingButtons, "Toggle Anti Lag") then
				Library:AddDraggableButton("Toggle Anti Lag", function()
					if AntiLagg then
						Toggles.AntiLag:SetValue(false)
					else
						Toggles.AntiLag:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Anti Lag")
			elseif k == "Toggle Anti Network" and not table.find(FloatingButtons, "Toggle Anti Network") then
				Library:AddDraggableButton("Toggle Anti Network", function()
					if AntiNet then
						Toggles.AntiNetwork:SetValue(false)
					else
						Toggles.AntiNetwork:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Anti Network")
			elseif k == "Toggle Gucci" and not table.find(FloatingButtons, "Toggle Gucci") then
				Library:AddDraggableButton("Toggle Gucci", function()
					if AutoGucci then
						Toggles.AutoGucci:SetValue(false)
					else
						Toggles.AutoGucci:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Gucci")
			elseif k == "Toggle Line Lag" and not table.find(FloatingButtons, "Toggle Line Lag") then
				Library:AddDraggableButton("Toggle Line Lag", function()
					if lagger then
						Toggles.LagServer:SetValue(false)
					else
						Toggles.LagServer:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Line Lag")
			elseif k == "Toggle Packet Lag" and not table.find(FloatingButtons, "Toggle Packet Lag") then
				Library:AddDraggableButton("Toggle Packet Lag", function()
					if PacketLagg then
						Toggles.PacketLag:SetValue(false)
					else
						Toggles.PacketLag:SetValue(true)
					end
				end)

				table.insert(FloatingButtons, "Toggle Packet Lag")
			elseif k == "Stick All" and not table.find(FloatingButtons, "Stick All") then
				Library:AddDraggableButton("Stick All [Lag]", function()
					StickAll()
				end)

				table.insert(FloatingButtons, "Stick All")
			elseif k == "Delete Limbs" and not table.find(FloatingButtons, "Delete Limbs") then
				Library:AddDraggableButton("Delete Limbs", function()
					DeleteLimbs(WhichLimbsNeedToDelete)
				end)

				table.insert(FloatingButtons, "Delete Limbs")
			end
		end
	end,
})

PC = INFO:AddLabel("Players: " .. #P:GetPlayers() .. "/25")
KC = INFO:AddLabel("Total Kicks: " .. KickCount)

INFO:AddButton("FindCheaters", {
	Text = "Find Cheaters",
	Func = function()
		for _, v27 in P:GetPlayers() do
			if v27 ~= LocalPlayer and workspace:FindFirstChild(v27.Name .. "SpawnedInToys") then
				local v28 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

				for _, v29 in v28:GetChildren() do
					if v29:FindFirstChild("StickyWeld", true) and v29:FindFirstChild("StickyWeld", true).Part1 and v29:FindFirstChild("StickyWeld", true).Part1.Name == "FirePlayerPart" then
						Library:Notify({
							Title = "Nil'e",
							Description = "Cheater Found: " .. v27.DisplayName .. " [" .. v27.Name .. "]",
							Time = 3,
							BigIcon = "triangle-alert",
						})

						break
					end
				end
			end
		end
	end,
})

INFO:AddButton("RejoinServer", {
	Text = "Rejoin",
	Func = function()
		if #P:GetPlayers() <= 1 then
			LocalPlayer:Kick()
			task.wait(0.25)
			game:GetService("TeleportService"):Teleport(game.PlaceId, LocalPlayer, nil)
		else
			game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, LocalPlayer, nil, nil)
		end
	end,
})

AutoSlots = false
SlotsTimeText = workspace.Slots:FindFirstChild("Slots").Screen.SlotGui.TimeLeftFrame.TimeText
SlotsTimeLeft = SL:AddLabel("Time Left: 15:00")

SlotsTimeText:GetPropertyChangedSignal("Text"):Connect(function()
	SlotsTimeLeft:SetText("Time Left: " .. SlotsTimeText.Text)
end)

SL:AddToggle("AutoSlots", {
	Text = "Auto Spin Slots",
	Default = false,
	Callback = function(arg)
		AutoSlots = arg

		while AutoSlots and task.wait() do
			if SlotsTimeText.Text == "0:00" and AutoSlots then
				for _, v27 in workspace.Slots:GetChildren() do
					local v28, v29, v30 = GetHRH(char)

					if v29 and v30 and v30.Health > 0 then
						local cFrame = v29.CFrame

						for i = 1, 10 do
							if v29 and v30 and v30.Health > 0 and SlotsTimeText.Text == "0:00" and AutoSlots then
								Teleport(v29, v27.Spin2.CFrame, CFrame.new(0, -6, -7))
								Ownerboat(v27.SlotHandle.Handle)
								task.wait(0.05)
							end
						end

						if v29 then
							Teleport(v29, cFrame, CFrame.new(0, 0, 0))
						end
					end
				end
			end
		end
	end,
})

BarrierStatus = BR:AddLabel("Barrier Status: Working 🔴")
BreakBarrierEnabled = false

BR:AddToggle("BreakBarrierToggle", {
	Text = "Break Barrier",
	Default = false,
	Callback = function(arg)
		BreakBarrierEnabled = arg

		while BreakBarrierEnabled and task.wait() do
			if char then
				local v27, v28, v29 = GetHRH(char)

				if v28 and v29 and v29.Health > 0 then
					local FoodHamburger = NewToy("FoodHamburger", CFrame.new(0, 1000, 0))

					if FoodHamburger then
						local holdPart = FoodHamburger:WaitForChild("HoldPart", 1)

						if holdPart then
							local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 1)
							local rigidConstraint = holdPart:WaitForChild("RigidConstraint", 1)

							if holdItemRemoteFunction and rigidConstraint and not rigidConstraint.Attachment1 and v28 and v29 and v29.Health > 0 then
								local cFrame = v28.CFrame
								local cframe = CFrame.new
								Teleport(v28, CFrame.new(400, -8, 535), cframe(0, 0, 0))
								task.wait(0.15)
								local now2 = tick()

								while true do
									task.wait()
									holdItemRemoteFunction:InvokeServer(FoodHamburger, char)
									if not (not BreakBarrierEnabled or not v29 or v29.Health <= 0 or not rigidConstraint or not rigidConstraint.Parent or rigidConstraint.Attachment1 or tick() - now2 > 1.5) then
										continue
									end
									break
								end

								if v28 and v29 and v29.Health > 0 and rigidConstraint and rigidConstraint.Parent and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
									DestroyT(FoodHamburger)
									task.wait(0.2)

									if v28 then
										Teleport(v28, cFrame, CFrame.new(0, 0, 0))
									end

									for _, v30 in toysFolder:GetChildren() do
										if v30.Name == "PlantPottedTree" then
											v30.Name = "иди нахуй отсюда"
											DestroyT(v30)
										end
									end

									if NewToy("PlantPottedTree", CFrame.new(400, -8, 535)) then
										local now3 = tick()

										while true do
											task.wait()
											if not (not BreakBarrierEnabled or not toysFolder:FindFirstChild("PlantPottedTree") or tick() - now3 > 1.5) then
												continue
											end
											break
										end

										if toysFolder:FindFirstChild("PlantPottedTree") then
											DestroyT(toysFolder.PlantPottedTree)
											BarrierStatus:SetText("Barrier Status: Broken 🟢")
											Toggles.BreakBarrierToggle:SetValue(false)
											Toggles.BreakBarrierToggle:SetDisabled(true)
										end
									end
								else
									DestroyT(FoodHamburger)
								end
							else
								DestroyT(FoodHamburger)
							end
						else
							DestroyT(FoodHamburger)
						end
					end
				end
			end
		end
	end,
})

BR:AddDivider()
PlotsToBreakTable = {}

SpawnKunaiToBreakPlotArea = function(arg)
	if AntiKickEnabled and not AntiKickSticked then
		return
	end

	if char then
		local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
		local humanoid = char:FindFirstChild("Humanoid")

		if humanoidRootPart and humanoid and humanoid.Health > 0 and LocalPlayer.CanSpawnToy.Value and not LocalPlayer.InPlot.Value then
			SpawnToy("NinjaShuriken", humanoidRootPart.CFrame * CFrame.new(0, 15, 20))
			local ninjaShuriken = toysFolder:WaitForChild("NinjaShuriken", 1)

			if ninjaShuriken then
				ninjaShuriken.Name = "Plot[" .. arg .. "]Breaker"

				task.spawn(function()
					if ninjaShuriken and ninjaShuriken.Parent == toysFolder then
						local ninjaShuriken2 = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
						:WaitForChild("NinjaShuriken", 1)

						if ninjaShuriken2 then
							ninjaShuriken2.Name = "PlotBreaker[" .. arg .. "]"
							ninjaShuriken2.ViewItemButton.Season.Visible = true
							ninjaShuriken2.ViewItemButton.Season.Text = "Plot Breaker [" .. arg .. "]"
						end
					end
				end)

				local stickyPart = ninjaShuriken:WaitForChild("StickyPart", 1)
				local soundPart = ninjaShuriken:WaitForChild("SoundPart", 1)

				if stickyPart and soundPart then
					while true do
						task.wait()
						SetNetworkOwner:FireServer(soundPart, soundPart.CFrame)
						local flag9 = not soundPart

						if not flag9 then
							flag9 = soundPart:FindFirstChild("PartOwner")

							if flag9 then
								local name = LocalPlayer.Name
								flag9 = soundPart:FindFirstChild("PartOwner").Value == name
							end
						end

						if not (flag9 or not humanoidRootPart or not humanoid or humanoid.Health <= 0) then
							continue
						end
						break
					end

					local partOwner = soundPart and soundPart:FindFirstChild("PartOwner")

					if partOwner then
						local name = LocalPlayer.Name
						partOwner = soundPart:FindFirstChild("PartOwner").Value == name
					end

					if partOwner then
						local cframe = CFrame.new
						StickyPartEvent:FireServer(stickyPart, workspace.Plots:FindFirstChild("Plot" .. arg).PlotArea,
							cframe(2.3e9, 2.3e9, 2.3e9))
					end
				end
			end
		end
	end
end

BR:AddDropdown("PlotsToBreak", {
	Text = "Select Plots",
	Values = { "Plot1", "Plot2", "Plot3", "Plot4", "Plot5" },
	ValueImages = {
		Plot1 = "rbxassetid://8989327148",
		Plot2 = "rbxassetid://8989326312",
		Plot3 = "rbxassetid://9909725942",
		Plot4 = "rbxassetid://9909733734",
		Plot5 = "rbxassetid://9108988013",
	},
	Default = nil,
	Multi = true,
	Callback = function(arg)
		table.clear(PlotsToBreakTable)

		for k in arg, nil, nil do
			table.insert(PlotsToBreakTable, k)
		end
	end,
})

BreakPlotAreaBoolean = false

BR:AddToggle("BreakPlotAreaToggle", {
	Text = "Break Area",
	Default = false,
	Callback = function(arg)
		if arg then
			BreakPlotAreaBoolean = true

			while BreakPlotAreaBoolean and task.wait() do
				for _, v27 in PlotsToBreakTable, nil, nil do
					if v27 == "Plot1" then
						if not toysFolder:FindFirstChild("Plot[1]Breaker") then
							SpawnKunaiToBreakPlotArea(1)
						end
					end

					if v27 == "Plot2" then
						if not toysFolder:FindFirstChild("Plot[2]Breaker") then
							SpawnKunaiToBreakPlotArea(2)
						end
					end

					if v27 == "Plot3" then
						if not toysFolder:FindFirstChild("Plot[3]Breaker") then
							SpawnKunaiToBreakPlotArea(3)
						end
					end

					if v27 == "Plot4" then
						if not toysFolder:FindFirstChild("Plot[4]Breaker") then
							SpawnKunaiToBreakPlotArea(4)
						end
					end

					if v27 == "Plot5" then
						if not toysFolder:FindFirstChild("Plot[5]Breaker") then
							SpawnKunaiToBreakPlotArea(5)
						end
					end
				end
			end
		else
			BreakPlotAreaBoolean = false
		end
	end,
})

LoopAllNoBlobmanMethod = "Bring"
LoopAllNoBlobmanEnabled = false
PositionToBring = nil

SRVFNB:AddDropdown("LoopAllNoBlobmanMethods", {
	Text = "Methods",
	Values = { "Bring", "Void" },
	ValueImages = { Bring = "map-pin", Void = "arrow-down-from-line" },
	Default = "Bring",
	Multi = false,
	Callback = function(arg)
		LoopAllNoBlobmanMethod = arg
	end,
})

SRVFNB:AddToggle("LoopAllNoBlobmanToggle", {
	Text = "Loop All",
	Default = false,
	Callback = function(arg)
		LoopAllNoBlobmanEnabled = arg

		if char then
			local v27 = GetCharPart(char, "HumanoidRootPart")

			if v27 then
				PositionToBring = v27.CFrame
			end
		end

		local v27

		while LoopAllNoBlobmanEnabled and task.wait() do
			if char then
				local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
				local humanoid = char:FindFirstChild("Humanoid")

				if humanoidRootPart and humanoid and humanoid.Health > 0 then
					for _, v28 in P:GetPlayers() do
						if v28 ~= LocalPlayer and not table.find(AllWhitelisted, v28) and v28.Character and v28:FindFirstChild("InPlot") and not v28.InPlot.Value and LoopAllNoBlobmanEnabled then
							local head = v28.Character:FindFirstChild("Head")
							local humanoid2 = v28.Character:FindFirstChild("Humanoid")

							if head and humanoid2 and humanoid2.Health > 0 then
								if not (LoopAllNoBlobmanMethod == "Void" and head.CFrame.Position.Y <= -100) then
									while true do
										task.wait()
										Teleport(humanoidRootPart, head.CFrame, CFrame.new(0, -1.5, 1.5))
										v27 = Ownerboat(head)
										if not (not LoopAllNoBlobmanEnabled or v28:FindFirstChild("InPlot") and v28.InPlot.Value or not head or not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart or v27) then
											continue
										end
										break
									end

									if v27 then
										if LoopAllNoBlobmanMethod == "Bring" then
											Teleport(head, PositionToBring, CFrame.new(0, 0, 0))
										elseif LoopAllNoBlobmanMethod == "Void" then
											head.Velocity = Vector3.new(0, -100000000, 0)
										end

										UnGrab(head)
									end

									if humanoidRootPart then
										Teleport(humanoidRootPart, PositionToBring, CFrame.new(0, 0, 0))
									end
								end
							end
						end
					end
				end
			end
		end
	end,
})

LoopAllBlobmanMethod = "Bring"
LoopAllBlobmanEnabled = false

SRVFB:AddDropdown("LoopAllBlobmanMethods", {
	Text = "Methods",
	Values = { "Bring", "Kill" },
	ValueImages = { Bring = "map-pin", Kill = "skull" },
	Default = "Bring",
	Multi = false,
	Callback = function(arg)
		LoopAllBlobmanMethod = arg
	end,
})

SRVFB:AddToggle("LoopAllBlobmanToggle", {
	Text = "Loop All",
	Default = false,
	Callback = function(arg)
		LoopAllBlobmanEnabled = arg

		while LoopAllBlobmanEnabled and task.wait() do
			for _, v27 in P:GetPlayers() do
				if v27 ~= LocalPlayer and not table.find(AllWhitelisted, v27) and v27.Character then
					local v28, v29, v30 = GetHRH(char)
					local v31, v32, v33 = GetHRH(v27.Character)

					if v28 and v29 and v30 and v30.Health > 0 and v31 and v32 and v33 and v33.Health > 0 and not v33.Sit and LoopAllBlobmanEnabled then
						if v30.SeatPart and v30.SeatPart.Parent then
							local parent = v30.SeatPart.Parent
							local blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")
							local humanoidRootPart = parent:FindFirstChild("HumanoidRootPart")
							local leftDetector = parent:FindFirstChild("LeftDetector")

							if blobmanSeatAndOwnerScript and humanoidRootPart and leftDetector then
								local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
								local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
								local leftWeld = leftDetector:FindFirstChild("LeftWeld")

								if creatureGrab and creatureRelease and leftWeld then
									local now2 = tick()
									local cFrame = v29.CFrame

									while true do
										task.wait(0.01)
										Teleport(v29, v32.CFrame, CFrame.new(0, 7, 3))
										creatureGrab:FireServer(leftDetector, v32, leftWeld)
										if not (not LoopAllBlobmanEnabled or not v30 or not v30.SeatPart or not v30.SeatPart.Parent or not v32 or not v33 or v33.Health <= 0 or leftWeld.Attachment0 and leftWeld.Attachment0.Parent == v32 or tick() - now2 > 1) then
											continue
										end
										break
									end

									if v30 and v30.SeatPart and v30.SeatPart.Parent and v32 and leftWeld and leftWeld.Attachment0 and leftWeld.Attachment0.Parent == v32 then
										if LoopAllBlobmanMethod == "Bring" then
											creatureRelease:FireServer(leftWeld)
											local bodyPosition = Instance.new("BodyPosition", v32)
											bodyPosition.Position = cFrame.Position
											bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
											bodyPosition.D = 100

											task.spawn(function()
												task.wait(0.25)

												if bodyPosition then
													bodyPosition:Destroy()
												end
											end)
										elseif LoopAllBlobmanMethod == "Kill" then
											creatureRelease:FireServer(leftWeld)
											v33:ChangeState("Dead")
										end
									end

									if v29 then
										Teleport(v29, cFrame, CFrame.new(0, 0, 0))
									end
								end
							end
						end
					end
				end
			end
		end
	end,
})

SRVFB:AddButton("KickAll", {
	Text = "Kick All",
	Tooltip = "With Blobman",
	Func = function()
		if char then
			local humanoid = char:FindFirstChild("Humanoid")
			local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")

			if humanoidRootPart and humanoid and humanoid.Health > 0 and humanoid.SeatPart then
				local parent = humanoid.SeatPart.Parent

				if parent and parent.Name == "CreatureBlobman" then
					local humanoidRootPart2 = parent:FindFirstChild("HumanoidRootPart")
					local blobmanSeatAndOwnerScript = parent:FindFirstChild("BlobmanSeatAndOwnerScript")

					if blobmanSeatAndOwnerScript and humanoidRootPart2 then
						KABlobGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
						KABlobRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")

						if KABlobGrab and KABlobRelease then
							KABlobLDetector = parent:FindFirstChild("LeftDetector")

							if KABlobLDetector then
								KABlobLWeld = KABlobLDetector:FindFirstChild("LeftWeld")

								if KABlobLWeld then
									for _, v27 in P:GetPlayers() do
										if v27 ~= LocalPlayer and not table.find(AllWhitelisted, v27) and v27.Character then
											local humanoidRootPart3 = v27.Character:FindFirstChild("HumanoidRootPart")
											local humanoid2 = v27.Character:FindFirstChildOfClass("Humanoid")

											if humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 and humanoidRootPart and humanoid and humanoid.Health > 0 and humanoid.SeatPart and humanoid.SeatPart.Parent == parent then
												for i = 1, 30 do
													humanoidRootPart.CFrame = humanoidRootPart3.CFrame *
													CFrame.new(0, 3, 3)
													humanoidRootPart.Velocity = Vector3.zero
													humanoidRootPart.RotVelocity = Vector3.zero
													KABlobGrab:FireServer(KABlobLDetector, humanoidRootPart3, KABlobLWeld)
													KABlobRelease:FireServer(KABlobLWeld)
													task.wait()
												end
											end
										end
									end

									if humanoidRootPart and humanoid and humanoid.Health > 0 and humanoid.SeatPart and humanoid.SeatPart.Parent == parent then
										humanoidRootPart2.CFrame = CFrame.new(0, 250, 0)
										humanoidRootPart2.Velocity = Vector3.zero
										humanoidRootPart2.RotVelocity = Vector3.zero
										local bodyPosition = Instance.new("BodyPosition", humanoidRootPart2)
										bodyPosition.Position = Vector3.new(0, 250, 0)
										bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										bodyPosition.D = 100
										Instance.new("BodyGyro", humanoidRootPart2).MaxTorque = Vector3.new(math.huge,
											math.huge, math.huge)
										local tbl7 = {}

										for _, v27 in P:GetPlayers() do
											if v27 ~= LocalPlayer then
												table.insert(tbl7, v27)
											end
										end

										if #tbl7 == 0 then
											return
										end

										for k, v27 in P:GetPlayers() do
											if v27 ~= LocalPlayer and not table.find(AllWhitelisted, v27) and v27.Character then
												local humanoidRootPart3 = v27.Character:FindFirstChild(
												"HumanoidRootPart")
												local humanoid2 = v27.Character:FindFirstChildOfClass("Humanoid")

												if humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 then
													local n49 = k * 6.2831853071795862 / #tbl7
													local n50 = math.cos(n49) * 20
													local n51 = math.sin(n49) * 20
													local bodyPosition2 = Instance.new("BodyPosition", humanoidRootPart3)
													bodyPosition2.Position = Vector3.new(n50, 250, n51)
													bodyPosition2.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
													bodyPosition2.D = 100
													Instance.new("BodyGyro", humanoidRootPart3).MaxTorque = Vector3.new(
													math.huge, math.huge, math.huge)
												end
											end
										end

										task.wait(0.25)

										for _, v27 in P:GetPlayers() do
											if v27 ~= LocalPlayer and not table.find(AllWhitelisted, v27) and v27.Character then
												local humanoidRootPart3 = v27.Character:FindFirstChild(
												"HumanoidRootPart")
												local humanoid2 = v27.Character:FindFirstChildOfClass("Humanoid")

												if humanoidRootPart3 and humanoid2 and humanoid2.Health > 0 and humanoidRootPart and humanoid and humanoid.Health > 0 and humanoid.SeatPart and humanoid.SeatPart.Parent == parent then
													task.spawn(function()
														for i = 1, 5 do
															SetNetworkOwner:FireServer(humanoidRootPart3,
																humanoidRootPart3.CFrame)
															GrabEvents.DestroyGrabLine:FireServer(humanoidRootPart3)
															task.wait()
															KABlobGrab:FireServer(KABlobLDetector, humanoidRootPart3,
																KABlobLWeld)
														end
													end)
												end
											end
										end

										task.spawn(function()
											task.wait(3)

											for _, v27 in P:GetPlayers() do
												if v27 ~= LocalPlayer and not table.find(AllWhitelisted, v27) and v27.Character then
													local humanoidRootPart3 = v27.Character:FindFirstChild(
													"HumanoidRootPart")

													if humanoidRootPart3 and humanoidRootPart3:FindFirstChild("BodyPosition") then
														humanoidRootPart3:FindFirstChild("BodyPosition"):Destroy()
													end

													if humanoidRootPart3 and humanoidRootPart3:FindFirstChild("BodyGyro") then
														humanoidRootPart3:FindFirstChild("BodyGyro"):Destroy()
													end
												end
											end
										end)

										task.wait(0.5)

										if parent and parent.Parent == toysFolder then
											DestroyT(parent)
										end
									end
								end
							end
						end
					end
				else
					Library:Notify({
						Title = "Nil'e",
						Description = "Sit On Blob",
						Time = PacketNotifyTime,
						BigIcon = "triangle-alert",
					})
				end
			else
				Library:Notify({
					Title = "Nil'e",
					Description = "Sit On Blob",
					Time = PacketNotifyTime,
					BigIcon = "triangle-alert",
				})
			end
		end
	end,
})

StealAllHoldablesMode = "Break"
StealAllHoldablesEnabled = false

SRVF:AddDropdown("StealAllModeDropdown", {
	Text = "Steal Mode",
	Values = { "Hold", "Use", "Break", "Delete" },
	ValueImages = { Hold = "hand-grab", Use = "pointer", Break = "bone-fracture", Delete = "trash-2" },
	Default = "Break",
	Multi = false,
	Callback = function(arg)
		StealAllHoldablesMode = arg
	end,
})

SRVF:AddToggle("StealAllHoldablesToggle", {
	Text = "Steal All Holdables",
	Default = false,
	Callback = function(arg)
		StealAllHoldablesEnabled = arg

		while StealAllHoldablesEnabled and task.wait(0.1) do
			if char then
				for _, v27 in P:GetPlayers() do
					if v27 ~= LocalPlayer then
						local v28 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

						if v28 then
							for _, v29 in v28:GetChildren() do
								if v29:FindFirstChild("HoldPart") and v29.Name ~= "Broken" then
									local holdItemRemoteFunction = v29.HoldPart:WaitForChild("HoldItemRemoteFunction", 1)
									local dropItemRemoteFunction = v29.HoldPart:WaitForChild("DropItemRemoteFunction", 1)
									local rigidConstraint = v29.HoldPart:WaitForChild("RigidConstraint", 1)

									if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
										task.spawn(function()
											local now2 = tick()

											while true do
												task.wait()
												holdItemRemoteFunction:InvokeServer(v29, char)
												if not (not StealAllHoldablesEnabled or not rigidConstraint or not rigidConstraint.Parent or rigidConstraint.Attachment1 or tick() - now2 > 1) then
													continue
												end
												break
											end

											if rigidConstraint and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
												if StealAllHoldablesMode == "Hold" then
													v29.Name = "Broken"
												elseif StealAllHoldablesMode == "Use" then
													v29.Name = "Broken"
													ReplicatedStorage.HoldEvents.Use:FireServer(v29)
													task.wait(0.1)

													pcall(function()
														dropItemRemoteFunction:InvokeServer(v29)
													end)
												elseif StealAllHoldablesMode == "Break" then
													v29.Name = "Broken"

													pcall(function()
														dropItemRemoteFunction:InvokeServer(v29)
													end)
												elseif StealAllHoldablesMode == "Delete" then
													dropItemRemoteFunction:InvokeServer(v29, CFrame.new(0, -500, 0),
														Vector3.zero)
												end
											end
										end)
									end
								end
							end
						end
					end
				end

				task.wait(0.05)

				for _, v27 in workspace.PlotItems:GetChildren() do
					for _, v28 in v27:GetChildren() do
						if v28:FindFirstChild("HoldPart") and v28.Name ~= "Broken" then
							local holdItemRemoteFunction = v28.HoldPart:WaitForChild("HoldItemRemoteFunction", 1)
							local dropItemRemoteFunction = v28.HoldPart:WaitForChild("DropItemRemoteFunction", 1)
							local rigidConstraint = v28.HoldPart:WaitForChild("RigidConstraint", 1)

							if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
								task.spawn(function()
									local now2 = tick()

									while true do
										task.wait()
										holdItemRemoteFunction:InvokeServer(v28, char)
										if not (not StealAllHoldablesEnabled or not rigidConstraint or not rigidConstraint.Parent or rigidConstraint.Attachment1 or tick() - now2 > 1) then
											continue
										end
										break
									end

									if rigidConstraint and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
										if StealAllHoldablesMode == "Hold" then
											v28.Name = "Broken"
										elseif StealAllHoldablesMode == "Use" then
											v28.Name = "Broken"
											ReplicatedStorage.HoldEvents.Use:FireServer(v28)
											task.wait(0.1)

											pcall(function()
												dropItemRemoteFunction:InvokeServer(v28)
											end)
										elseif StealAllHoldablesMode == "Break" then
											v28.Name = "Broken"

											pcall(function()
												dropItemRemoteFunction:InvokeServer(v28)
											end)
										elseif StealAllHoldablesMode == "Delete" then
											dropItemRemoteFunction:InvokeServer(v28, CFrame.new(0, -500, 0), Vector3
											.zero)
										end
									end
								end)
							end
						end
					end
				end

				task.wait(0.05)

				for _, v27 in workspace.Food:GetChildren() do
					if v27:FindFirstChild("HoldPart") and v27.Name ~= "Broken" then
						local holdItemRemoteFunction = v27.HoldPart:WaitForChild("HoldItemRemoteFunction", 1)
						local dropItemRemoteFunction = v27.HoldPart:WaitForChild("DropItemRemoteFunction", 1)
						local rigidConstraint = v27.HoldPart:WaitForChild("RigidConstraint", 1)

						if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
							task.spawn(function()
								local now2 = tick()

								while true do
									task.wait()
									holdItemRemoteFunction:InvokeServer(v27, char)
									if not (not StealAllHoldablesEnabled or not rigidConstraint or not rigidConstraint.Parent or rigidConstraint.Attachment1 or tick() - now2 > 1) then
										continue
									end
									break
								end

								if rigidConstraint and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
									if StealAllHoldablesMode == "Hold" then
										v27.Name = "Broken"
									elseif StealAllHoldablesMode == "Use" then
										v27.Name = "Broken"
										ReplicatedStorage.HoldEvents.Use:FireServer(v27)
										task.wait(0.1)

										pcall(function()
											dropItemRemoteFunction:InvokeServer(v27)
										end)
									elseif StealAllHoldablesMode == "Break" then
										v27.Name = "Broken"

										pcall(function()
											dropItemRemoteFunction:InvokeServer(v27)
										end)
									elseif StealAllHoldablesMode == "Delete" then
										dropItemRemoteFunction:InvokeServer(v27, CFrame.new(0, -500, 0), Vector3.zero)
									end
								end
							end)
						end
					end
				end

				task.wait(0.05)

				for _, v27 in workspace["NOT New"]:GetChildren() do
					if v27:FindFirstChild("HoldPart") and v27.Name ~= "Broken" then
						local holdItemRemoteFunction = v27.HoldPart:WaitForChild("HoldItemRemoteFunction", 1)
						local dropItemRemoteFunction = v27.HoldPart:WaitForChild("DropItemRemoteFunction", 1)
						local rigidConstraint = v27.HoldPart:WaitForChild("RigidConstraint", 1)

						if holdItemRemoteFunction and dropItemRemoteFunction and rigidConstraint then
							task.spawn(function()
								local now2 = tick()

								while true do
									task.wait()
									holdItemRemoteFunction:InvokeServer(v27, char)
									if not (not StealAllHoldablesEnabled or not rigidConstraint or not rigidConstraint.Parent or rigidConstraint.Attachment1 or tick() - now2 > 1) then
										continue
									end
									break
								end

								if rigidConstraint and rigidConstraint.Attachment1 and rigidConstraint.Attachment1.Parent and rigidConstraint.Attachment1.Parent.Parent and rigidConstraint.Attachment1.Parent.Parent.Name == LocalPlayer.Name then
									if StealAllHoldablesMode == "Hold" then
										v27.Name = "Broken"
									elseif StealAllHoldablesMode == "Use" then
										v27.Name = "Broken"
										ReplicatedStorage.HoldEvents.Use:FireServer(v27)
										task.wait(0.1)

										pcall(function()
											dropItemRemoteFunction:InvokeServer(v27)
										end)
									elseif StealAllHoldablesMode == "Break" then
										v27.Name = "Broken"

										pcall(function()
											dropItemRemoteFunction:InvokeServer(v27)
										end)
									elseif StealAllHoldablesMode == "Delete" then
										dropItemRemoteFunction:InvokeServer(v27, CFrame.new(0, -500, 0), Vector3.zero)
									end
								end
							end)
						end
					end
				end
			end
		end
	end,
})

SRVF:AddToggle("RAI", {
	Text = "Sync All",
	Tooltip = "Anti Invisible Gucci",
	Default = false,
	Callback = function(arg)
		if arg then
			RAI = true

			while RAI and task.wait(0.1) do
				for _, v27 in P:GetPlayers() do
					if v27 ~= LocalPlayer and v27.Character and v27.Character:FindFirstChild("HumanoidRootPart") and v27.Character:FindFirstChild("HumanoidRootPart").Massless then
						v27.Character:FindFirstChild("HumanoidRootPart").Massless = false
					end
				end
			end
		else
			RAI = false
		end
	end,
})

BananaAllESPColor = Color3.fromRGB(237, 198, 255)

SRVF:AddToggle("BananaAll", {
	Text = "Banana All",
	Default = false,
	Callback = function(arg)
		if arg then
			BananaAllBool = true

			while BananaAllBool and RunService.RenderStepped:Wait() do
				local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")
				local humanoid = char:FindFirstChild("Humanoid")

				if humanoidRootPart and humanoid and humanoid.Health > 0 then
					Toggles.BananaAll:SetDisabled(true)

					while true do
						RunService.RenderStepped:Wait()
						if not (LocalPlayer.CanSpawnToy.Value == true or arg == false) then
							continue
						end
						break
					end

					SpawnToy("FoodBanana", humanoidRootPart.CFrame * CFrame.new(0, 5, 20))
					local v27, v28 = GetPlot()

					if v27 and v28 then
						BananAll = v28:WaitForChild("FoodBanana", 1)
					else
						BananAll = toysFolder:WaitForChild("FoodBanana", 1)
					end

					if BananAll then
						BananAll.Name = "BananaAll67"

						task.spawn(function()
							if BananAll and BananAll.Parent == toysFolder then
								local foodBanana = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents
								:WaitForChild("FoodBanana", 1)

								if foodBanana then
									foodBanana.Name = "Banana All"
									foodBanana.ViewItemButton.Season.Visible = true
									foodBanana.ViewItemButton.Season.Text = "Banana All"
								end
							end
						end)

						local holdPart = BananAll:WaitForChild("HoldPart", 1)
						local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 1)
						local dropItemRemoteFunction = holdPart:WaitForChild("DropItemRemoteFunction", 1)
						local soundPart = BananAll:WaitForChild("SoundPart", 1)
						local ediblePart = BananAll:WaitForChild("EdiblePart", 1)

						if holdPart and soundPart and holdItemRemoteFunction and dropItemRemoteFunction then
							if ediblePart then
								pcall(function()
									holdItemRemoteFunction:InvokeServer(BananAll, char)
									RunService.RenderStepped:Wait()
									ReplicatedStorage.HoldEvents.Use:FireServer(BananAll)
								end)

								while true do
									local ediblePart2 = BananAll:FindFirstChild("EdiblePart")
									RunService.RenderStepped:Wait()
									if not (not ediblePart2 or not BananAll or not humanoidRootPart or not humanoid or humanoid and humanoid.Health <= 0 or BananaAllBool == false) then
										continue
									end
									break
								end

								RunService.RenderStepped:Wait()

								pcall(function()
									dropItemRemoteFunction:InvokeServer(BananAll)
								end)

								if BananAll and holdPart and soundPart and humanoidRootPart and humanoid and humanoid.Health > 0 then
									while true do
										SetNetworkOwner:FireServer(soundPart, soundPart.CFrame)
										RunService.RenderStepped:Wait()
										local partOwner = soundPart:FindFirstChild("PartOwner")
										local flag9

										if partOwner then
											local name = LocalPlayer.Name
											flag9 = soundPart:FindFirstChild("PartOwner").Value == name
										else
											flag9 = partOwner
										end

										flag9 = flag9 or not BananAll or not humanoidRootPart or not humanoid or
										humanoid.Health <= 0 or BananaAllBool == false
										if not flag9 then
											continue
										end
										break
									end

									local partOwner = soundPart and soundPart:FindFirstChild("PartOwner")

									if partOwner then
										local name = LocalPlayer.Name
										partOwner = soundPart:FindFirstChild("PartOwner").Value == name
									end

									if partOwner then
										GrabEvents.DestroyGrabLine:FireServer(soundPart)
									end
								end
							end

							soundPart.CanCollide = false
							local highlight = Instance.new("Highlight", BananAll)
							highlight.FillColor = Color3.fromRGB(0, 0, 0)
							highlight.OutlineColor = BananaAllESPColor
							local billboardGui = Instance.new("BillboardGui", BananAll)
							billboardGui.AlwaysOnTop = true
							billboardGui.Size = UDim2.new(5, 50, 1, 50)
							local textLabel = Instance.new("TextLabel", billboardGui)
							textLabel.Size = UDim2.new(1, 0, 1, 0)
							textLabel.Text = "Banana All"
							textLabel.TextScaled = true
							textLabel.BackgroundTransparency = 1
							textLabel.TextColor3 = BananaAllESPColor
							Toggles.BananaAll:SetDisabled(false)

							while RunService.RenderStepped:Wait() and soundPart and BananaAllBool do
								for _, v29 in P:GetPlayers() do
									if v29 ~= LocalPlayer and not table.find(AllWhitelisted, v29) and v29.Character and BananaAllBool then
										local humanoidRootPart2 = v29.Character:FindFirstChild("HumanoidRootPart")
										local humanoidRootPart3 = char:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart2 and humanoidRootPart3 then
											soundPart = BananAll:FindFirstChild("SoundPart")

											if soundPart then
												soundPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -2, 0)
												soundPart.Velocity = Vector3.new(0, 50, 0)
												task.wait(0.15)
											end
										elseif humanoidRootPart3 and BananaAllBool then
											soundPart = BananAll:FindFirstChild("SoundPart")

											if soundPart then
												soundPart.CFrame = humanoidRootPart3.CFrame * CFrame.new(0, 9, 0)
												soundPart.Velocity = Vector3.zero
											end
										end
									elseif BananaAllBool then
										local humanoidRootPart2 = char:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart2 then
											soundPart = BananAll:FindFirstChild("SoundPart")

											if soundPart then
												soundPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, 9, 0)
												soundPart.Velocity = Vector3.zero
											end
										end
									end
								end
							end

							if soundPart then
								task.wait(0.01)
								soundPart.Velocity = Vector3.new(0, -100000, 0)
							end
						end
					end
				end
			end
		else
			BananaAllBool = false

			for _, v27 in toysFolder:GetChildren() do
				if v27.Name == "BananaAll67" or v27.Name == "FoodBanana" then
					DestroyT(v27)
				end
			end
		end
	end,
}):AddColorPicker("BananaAllESPColorPicker", {
	Default = Color3.fromRGB(237, 198, 255),
	Transparency = 0,
	Callback = function(arg)
		BananaAllESPColor = arg
	end,
})

OvenESPColor = Color3.fromRGB(237, 198, 255)

SRVF:AddToggle("AutoExplode", {
	Text = "Auto Explode Bombs",
	Default = false,
	Callback = function(arg)
		if arg then
			AEXP = true

			while AEXP and task.wait(0.1) do
				if char then
					local humanoidRootPart = char:WaitForChild("HumanoidRootPart", 1)

					if humanoidRootPart and LocalPlayer.CanSpawnToy.Value and not LocalPlayer.InPlot.Value then
						SpawnToy("OvenDarkGray", humanoidRootPart.CFrame * CFrame.new(0, 5, 20))
						local ovenDarkGray = toysFolder:WaitForChild("OvenDarkGray", 1)

						if ovenDarkGray then
							ovenDarkGray.Name = "AutoExplode"

							task.spawn(function()
								if ovenDarkGray and ovenDarkGray.Parent == toysFolder then
									local ovenDarkGray2 = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy
									.Contents:WaitForChild("OvenDarkGray", 1)

									if ovenDarkGray2 then
										ovenDarkGray2.Name = "Auto Explode"
										ovenDarkGray2.ViewItemButton.Season.Visible = true
										ovenDarkGray2.ViewItemButton.Season.Text = "Auto Explode"
									end
								end
							end)

							local buttonOven = ovenDarkGray:WaitForChild("ButtonOven", 1)
							local paintPlayerPart = ovenDarkGray:WaitForChild("PaintPlayerPart", 1)
							local glassWindow = ovenDarkGray:WaitForChild("GlassWindow", 1)

							if buttonOven and paintPlayerPart and glassWindow then
								while true do
									SetNetworkOwner:FireServer(buttonOven, buttonOven.CFrame)
									local flag9 = not buttonOven:FindFirstChild("PartOwner")

									if not flag9 then
										flag9 = buttonOven:FindFirstChild("PartOwner")

										if flag9 then
											local name = LocalPlayer.Name
											flag9 = buttonOven:FindFirstChild("PartOwner").Value ~= name
										end
									end

									if flag9 then
										task.wait(0.25)
									end

									local partOwner = buttonOven:FindFirstChild("PartOwner")

									if partOwner then
										local name = LocalPlayer.Name
										partOwner = buttonOven:FindFirstChild("PartOwner").Value == name
									end

									if not (partOwner or not ovenDarkGray or not humanoidRootPart or AEXP == false) then
										continue
									end
									break
								end

								local bodyPosition = Instance.new("BodyPosition", buttonOven)
								bodyPosition.Position = Vector3.new(115, 300, 332)
								bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
								bodyPosition.D = 100
								paintPlayerPart.CFrame = CFrame.new(115, 300, 332)
								glassWindow.CFrame = CFrame.new(115, 297, 332)
								local highlight = Instance.new("Highlight", ovenDarkGray)
								highlight.FillColor = Color3.fromRGB(0, 0, 0)
								highlight.OutlineColor = OvenESPColor
								local billboardGui = Instance.new("BillboardGui", buttonOven)
								billboardGui.AlwaysOnTop = true
								billboardGui.Size = UDim2.new(5, 50, 1, 50)
								local textLabel = Instance.new("TextLabel", billboardGui)
								textLabel.Size = UDim2.new(1, 0, 1, 0)
								textLabel.Text = "Auto Explode"
								textLabel.TextScaled = true
								textLabel.BackgroundTransparency = 1
								textLabel.TextColor3 = OvenESPColor

								while true do
									buttonOven = task.wait(0.05) and AEXP and buttonOven

									if buttonOven then
										buttonOven = ovenDarkGray:FindFirstChild("ButtonOven")
										local paintPlayerPart2 = ovenDarkGray:FindFirstChild("PaintPlayerPart")
										local glassWindow2 = ovenDarkGray:FindFirstChild("GlassWindow")

										if buttonOven and paintPlayerPart2 and glassWindow2 then
											for _, v27 in P:GetPlayers() do
												if v27 ~= LocalPlayer then
													local v28 = game.workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

													if v28 then
														if v28:FindFirstChild("BombMissile") then
															paintPlayerPart2.CFrame = v28.BombMissile:WaitForChild(
															"Part", 1).CFrame
															glassWindow2.CFrame = v28.BombMissile:WaitForChild("Part", 1)
															.CFrame
															task.wait(0.025)
															paintPlayerPart2.CFrame = CFrame.new(115, 300, 332)
															paintPlayerPart2.Velocity = Vector3.zero
															paintPlayerPart2.RotVelocity = Vector3.zero
															glassWindow2.CFrame = CFrame.new(115, 297, 332)
															glassWindow2.Velocity = Vector3.zero
															glassWindow2.RotVelocity = Vector3.zero
														elseif v28:FindFirstChild("BombDarkMatter") then
															paintPlayerPart2.CFrame = v28.BombDarkMatter:WaitForChild(
															"PartHitDetector", 1).CFrame
															glassWindow2.CFrame = v28.BombDarkMatter:WaitForChild(
															"PartHitDetector", 1).CFrame
															task.wait(0.025)
															paintPlayerPart2.CFrame = CFrame.new(115, 300, 332)
															paintPlayerPart2.Velocity = Vector3.zero
															paintPlayerPart2.RotVelocity = Vector3.zero
															glassWindow2.CFrame = CFrame.new(115, 297, 332)
															glassWindow2.Velocity = Vector3.zero
															glassWindow2.RotVelocity = Vector3.zero
														elseif v28:FindFirstChild("BombBalloon") then
															paintPlayerPart2.CFrame = v28.BombBalloon:WaitForChild(
															"Balloon", 1).CFrame
															glassWindow2.CFrame = v28.BombBalloon:WaitForChild("Balloon",
																1).CFrame
															task.wait(0.025)
															paintPlayerPart2.CFrame = CFrame.new(115, 300, 332)
															paintPlayerPart2.Velocity = Vector3.zero
															paintPlayerPart2.RotVelocity = Vector3.zero
															glassWindow2.CFrame = CFrame.new(115, 297, 332)
															glassWindow2.Velocity = Vector3.zero
															glassWindow2.RotVelocity = Vector3.zero
														end
													end
												end
											end

											task.wait(0.05)

											for _, v27 in workspace.PlotItems:GetChildren() do
												for _, v28 in v27:GetChildren() do
													if v28.Name == "BombMissile" then
														paintPlayerPart2.CFrame = v28:WaitForChild("Part", 1).CFrame
														glassWindow2.CFrame = v28:WaitForChild("Part", 1).CFrame
														task.wait(0.025)
														paintPlayerPart2.CFrame = CFrame.new(115, 300, 332)
														paintPlayerPart2.Velocity = Vector3.zero
														paintPlayerPart2.RotVelocity = Vector3.zero
														glassWindow2.CFrame = CFrame.new(115, 297, 332)
														glassWindow2.Velocity = Vector3.zero
														glassWindow2.RotVelocity = Vector3.zero
													elseif v28.Name == "BombDarkMatter" then
														paintPlayerPart2.CFrame = v28:WaitForChild("PartHitDetector", 1)
														.CFrame
														glassWindow2.CFrame = v28:WaitForChild("PartHitDetector", 1)
														.CFrame
														task.wait(0.025)
														paintPlayerPart2.CFrame = CFrame.new(115, 300, 332)
														paintPlayerPart2.Velocity = Vector3.zero
														paintPlayerPart2.RotVelocity = Vector3.zero
														glassWindow2.CFrame = CFrame.new(115, 297, 332)
														glassWindow2.Velocity = Vector3.zero
														glassWindow2.RotVelocity = Vector3.zero
													elseif v28.Name == "BombBalloon" then
														paintPlayerPart2.CFrame = v28:WaitForChild("Balloon", 1).CFrame
														glassWindow2.CFrame = v28:WaitForChild("Balloon", 1).CFrame
														task.wait(0.025)
														paintPlayerPart2.CFrame = CFrame.new(115, 300, 332)
														paintPlayerPart2.Velocity = Vector3.zero
														paintPlayerPart2.RotVelocity = Vector3.zero
														glassWindow2.CFrame = CFrame.new(115, 297, 332)
														glassWindow2.Velocity = Vector3.zero
														glassWindow2.RotVelocity = Vector3.zero
													end
												end
											end
										end

										continue
									end

									break
								end
							end
						end
					end
				end
			end
		else
			AEXP = false

			if toysFolder:FindFirstChild("AutoExplode") then
				DestroyT(toysFolder:FindFirstChild("AutoExplode"))
			end
		end
	end,
}):AddColorPicker("OvenESPColorPicker", {
	Default = Color3.fromRGB(237, 198, 255),
	Transparency = 0,
	Callback = function(arg)
		OvenESPColor = arg
	end,
})

SRVF:AddButton("DestroyTrain", {
	Text = "Delete Train",
	Func = function()
		local objectModel = workspace.Map.AlwaysHereTweenedObjects.Train.Object:FindFirstChild("ObjectModel")

		if objectModel and objectModel:FindFirstChild("Seat") and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char:FindFirstChild("Humanoid").Health > 0 then
			task.spawn(function()
				Toggles.AntiVoid:SetValue(true)
			end)

			local cFrame = char:FindFirstChild("HumanoidRootPart").CFrame

			while true do
				RunService.RenderStepped:Wait()
				local v27 = char
				objectModel:FindFirstChild("Seat"):Sit(v27:FindFirstChild("Humanoid"))
				local flag9 = not objectModel:FindFirstChild("Seat")

				if not flag9 then
					local v28 = char
					flag9 = objectModel:FindFirstChild("Seat").Occupant == v28:FindFirstChild("Humanoid")
				end

				if not (flag9 or not char:FindFirstChild("Humanoid") or char:FindFirstChild("Humanoid").Health <= 0) then
					continue
				end
				break
			end

			while true do
				RunService.RenderStepped:Wait()
				if not (LocalPlayer.CanSpawnToy.Value == true or Value == false) then
					continue
				end
				break
			end

			SpawnToy("FoodHamburger", CFrame.new(0, 100, 0))
			local foodHamburger = toysFolder:WaitForChild("FoodHamburger", 1)

			if foodHamburger then
				local holdPart = foodHamburger:WaitForChild("HoldPart", 1)

				if holdPart then
					local holdItemRemoteFunction = holdPart:WaitForChild("HoldItemRemoteFunction", 1)

					if holdItemRemoteFunction and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChild("Humanoid") and char:FindFirstChild("Humanoid").Health > 0 then
						holdItemRemoteFunction:InvokeServer(foodHamburger, char)
						task.wait(0.25)
						char:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(0, -300, 0)
						task.wait(0.1)
						char:FindFirstChild("Humanoid").Jump = true
						RunService.RenderStepped:Wait()
						char:FindFirstChild("HumanoidRootPart").CFrame = cFrame
						char:FindFirstChild("HumanoidRootPart").Velocity = Vector3.zero
						char:FindFirstChild("HumanoidRootPart").RotVelocity = Vector3.zero
					end
				end

				DestroyT(foodHamburger)
			end
		else
			Library:Notify({ Title = "Nil'e", Description = "Train is Deleted", Time = 1.5, BigIcon = "info" })
		end
	end,
})

lagger = false
LagLinesAmount = 5

SRVL:AddSlider("LinesAmount", {
	Text = "Lines",
	Default = 5,
	Min = 1,
	Max = 10,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		LagLinesAmount = arg
	end,
})

SRVL:AddToggle("LagServer", {
	Text = "Line Lag",
	Default = false,
	Callback = function(arg)
		lagger = arg

		while lagger and task.wait(0.001) do
			for i = 1, LagLinesAmount do
				GrabEvents.CreateGrabLine:FireServer(workspace.SpawnLocation, CFrame.new(-2.3e9, 0, -2.3e9))
			end
		end
	end,
}):AddKeyPicker("ToggleLineLag", {
	Default = "None",
	Callback = function()
		if lagger then
			Library:Notify({ Title = "Nil'e", Description = "Line Lag Off", Time = 1.5, BigIcon = "info" })
			Toggles.LagServer:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Line Lag On", Time = 1.5, BigIcon = "info" })
			Toggles.LagServer:SetValue(true)
		end
	end,
})

SRVL:AddDivider()
CrazyLineInterval = 0.1
CrazyLineEnabled = false

SRVL:AddSlider("CrazyLineInterval", {
	Text = "Interval",
	Default = 0.1,
	Min = 0,
	Max = 0.5,
	Rounding = 2,
	Compact = true,
	Callback = function(arg)
		CrazyLineInterval = arg
	end,
})

SRVL:AddToggle("CrazyLineToggle", {
	Text = "Crazy Line",
	Default = false,
	Callback = function(arg)
		CrazyLineEnabled = arg

		while CrazyLineEnabled and task.wait() do
			for _, v27 in P:GetPlayers() do
				if v27 ~= LocalPlayer and v27.Character then
					local v28, v29, v30 = GetHRH(v27.Character)

					if v28 and v30 and v30.Health > 0 then
						GrabEvents.CreateGrabLine:FireServer(v28, CFrame.new(0, 0, 0))
						task.wait(CrazyLineInterval)
					end
				end
			end
		end

		GrabEvents.CreateGrabLine:FireServer()
	end,
})

SRVL:AddDivider()
LineLagDetector = true
LineLagDetectorTimeOut = false
LastLineLagger = nil

GrabEvents.CreateGrabLine.OnClientEvent:Connect(function(arg, arg2, arg3)
	if LineLagDetector and not LineLagDetectorTimeOut and typeof(arg3) == "CFrame" and (workspace.SpawnLocation.Position - arg3.Position).Magnitude > 100000 and P:FindFirstChild(tostring(arg)) then
		LineLagDetectorTimeOut = true
		local v27 = P:FindFirstChild(tostring(arg))

		if v27 and LastLineLagger ~= v27 then
			LastLineLagger = v27
			local v28 = tostring

			Library:Notify({
				Title = "Nil'e",
				Description = "Line Lag Detected" ..
				"\nPlayer: " ..
				v27.DisplayName ..
				"(" ..
				v27.Name ..
				")" ..
				"\nPart: " ..
				tostring(arg2) ..
				"\nCFrame: " ..
				v28("(" ..
				math.round(arg3.Position.X) ..
				", " .. math.round(arg3.Position.Y) .. ", " .. math.round(arg3.Position.Z) .. ")"),
				Time = 3,
				BigIcon = "triangle-alert",
			})
		end

		task.wait(3.3)
		LineLagDetectorTimeOut = false
		LastLineLagger = nil
	end
end)

SRVL:AddToggle("DetectLineLagToggle", {
	Text = "Detect Line Lag",
	Default = true,
	Callback = function(arg)
		LineLagDetector = arg
	end,
})

SRVL:AddDivider()
StickAllButton = nil
KeepShurikens = false
ShurikensCount = 10
ShurikensNow = {}

SpawnShuriken = function(name)
	if AntiKickEnabled and not AntiKickSticked then
		return
	end

	if char then
		local humanoidRootPart = char:FindFirstChild("HumanoidRootPart")

		if humanoidRootPart then
			while true do
				task.wait()
				if not (not humanoidRootPart or LocalPlayer.CanSpawnToy.Value and not LocalPlayer.InPlot.Value) then
					continue
				end
				break
			end

			SpawnToy("NinjaShuriken", humanoidRootPart.CFrame * CFrame.new(0, 15, 20))
			local ninjaShuriken = toysFolder:WaitForChild("NinjaShuriken", 1)

			if ninjaShuriken then
				local soundPart = ninjaShuriken:WaitForChild("SoundPart", 1)

				if soundPart then
					local now2 = tick()

					while true do
						RunService.RenderStepped:Wait()
						SetNetworkOwner:FireServer(soundPart, soundPart.CFrame)
						local flag9 = not soundPart or not humanoidRootPart or
						(humanoidRootPart.Position - soundPart.Position).Magnitude > 20

						if not flag9 then
							flag9 = soundPart:FindFirstChild("PartOwner")

							if flag9 then
								local name2 = LocalPlayer.Name
								flag9 = soundPart:FindFirstChild("PartOwner").Value == name2
							end
						end

						if not (flag9 or tick() - now2 > 1) then
							continue
						end
						break
					end

					local partOwner = soundPart:FindFirstChild("PartOwner")

					if partOwner then
						local name2 = LocalPlayer.Name
						partOwner = soundPart:FindFirstChild("PartOwner").Value == name2
					end

					if partOwner then
						if not soundPart:FindFirstChild("BodyPosition") then
							local bodyPosition = Instance.new("BodyPosition", soundPart)
							bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
							bodyPosition.D = 100
							local random = math.random
							bodyPosition.Position = Vector3.new(math.random(-100000, 100000), 100000,
								random(-100000, 100000))
						end

						ninjaShuriken.Name = name
						return ninjaShuriken
					end

					DestroyT(ninjaShuriken)
				else
					DestroyT(ninjaShuriken)
				end
			end
		end
	end
end

StickAll = function()
	Toggles.KeepShurikensToggle:SetValue(false)
	task.wait(0.01)

	for _, v27 in toysFolder:GetChildren() do
		if v27.Name == "ShurikensToKeep" then
			v27.Name = "Sticked"

			task.spawn(function()
				local ninjaShuriken = LocalPlayer.PlayerGui.MenuGui.Menu.TabContents.ToyDestroy.Contents:WaitForChild(
				"NinjaShuriken", 1)

				if ninjaShuriken then
					ninjaShuriken.Name = "Sticked"
					ninjaShuriken.ViewItemButton.Season.Visible = true
					ninjaShuriken.ViewItemButton.Season.RichText = true
					ninjaShuriken.ViewItemButton.Season.Size = UDim2.fromScale(1, 1)
					ninjaShuriken.ViewItemButton.Season.Position = UDim2.fromScale(0.5, 1)
					ninjaShuriken.ViewItemButton.Season.Text = "DELETING THIS MAY FREEZE YOUR PING !"
				end
			end)

			local stickyPart = v27:FindFirstChild("StickyPart")
			local soundPart = v27:FindFirstChild("SoundPart")

			if stickyPart and soundPart then
				task.spawn(function()
					stickyPart.Parent = nil
					StickyPartEvent:FireServer(stickyPart, workspace.SpawnLocation,
						CFrame.new(2.3e9, math.random(0, 111), 2.3e9))
				end)
			end
		end
	end
end

SRVL:AddSlider("ShurikensCountSlider", {
	Text = "Shurikens Count",
	Default = 10,
	Min = 1,
	Max = 40,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		ShurikensCount = arg
	end,
})

SRVL:AddToggle("KeepShurikensToggle", {
	Text = "Keep Shurikens",
	Default = false,
	Callback = function(arg)
		if arg then
			KeepShurikens = true

			while KeepShurikens and task.wait() do
				table.clear(ShurikensNow)

				for _, v27 in toysFolder:GetChildren() do
					if v27.Name == "ShurikensToKeep" then
						table.insert(ShurikensNow, v27)
					end
				end

				if #ShurikensNow < ShurikensCount then
					SpawnShuriken("ShurikensToKeep")
				end
			end
		else
			KeepShurikens = false
			table.clear(ShurikensNow)
		end
	end,
})

StickAllButton = SRVL:AddButton({
	Text = "Stick All [Lag]",
	Func = function()
		Library:Notify({ Title = "Nil'e", Description = "Sticked All", Time = 1.5, BigIcon = "info" })
		StickAll()
	end,
})

StickAllButton:AddKeyPicker("StickAllBind", { Default = "None", Mode = "Press" })

CoundSize = function(arg)
	local n49 = 0

	for _, v27 in arg, nil, nil do
		if typeof(v27) == "string" then
			n49 += string.len(v27)
		elseif typeof(v27) == "table" then
			n49 += CoundSize(v27)
		end
	end

	return n49
end

Remotes = {
	Default = "ExtendGrabLine",
	CreateGrabline = "CreateGrabLine",
	RelayClientAnimation = "PlayCreatureAnimation",
}

ScriptSignatures = {
	["Hopium | wsp nigga"] = "Hopium",
	sosososososo = "Neolose",
	["floppa loves you"] = "The Worst (prem)",
	["sex 💖 sex 💖 sex 💖 "] = "Nil'e",
	["BLITZ_HUB | floppa loves you"] = "The Worst (priv)",
	["balls balls balls balls"] = "SRV9 or other skid",
	["❤️❤️❤️❤️❤️😘😘😘😘😍😍😍😍"] = "Mercury",
	["00000000000000000"] = "Resonance",
	A = "Neverlose",
	["❤️❤️❤️❤️❤️"] = "Phoenix hub",
}

AntiDetectPackets = false
PacketLagg = false
PacketInfo = nil
PacketMultipler = 50000
PacketInterval = 1
PacketText = "sex 💖 sex 💖 sex 💖 sex 💖 sex 💖 sex 💖 sex 💖 "
SelfDetect = true
PacketDetector = true
PacketsNotifyTimeOut = false
LastPacketsSource = nil

GrabEvents.ExtendGrabLine.OnClientEvent:Connect(function(arg, arg2)
	if PacketDetector and not PacketsNotifyTimeOut and P:FindFirstChild(arg.Name) then
		local v27 = P:FindFirstChild(arg.Name)
		if not SelfDetect and v27 == LocalPlayer then
			return
		end

		if LastPacketsSource == v27 then
			return
		end

		if typeof(arg2) == "string" then
			LastPacketsSource = v27
			PacketsNotifyTimeOut = true

			Library:Notify({
				Title = "Nil'e",
				Time = 3,
				BigIcon = "triangle-alert",
				Description = "Packets Detected" ..
				"\nPlayer: " ..
				v27.DisplayName ..
				"(" ..
				v27.Name ..
				")" ..
				"\nPacket Size: " ..
				tostring(math.round(string.len(arg2) / 1048576 * 1000) / 1000) ..
				" MB" .. "\nPacket Args: " .. tostring(arg2):sub(1, 40) .. "...",
			})
		elseif typeof(arg2) == "table" then
			LastPacketsSource = v27
			PacketsNotifyTimeOut = true
			TotalPacketSize = CoundSize(arg2)

			Library:Notify({
				Title = "Nil'e",
				Time = 3,
				BigIcon = "triangle-alert",
				Description = "Packets Detected" ..
				"\nPlayer: " ..
				v27.DisplayName ..
				"(" ..
				v27.Name ..
				")" .. "\nPacket Size: " .. tostring(math.round(TotalPacketSize / 1048576 * 1000) / 1000) .. " MB",
			})
		end

		task.wait(3.3)
		LastPacketsSource = nil
		PacketsNotifyTimeOut = false
	end
end)

SRVP:AddInput("PacketMSG", {
	Numeric = false,
	Finished = false,
	ClearTextOnFocus = false,
	Text = "Packet Args",
	Tooltip = "Send Packet With Custom Args",
	Placeholder = "Message Here...",
	Default = "sex 💖 sex 💖 sex 💖 sex 💖 sex 💖 sex 💖 sex 💖 ",
	Callback = function(arg)
		PacketText = arg
		local v27 = PacketMultipler
		PacketInfo:SetText("Packet Size: " .. math.round(string.len(PacketText) * v27 / 1048576 * 1000) / 1000 .. " MB")
	end,
})

SRVP:AddSlider("PacketStrength", {
	Text = "Packet Amount",
	Default = 50000,
	Min = 1,
	Max = 100000,
	Rounding = 0,
	Compact = true,
	Callback = function(arg)
		PacketMultipler = arg
		local v27 = PacketMultipler
		PacketInfo:SetText("Packet Size: " .. math.round(string.len(PacketText) * v27 / 1048576 * 1000) / 1000 .. " MB")
	end,
})

SRVP:AddSlider("PacketsInterval", {
	Text = "Send Interval",
	Default = 1,
	Min = 0.01,
	Max = 1,
	Rounding = 2,
	Compact = true,
	Callback = function(arg)
		PacketInterval = arg
	end,
})

local v27 = PacketMultipler
PacketInfo = SRVP:AddLabel("Packet Size: " .. math.round(string.len(PacketText) * v27 / 1048576 * 1000) / 1000 .. " MB")

SRVP:AddCheckbox("AntiDetectToggle", {
	Text = "Anti Detect",
	Default = false,
	Callback = function(arg)
		AntiDetectPackets = arg
	end,
})

SRVP:AddToggle("PacketLag", {
	Text = "Send Packets",
	Default = false,
	Callback = function(arg)
		if arg then
			PacketLagg = true

			while PacketLagg and task.wait(PacketInterval) do
				if AntiDetectPackets then
					GrabEvents.ExtendGrabLine:FireServer({ pitux = { string.rep(PacketText, PacketMultipler) } })
				else
					GrabEvents.ExtendGrabLine:FireServer(string.rep(PacketText, PacketMultipler))
				end
			end
		else
			PacketLagg = false
		end
	end,
}):AddKeyPicker("TogglePacketLag", {
	Default = "None",
	Callback = function()
		if PacketLagg then
			Library:Notify({ Title = "Nil'e", Description = "Packet Lag Off", Time = 1.5, BigIcon = "info" })
			Toggles.PacketLag:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "Packet Lag On", Time = 1.5, BigIcon = "info" })
			Toggles.PacketLag:SetValue(true)
		end
	end,
})

SRVP:AddButton("SendPacketMessage", {
	Text = "Send Packet",
	Func = function()
		if AntiDetectPackets then
			GrabEvents.ExtendGrabLine:FireServer({ pitux = { string.rep(PacketText, PacketMultipler) } })
		else
			GrabEvents.ExtendGrabLine:FireServer(string.rep(PacketText, PacketMultipler))
		end
	end,
})

SRVP:AddDivider()

SRVP:AddToggle("PacketLagDetecctor", {
	Text = "Detect Packets",
	Default = false,
	Callback = function(arg)
		PacketDetector = arg
	end,
})

ChatSounds = {
	"oi",
	"mommy",
	"daddy",
	"lick",
	"ew",
	"haha",
	"yay",
	"oof",
	"hmm",
	"ree",
	"tehe",
	"kick",
	"ahh",
	"monkey",
	"ooo",
	"grr",
	"nom",
	"one",
	"two",
	"three",
	"four",
	"five",
	"fly",
	"shh",
	"pew",
	"hold",
	"soda",
	"yeehaw",
	"cough",
	"ahem",
	"cry",
	"uwu",
	"mountain",
}

SelectedChatSounds = {}
SoundSpamInterval = 0.1
SoundSpamEnabled = false
ClearChatErrors = nil
MSGSPAM:AddLabel("Enabling this feature may make it difficult to view chat logs!", true)

MSGSPAM:AddDropdown("ChatSoundsDropdown", {
	Text = "Sounds",
	Values = ChatSounds,
	Multi = true,
	Callback = function(arg)
		SelectedChatSounds = arg
	end,
})

MSGSPAM:AddSlider("SoundSpamIntervalSlider", {
	Text = "Sound Spam Interval",
	Default = 0.1,
	Min = 0,
	Max = 0.5,
	Rounding = 2,
	Compact = true,
	Callback = function(arg)
		SoundSpamInterval = arg
	end,
})

MSGSPAM:AddToggle("SoundSpamToggle", {
	Text = "Sound Spam",
	Default = false,
	Callback = function(arg)
		SoundSpamEnabled = arg

		if SoundSpamEnabled then
			ClearChatErrors = game:GetService("CoreGui").ExperienceChat.appLayout.chatWindow.contentFrame.scrollingView
			.bottomLockedScrollView.scrollView.ChildAdded:Connect(function(child)
				if string.find(child.Name, "0-{", 1, true) then
					child.Visible = false
				end
			end)
		end

		while SoundSpamEnabled and task.wait() do
			for k in SelectedChatSounds, nil, nil do
				task.spawn(function()
					TextChatService.TextChannels.RBXGeneral:SendAsync("/w ' " .. k)
				end)

				task.wait(SoundSpamInterval)
			end
		end

		task.wait(0.1)

		if ClearChatErrors then
			ClearChatErrors:Disconnect()
		end
	end,
})

SelectedMapParts = {}
ShurikenBreakers = {}
WatchForGrabParts = nil
BreakMapPartsMode = "Noclip"
SelectedMapPartsLabel = MO:AddLabel("Selected Parts: 0")

MO:AddDropdown("BreakMapPartsModeDropdown", {
	Text = "Break Mode",
	Values = { "Noclip", "Kick" },
	ValueImages = { Noclip = "circle-slash-2", Kick = "ban" },
	Default = "Noclip",
	Callback = function(arg)
		BreakMapPartsMode = arg
	end,
})

SelectedBreakMapPartsColor = Color3.fromRGB(237, 198, 255)

MO:AddLabel("Selected Parts Color"):AddColorPicker("BreakMapPartsColor", {
	Default = Color3.fromRGB(237, 198, 255),
	Transparency = 0,
	Callback = function(arg)
		SelectedBreakMapPartsColor = arg
	end,
})

MO:AddButton({
	Text = "Break Part",
	Func = function()
		Library:Notify({ Title = "Nil'e", Description = "Grab Part", Time = 1.5, BigIcon = "info" })

		WatchForGrabParts = workspace.ChildAdded:Connect(function(child)
			if child.Name == "GrabParts" then
				local part1 = child.GrabPart.WeldConstraint.Part1

				if part1 and part1:IsA("Part") and part1.Anchored and not part1:FindFirstChild("SelectedToBreak") then
					local selectionBox = Instance.new("SelectionBox", part1)
					selectionBox.Adornee = part1
					selectionBox.LineThickness = 0
					selectionBox.SurfaceColor3 = SelectedBreakMapPartsColor
					selectionBox.SurfaceTransparency = 0.75
					selectionBox.Name = "SelectedToBreak"
					table.insert(SelectedMapParts, part1)
					SelectedMapPartsLabel:SetText("Selected Parts: " .. #SelectedMapParts)
					WatchForGrabParts:Disconnect()
					local BreakMapPartsShuriken = SpawnShuriken("BreakMapPartsShuriken")

					if BreakMapPartsMode == "Noclip" then
						StickyPartEvent:FireServer(BreakMapPartsShuriken.StickyPart, part1,
							CFrame.new(2199023255552, 2199023255552, 2199023255552))
					elseif BreakMapPartsMode == "Kick" then
						StickyPartEvent:FireServer(BreakMapPartsShuriken.StickyPart, part1, CFrame.new(0, -2.3e9, 0))
					end

					table.insert(ShurikenBreakers, BreakMapPartsShuriken)
					BreakMapPartsShuriken.Parent = nil
				end
			end
		end)
	end,
}):AddButton({
	Text = "Fix All",
	Func = function()
		for _, v28 in SelectedMapParts, nil, nil do
			if v28:FindFirstChild("SelectedToBreak") then
				v28:FindFirstChild("SelectedToBreak"):Destroy()
			end
		end

		for _, v28 in ShurikenBreakers, nil, nil do
			DestroyT(v28)
		end

		table.clear(SelectedMapParts)
		SelectedMapPartsLabel:SetText("Selected Parts: 0")
	end,
})

MO:AddDivider()
BreakObjectButton = nil
TsunamiShurikensNow = {}

TsunamiButton = MO:AddButton({
	Text = "Flood",
	Func = function()
		BreakObjectButton:SetDisabled(true)
		TsunamiButton:SetDisabled(true)
		Library:Notify({ Title = "Nil'e", Description = "Wait For Shurikens Spawn", Time = 3, BigIcon = "info" })

		while #TsunamiShurikensNow < 10 and RunService.RenderStepped:Wait() do
			table.clear(TsunamiShurikensNow)

			for _, v28 in toysFolder:GetChildren() do
				if v28.Name == "TsunamiShurikens" then
					table.insert(TsunamiShurikensNow, v28)
				end
			end

			if #TsunamiShurikensNow < 10 then
				SpawnShuriken("TsunamiShurikens")
			end
		end

		local objectModel = game.Workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")

		if objectModel then
			local v28 = nil

			for _, v29 in objectModel:GetChildren() do
				if v29.Size == Vector3.new(1680, 80, 1712) then
					v28 = v29
				end
			end

			for _, v29 in toysFolder:GetChildren() do
				if v29.Name == "TsunamiShurikens" then
					local stickyPart = v29:FindFirstChild("StickyPart")
					stickyPart.Parent = nil
					StickyPartEvent:FireServer(stickyPart, v28, CFrame.new(-2.3e9, 2.3e9, -2.3e9))
				end
			end
		end

		table.clear(TsunamiShurikensNow)
		task.wait(3)
		TsunamiButton:SetDisabled(false)
		BreakObjectButton:SetDisabled(false)
	end,
})

MO:AddDivider()
BreakObjectShurikens = {}
MapObjectsPath = workspace.Map.AlwaysHereTweenedObjects
SelectedMapObject = MapObjectsPath.CaveCart.Object

MO:AddDropdown("BreakMapObjectDropdown", {
	Text = "Select Object",
	Values = { "CaveCart", "InnerUFO", "OuterUFO", "LrgDebris", "LrgDebris2", "SmlDebris", "SmlDebris2" },
	Default = "CaveCart",
	Callback = function(arg)
		SelectedMapObject = MapObjectsPath[arg].Object
	end,
})

BreakObjectButton = MO:AddButton({
	Text = "Break Object",
	Func = function()
		TsunamiButton:SetDisabled(true)
		BreakObjectButton:SetDisabled(true)
		Library:Notify({ Title = "Nil'e", Description = "Wait For Shurikens Spawn", Time = 3, BigIcon = "info" })

		if char and SelectedMapObject:FindFirstChild("ObjectModel") then
			if SelectedMapObject:FindFirstChild("FollowThisPart") then
				SelectedMapObject.FollowThisPart:Destroy()
			end

			local objectModel = SelectedMapObject:FindFirstChild("ObjectModel")
			local v28, v29, v30 = GetHRH(char)

			if v29 and v30 then
				local v31 = nil

				for _, v32 in objectModel:GetChildren() do
					if (v32:IsA("Part") or v32:IsA("MeshPart")) and v32.CanQuery then
						v31 = v32
						break
					else
						v31 = nil
					end
				end

				if v31 then
					local cFrame = v29.CFrame
					local now2 = tick()
					local v32

					while true do
						task.wait()
						Teleport(v29, v31.CFrame, CFrame.new(0, 0, 0))
						v32 = Ownerboat(v31)
						if not (not v30 or v30.Health <= 0 or not v29 or not v31 or (v29.Position - v31.Position).Magnitude > 20 or tick() - now2 > 3 or v32) then
							continue
						end
						break
					end

					if v32 then
						Teleport(v29, cFrame, CFrame.new(0, 0, 0))

						while #BreakObjectShurikens < 10 and task.wait() do
							table.clear(BreakObjectShurikens)

							for _, v33 in toysFolder:GetChildren() do
								if v33.Name == "BreakObjectShurikens" then
									table.insert(BreakObjectShurikens, v33)
								end
							end

							if #BreakObjectShurikens < 10 then
								SpawnShuriken("BreakObjectShurikens")
							end
						end

						for _, v33 in toysFolder:GetChildren() do
							if v33.Name == "BreakObjectShurikens" then
								local cframe = CFrame.new
								StickyPartEvent:FireServer(v33:FindFirstChild("StickyPart"), v31, cframe(0, 0, 0))
							end
						end
					elseif v29 then
						Teleport(v29, cFrame, CFrame.new(0, 0, 0))
					end
				end
			end
		end

		task.wait(3)
		table.clear(BreakObjectShurikens)
		BreakObjectButton:SetDisabled(false)
		TsunamiButton:SetDisabled(false)
	end,
})

MO:AddLabel("If objects don't fall, try kick all, and massless grab should also be enabled!", true)
FrameTimer = tick()
FrameCounter = 0
FPS = 0

RunService.RenderStepped:Connect(function()
	FrameCounter = FrameCounter + 1
	local v28 = FrameTimer

	if tick() - v28 >= 0.5 then
		clone.CoinsDisplay.Coins.Text = " FPS:" ..
		FPS * 2 ..
		" \n Ping:" .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. " "
		FPS = FrameCounter
		FrameTimer = tick()
		FrameCounter = 0
	end
end)

Timer = true
local n49 = 0
local n50 = 0

task.spawn(function()
	while Timer and task.wait(1) do
		n49 += 1

		if n49 == 60 then
			n49 = 0
			n50 += 1
		end

		SessionTimer:SetText("Session Time: " .. string.format("%02d:%02d", n50, n49))
	end
end)

local v28 = Tabs["UI Settings"]:AddLeftGroupbox("UI Settings", "app-window")

v28:AddSlider("UICornerSlider", {
	Text = "Corner Radius",
	Default = Library.CornerRadius,
	Min = 0,
	Max = 20,
	Rounding = 0,
	Callback = function(arg)
		Window:SetCornerRadius(arg)
	end,
})

LockedMouse = false

v28:AddToggle("LockMouseToggle", {
	Text = "Lock Mouse",
	Default = false,
	Callback = function(arg)
		LockedMouse = arg

		if LockedMouse then
			while LockedMouse and task.wait() do
				UserInputService.MouseBehavior = Enum.MouseBehavior.LockCenter
			end
		else
			task.wait(0.01)
			UserInputService.MouseBehavior = Enum.MouseBehavior.Default
		end
	end,
}):AddKeyPicker("ToggleLockMouse", {
	Default = "None",
	Callback = function()
		if LockedMouse then
			Library:Notify({ Title = "Nil'e", Description = "Lock Mouse Off", Time = 1.5, BigIcon = "info" })
			Toggles.LockMouseToggle:SetValue(false)
		else
			Library:Notify({ Title = "Nil'e", Description = "LockMouse On", Time = 1.5, BigIcon = "info" })
			Toggles.LockMouseToggle:SetValue(true)
		end
	end,
})

BG:AddInput("BackgroundImageIdInput", {
	Finished = false,
	ClearTextOnFocus = false,
	Text = "Image",
	Placeholder = "Image Link Here...",
	Callback = function(arg)
		local str5 = tostring(os.time())
		writefile(str5 .. ".png", game:HttpGet(arg))
		Window:SetBackgroundImage(getcustomasset(str5 .. ".png"))

		if isfile(str5 .. ".png") then
			delfile(str5 .. ".png")
		end
	end,
})

ImportJsonName = "NewConfig.json"
ImportJson = nil

IMPORT:AddInput("ImportJsonNameInput", {
	Finished = false,
	ClearTextOnFocus = false,
	Text = "File Name",
	Placeholder = "Name Here...",
	Default = "NewConfig",
	Callback = function(arg)
		ImportJsonName = arg .. ".json"
	end,
})

IMPORT:AddInput("ImportJsonInput", {
	Finished = false,
	ClearTextOnFocus = false,
	Text = "Json",
	Placeholder = "Json Here...",
	Callback = function(arg)
		ImportJson = arg
	end,
})

IMPORT:AddButton({
	Text = "Create Config",
	Func = function()
		writefile("Nil'e/Configs/settings/" .. ImportJsonName, ImportJson)
	end,
})

ExportJsonName = nil

EXPORT:AddInput("ExportJsonNameInput", {
	Finished = false,
	ClearTextOnFocus = false,
	Text = "File Name",
	Placeholder = "File Name Here...",
	Default = "NewConfig",
	Callback = function(arg)
		ExportJsonName = "Nil'e/Configs/settings/" .. arg .. ".json"
	end,
})

EXPORT:AddButton({
	Text = "Copy Json",
	Func = function()
		if isfile(ExportJsonName) then
			local v29 = readfile(ExportJsonName)
			setclipboard(v29)
		end
	end,
})

Library.ToggleKeybind = Options.MenuKeybind
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)
SaveManager:IgnoreThemeSettings()
ThemeManager:SetFolder("Nil'e")
SaveManager:SetFolder("Nil'e/Configs")
SaveManager:BuildConfigSection(Tabs["UI Settings"])
ThemeManager:ApplyToTab(Tabs["UI Settings"])
SaveManager:LoadAutoloadConfig()

SaveManager:SetIgnoreIndexes({
	"TargetPlayer",
	"SelectWhitelistedPlayer",
	"SelectPosePlayer",
	"BodyPartsRedactor",
	"SliderHeadRotX",
	"SliderHeadRotY",
	"SliderHeadRotZ",
	"SliderTorsoRotX",
	"SliderTorsoRotY",
	"SliderTorsoRotZ",
	"SliderLARotX",
	"SliderLARotY",
	"SliderLARotZ",
	"SliderRARotX",
	"SliderRARotY",
	"SliderRARotZ",
	"SliderLLRotX",
	"SliderLLRotY",
	"SliderLLRotZ",
	"SliderRLRotX",
	"SliderRLRotY",
	"SliderRLRotZ",
	"SliderHeadOffsetX",
	"SliderHeadOffsetY",
	"SliderHeadOffsetZ",
	"SliderTorsoOffsetX",
	"SliderTorsoOffsetY",
	"SliderTorsoOffsetZ",
	"SliderLAOffsetX",
	"SliderLAOffsetY",
	"SliderLAOffsetZ",
	"SliderRAOffsetX",
	"SliderRAOffsetY",
	"SliderRAOffsetZ",
	"SliderLLOffsetX",
	"SliderLLOffsetY",
	"SliderLLOffsetZ",
	"SliderRLOffsetX",
	"SliderRLOffsetY",
	"SliderRLOffsetZ",
	"ImportPoseJsonNameInput",
	"ImportPoseJsonInput",
	"EXportPoseJsonNameInput",
	"ImportJsonNameInput",
	"ImportJsonInput",
	"EXportJsonNameInput",
})
