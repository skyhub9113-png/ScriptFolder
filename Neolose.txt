local now2
	now2 = os.clock()
	HttpService = game:GetService("HttpService")
	CoreGui = game:GetService("CoreGui")
	Players = game:GetService("Players")
	RunService = game:GetService("RunService")
	UserInputService = game:GetService("UserInputService")
	TeleportService = game:GetService("TeleportService")
	TweenService = game:GetService("TweenService")
	rs = game:GetService("ReplicatedStorage")
	Stats = game:GetService("Stats")

	repeat
		task.wait()
	until Players.LocalPlayer

	plr = Players.LocalPlayer
	LocalPlayer = plr
	UIS = UserInputService
	Mouse = plr:GetMouse()
	DestroyToy = rs:FindFirstChild("MenuToys") and rs.MenuToys:FindFirstChild("DestroyToy")
	SetNetOwner = rs:FindFirstChild("GrabEvents") and rs.GrabEvents:FindFirstChild("SetNetworkOwner")
	CreateLine = rs:FindFirstChild("GrabEvents") and rs.GrabEvents:FindFirstChild("CreateGrabLine")
	DestroyLine = rs:FindFirstChild("GrabEvents") and rs.GrabEvents:FindFirstChild("DestroyGrabLine")
	SpawnToy = rs:FindFirstChild("MenuToys") and rs.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
	Struggle = rs:FindFirstChild("CharacterEvents") and rs.CharacterEvents:FindFirstChild("Struggle")
	Ragdoll = rs:FindFirstChild("CharacterEvents") and rs.CharacterEvents:FindFirstChild("RagdollRemote")
	StickyEvent = rs:FindFirstChild("PlayerEvents") and rs.PlayerEvents:FindFirstChild("StickyPartEvent")
	local fn15, fn16

	do
		local n25 = 0
		local n26 = 0

		fn15 = function(arg, arg2, arg3)
			if not arg or not arg2 then
				return
			end

			if not StickyEvent then
				return
			end

			if typeof(arg3) ~= "CFrame" then
				arg3 = CFrame.new()
			end

			if tick() - n25 < 0.05 then
				return
			end
			n25 = tick()

			pcall(function()
				StickyEvent:FireServer(arg, arg2, arg3)
			end)
		end

		fn16 = function(arg, arg2, arg3, arg4)
			if not arg or not CreateLine then
				return
			end

			if tick() - n26 < 0.2 then
				return
			end
			n26 = tick()

			pcall(function()
				CreateLine:FireServer(arg, arg2 or Vector3.zero, arg3 or arg.Position, arg4 == true)
			end)
		end
	end

	local function fn17()
		local plots = workspace:FindFirstChild("Plots")
		if not plots then
			return
		end

		for _, child in ipairs(plots:GetChildren()) do
			local barrier = child:FindFirstChild("Barrier")

			if barrier then
				for _, child2 in ipairs(barrier:GetChildren()) do
					if child2:IsA("BasePart") then
						child2.CanCollide = false
					end
				end
			end
		end
	end

	task.defer(function()
		fn17()

		workspace.ChildAdded:Connect(function(child)
			if child.Name == "Plots" then
				task.defer(fn17)
			end
		end)
	end)

	char = plr.Character or plr.CharacterAdded:Wait()
	HRP = char:WaitForChild("HumanoidRootPart")
	hum = char:WaitForChild("Humanoid")
	cons = {}
	Seats = {}
	local tbl5
	tbl5 = {}
	local v19, fn18, fn19, fn20, fn21

	do
		local function fn22()
			local name = plr.Name .. "SpawnedInToys"
			local folder_ = workspace:FindFirstChild(name)

			if not folder_ then
				folder_ = Instance.new("Folder")
				folder_.Name = name
				folder_.Parent = workspace
			end

			return folder_
		end

		inv = fn22()

		plr.CharacterAdded:Connect(function(character_)
			task.wait(0.1)

			if character_ then
				HRP = character_:FindFirstChild("HumanoidRootPart") or character_:WaitForChild("HumanoidRootPart", 1)
				hum = character_:FindFirstChild("Humanoid") or character_:WaitForChild("Humanoid", 1)
				char = character_
				inv = fn22()
			end
		end)

		folders = { "m1kp", "m1kp/config" }

		for _, v20 in pairs(folders) do
			if not isfolder(v20) then
				makefolder(v20)
			end
		end

		local function fn23()
			local ok2, result = pcall(function()
				local response = game:HttpGet("https://raw.githubusercontent.com/ludicious-claw/BetterOrion/refs/heads/main/Library.lua")
				local chunk = loadstring(response)
				return chunk and chunk()
			end)

			if ok2 and type(result) == "table" then
				return result
			end

			local function fn24()
				local tbl6 = {}

				setmetatable(tbl6, { __index = function(arg, arg2)
					local function fn25()
						return arg
					end

					rawset(arg, arg2, fn25)
					return fn25
				end })

				return tbl6
			end

			return {
				Flags = {},
				MakeNotification = function()
				end,
				Destroy = function()
				end,
				SetConfigTab = function()
				end,
				LoadAutoloadConfigs = function()
				end,
				SaveAndLoadSizes = function()
				end,
				Init = function()
				end,
				Set = function()
				end,
				Save = function()
				end,
				Get = function()
					return nil
				end,
				MakeWindow = function()
					local v20 = fn24()

					v20.MakeTab = function()
						return fn24()
					end

					return v20
				end,
			}
		end

		v19 = fn23()

		fn18 = function(arg)
			if arg then
				arg.AssemblyLinearVelocity = Vector3.zero
				arg.AssemblyAngularVelocity = Vector3.zero
			end
		end

		fn19 = function(arg)
			if arg and SetNetOwner then
				pcall(function()
					SetNetOwner:FireServer(arg, arg.CFrame)
				end)
			end
		end

		fn20 = function(arg)
			if arg and arg:FindFirstChild("HoldPart") and char then
				pcall(function()
					arg.HoldPart.HoldItemRemoteFunction:InvokeServer(arg, char)
				end)
			end
		end

		fn21 = function(arg, arg2)
			local v20 = nil

			local connection = fn22().ChildAdded:Connect(function(child)
				if child and child.Name == arg then
					v20 = child
				end
			end)

			task.spawn(function()
				pcall(function()
					if SpawnToy then
						SpawnToy:InvokeServer(arg, arg2, Vector3.zero)
					end
				end)
			end)

			time = tick() + 1

			while true do
				task.wait()
				local flag12

				if v20 then
					flag12 = v20
				else
					local v21 = time
					flag12 = tick() > v21
				end

				if not flag12 then
					continue
				end
				break
			end

			if connection then
				connection:Disconnect()
			end

			return v20
		end
	end

	local fn22

	fn22 = function()
		local tbl6 = {}

		if isfolder("m1kp/config") then
			for _, v20 in pairs(listfiles("m1kp/config")) do
				if v20:match("%.m1kp$") then
					table.insert(tbl6, v20:match("([^/\\]+)%.m1kp$"))
				end
			end
		end

		return #tbl6 > 0 and tbl6 or { "default" }
	end

	local function fn23(arg)
		if not arg or arg == "" then
			return
		end
		local loaded = string.gsub(arg, "^%s*(.-)%s*$", "%1")
		local str5 = "m1kp/config/" .. loaded .. ".m1kp"

		if isfile(str5) then
			local ok2, result = pcall(function()
				return HttpService:JSONDecode(readfile(str5))
			end)

			if ok2 and type(result) == "table" then
				for k, v20 in pairs(result) do
					if v19.Flags[k] then
						pcall(function()
							local value = v20.Value

							if type(value) == "string" and string.sub(value, 1, 4) == "HEX:" then
								value = Color3.fromHex(string.sub(value, 5))
							end

							v19.Flags[k]:Set(value)
						end)
					end
				end

				if result.Def_AntiNetFoodToy then
					selectedInputLagToy = result.Def_AntiNetFoodToy.Value
				end

				if result.Def_AntiNetFoodSpeed then
					_G.CycleSpeed = tonumber(result.Def_AntiNetFoodSpeed.Value) or _G.CycleSpeed
				end

				if result.Def_AntiNetFood then
					_G.InstantLagActive = result.Def_AntiNetFood.Value == true
				end

				if _G.UpdateAllHighlights then
					task.spawn(_G.UpdateAllHighlights)
				end

				v19:MakeNotification({ Name = "NeoLose", Content = "Loaded: " .. loaded, Image = "hand", Time = 2 })
			end
		end
	end

	local tbl6

	local v20 = v19:MakeWindow({
		Name = "NL",
		SubNameSide = "Center",
		ShowIcon = true,
		Icon = "crown",
		IntroEnabled = false,
		Size = UDim2.new(0, 700, 0, 600),
		MinSize = UDim2.new(0, 500, 0, 300),
		MaxSize = UDim2.new(0, 9999, 0, 9999),
		Theme = "Default",
		Transparency = 0.15,
		ElementsTransparency = 0.3,
		SearchBar = true,
		ToggleUIKey = Enum.KeyCode.Tab,
	})

	tbl6 = {
		Target = v20:MakeTab({ Name = "Target", Icon = "crosshair" }),
		Blobman = v20:MakeTab({ Name = "Blobman", Icon = "user" }),
		Defense = v20:MakeTab({ Name = "Defense", Icon = "shield" }),
		Visual = v20:MakeTab({ Name = "Visual", Icon = "eye" }),
		Movement = v20:MakeTab({ Name = "Movement", Icon = "chevrons-up" }),
		Teleport = v20:MakeTab({ Name = "Teleport", Icon = "map-pin" }),
		Server = v20:MakeTab({ Name = "Server", Icon = "server" }),
		Notify = v20:MakeTab({ Name = "Notify", Icon = "bell" }),
		Sounds = v20:MakeTab({ Name = "Sounds", Icon = "volume-2" }),
		Auras = v20:MakeTab({ Name = "Auras", Icon = "rbxassetid://10723397268" }),
		Keybinds = v20:MakeTab({ Name = "Keybinds", Icon = "keyboard" }),
		Settings = v20:MakeTab({ Name = "Settings", Icon = "settings" }),
	}

	local v21
	v21 = tbl6.Target:AddSection({ Name = "Kill", Side = "Right" })
	local v22
	v22 = tbl6.Target:AddSection({ Name = "Advanced", Side = "Right" })
	local v23, v24, v25, v26, tbl7, fn24, fn25

	do
		local v27 = tbl6.Target:AddSection({ Name = "List", Side = "Left" })
		local v28 = tbl6.Target:AddSection({ Name = "Destroy gucci", Side = "Left" })
		local v29 = tbl6.Target:AddSection({ Name = "Player", Side = "Left" })
		v23 = tbl6.Target:AddSection({ Name = "Ownership", Side = "Right" })
		v24 = tbl6.Blobman:AddSection({ Name = "List", Side = "Left" })
		v25 = tbl6.Blobman:AddSection({ Name = "Player", Side = "Right" })
		v26 = tbl6.Blobman:AddSection({ Name = "Other", Side = "Left" })

		tbl7 = {
			Name = nil,
			Char = nil,
			HRP = nil,
			Method = nil,
			BlobMethod = nil,
			IsGrabbing = false,
			IsBlobbing = false,
			IsLoopTp = false,
			IsSnowballing = false,
		}

		local connection = nil
		local connection2 = nil

		fn24 = function()
			local tbl8 = { "None" }

			for _, player in pairs(Players:GetPlayers()) do
				if player ~= plr then
					table.insert(tbl8, player.DisplayName .. " (@" .. player.Name .. ")")
				end
			end

			return tbl8
		end

		local v30 = v27:AddDropdown({
			Name = "Player list",
			Options = fn24(),
			MaxSize = 5,
			Flag = "Targ_Player",
			Callback = function(arg)
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				if not arg or arg == "None" or arg == "" then
					tbl7.Name = nil
					return
				end
				tbl7.Name = arg:match("@([%w_%.]+)")

				connection = Players.PlayerAdded:Connect(function(player)
					if tbl7.Name and player.Name == tbl7.Name then
						v19:MakeNotification({ Name = "NeoLose", Content = player.Name .. " has Joined the server", Image = "crown", Time = 4 })
					end
				end)

				connection2 = Players.PlayerRemoving:Connect(function(player)
					if tbl7.Name and player.Name == tbl7.Name then
						if not workspace:FindFirstChild("BlackHoleKick") then
							v19:MakeNotification({
								Name = "NeoLose",
								Content = player.Name .. " has Left the server",
								Image = "crown",
								Time = 4,
							})
						end
					end
				end)
			end,
		})

		Players.PlayerAdded:Connect(function()
			v30:Refresh(fn24(), true)
		end)

		Players.PlayerRemoving:Connect(function()
			task.wait(0.1)
			v30:Refresh(fn24(), true)
		end)

		local tbl8 = {}

		local function fn26(player)
			if player == LocalPlayer then
				return
			end

			local function fn27(character_)
				local humanoid = character_:WaitForChild("Humanoid", 10)

				if humanoid then
					if humanoid.SeatPart then
						tbl8[player.Name] = humanoid.SeatPart
					end

					humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function()
						if humanoid.SeatPart then
							tbl8[player.Name] = humanoid.SeatPart
						end
					end)
				end
			end

			if player.Character then
				fn27(player.Character)
			end

			player.CharacterAdded:Connect(fn27)
		end

		for _, player in pairs(Players:GetPlayers()) do
			fn26(player)
		end

		Players.PlayerAdded:Connect(fn26)
		local tbl9 = {}

		local function fn27(player)
			if player == LocalPlayer then
				return
			end

			local function fn28(character_)
				local humanoid = character_:WaitForChild("Humanoid", 10)

				if humanoid then
					if humanoid.SeatPart then
						tbl9[player.Name] = humanoid.SeatPart
					end

					humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function()
						if humanoid.SeatPart then
							tbl9[player.Name] = humanoid.SeatPart
						end
					end)
				end
			end

			if player.Character then
				fn28(player.Character)
			end

			player.CharacterAdded:Connect(fn28)
		end

		for _, player in pairs(Players:GetPlayers()) do
			fn27(player)
		end

		Players.PlayerAdded:Connect(fn27)

		fn25 = function()
			local name = tbl7 and tbl7.Name and Players:FindFirstChild(tbl7.Name) or currentTargetPlayer
			if not name then
				v19:MakeNotification({ Name = "Error", Content = "Target not selected", Time = 3 })
				return
			end
			local v31 = tbl9[name.Name]
			local cFrame = HRP and HRP.CFrame

			if v31 and v31.Parent and hum and cFrame then
				pcall(function()
					HRP.CFrame = v31.CFrame * CFrame.new(0, -2, 0)
					task.wait(0.1)
					v31:Sit(hum)
					task.wait(0.3)
					HRP.AssemblyLinearVelocity = Vector3.zero
					HRP.CFrame = cFrame
					v19:MakeNotification({ Name = "Kill gucci", Content = "Kill gucci player", Time = 2 })
				end)
			else
				v19:MakeNotification({ Name = "Kill gucci player", Content = "Target is not using gucci", Time = 3 })
			end
		end

		local function fn28()
			local name = tbl7 and tbl7.Name and Players:FindFirstChild(tbl7.Name) or currentTargetPlayer
			if not name or not name.Character then
				v19:MakeNotification({ Name = "Error", Content = "Target not selected", Time = 3 })
				return
			end
			local humanoidRootPart = name.Character:FindFirstChild("HumanoidRootPart")
			local humanoid = name.Character:FindFirstChild("Humanoid")
			if not humanoidRootPart or not humanoid then
				v19:MakeNotification({ Name = "Error", Content = "Target character not ready", Time = 3 })
				return
			end
			local creatureBlobman = inv and (inv:FindFirstChild("CreatureBlobman") or inv:FindFirstChild("blobmangucci"))

			if not creatureBlobman then
				creatureBlobman = fn21("CreatureBlobman", (HRP and HRP.CFrame or CFrame.new(0, 0, 0)) * CFrame.new(0, 4, 0))
			end

			if not creatureBlobman then
				return
			end
			local pivot = char and char:GetPivot()
			humanoidRootPart.Massless = false
			local vehicleSeat = creatureBlobman:FindFirstChild("VehicleSeat")

			if vehicleSeat then
				vehicleSeat:Sit(hum)

				while not hum or not hum.SeatPart do
					task.wait()
				end
			end

			local blobmanSeatAndOwnerScript = creatureBlobman:FindFirstChild("BlobmanSeatAndOwnerScript")
			local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
			local creatureRelease = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
			local rightDetector = creatureBlobman:FindFirstChild("RightDetector")
			local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")

			if creatureBlobman and creatureBlobman:IsDescendantOf(workspace) then
				creatureBlobman:PivotTo(humanoidRootPart.CFrame)
			end

			task.wait(0.15)

			for i = 1, 15 do
				pcall(function()
					if creatureGrab and rightDetector and rightWeld then
						creatureGrab:FireServer(rightDetector, humanoidRootPart, rightWeld)
					end
				end)

				pcall(function()
					if creatureRelease and rightWeld then
						creatureRelease:FireServer(rightWeld, humanoidRootPart)
					end
				end)

				humanoidRootPart.Massless = false

				for i2 = 1, 10 do
					if humanoid then
						humanoid.Sit = true
					end
				end

				task.wait()
			end

			if char and pivot then
				char:PivotTo(pivot)
			end
		end

		v28:AddButton({ Name = "Destroy gucci", Callback = fn25 })
		v28:AddButton({ Name = "Destroy gucci blobman", Callback = fn28 })
		local flag12 = false
		local n25 = 0.1

		v22:AddToggle({
			Name = "Remove invisibility",
			Default = false,
			Flag = "Targ_RemoveInvis",
			Callback = function(arg)
				flag12 = arg

				task.spawn(function()
					while flag12 do
						local name = tbl7.Name and game.Players:FindFirstChild(tbl7.Name)

						if name and name.Character then
							local humanoidRootPart = name.Character:FindFirstChild("HumanoidRootPart")
							local playerCharacterLocationDetector = workspace:FindFirstChild("PlayerCharacterLocationDetector")

							if humanoidRootPart and playerCharacterLocationDetector and playerCharacterLocationDetector:IsA("BasePart") then
								if n25 < (humanoidRootPart.Position - playerCharacterLocationDetector.Position).Magnitude then
									humanoidRootPart.CFrame = playerCharacterLocationDetector.CFrame
									humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
								end
							end
						end

						task.wait()
					end
				end)
			end,
		})

		local n26 = 0

		v29:AddSlider({
			Name = "TP Back Delay (s)",
			Range = { 0, 10 },
			Increment = 0.05,
			Default = 0,
			Flag = "TP_Back_Delay",
			Callback = function(arg)
				n26 = arg
			end,
			Format = function(arg)
				return string.format("(%.2fs)", arg)
			end,
		})

		v29:AddButton({
			Name = "TP to player",
			Callback = function()
				local name = tbl7.Name and Players:FindFirstChild(tbl7.Name)

				if name and name.Character and name.Character:FindFirstChild("HumanoidRootPart") and HRP then
					local cFrame = HRP.CFrame
					HRP.CFrame = name.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

					if n26 > 0 then
						task.wait(n26)

						if HRP then
							HRP.CFrame = cFrame
						end
					end
				end
			end,
		})
	end

	local flag12 = false

	v22:AddToggle({
		Name = "lag food",
		Default = false,
		Flag = "Targ_LagFood",
		Callback = function(arg)
			flag12 = arg
			if not arg then
				return
			end

			task.spawn(function()
				local localPlayer = game.Players.LocalPlayer

				local function fn26(arg2)
					if arg2.Name ~= "HoldPart" then
						return
					end
					local character_ = localPlayer.Character
					local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
					if not character_ or not humanoidRootPart then
						return
					end

					task.spawn(function()
						arg2:FindFirstChild("HoldItemRemoteFunction")
						arg2:FindFirstChild("DropItemRemoteFunction")
						local dropItemRemoteFunction

						while true do
							local holdItemRemoteFunction = arg2.Parent and arg2:FindFirstChild("HoldItemRemoteFunction")
							dropItemRemoteFunction = arg2.Parent and arg2:FindFirstChild("DropItemRemoteFunction")

							if holdItemRemoteFunction then
								task.wait(0.05)

								task.spawn(function()
									pcall(function()
										holdItemRemoteFunction:InvokeServer(arg2.Parent, character_)
									end)
								end)

								local flag13

								if arg2.AssemblyRootPart == humanoidRootPart then
									flag13 = true
								else
									local leftArm = arg2:FindFirstChild("RigidConstraint") and character_:FindFirstChild("Left Arm")
									flag13 = false

									if leftArm then
										local leftGripAttachment = character_["Left Arm"]:FindFirstChild("LeftGripAttachment")

										if leftGripAttachment and arg2.RigidConstraint.Attachment1 == leftGripAttachment then
											flag13 = true
										end
									end
								end

								flag13 = not arg2 or not arg2.Parent or not holdItemRemoteFunction or flag13 or not flag12
								if not flag13 then
									continue
								end
							end

							break
						end

						if dropItemRemoteFunction and flag12 then
							task.spawn(function()
								pcall(function()
									dropItemRemoteFunction:InvokeServer(arg2.Parent)
								end)
							end)
						end

						if arg2 and arg2.Parent then
							arg2.Name = "NotHoldPart"
						end
					end)
				end

				local function fn27(arg2)
					for _, descendant in ipairs(arg2:GetDescendants()) do
						if flag12 then
							fn26(descendant)
						end
					end

					arg2.DescendantAdded:Connect(function(descendant)
						if flag12 then
							task.wait(0.1)
							fn26(descendant)
						end
					end)
				end

				for _, player in ipairs(game.Players:GetPlayers()) do
					task.spawn(function()
						local str5 = player.Name .. "SpawnedInToys"
						local v27 = workspace:FindFirstChild(str5) or workspace:WaitForChild(str5, 5)

						if v27 then
							fn27(v27)
						end
					end)
				end

				game.Players.PlayerAdded:Connect(function(player)
					folderName = player.Name .. "SpawnedInToys"
					folder = workspace:WaitForChild(folderName, 10)

					if folder and flag12 then
						fn27(folder)
					end
				end)

				workspace.DescendantAdded:Connect(function(descendant)
					if flag12 then
						task.wait(0.1)
						fn26(descendant)
					end
				end)
			end)
		end,
	})

	do
		local thread = nil
		local menuToys = rs:FindFirstChild("MenuToys")
		local grabEvents = rs:FindFirstChild("GrabEvents")
		local bombEvents = rs:FindFirstChild("BombEvents")
		local spawnToyRemoteFunction = menuToys and menuToys:FindFirstChild("SpawnToyRemoteFunction")
		grabEvents = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
		local bombExplode = bombEvents and bombEvents:FindFirstChild("BombExplode")

		local function fn26()
			if thread and coroutine.status(thread) ~= "dead" then
				return
			end

			thread = coroutine.create(function()
				while tbl7 and tbl7.SnowballRagdoll do
					task.wait(0.1)
					local character_ = plr.Character
					local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
					local name = tbl7.Name and game.Players:FindFirstChild(tbl7.Name)

					if not (not humanoidRootPart or not name or name == plr or not name.Character) then
						local humanoidRootPart2 = name.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart2 then
							local ballSnowball = inv:FindFirstChild("BallSnowball")

							if not ballSnowball then
								if spawnToyRemoteFunction then
									task.spawn(function()
										spawnToyRemoteFunction:InvokeServer("BallSnowball", humanoidRootPart.CFrame * CFrame.new(0, 10, 20), Vector3.zero)
									end)
								end

								task.wait(0.15)
							else
								local soundPart = ballSnowball:FindFirstChild("SoundPart")

								if not soundPart then
									task.wait(0.1)
								else
									if grabEvents then
										grabEvents:FireServer(soundPart, soundPart.CFrame)
									end

									task.wait(0.05)
									soundPart.CFrame = humanoidRootPart2.CFrame
									task.wait(0.05)

									if bombExplode then
										bombExplode:FireServer({
											Radius = 0,
											Color = Color3.new(0, 0, 0),
											TimeLength = 0,
											Model = ballSnowball,
											Type = "SnowPoof",
											ExplodesByFire = false,
											MaxForcePerStudSquared = 0,
											Hitbox = soundPart,
											ImpactSpeed = 0,
											ExplodesByPointy = false,
											DestroysModel = true,
											PositionPart = soundPart,
										}, Vector3.zero)
									end

									task.wait(0.15)
								end
							end
						end
					end
				end

				thread = nil
			end)

			coroutine.resume(thread)
		end

		v22:AddToggle({
			Name = "Snowball Ragdoll",
			Default = false,
			Flag = "Targ_SnowballRagdoll",
			Callback = function(snowballRagdoll)
				if not tbl7 then
					tbl7 = {}
				end

				tbl7.SnowballRagdoll = snowballRagdoll

				if snowballRagdoll then
					fn26()
				end
			end,
		})
	end

	Players = game:GetService("Players")
	RunService = game:GetService("RunService")
	LocalPlayer = Players.LocalPlayer
	tpActive = false
	tbl7.Method = "Faster Kick"

	v23:AddDropdown({
		Name = "Ownership",
		Options = { "Faster Kick" },
		Default = "Faster Kick",
		Flag = "Targ_GrabMethod",
		Callback = function(method)
			tbl7.Method = method
		end,
	})

	v23:AddToggle({
		Name = "Kick",
		Default = false,
		Flag = "Targ_ExecuteGrab",
		Callback = function(isGrabbing)
			tbl7.IsGrabbing = isGrabbing
			local name = tbl7.Name and Players:FindFirstChild(tbl7.Name)
			local bodyPosition = nil
			local bodyGyro = nil
			if not name then
				return
			end

			if isGrabbing then
				task.spawn(function()
					local clone = nil
					local grabEvents = game:GetService("ReplicatedStorage"):FindFirstChild("GrabEvents")

					local function fn26()
						if bodyPosition then
							bodyPosition:Destroy()
							bodyPosition = nil
						end

						if bodyGyro then
							bodyGyro:Destroy()
							bodyGyro = nil
						end
					end

					local function fn27(arg)
						local plotItems = workspace:FindFirstChild("PlotItems")
						plotItems = plotItems and plotItems:FindFirstChild("PlayersInPlots")
						if not plotItems or not arg then
							return false
						end
						return plotItems:FindFirstChild(arg.Name) or arg.Character and arg.Character.Parent == plotItems
					end

					local function fn28(arg)
						local character_ = LocalPlayer.Character
						if not character_ then
							return
						end

						for _, descendant in pairs(character_:GetDescendants()) do
							if descendant:IsA("BasePart") then
								if arg then
									descendant.LocalTransparencyModifier = 0
								else
									descendant.LocalTransparencyModifier = 1
								end
							end
						end
					end

					local function fn29()
						local character_ = LocalPlayer.Character
						if not character_ or clone then
							return
						end
						character_.Archivable = true
						clone = character_:Clone()
						character_.Archivable = false

						for _, descendant in pairs(clone:GetDescendants()) do
							if descendant:IsA("Script") or descendant:IsA("LocalScript") then
								descendant:Destroy()
							end
						end

						clone.Name = "LocalVisualDummy"
						clone.Parent = workspace
						local currentCamera = workspace.CurrentCamera

						if clone:FindFirstChild("Humanoid") then
							currentCamera.CameraSubject = clone.Humanoid
						end
					end

					local function fn30()
						if not clone then
							return
						end
						local character_ = LocalPlayer.Character

						if character_ and character_:FindFirstChild("HumanoidRootPart") and clone:FindFirstChild("HumanoidRootPart") then
							HRP.CFrame = clone.HumanoidRootPart.CFrame

							if character_:FindFirstChild("Humanoid") then
								workspace.CurrentCamera.CameraSubject = character_.Humanoid
							end
						end

						clone:Destroy()
						clone = nil
						fn28(true)
					end

					local flag13 = false
					local n25 = 0
					local n26 = 0

					while true do
						if tbl7.IsGrabbing and RunService.RenderStepped:Wait() then
							name = Players:FindFirstChild(tbl7.Name)

							if not (not name or not name.Character or tbl7.Method ~= "Faster Kick") then
								tbl7.Char = name.Character
								tbl7.HRP = name.Character:FindFirstChild("HumanoidRootPart")
								local humanoid = tbl7.Char:FindFirstChild("Humanoid")

								if not (not tbl7.HRP or not humanoid or humanoid.Health <= 0) then
									if fn27(name) then
										fn30()
										fn26()
										flag13 = false

										if tick() - n25 > 8 then
											v19:MakeNotification({
												Name = "NeoLose",
												Content = name.DisplayName .. " In a Plot",
												Image = "crown",
												Time = 4,
											})

											n25 = tick()
										end
									else
										if flag13 and (HRP.Position - tbl7.HRP.Position).Magnitude > 15 then
											fn26()
											flag13 = false
											n26 = 0
										end

										if humanoid.Health > 0 then
											tbl7.HRP.AssemblyLinearVelocity = Vector3.zero

											if not flag13 then
												fn29()

												if LocalPlayer.Character then
													for _, descendant in pairs(LocalPlayer.Character:GetDescendants()) do
														if descendant:IsA("BasePart") then
															descendant.LocalTransparencyModifier = 1
														end
													end
												end

												if n26 == 0 then
													n26 = tick()
												end

												local position = tbl7.HRP.Position
												local n27 = position - tbl7.HRP.CFrame.LookVector * 4
												HRP.CFrame = CFrame.new(n27.X, position.Y, n27.Z)

												pcall(function()
													humanoid.PlatformStand = true
													humanoid.Sit = true
													grabEvents.SetNetworkOwner:FireServer(tbl7.HRP, tbl7.HRP.CFrame)
													fn16(tbl7.HRP, Vector3.zero, tbl7.HRP.Position, false)
												end)

												if tick() - n26 > 0.35 then
													fn30()
													flag13 = true
													n26 = 0

													if tbl7.HRP then
														tbl7.HRP.CFrame = HRP.CFrame * CFrame.new(0, 0, -3)
													end
												end
											else
												fn30()
												local position = HRP.Position + Vector3.new(0, 12, -4)

												if not bodyPosition or bodyPosition.Parent ~= tbl7.HRP then
													fn26()
													bodyPosition = Instance.new("BodyPosition", tbl7.HRP)
													bodyPosition.P = 1000000
													bodyPosition.D = 500
													bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
													bodyGyro = Instance.new("BodyGyro", tbl7.HRP)
													bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
												end

												bodyPosition.Position = position
												bodyGyro.CFrame = HRP.CFrame

												task.spawn(function()
													if v19.Flags.Targ_RagdollPallet and v19.Flags.Targ_RagdollPallet.Value and PalletForRagdoll and inv:FindFirstChild("PalletForRagdoll") then
														local soundPart = PalletForRagdoll:FindFirstChild("SoundPart")

														if soundPart then
															soundPart.AssemblyLinearVelocity = Vector3.new(0, 1000, 0)
															soundPart.CFrame = tbl7.HRP.CFrame
															task.wait(0.05)
															soundPart.CFrame = HRP.CFrame * CFrame.new(0, 1000, 0)
														end
													end
												end)

												pcall(function()
													humanoid.PlatformStand = true
													grabEvents.SetNetworkOwner:FireServer(tbl7.HRP, tbl7.HRP.CFrame)
													grabEvents.DestroyGrabLine:FireServer(tbl7.HRP)
													fn16(tbl7.HRP, Vector3.zero, tbl7.HRP.Position, false)
												end)
											end
										end
									end
								end

								continue
							end
						end

						break
					end

					fn30()
					fn26()
				end)
			elseif tbl7.HRP then
				pcall(function()
					if tbl7.HRP:FindFirstChild("BodyPosition") then
						tbl7.HRP.BodyPosition:Destroy()
					end

					if tbl7.HRP:FindFirstChild("BodyGyro") then
						tbl7.HRP.BodyGyro:Destroy()
					end
				end)
			end
		end,
	})

	v23:AddToggle({
		Name = "Grab Toys",
		Default = false,
		Flag = "Targ_RemoveAK",
		Callback = function(arg)
			if arg then
				task.spawn(function()
					while v19.Flags.Targ_RemoveAK.Value and RunService.RenderStepped:Wait() do
						if not tbl7.Name then
							return
						end
						local v27 = Players:FindFirstChild(tbl7.Name)
						if not v27 then
							return
						end
						local v28 = workspace:FindFirstChild(v27.Name .. "SpawnedInToys")

						if v28 then
							for _, child in pairs(v28:GetChildren()) do
								if child:FindFirstChild("StickyPart") and HRP and (child.StickyPart.Position - HRP.Position).Magnitude < 30 then
									fn19(child.StickyPart)

									if child.StickyPart:FindFirstChild("PartOwner") and child.StickyPart.PartOwner.Value == plr.Name then
										child.StickyPart.CFrame = CFrame.new(0, (0/0), 0)
									end
								end
							end
						end
					end
				end)
			end
		end,
	})

	v23:AddToggle({
		Name = "Ragdoll",
		Default = false,
		Flag = "Targ_RagdollPallet",
		Callback = function(arg)
			if arg then
				local fn26 = nil

				fn26 = function()
					PalletForRagdoll = fn21("PalletLightBrown", HRP.CFrame * CFrame.new(0, 10, 20))

					while true do
						task.wait()
						if not (PalletForRagdoll and PalletForRagdoll:FindFirstChild("SoundPart")) then
							continue
						end
						break
					end

					repeat
						task.wait()
						fn19(PalletForRagdoll.SoundPart)
					until PalletForRagdoll.SoundPart:FindFirstChild("PartOwner")

					PalletForRagdoll.SoundPart.AssemblyLinearVelocity = Vector3.new(0, 1e9, 0)

					for _, child in pairs(PalletForRagdoll:GetChildren()) do
						if child:IsA("Part") then
							child.CanCollide = false
							child.CanQuery = false
							child.Transparency = 1
						end
					end

					PalletForRagdoll.Name = "PalletForRagdoll"

					cons.PalletDestroying = PalletForRagdoll.Destroying:Once(function()
						fn26()
					end)
				end

				fn26()
			else
				if cons.PalletDestroying then
					cons.PalletDestroying:Disconnect()
					cons.PalletDestroying = nil
				end

				if inv and inv:FindFirstChild("PalletForRagdoll") then
					DestroyToy:FireServer(inv.PalletForRagdoll)
				end
			end
		end,
	})

	local v27
	v27 = tbl6.Defense:AddSection({ Name = "Defense Main", Side = "Left" })
	local v28
	v28 = tbl6.Defense:AddSection({ Name = "Defense Extra", Side = "Right" })

	do
		local flag13 = false
		local flag14 = false
		local tbl8 = {}

		local function fn26()
			for _, v29 in pairs(tbl8) do
				if v29 then
					v29:Disconnect()
				end
			end

			table.clear(tbl8)
		end

		v27:AddToggle({
			Name = "Anti Grab",
			Default = false,
			Flag = "AntiGrabClean",
			Callback = function(antiGrabEnabled)
				local Players_ = game:GetService("Players")
				local ReplicatedStorage = game:GetService("ReplicatedStorage")
				local localPlayer = Players_.LocalPlayer
				local currentCamera = workspace.CurrentCamera
				_G.AntiGrabEnabled = antiGrabEnabled
				fn26()
				local characterEvents = ReplicatedStorage:FindFirstChild("CharacterEvents")
				local struggle = characterEvents and characterEvents:FindFirstChild("Struggle")
				local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")
				local isHeld = localPlayer:FindFirstChild("IsHeld")

				local function fn27(character_)
					if not character_ or not _G.AntiGrabEnabled then
						return
					end
					local humanoidRootPart = character_:WaitForChild("HumanoidRootPart", 5)
					local humanoid = character_:WaitForChild("Humanoid", 5)
					if not (humanoidRootPart and humanoid) then
						return
					end

					pcall(function()
						humanoid.RequiresNeck = false
					end)

					for _, child in pairs(character_:GetChildren()) do
						if child:IsA("BasePart") then
							tbl8["AGPart_" .. child.Name] = child.ChildAdded:Connect(function(child2)
								if child2.Name == "PartOwner" then
									if not flag13 then
										flag13 = true
										humanoid.Sit = false

										task.spawn(function()
											while child and child:FindFirstChild("PartOwner") or isHeld and isHeld.Value do
												if struggle then
													struggle:FireServer(localPlayer)
												end

												if ragdollRemote then
													ragdollRemote:FireServer(humanoidRootPart, 0)
												end

												task.wait()
											end
										end)

										humanoidRootPart.Anchored = true

										if not flag14 then
											flag14 = true
											local raycastParams = RaycastParams.new()
											raycastParams.FilterDescendantsInstances = { character_ }
											raycastParams.FilterType = Enum.RaycastFilterType.Exclude

											while isHeld and isHeld.Value do
												local v29 = task.wait()
												local moveDirection = humanoid.MoveDirection
												local position = humanoidRootPart.Position
												local n25 = math.max(humanoid.WalkSpeed, 16)

												if moveDirection.Magnitude > 0 then
													position += Vector3.new(moveDirection.X, 0, moveDirection.Z).Unit * n25 * v29
												end

												local hit = workspace:Raycast(position + Vector3.new(0, 3, 0), Vector3.new(0, -10, 0), raycastParams)

												if hit then
													position = Vector3.new(position.X, hit.Position.Y + (humanoid.HipHeight > 0 and humanoid.HipHeight or 2) + 1, position.Z)
												end

												humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
												local cFrame = currentCamera.CFrame
												local vector = Vector3.new(cFrame.LookVector.X, 0, cFrame.LookVector.Z)

												if vector.Magnitude > 0 then
													humanoidRootPart.CFrame = CFrame.new(position, position + vector)
												else
													humanoidRootPart.CFrame = CFrame.new(position)
												end
											end
										end

										humanoidRootPart.Anchored = false
										flag13 = false
										flag14 = false
									end
								end
							end)
						end
					end

					local weldHRP = humanoidRootPart:WaitForChild("WeldHRP", 5)

					if weldHRP then
						tbl8.AGWeld = weldHRP.Changed:Connect(function()
							if humanoidRootPart.WeldHRP.Enabled then
								while not humanoid.Sit do
									task.wait()
								end

								humanoid.Sit = false
							end
						end)
					end
				end

				if antiGrabEnabled then
					fn27(localPlayer.Character)
					tbl8.AGChar = localPlayer.CharacterAdded:Connect(fn27)
				end
			end,
		})
	end

	do
		local tbl8 = {}
		local n25 = 0

		local function fn26()
			for _, v29 in pairs(tbl8) do
				if v29 then
					v29:Disconnect()
				end
			end

			table.clear(tbl8)
		end

		v27:AddToggle({
			Name = "Anti Snowball",
			Default = false,
			Flag = "AntiSnowballSpinBest",
			Callback = function(antiSnowballEnabled)
				local Players_ = game:GetService("Players")
				local RunService_ = game:GetService("RunService")
				local localPlayer = Players_.LocalPlayer
				_G.AntiSnowballEnabled = antiSnowballEnabled
				fn26()

				local function fn27(character_)
					if not character_ or not _G.AntiSnowballEnabled then
						return
					end
					local humanoidRootPart = character_:WaitForChild("HumanoidRootPart", 5)
					local humanoid = character_:WaitForChild("Humanoid", 5)
					if not (humanoidRootPart and humanoid) then
						return
					end
					local tbl9 = {}
					local thread = nil

					local function fn28()
						table.clear(tbl9)

						for _, child in ipairs(character_:GetChildren()) do
							if child:IsA("BasePart") and child ~= humanoidRootPart then
								tbl9[child] = humanoidRootPart.CFrame:ToObjectSpace(child.CFrame)
							end
						end
					end

					local function fn29()
						for k, v29 in pairs(tbl9) do
							if k.Parent == character_ and k:IsA("BasePart") then
								k.CanCollide = false
								k.CFrame = humanoidRootPart.CFrame * v29
								k.AssemblyLinearVelocity = Vector3.zero
								k.AssemblyAngularVelocity = Vector3.zero
							end
						end
					end

					fn28()

					local function fn30()
						n25 = os.clock()
					end

					local function fn31(descendant)
						if descendant:IsA("BasePart") then
							table.insert(tbl8, descendant.Touched:Connect(function(hit)
								if hit then
									local str5 = hit.Name:lower()
									local str6 = hit.Parent and hit.Parent.Name:lower() or ""

									if string.find(str5, "snowball") or string.find(str6, "snowball") then
										fn30()
									end
								end
							end))

							table.insert(tbl8, descendant.ChildAdded:Connect(function(child)
								if string.find(child.Name:lower(), "snowball") then
									fn30()
								end
							end))
						end
					end

					for _, descendant in pairs(character_:GetDescendants()) do
						fn31(descendant)
					end

					table.insert(tbl8, character_.DescendantAdded:Connect(fn31))
					local tbl10 = {}

					local function fn32(descendant)
						if descendant:IsA("BasePart") and string.find(descendant.Name:lower(), "snowball") then
							tbl10[descendant] = true
							local connection = nil

							connection = descendant.AncestryChanged:Connect(function(child, parent)
								if not parent then
									tbl10[descendant] = nil

									if connection then
										connection:Disconnect()
									end
								end
							end)
						end
					end

					for _, descendant in pairs(workspace:GetDescendants()) do
						fn32(descendant)
					end

					table.insert(tbl8, workspace.DescendantAdded:Connect(fn32))

					table.insert(tbl8, RunService_.Heartbeat:Connect(function()
						if not humanoidRootPart then
							return
						end

						for k in pairs(tbl10) do
							if k.Parent then
								if (k.Position - humanoidRootPart.Position).Magnitude < 15 then
									fn30()
								end
							else
								tbl10[k] = nil
							end
						end
					end))

					local function fn33()
						local ragdolled = humanoid:FindFirstChild("Ragdolled")
						local state = humanoid:GetState()
						return ragdolled and ragdolled:IsA("BoolValue") and ragdolled.Value or state == Enum.HumanoidStateType.Ragdoll or state == Enum.HumanoidStateType.Physics
					end

					local function fn34()
						if thread or not _G.AntiSnowballEnabled or not fn33() then
							return
						end

						thread = task.spawn(function()
							local v29, v30 = humanoidRootPart.CFrame:ToOrientation()

							while _G.AntiSnowballEnabled and character_.Parent and humanoid.Parent and humanoidRootPart.Parent and fn33() do
								humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
								humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position) * CFrame.Angles(0, v30, 0)
								fn29()
								RunService_.Heartbeat:Wait()
							end

							thread = nil
						end)
					end

					table.insert(tbl8, humanoid.ChildAdded:Connect(function(child)
						if child.Name == "Ragdolled" then
							table.insert(tbl8, child.Changed:Connect(fn34))
							fn34()
						end
					end))

					local ragdolled = humanoid:FindFirstChild("Ragdolled")

					if ragdolled then
						table.insert(tbl8, ragdolled.Changed:Connect(fn34))
					end

					table.insert(tbl8, humanoid.StateChanged:Connect(function()
						fn34()
					end))

					table.insert(tbl8, RunService_.Heartbeat:Connect(function()
						if fn33() then
							fn34()
						end
					end))
				end

				if antiSnowballEnabled then
					fn27(localPlayer.Character)
					table.insert(tbl8, localPlayer.CharacterAdded:Connect(fn27))
				end
			end,
		})
	end

	_G.GucciModule = _G.GucciModule or {}
	_G.GucciModule.PinkHouseCFrame = CFrame.new(-491, -7, -166)
	_G.GucciModule.IsSaving = false

	_G.GucciModule.StartSlide = function(arg)
		local cFrame = arg.CFrame
		local pinkHouseCFrame = _G.GucciModule.PinkHouseCFrame

		for i = 1, 20 do
			if not (not arg or not arg.Parent) then
				arg.CFrame = cFrame:Lerp(pinkHouseCFrame, i / 20)
				arg.AssemblyLinearVelocity = Vector3.zero
				arg.AssemblyAngularVelocity = Vector3.zero
				task.wait()
				continue
			end

			break
		end

		arg.CFrame = pinkHouseCFrame
		arg.AssemblyLinearVelocity = Vector3.zero
		arg.AssemblyAngularVelocity = Vector3.zero
	end

	_G.GucciModule.PerformGucciSave = function(arg, arg2, arg3)
		_G.GucciModule.IsSaving = true

		pcall(function()
			_G.GucciModule.StartSlide(arg2)
			local cFrame = arg2.CFrame

			if workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("AlwaysHereTweenedObjects") and workspace.Map.AlwaysHereTweenedObjects:FindFirstChild("Train") and workspace.Map.AlwaysHereTweenedObjects.Train:FindFirstChild("Object") and workspace.Map.AlwaysHereTweenedObjects.Train.Object:FindFirstChild("ObjectModel") and workspace.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel:FindFirstChild("Seat") then
				workspace.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel.Seat:Sit(arg3)

				task.spawn(function()
					local n25 = tick() + 3

					while tick() < n25 do
						if Ragdoll then
							Ragdoll:FireServer(arg2, 0)
						end

						task.wait()
					end
				end)

				task.wait(0.2)
				arg3:ChangeState(Enum.HumanoidStateType.Jumping)
				task.wait(0.2)
				arg2.CFrame = cFrame
				fn18(arg2)
			end
		end)

		task.wait(1)
		_G.GucciModule.IsSaving = false
	end

	_G.GucciModule.PerformPureSlideSave = function(arg, arg2)
		_G.GucciModule.IsSaving = true

		pcall(function()
			_G.GucciModule.StartSlide(arg2)
		end)

		task.wait(1)
		_G.GucciModule.IsSaving = false
	end

	do
		local flag13 = false
		local flag14 = false
		local tbl8 = {}

		local function fn26()
			for _, v29 in pairs(tbl8) do
				if v29 then
					v29:Disconnect()
				end
			end

			table.clear(tbl8)
		end

		v27:AddToggle({
			Name = "Anti Grab",
			Default = false,
			Flag = "AntiGrabBest",
			Callback = function(antiGrabEnabled)
				local Players_ = game:GetService("Players")
				local ReplicatedStorage = game:GetService("ReplicatedStorage")
				local localPlayer = Players_.LocalPlayer
				local currentCamera = workspace.CurrentCamera
				_G.AntiGrabEnabled = antiGrabEnabled
				fn26()
				local characterEvents = ReplicatedStorage:FindFirstChild("CharacterEvents")
				local struggle = characterEvents and characterEvents:FindFirstChild("Struggle")
				local ragdollRemote = characterEvents and characterEvents:FindFirstChild("RagdollRemote")
				local isHeld = localPlayer:FindFirstChild("IsHeld")

				local function fn27(character_)
					if not character_ or not _G.AntiGrabEnabled then
						return
					end
					local humanoidRootPart = character_:WaitForChild("HumanoidRootPart", 5)
					local humanoid = character_:WaitForChild("Humanoid", 5)
					if not (humanoidRootPart and humanoid) then
						return
					end

					pcall(function()
						humanoid.RequiresNeck = false
					end)

					local tbl9 = {
						Head = CFrame.new(0, 1.5, 0),
						["Left Arm"] = CFrame.new(-1.5, 0, 0),
						LeftUpperArm = CFrame.new(-1.5, 0, 0),
						["Right Arm"] = CFrame.new(1.5, 0, 0),
						RightUpperArm = CFrame.new(1.5, 0, 0),
						["Left Leg"] = CFrame.new(-0.5, -1.95, 0),
						LeftLowerLeg = CFrame.new(-0.5, -1.95, 0),
						["Right Leg"] = CFrame.new(0.5, -1.95, 0),
						RightLowerLeg = CFrame.new(0.5, -1.95, 0),
					}

					local function fn28()
						for _, child in pairs(character_:GetChildren()) do
							if child:IsA("BasePart") and child.Name ~= "HumanoidRootPart" then
								child.CanCollide = false
								local v29 = tbl9[child.Name]

								if v29 then
									child.CFrame = humanoidRootPart.CFrame * v29
								end
							end
						end
					end

					local n25 = 0

					local function fn29()
						n25 = os.clock()
					end

					for _, child in pairs(character_:GetChildren()) do
						if child:IsA("BasePart") then
							tbl8["AG_SnowballChild_" .. child.Name] = child.ChildAdded:Connect(function(child2)
								local str5 = child2.Name:lower()

								if string.find(str5, "ballsnowball") or string.find(str5, "snowball") then
									fn29()
								end
							end)

							tbl8["AG_SnowballTouch_" .. child.Name] = child.Touched:Connect(function(hit)
								if hit then
									local str5 = hit.Name:lower()
									local str6 = hit.Parent and hit.Parent.Name:lower() or ""

									if str5 == "ballsnowball" or string.find(str5, "snowball") or str6 == "ballsnowball" or string.find(str6, "snowball") then
										fn29()
									end
								end
							end)
						end
					end

					for _, child in pairs(character_:GetChildren()) do
						if child:IsA("BasePart") then
							tbl8["AGPart_" .. child.Name] = child.ChildAdded:Connect(function(child2)
								if child2.Name == "PartOwner" then
									if not flag13 then
										flag13 = true
										humanoid.Sit = false

										task.spawn(function()
											while child and child:FindFirstChild("PartOwner") or isHeld and isHeld.Value do
												if struggle then
													struggle:FireServer(localPlayer)
												end

												if ragdollRemote then
													ragdollRemote:FireServer(humanoidRootPart, 0)
												end

												fn28()
												task.wait()
											end
										end)

										humanoidRootPart.Anchored = true

										if not flag14 then
											flag14 = true
											local raycastParams = RaycastParams.new()
											raycastParams.FilterDescendantsInstances = { character_ }
											raycastParams.FilterType = Enum.RaycastFilterType.Exclude

											while isHeld and isHeld.Value do
												local v29 = task.wait()
												local moveDirection = humanoid.MoveDirection
												local position = humanoidRootPart.Position
												local n26 = math.max(humanoid.WalkSpeed, 16)

												if moveDirection.Magnitude > 0 then
													position += Vector3.new(moveDirection.X, 0, moveDirection.Z).Unit * n26 * v29
												end

												local hit = workspace:Raycast(position + Vector3.new(0, 3, 0), Vector3.new(0, -10, 0), raycastParams)

												if hit then
													position = Vector3.new(position.X, hit.Position.Y + (humanoid.HipHeight > 0 and humanoid.HipHeight or 2) + 1, position.Z)
												end

												humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
												local cFrame = currentCamera.CFrame
												local vector = Vector3.new(cFrame.LookVector.X, 0, cFrame.LookVector.Z)

												if vector.Magnitude > 0 then
													humanoidRootPart.CFrame = CFrame.new(position, position + vector)
												else
													humanoidRootPart.CFrame = CFrame.new(position)
												end

												fn28()
											end
										end

										humanoidRootPart.Anchored = false
										flag13 = false
										flag14 = false
									end
								end
							end)
						end
					end

					local weldHRP = humanoidRootPart:WaitForChild("WeldHRP", 5)

					if weldHRP then
						tbl8.AGWeld = weldHRP.Changed:Connect(function()
							if humanoidRootPart.WeldHRP.Enabled then
								while not humanoid.Sit do
									task.wait()
								end

								humanoid.Sit = false

								while humanoidRootPart.WeldHRP.Enabled and task.wait() do
									fn28()
								end
							end
						end)
					end

					local ragdolled = humanoid:WaitForChild("Ragdolled", 5)

					if ragdolled then
						tbl8.AGRagdoll = ragdolled.Changed:Connect(function()
							if ragdolled.Value then
								if os.clock() - n25 <= 1.5 then
									task.spawn(function()
										local v29, v30 = humanoidRootPart.CFrame:ToOrientation()

										while ragdolled.Parent and ragdolled.Value and task.wait() do
											humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
											humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position) * CFrame.Angles(0, v30, 0)
											fn28()
										end
									end)
								end
							end
						end)
					end
				end

				if antiGrabEnabled then
					fn27(localPlayer.Character)
					tbl8.AGChar = localPlayer.CharacterAdded:Connect(fn27)
				end
			end,
		})
	end

	v27:AddToggle({
		Name = "Anti grab Plot",
		Default = false,
		Flag = "Def_PureSlideSave",
		Callback = function(pureSlideEnabled)
			_G.PureSlideEnabled = pureSlideEnabled

			if pureSlideEnabled then
				if _G.PureSlideConn then
					_G.PureSlideConn:Disconnect()
				end

				_G.PureSlideConn = game:GetService("RunService").Heartbeat:Connect(function()
					local character_ = game:GetService("Players").LocalPlayer.Character
					if not character_ or _G.GucciModule.IsSaving or _G.GucciSaveEnabled then
						return
					end
					local humanoidRootPart = character_:FindFirstChild("HumanoidRootPart")
					local head = character_:FindFirstChild("Head")
					local humanoid = character_:FindFirstChildOfClass("Humanoid")
					if not humanoidRootPart or not head or not humanoid then
						return
					end
					local partOwner = head:FindFirstChild("PartOwner") or humanoidRootPart:FindFirstChild("PartOwner")

					if partOwner and partOwner.Value ~= game:GetService("Players").LocalPlayer.Name then
						_G.GucciModule.PerformPureSlideSave(character_, humanoidRootPart, humanoid)
					end
				end)
			elseif _G.PureSlideConn then
				_G.PureSlideConn:Disconnect()
				_G.PureSlideConn = nil
			end
		end,
	})

	v28:AddToggle({
		Name = "Anti Blobman",
		Default = false,
		Flag = "Def_AntiBlobman",
		Callback = function(arg)
			if arg then
				for _, descendant in pairs(workspace:GetDescendants()) do
					if descendant.Name == "CreatureBlobman" and (not inv or not descendant:IsDescendantOf(inv)) then
						local rightDetector = descendant:FindFirstChild("RightDetector")
						local leftDetector = descendant:FindFirstChild("LeftDetector")

						if rightDetector and leftDetector then
							pcall(function()
								rightDetector.RightAlignOrientation.Enabled = false
								rightDetector.RightWeld.Enabled = false
								leftDetector.LeftAlignOrientation.Enabled = false
								leftDetector.LeftWeld.Enabled = false
							end)
						end
					end
				end

				cons.antiblob = workspace.DescendantAdded:Connect(function(descendant)
					if descendant.Name == "CreatureBlobman" and (not inv or not descendant:IsDescendantOf(inv)) then
						local rightDetector = descendant:WaitForChild("RightDetector", 5)
						local leftDetector = descendant:WaitForChild("LeftDetector", 5)

						if rightDetector and leftDetector then
							local rightAlignOrientation = rightDetector:WaitForChild("RightAlignOrientation", 2)
							local rightWeld = rightDetector:WaitForChild("RightWeld", 2)
							local leftAlignOrientation = leftDetector:WaitForChild("LeftAlignOrientation", 2)
							local leftWeld = leftDetector:WaitForChild("LeftWeld", 2)

							if rightAlignOrientation then
								rightAlignOrientation.Enabled = false
							end

							if rightWeld then
								rightWeld.Enabled = false
							end

							if leftAlignOrientation then
								leftAlignOrientation.Enabled = false
							end

							if leftWeld then
								leftWeld.Enabled = false
							end
						end
					end
				end)
			elseif cons.antiblob then
				cons.antiblob:Disconnect()
				cons.antiblob = nil
			end
		end,
	})

	v27:AddToggle({
		Name = "Perm ragdoll",
		Default = false,
		Flag = "Def_LoopRagdoll",
		Callback = function(loopRagdollActive)
			_G.LoopRagdollActive = loopRagdollActive

			if loopRagdollActive then
				task.spawn(function()
					while _G.LoopRagdollActive do
						local character_ = plr.Character
						local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							local ragdollRemote = game:GetService("ReplicatedStorage"):FindFirstChild("CharacterEvents") and game:GetService("ReplicatedStorage").CharacterEvents:FindFirstChild("RagdollRemote")

							if ragdollRemote then
								pcall(function()
									ragdollRemote:FireServer(humanoidRootPart, 0.5)
								end)
							end
						end

						task.wait(0.05)
					end
				end)
			else
				_G.LoopRagdollActive = false
			end
		end,
	})

	task.spawn(function()
		while task.wait(1) do
			if plr and plr:FindFirstChild("PlayerScripts") then
				local characterAndBeamMove = plr.PlayerScripts:FindFirstChild("CharacterAndBeamMove")

				if characterAndBeamMove and characterAndBeamMove.Enabled then
					characterAndBeamMove.Enabled = false
				end
			end
		end
	end)

	local ReplicatedStorage
	ReplicatedStorage = game:GetService("ReplicatedStorage")

	ReplicatedStorage.GameCorrectionEvents.GameCorrectionsNotify.OnClientEvent:Connect(function(arg)
		if arg == "Flying" then
			if v19 then
				v19:MakeNotification({ Name = "NeoLose", Content = "Auto Reset", Image = "crown", Time = 3 })
			end

			local character_ = game.Players.LocalPlayer.Character
			character_ = character_ and character_:FindFirstChild("Humanoid")

			if character_ then
				character_:ChangeState("Dead")
			end
		end
	end)

	do
		local flag13 = false
		local thread = nil
		local flag14 = false

		local function fn26()
			local Players_ = game:GetService("Players")
			local Workspace = game:GetService("Workspace")
			local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
			local localPlayer = Players_.LocalPlayer
			local character_ = localPlayer.Character or localPlayer.CharacterAdded:Wait()
			local humanoid = character_:FindFirstChildOfClass("Humanoid")
			local humanoidRootPart = character_:FindFirstChild("HumanoidRootPart")
			local ragdollRemote = ReplicatedStorage2:FindFirstChild("CharacterEvents") and ReplicatedStorage2.CharacterEvents:FindFirstChild("RagdollRemote")

			local function fn27(arg, arg2, arg3, arg4)
				if _G.notify and type(_G.notify) == "function" then
					_G.notify(arg, arg2, arg3, arg4)
				end
			end

			if not (character_ and humanoid and humanoidRootPart and ragdollRemote) then
				fn27("Error", "no have RagdollRemote", 5, "error")
				return
			end
			local leftLeg = character_:FindFirstChild("Left Leg")
			local rightLeg = character_:FindFirstChild("Right Leg")
			local torso = character_:FindFirstChild("Torso")
			if not (leftLeg and rightLeg and torso) then
				fn27("Error", "legs already deleted", 5, "warning")
				return
			end
			local health = humanoid.Health
			humanoid.Health = humanoid.MaxHealth
			local fallenPartsDestroyHeight = Workspace.FallenPartsDestroyHeight
			local cFrame = torso.CFrame
			Workspace.FallenPartsDestroyHeight = -200000
			fn27("Delete Legs", "Deleting legs...", 3)
			ragdollRemote:FireServer(humanoidRootPart, 2)
			task.wait(0.5)
			rightLeg.CFrame = CFrame.new(0, -60000, 0)
			leftLeg.CFrame = CFrame.new(0, -60000, 0)
			task.wait(0.3)
			torso.CFrame = CFrame.new(0, -59970, 0)
			task.wait(0.5)
			torso.CFrame = cFrame
			task.wait(0.5)
			Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
			humanoid.Health = health

			if not character_:FindFirstChild("Left Leg") and not character_:FindFirstChild("Right Leg") then
				fn27("Delete Legs", "Legs successfully deleted!", 5)

				task.spawn(function()
					while character_.Parent do
						local humanoid2 = character_:FindFirstChildOfClass("Humanoid")
						local controlsGui = localPlayer.PlayerGui:FindFirstChild("ControlsGui")

						if humanoid2 and controlsGui then
							local stand = controlsGui:FindFirstChild("Stand", true)
							humanoid2.HipHeight = stand and not stand.Visible and 2 or 0
						end

						task.wait(0.1)
					end
				end)
			else
				fn27("Delete Legs", "Warning: Legs not fully deleted", 3)
			end
		end

		v27:AddButton({ Name = "Anti Banana", Callback = fn26 })

		v27:AddToggle({
			Name = "Auto Anti Banana",
			Default = false,
			Flag = "Def_AutoAntiBanana",
			Callback = function(arg)
				flag13 = arg

				if thread then
					pcall(function()
						task.cancel(thread)
					end)

					thread = nil
				end

				if arg then
					thread = task.spawn(function()
						while flag13 do
							local character_ = plr.Character
							local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
							local leftLeg = character_ and character_:FindFirstChild("Left Leg")
							local rightLeg = character_ and character_:FindFirstChild("Right Leg")

							if character_ and humanoid and humanoid.Health > 0 and leftLeg and rightLeg and not flag14 then
								flag14 = true
								pcall(fn26)
								flag14 = false
								task.wait(0.5)
							else
								task.wait(0.2)
							end
						end
					end)
				end
			end,
		})
	end

	lastDeathPos = nil
	diedConnection = nil
	local fn26 = nil

	fn26 = function(arg)
		if diedConnection then
			diedConnection:Disconnect()
		end

		local localPlayer = game:GetService("Players").LocalPlayer
		local humanoid = arg:WaitForChild("Humanoid", 5)

		if humanoid then
			diedConnection = humanoid.Died:Connect(function()
				if _G.Def_BreakPCLDLoop then
					local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						lastDeathPos = humanoidRootPart.CFrame
					end

					task.spawn(function()
						local result = localPlayer.CharacterAdded:Wait()
						if not _G.Def_BreakPCLDLoop then
							return
						end
						task.wait(0.2)
						if not _G.Def_BreakPCLDLoop then
							return
						end
						local humanoid2 = result:WaitForChild("Humanoid", 5)

						if humanoid2 then
							humanoid2.Health = 0
						end

						local result2 = localPlayer.CharacterAdded:Wait()
						if not _G.Def_BreakPCLDLoop then
							return
						end
						task.wait(0.1)
						if not _G.Def_BreakPCLDLoop then
							return
						end
						local humanoidRootPart2 = result2:WaitForChild("HumanoidRootPart", 5)

						if humanoidRootPart2 and lastDeathPos then
							humanoidRootPart2.CFrame = lastDeathPos
						end

						fn26(result2)
					end)
				end
			end)
		end
	end

	v28:AddToggle({
		Name = "Auto Break PCLD",
		Default = false,
		Flag = "Def_BreakPCLD",
		Callback = function(defBreakPCLDLoop)
			_G.Def_BreakPCLDLoop = defBreakPCLDLoop

			if defBreakPCLDLoop then
				local localPlayer = game:GetService("Players").LocalPlayer
				local character_ = localPlayer.Character or localPlayer.CharacterAdded:Wait()
				local humanoidRootPart = character_:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					lastDeathPos = humanoidRootPart.CFrame
				end

				task.spawn(function()
					local humanoid = character_:FindFirstChildOfClass("Humanoid")

					if humanoid and humanoid.Health > 0 then
						humanoid.Health = 0
					end

					local result = localPlayer.CharacterAdded:Wait()
					if not _G.Def_BreakPCLDLoop then
						return
					end
					task.wait(0.2)
					if not _G.Def_BreakPCLDLoop then
						return
					end
					local humanoid2 = result:WaitForChild("Humanoid", 5)

					if humanoid2 then
						humanoid2.Health = 0
					end

					local result2 = localPlayer.CharacterAdded:Wait()
					if not _G.Def_BreakPCLDLoop then
						return
					end
					task.wait(0.1)
					if not _G.Def_BreakPCLDLoop then
						return
					end
					local humanoidRootPart2 = result2:WaitForChild("HumanoidRootPart", 5)

					if humanoidRootPart2 and lastDeathPos then
						humanoidRootPart2.CFrame = lastDeathPos
					end

					fn26(result2)
				end)
			elseif diedConnection then
				diedConnection:Disconnect()
				diedConnection = nil
			end
		end,
	})

	local cFrame = nil

	v28:AddButton({
		Name = "Break PCLD",
		Callback = function()
			if HRP then
				cFrame = HRP.CFrame
			end

			task.spawn(function()
				if hum then
					hum.Health = 0
				end

				local result = plr.CharacterAdded:Wait()
				task.wait(0.2)
				result:WaitForChild("Humanoid").Health = 0
				local result2 = plr.CharacterAdded:Wait()
				task.wait(0.1)

				if cFrame then
					result2:WaitForChild("HumanoidRootPart").CFrame = cFrame
				end
			end)
		end,
	})

	local str5
	str5 = "FoodMushroomPoison"

	v28:AddDropdown({
		Name = "Select Input Lag Toy",
		Options = {
			"InstrumentDrumBongos",
			"InstrumentBrassTrumpet",
			"InstrumentBrassBugle",
			"InstrumentVoiceMicrophone",
			"InstrumentWoodwindOcarina",
			"InstrumentGuitarUkulele",
			"InstrumentGuitarLyre",
			"InstrumentGuitarBanjo",
			"InstrumentGuitarAcoustic",
			"CupMugBrown",
			"CupMugWhite",
			"FoodBread",
			"FoodBroccoli",
			"FoodDippyEgg",
			"FoodDonut",
			"FoodHotdog",
			"FoodMeatStick",
			"FoodPizzaCheese",
			"FoodPizzaPepperoni",
			"FoodMushroomPoison",
			"FoodHamburger",
			"FoodCoconut",
			"FoodFrenchFries",
			"FoodMayonnaise",
			"PoopPileSparkle",
			"FoodCakePink",
			"FoodSodaCan",
			"FoodBanana",
			"PoopPile",
		},
		Default = "FoodMushroomPoison",
		Flag = "Def_AntiNetFoodToy",
		Save = true,
		Callback = function(arg)
			str5 = arg
		end,
	})

	_G.CycleSpeed = 0.05

	v28:AddSlider({
		Name = "Net-Owner Speed",
		Default = 0.05,
		Min = 0.03,
		Max = 0.3,
		Increment = 0.01,
		ValueName = "seconds",
		Flag = "Def_AntiNetFoodSpeed",
		Save = true,
		Callback = function(cycleSpeed)
			_G.CycleSpeed = cycleSpeed
		end,
	})

	v28:AddToggle({
		Name = "Anti-Net Food",
		Default = false,
		Flag = "Def_AntiNetFood",
		Save = true,
		Callback = function(instantLagActive)
			_G.InstantLagActive = instantLagActive

			if instantLagActive then
				task.spawn(function()
					while _G.InstantLagActive do
						local localPlayer = game.Players.LocalPlayer
						local character_ = localPlayer.Character
						local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							local spawnToyRemoteFunction = game:GetService("ReplicatedStorage"):WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
							local v29 = workspace:FindFirstChild(localPlayer.Name .. "SpawnedInToys")
							local v30 = str5
							local v31 = v29 and v29:FindFirstChild(v30)

							if not v31 or not v31.Parent then
								task.spawn(function()
									pcall(function()
										local vector = Vector3.new
										spawnToyRemoteFunction:InvokeServer(v30, humanoidRootPart.CFrame * CFrame.new(0, -12, 0), vector())
									end)
								end)

								task.wait(0.1)
							else
								local holdPart = v31:FindFirstChild("HoldPart")

								if holdPart then
									task.spawn(function()
										pcall(function()
											holdPart.HoldItemRemoteFunction:InvokeServer(v31, character_)
										end)
									end)

									task.wait(0.05)

									task.spawn(function()
										pcall(function()
											local vector = Vector3.new
											holdPart.DropItemRemoteFunction:InvokeServer(v31, CFrame.new(0, 5000, 0), vector())
										end)
									end)
								end
							end
						end

						task.wait(getNetFoodInterval())
					end
				end)
			end
		end,
	})

	v27:AddToggle({
		Name = "Anti Loop Kill",
		Default = false,
		Flag = "Def_AntiLoopKill",
		Callback = function(arg)
			if arg then
				cons.antiloopkill = plr.CharacterAdded:Connect(function(character_)
					local humanoidRootPart = character_:WaitForChild("HumanoidRootPart")
					task.wait(0.15)
					runTeleport(humanoidRootPart, MyGlobals.pos)
				end)
			elseif cons.antiloopkill then
				cons.antiloopkill:Disconnect()
			end
		end,
	})

	do
		local n25 = 0
		local n26 = 0
		local n27 = 3
		local n28 = 2

		ReplicatedStorage.GameCorrectionEvents.GameCorrectionsNotify.OnClientEvent:Connect(function(arg)
			if arg == "Flying" then
				local now3 = os.clock()

				if now3 - n26 <= n28 then
					n25 += 1
				else
					n25 = 1
				end

				n26 = now3

				if n25 >= n27 then
					plr:Kick("Вы спасены от Кика священным рогаликом.")
				end
			end
		end)
	end

	tpActive = false

	do
		local flag13 = false
		local tbl8 = {}
		local tbl9 = {}
		local tbl10 = {}

		local tbl11 = {
			Pickaxe = {
				toyName = "ToolPickaxe",
				spawnOffset = CFrame.new(0, 12, 20),
				spawnVelocity = Vector3.zero,
				stickyOffset = CFrame.new(-0.25, 0.45, 0.78) * CFrame.Angles(-1.5707963267948966, -0.78539816339744828, 0),
				targetType = "Torso",
				applyVisuals = nil,
			},
			Default = {
				toyName = "NinjaShuriken",
				spawnOffset = CFrame.new(0, 12, 20),
				spawnVelocity = Vector3.zero,
				stickyOffset = CFrame.new(0, 0, 0) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
				targetType = "FirePart",
				applyVisuals = function(arg)
					for _, child in pairs(arg:GetChildren()) do
						if child.Name == "Pyramid" or child.Name == "Main" then
							child.CanTouch = false
							child.CanCollide = false
							child.CanQuery = false
							child.Transparency = 0
						elseif child:IsA("BasePart") then
							child.CanTouch = false
							child.CanCollide = false
							child.CanQuery = false
							child.Transparency = 1
						end
					end
				end,
			},
			Kunai = {
				toyName = "NinjaKunai",
				spawnOffset = CFrame.new(0, 12, 20),
				spawnVelocity = Vector3.new(1, 1, 2),
				stickyOffset = CFrame.new(0, -1.2, 0) * CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966),
				targetType = "FirePart",
				applyVisuals = function(arg)
					for _, child in pairs(arg:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanTouch = false
							child.CanCollide = false
							child.CanQuery = false
							child.Transparency = child.Name == "Pyramid" and 0 or 1
						end
					end
				end,
			},
		}

		local function fn27(arg)
			local v29 = workspace:FindFirstChild(plr.Name .. "SpawnedInToys")
			if not v29 or not DestroyToy then
				return
			end

			for _, child in pairs(v29:GetChildren()) do
				if child.Name == "AntiKick" or arg == "Default" and child.Name == "NinjaShuriken" or arg == "Pickaxe" and child.Name == "ToolPickaxe" or arg == "Kunai" and child.Name == "NinjaKunai" then
					pcall(function()
						DestroyToy:FireServer(child)
					end)
				end
			end
		end

		local function fn28(arg)
			if tbl9[arg] then
				return
			end
			local v29 = tbl11[arg]
			if not v29 then
				return
			end
			tbl9[arg] = true

			tbl10[arg] = task.spawn(function()
				local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
				local setNetworkOwner = ReplicatedStorage2:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
				ReplicatedStorage2:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
				local spawnToyRemoteFunction = ReplicatedStorage2.MenuToys.SpawnToyRemoteFunction
				local canSpawnToy = plr:WaitForChild("CanSpawnToy")

				local function fn29()
					if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
						return plr.Character.HumanoidRootPart
					end
					return plr.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")
				end

				local function fn30()
					if not workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) then
						return false
					end

					for _, child in pairs(workspace.Plots:GetChildren()) do
						local plotSign = child:FindFirstChild("PlotSign")
						plotSign = plotSign and plotSign:FindFirstChild("ThisPlotsOwners")

						if plotSign then
							for _, child2 in pairs(plotSign:GetChildren()) do
								if child2.Value ~= plr.Name then
									continue
								end
								local v30 = workspace.PlotItems:FindFirstChild(child.Name)
								if v30 then
									return true, v30
								end
							end
						end
					end

					return false
				end

				local function fn31(arg2)
					local now3 = tick()

					while not canSpawnToy.Value do
						if not tbl9[arg] or tick() - now3 > 5 then
							return nil
						end
						task.wait(0.1)
					end

					local v30 = fn29()

					if v30 then
						task.spawn(function()
							pcall(function()
								spawnToyRemoteFunction:InvokeServer(arg2, v30.CFrame * v29.spawnOffset, v29.spawnVelocity)
							end)
						end)
					end

					local v31, v32 = fn30()
					local v33 = workspace:FindFirstChild(plr.Name .. "SpawnedInToys")
					if v31 and v32 then
						return v32:WaitForChild(arg2, 2)
					end

					if not workspace.PlotItems.PlayersInPlots:FindFirstChild(plr.Name) and v33 then
						return v33:WaitForChild(arg2, 2)
					end
					return nil
				end

				local function fn32()
					local v30 = workspace:FindFirstChild(plr.Name .. "SpawnedInToys")
					local v31, v32 = fn30()
					v31 = v31 and v32
					local v33 = nil

					if not v31 then
						v32 = v33
					end

					local function fn33(arg2)
						if not arg2 then
							return nil
						end

						for _, child in ipairs(arg2:GetChildren()) do
							if child.Name == "AntiKick" or child.Name == v29.toyName then
								return child
							end
						end

						return nil
					end

					local v34 = fn33(v30)
					if v34 then
						return v34
					end

					if v32 then
						local v35 = fn33(v32)
						if v35 then
							return v35
						end
					end

					if v30 then
						for _, child in ipairs(v30:GetChildren()) do
							if child:FindFirstChild("StickyPart") then
								return child
							end
						end
					end

					return nil
				end

				local function fn33(arg2)
					if not arg2 or not arg2:FindFirstChild("StickyPart") then
						return false
					end
					local v30 = fn29()
					if not v30 then
						return false
					end

					if arg2:FindFirstChild("SoundPart") then
						if not arg2.SoundPart:FindFirstChild("PartOwner") or arg2.SoundPart.PartOwner.Value ~= plr.Name then
							setNetworkOwner:FireServer(arg2.SoundPart, arg2.SoundPart.CFrame)
						end
					end

					local firePlayerPart

					if v29.targetType == "FirePart" then
						firePlayerPart = v30:FindFirstChild("FirePlayerPart") or v30:FindFirstChild("UpperTorso") or v30:FindFirstChild("Torso") or v30
					else
						firePlayerPart = plr.Character and (plr.Character:FindFirstChild("UpperTorso") or plr.Character:FindFirstChild("Torso") or v30)
					end

					if firePlayerPart then
						fn15(arg2.StickyPart, firePlayerPart, v29.stickyOffset)
					end

					if v29.applyVisuals then
						v29.applyVisuals(arg2)
					end

					arg2.Name = "AntiKick"
					return true
				end

				local v30 = nil
				local now3 = nil
				local n25 = 0

				while tbl9[arg] do
					RunService.Heartbeat:Wait()

					if not plr.Character or not plr.Character:FindFirstChild("Humanoid") or plr.Character.Humanoid.Health <= 0 then
						fn27(arg)
						v30 = nil
						now3 = nil
						n25 = 0
					elseif fn29() then
						v30 = v30 or fn32() or fn31(v29.toyName)

						if v30 and v30.Parent then
							v30.Name = "AntiKick"
						end

						if not v30 or not v30:FindFirstChild("StickyPart") then
							v30 = nil
							now3 = nil
							n25 = 0
						else
							local stickyPart = v30.StickyPart
							local flag14 = stickyPart:FindFirstChild("StickyWeld") and stickyPart.StickyWeld.Part1 ~= nil

							if flag14 then
								now3 = nil
							else
								if tick() - n25 >= 0.01 then
									n25 = tick()
									local v31 = fn33(v30)
									flag14 = stickyPart:FindFirstChild("StickyWeld") and stickyPart.StickyWeld.Part1 ~= nil

									if v31 and flag14 then
										now3 = nil
									else
										now3 = now3 or tick()
									end
								end

								if not flag14 and now3 and tick() - now3 >= 0.8 then
									fn27(arg)
									v30 = nil
									now3 = nil
									n25 = 0
								end
							end
						end
					end
				end
			end)
		end

		local function fn29(arg)
			tbl9[arg] = false

			if tbl10[arg] then
				pcall(function()
					task.cancel(tbl10[arg])
				end)

				tbl10[arg] = nil
			end

			fn27(arg)
		end

		local function fn30()
			for _, v29 in ipairs({ "Pickaxe", "Default", "Kunai" }) do
				local flag14 = flag13 and table.find(tbl8, v29) ~= nil

				if flag14 and not tbl9[v29] then
					fn28(v29)
				elseif not flag14 and tbl9[v29] then
					fn29(v29)
				end
			end
		end

		local function fn31()
			local defAntiKickEnabled = v19.Flags.Def_AntiKickEnabled

			if defAntiKickEnabled then
				flag13 = defAntiKickEnabled.Value == true
			end

			local defAntiKickModes = v19.Flags.Def_AntiKickModes
			tbl8 = {}

			if defAntiKickModes then
				local value = defAntiKickModes.Value

				if type(value) == "table" then
					for _, v29 in ipairs(value) do
						if v29 then
							table.insert(tbl8, v29)
						end
					end
				elseif value then
					table.insert(tbl8, value)
				end
			end

			fn30()
		end

		v27:AddDropdown({
			Name = "Anti Kick Modes",
			Options = { "Pickaxe", "Default", "Kunai" },
			Default = {},
			MultiSelect = true,
			Flag = "Def_AntiKickModes",
			Callback = function(arg)
				tbl8 = {}

				if type(arg) == "table" then
					for _, v29 in ipairs(arg) do
						if v29 then
							table.insert(tbl8, v29)
						end
					end
				elseif arg then
					table.insert(tbl8, arg)
				end

				fn30()
			end,
		})

		v27:AddToggle({
			Name = "Anti Kick",
			Default = false,
			Flag = "Def_AntiKickEnabled",
			Callback = function(arg)
				flag13 = arg
				fn30()
			end,
		})

		task.defer(fn31)
	end

	do
		local connection = nil

		local function fn27(arg)
			for _, descendant in ipairs(workspace:GetDescendants()) do
				if descendant:IsA("Model") and descendant.Name == "Campfire" then
					for _, descendant2 in ipairs(descendant:GetDescendants()) do
						if descendant2:IsA("BasePart") then
							descendant2.CanTouch = not arg
						end
					end
				end
			end
		end

		v27:AddToggle({
			Name = "Anti Burn",
			Default = false,
			Flag = "Def_AntiBurn",
			Callback = function(arg)
				fn27(arg)

				if arg then
					connection = workspace.DescendantAdded:Connect(function(descendant)
						if descendant:IsA("Model") and descendant.Name == "Campfire" then
							task.wait(0.1)

							for _, descendant2 in ipairs(descendant:GetDescendants()) do
								if descendant2:IsA("BasePart") then
									descendant2.CanTouch = false
								end
							end
						end
					end)
				elseif connection then
					connection:Disconnect()
					connection = nil
				end
			end,
		})
	end

	local fn27

	do
		local function fn28()
			if inv and inv:FindFirstChild("tractorgucci") then
				DestroyToy:FireServer(inv.tractorgucci)
			end

			for i = 1, 30 do
				hum.Sit = true
				task.wait()
				hum.Sit = false
			end
		end

		local function fn29()
			local TractorGreen = fn21("TractorGreen", HRP.CFrame * CFrame.new(5, 5, 20))

			if TractorGreen then
				TractorGreen.Name = "tractorgucci"
				task.wait()
				local vehicleSeat = TractorGreen:WaitForChild("VehicleSeat", 3)

				if vehicleSeat then
					vehicleSeat:Sit(hum)
				end
			end

			task.spawn(function()
				local n25 = tick() + 3

				while tick() < n25 do
					Ragdoll:FireServer(HRP, 0)
					task.wait()
				end
			end)

			task.wait()

			if TractorGreen and TractorGreen:FindFirstChild("VehicleSeat") then
				while TractorGreen.VehicleSeat.Occupant ~= hum do
					task.wait()
				end

				hum:ChangeState(Enum.HumanoidStateType.Jumping)
				fn19(TractorGreen.Part)
			end
		end

		fn27 = function()
			fn28()
			task.wait(0.2)
			fn29()
		end
	end

	v28:AddToggle({
		Name = "Gucci Tractor",
		Default = false,
		Flag = "Def_GucciTractor",
		Callback = function(arg)
			if arg then
				local TractorGreen = fn21("TractorGreen", HRP.CFrame * CFrame.new(5, 5, 20))

				if TractorGreen then
					TractorGreen.Name = "tractorgucci"
					local vehicleSeat = TractorGreen:WaitForChild("VehicleSeat", 3)

					if vehicleSeat then
						vehicleSeat:Sit(hum)
					end
				end

				task.spawn(function()
					local n25 = tick() + 3

					while tick() < n25 do
						Ragdoll:FireServer(HRP, 0)
						task.wait()
					end
				end)

				task.wait()

				if TractorGreen and TractorGreen:FindFirstChild("VehicleSeat") then
					while TractorGreen.VehicleSeat.Occupant ~= hum do
						task.wait()
					end

					hum:ChangeState(Enum.HumanoidStateType.Jumping)
					local part2 = TractorGreen:FindFirstChild("Part") or TractorGreen.PrimaryPart or TractorGreen.VehicleSeat

					if part2 then
						fn19(part2)
						local bodyVelocity = Instance.new("BodyVelocity")
						bodyVelocity.Name = "AstralFlightVelocity"
						bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						bodyVelocity.Velocity = Vector3.new(0, 5000, 0)
						bodyVelocity.Parent = part2
						local bodyGyro = Instance.new("BodyGyro")
						bodyGyro.Name = "AstralFlightGyro"
						bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
						bodyGyro.CFrame = part2.CFrame
						bodyGyro.Parent = part2
					end
				end
			else
				if inv and inv:FindFirstChild("tractorgucci") then
					DestroyToy:FireServer(inv.tractorgucci)
				end

				for i = 1, 30 do
					hum.Sit = true
					task.wait()
					hum.Sit = false
				end
			end
		end,
	})

	v28:AddButton({
		Name = "GucciTrain",
		Callback = function()
			if not char or not hum or not HRP then
				return
			end
			local pivot = char:GetPivot()
			local objectModel = workspace.Map.AlwaysHereTweenedObjects.Train.Object:FindFirstChild("ObjectModel")
			if not objectModel then
				return
			end
			local v29 = nil

			for _, child in pairs(objectModel:GetChildren()) do
				if child.Name == "Seat" and child.Occupant == nil and child ~= tbl5.LastSeat then
					tbl5.LastSeat = child
					v29 = child
					break
				else
					v29 = nil
				end
			end

			if not v29 then
				return
			end
			v29:Sit(hum)

			task.spawn(function()
				local n25 = tick() + 0.5

				while tick() < n25 do
					task.wait()
					Ragdoll:FireServer(HRP, 0)
				end
			end)

			task.wait()
			local isHeld = plr:FindFirstChild("IsHeld")

			while not hum.SeatPart or isHeld and isHeld.Value do
				task.wait()
			end

			hum.Sit = false
			task.wait()

			for i = 1, 3 do
				char:PivotTo(pivot)
			end
		end,
	})

	v28:AddToggle({
		Name = "Gucci Blobman",
		Default = false,
		Flag = "Def_GucciBlob",
		Callback = function(arg)
			if arg then
				local CreatureBlobman = fn21("CreatureBlobman", HRP.CFrame * CFrame.new(5, 5, 20))

				repeat
					task.wait()
				until CreatureBlobman

				CreatureBlobman:WaitForChild("VehicleSeat", 3):Sit(hum)

				task.spawn(function()
					local n25 = tick() + 3

					while tick() < n25 do
						Ragdoll:FireServer(HRP, 0)
						task.wait()
					end
				end)

				task.wait()

				while CreatureBlobman.VehicleSeat.Occupant ~= hum do
					task.wait()
				end

				hum:ChangeState(Enum.HumanoidStateType.Jumping)
			else
				if inv and inv:FindFirstChild("CreatureBlobman") then
					DestroyToy:FireServer(inv.CreatureBlobman)
				end

				for i = 1, 30 do
					hum.Sit = true
					task.wait()
					hum.Sit = false
				end
			end
		end,
	})

	v28:AddToggle({
		Name = "Anti Paint",
		Default = false,
		Flag = "Def_AntiPaint",
		Callback = function(arg)
			if arg then
				cons.AntiPaint = workspace.DescendantAdded:Connect(function(descendant)
					if descendant.Name == "PaintPlayerPart" then
						task.wait(0.1)
						descendant:Destroy()
					end
				end)

				for _, descendant in pairs(workspace:GetDescendants()) do
					if descendant.Name == "PaintPlayerPart" or descendant.Name == "PainPlayerPart" then
						descendant:Destroy()
					end
				end
			elseif cons.AntiPaint then
				cons.AntiPaint:Disconnect()
			end
		end,
	})

	v28:AddToggle({
		Name = "Anti Explosion",
		Default = false,
		Flag = "Def_AntiExplode",
		Callback = function(arg)
			if arg then
				cons.AntiExplode = workspace.ChildAdded:Connect(function(child)
					local ragdolled = hum and hum:FindFirstChild("Ragdolled")

					if child.Name == "Part" and HRP and ragdolled and ragdolled:IsA("BoolValue") and (child.Position - HRP.Position).Magnitude < 40 and ragdolled.Value then
						HRP.Anchored = true
						task.wait(0.01)
						HRP.Anchored = false
						fn18(HRP)
						hum:ChangeState(Enum.HumanoidStateType.Running)
					end
				end)
			elseif cons.AntiExplode then
				cons.AntiExplode:Disconnect()
			end
		end,
	})

	v28:AddToggle({
		Name = "Anti Void",
		Default = false,
		Flag = "Def_AntiVoid",
		Callback = function(arg)
			workspace.FallenPartsDestroyHeight = arg and (0/0) or -100
		end,
	})

	v28:AddToggle({
		Name = "Anti Sticky",
		Default = false,
		Flag = "Def_AntiSticky",
		Callback = function(arg)
			if plr:FindFirstChild("PlayerScripts") and plr.PlayerScripts:FindFirstChild("StickyPartsTouchDetection") then
				plr.PlayerScripts.StickyPartsTouchDetection.Enabled = not arg
			end
		end,
	})

	local v29
	v29 = tbl6.Visual:AddSection({ Name = "Player Visuals", Side = "Left" })
	local v30
	v30 = tbl6.Visual:AddSection({ Name = "World Visuals", Side = "Right" })

	do
		local tbl8 = {}
		local tbl9 = {}
		local flag13 = false
		local str6 = "Black-White"
		local n25 = 20
		local connection = nil
		local n26 = 0

		local function fn28()
			if str6 == "Black-White" then
				return {
					FillColor = Color3.fromRGB(0, 0, 0),
					OutlineColor = Color3.fromRGB(255, 255, 255),
					FillTransparency = 0.35,
					OutlineTransparency = 0,
				}
			end

			if str6 == "Gray-Black" then
				return {
					FillColor = Color3.fromRGB(80, 80, 80),
					OutlineColor = Color3.fromRGB(0, 0, 0),
					FillTransparency = 0.35,
					OutlineTransparency = 0,
				}
			end

			if str6 == "Black" then
				return {
					FillColor = Color3.fromRGB(0, 0, 0),
					OutlineColor = Color3.fromRGB(0, 0, 0),
					FillTransparency = 0,
					OutlineTransparency = 0,
				}
			end

			return {
				FillColor = Color3.fromRGB(0, 0, 0),
				OutlineColor = Color3.fromRGB(255, 255, 255),
				FillTransparency = 0.35,
				OutlineTransparency = 0,
			}
		end

		local function fn29(arg)
			if not arg then
				return
			end
			local highlight = arg:FindFirstChildOfClass("Highlight")

			if highlight then
				highlight:Destroy()
			end

			for _, child in pairs(arg:GetChildren()) do
				local highlight2 = child:FindFirstChildOfClass("Highlight")

				if highlight2 then
					highlight2:Destroy()
				end
			end
		end

		local function fn30(arg)
			if not arg or not arg.Parent or not arg:IsA("Model") then
				return
			end

			if arg:FindFirstChild("StickyPart") then
				tbl9[arg] = true
			end
		end

		local function fn31(arg)
			if not arg then
				return
			end
			local stickyPart = arg:FindFirstChild("StickyPart")

			if not stickyPart or not arg.Parent then
				fn29(arg)
				tbl9[arg] = nil
				return
			end

			local character_ = plr and plr.Character
			character_ = character_ and character_:FindFirstChild("HumanoidRootPart")
			if not character_ or not stickyPart.Position then
				fn29(arg)
				return
			end

			if n25 < (stickyPart.Position - character_.Position).Magnitude then
				fn29(arg)
				return
			end
			local v31 = fn28()

			if arg:FindFirstChild("Pyramid") then
				for _, child in pairs(arg:GetChildren()) do
					if child:IsA("BasePart") and child.Name == "Pyramid" and not child:FindFirstChildOfClass("Highlight") then
						local highlight = Instance.new("Highlight", child)
						highlight.FillColor = v31.FillColor
						highlight.OutlineColor = v31.OutlineColor
						highlight.FillTransparency = v31.FillTransparency
						highlight.OutlineTransparency = v31.OutlineTransparency
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					end
				end
			elseif not arg:FindFirstChildOfClass("Highlight") then
				local highlight = Instance.new("Highlight", arg)
				highlight.FillColor = v31.FillColor
				highlight.OutlineColor = v31.OutlineColor
				highlight.FillTransparency = v31.FillTransparency
				highlight.OutlineTransparency = v31.OutlineTransparency
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			end
		end

		local function fn32()
			for k in pairs(tbl9) do
				fn31(k)
			end
		end

		local function fn33()
			if connection then
				return
			end
			n26 = 0

			connection = RunService.Heartbeat:Connect(function(deltaTime)
				n26 += deltaTime

				if n26 >= 0.4 then
					n26 = 0
					fn32()
				end
			end)
		end

		local function fn34()
			if connection then
				connection:Disconnect()
				connection = nil
			end
		end

		v29:AddToggle({
			Name = "Anti kick ESP",
			Default = false,
			Flag = "Vis_StickESP",
			Callback = function(arg)
				flag13 = arg

				for _, v31 in ipairs(tbl8) do
					if v31 then
						v31:Disconnect()
					end
				end

				table.clear(tbl8)

				local function fn35(arg2)
					if flag13 and arg2 and arg2.Parent and arg2:IsA("Model") then
						fn30(arg2)

						table.insert(tbl8, arg2.ChildAdded:Connect(function(child)
							if child.Name == "StickyPart" then
								fn30(arg2)
							end
						end))
					end
				end

				local function fn36(arg2)
					if not flag13 or not arg2 or not arg2:IsA("Folder") then
						return
					end

					for _, child in pairs(arg2:GetChildren()) do
						fn35(child)
					end

					table.insert(tbl8, arg2.ChildAdded:Connect(function(child)
						fn35(child)
					end))
				end

				if arg then
					local v31 = pairs
					local Players_ = game:GetService("Players")

					for _, player in v31(Players_:GetPlayers()) do
						local v32 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")

						if v32 then
							fn36(v32)
						end
					end

					table.insert(tbl8, workspace.ChildAdded:Connect(function(child)
						if child.Name:match("SpawnedInToys$") then
							local v32
							fn36(v32)
						end
					end))

					fn33()
				else
					fn34()

					for k in pairs(tbl9) do
						fn29(k)
					end

					table.clear(tbl9)
				end
			end,
		})

		v29:AddDropdown({
			Name = "Anti kick ESP Mode",
			Options = { "Black-White", "Gray-Black", "Black" },
			Default = "Black-White",
			Flag = "Vis_StickESPMode",
			Callback = function(arg)
				if arg == "Normal" then
					arg = "Black-White"
				elseif arg == "Dark" then
					arg = "Black-White"
				end

				str6 = arg or "Black-White"

				if v19.Flags.Vis_StickESP and v19.Flags.Vis_StickESP.Value then
					local v31 = pairs
					local Players_ = game:GetService("Players")

					for _, player in v31(Players_:GetPlayers()) do
						local v32 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")

						if v32 then
							for _, child in pairs(v32:GetChildren()) do
								if child:FindFirstChild("StickyPart") then
									fn29(child)
									fn31(child)
								end
							end
						end
					end
				end
			end,
		})
	end

	v29:AddToggle({
		Name = "Third Person",
		Tooltip = "Unlocks camera zoom distance.",
		Default = false,
		Flag = "Vis_ThirdPerson",
		Callback = function(arg)
			local v31 = LocalPlayer

			if arg then
				v31.CameraMode = Enum.CameraMode.Classic
				v31.CameraMaxZoomDistance = 1000
				v31.CameraMinZoomDistance = 12
				task.wait()
				v31.CameraMinZoomDistance = 0.5
			else
				v31.CameraMode = Enum.CameraMode.LockFirstPerson
				v31.CameraMaxZoomDistance = 0.5
				v31.CameraMinZoomDistance = 0.5
			end
		end,
	})

	local RunService_
	RunService_ = game:GetService("RunService")
	local CoreGui_
	CoreGui_ = game:GetService("CoreGui")
	local localPlayer

	do
		local Players_ = game:GetService("Players")
		localPlayer = Players_.LocalPlayer

		local tbl8 = {
			Enabled = false,
			Boxes = {},
			Style = "Brick (Solid Red)",
			Targets = { "partesp", "playercharacterlocationdetector" },
			Styles = {
				["Gray / Black Outline"] = { Fill = Color3.fromRGB(169, 169, 169), Out = Color3.fromRGB(0, 0, 0), Trans = 0.8 },
				["White / Black Outline"] = { Fill = Color3.fromRGB(255, 255, 255), Out = Color3.fromRGB(0, 0, 0), Trans = 0.8 },
				["Gray / White Outline"] = {
					Fill = Color3.fromRGB(169, 169, 169),
					Out = Color3.fromRGB(255, 255, 255),
					Trans = 0.7,
				},
				["Brick (Solid Red)"] = { Fill = Color3.fromRGB(200, 50, 50), Out = Color3.fromRGB(0, 0, 0), Trans = 0.2 },
			},
		}

		local function fn28(arg, arg2)
			if not arg then
				return
			end
			arg2 = arg2 and tbl8.Styles[arg2] or tbl8.Styles["Brick (Solid Red)"]

			if arg2 then
				if arg.F then
					arg.F.Color3 = arg2.Fill
					arg.F.Transparency = arg2.Trans
				end

				if arg.O then
					arg.O.Color3 = arg2.Out
					arg.O.LineThickness = 0.07
				end
			end
		end

		local function fn29()
			for _, boxe in pairs(tbl8.Boxes) do
				fn28(boxe, tbl8.Style)
			end
		end

		local function fn30(arg)
			if not arg:IsA("BasePart") or tbl8.Boxes[arg] then
				return
			end

			if localPlayer.Character and arg:IsDescendantOf(localPlayer.Character) then
				return
			end
			local part2 = Instance.new("Part")
			part2.Name = "PCLD_Proxy"
			part2.Transparency = 1
			part2.Anchored = true
			part2.CanCollide = false
			part2.CanQuery = false
			part2.CanTouch = false
			part2.Locked = true
			part2.Size = Vector3.new(2.5, 7, arg.Size.Z + 0.1)
			part2.CFrame = arg.CFrame
			part2.Parent = workspace.CurrentCamera
			local boxHandleAdornment = Instance.new("BoxHandleAdornment", CoreGui_)
			boxHandleAdornment.Name = "PCLD_Visual_Fill"
			boxHandleAdornment.Adornee = part2
			boxHandleAdornment.AlwaysOnTop = true
			boxHandleAdornment.ZIndex = 4
			boxHandleAdornment.Size = part2.Size
			local selectionBox = Instance.new("SelectionBox", CoreGui_)
			selectionBox.Name = "PCLD_Visual_Outline"
			selectionBox.Adornee = part2
			selectionBox.LineThickness = 0.07

			local tbl9 = {
				F = boxHandleAdornment,
				O = selectionBox,
				Proxy = part2,
				Conn = RunService_.RenderStepped:Connect(function(deltaTime)
					if arg and arg.Parent and part2 then
						local vector = Vector3.new(2.5, 7, arg.Size.Z + 0.1)
						local n25 = math.clamp(deltaTime * 12, 0, 1)
						part2.CFrame = part2.CFrame:Lerp(arg.CFrame, n25)
						part2.Size = part2.Size:Lerp(vector, n25)
						boxHandleAdornment.Size = part2.Size
					end
				end),
			}

			tbl8.Boxes[arg] = tbl9
			fn28(tbl9, tbl8.Style)

			arg.AncestryChanged:Connect(function(child, parent)
				if not parent and tbl8.Boxes[arg] then
					if tbl9.F then
						tbl9.F:Destroy()
					end

					if tbl9.O then
						tbl9.O:Destroy()
					end

					if tbl9.Proxy then
						tbl9.Proxy:Destroy()
					end

					if tbl9.Conn then
						tbl9.Conn:Disconnect()
					end

					tbl8.Boxes[arg] = nil
				end
			end)
		end

		local function fn31()
			for _, boxe in pairs(tbl8.Boxes) do
				if boxe.F then
					boxe.F:Destroy()
				end

				if boxe.O then
					boxe.O:Destroy()
				end

				if boxe.Proxy then
					boxe.Proxy:Destroy()
				end

				if boxe.Conn then
					boxe.Conn:Disconnect()
				end
			end

			tbl8.Boxes = {}
		end

		local function fn32()
			if not tbl8.Enabled then
				return
			end

			for _, descendant in ipairs(workspace:GetDescendants()) do
				local v31 = string.lower(descendant.Name)

				for _, target in ipairs(tbl8.Targets) do
					if v31 == string.lower(target) then
						fn30(descendant)
						break
					end
				end
			end
		end

		workspace.DescendantAdded:Connect(function(descendant)
			if tbl8.Enabled then
				local v31 = string.lower(descendant.Name)

				for _, target in ipairs(tbl8.Targets) do
					if v31 == string.lower(target) then
						fn30(descendant)
						break
					end
				end
			end
		end)

		v30:AddToggle({
			Name = "PCLD ESP",
			Default = false,
			Flag = "Vis_PCLD",
			Callback = function(enabled)
				tbl8.Enabled = enabled

				if enabled then
					fn32()
				else
					fn31()
				end
			end,
		})

		v30:AddDropdown({
			Name = "PCLD Style Mode",
			Options = {
				"Gray / Black Outline",
				"White / Black Outline",
				"Gray / White Outline",
				"Brick (Solid Red)",
			},
			Default = "Brick (Solid Red)",
			Flag = "Vis_PCLD_Style",
			Callback = function(style)
				tbl8.Style = style
				fn29()
			end,
		})

		v30:AddToggle({
			Name = "Blue Shaders",
			Default = false,
			Flag = "Vis_GalaxyShaders",
			Callback = function(arg)
				local Lighting = game:GetService("Lighting")

				if arg then
					pcall(function()
						local galCC = Lighting:FindFirstChild("GalCC") or Instance.new("ColorCorrectionEffect")
						galCC.Name = "GalCC"
						galCC.Saturation = 0.5
						galCC.Contrast = 0.3
						galCC.TintColor = Color3.fromRGB(240, 220, 255)
						galCC.Parent = Lighting
						galCC.Enabled = true
						local galBloom = Lighting:FindFirstChild("GalBloom") or Instance.new("BloomEffect")
						galBloom.Name = "GalBloom"
						galBloom.Intensity = 0.3
						galBloom.Threshold = 0.8
						galBloom.Parent = Lighting
						galBloom.Enabled = true
						local galAtmo = Lighting:FindFirstChild("GalAtmo") or Instance.new("Atmosphere")
						galAtmo.Name = "GalAtmo"
						galAtmo.Density = 0.3
						galAtmo.Color = Color3.fromRGB(40, 0, 100)
						galAtmo.Parent = Lighting
						galAtmo.Enabled = true
						Lighting.GlobalShadows = true
					end)
				else
					pcall(function()
						if Lighting:FindFirstChild("GalCC") then
							Lighting.GalCC:Destroy()
						end

						if Lighting:FindFirstChild("GalBloom") then
							Lighting.GalBloom:Destroy()
						end

						if Lighting:FindFirstChild("GalAtmo") then
							Lighting.GalAtmo:Destroy()
						end

						Lighting.GlobalShadows = false
					end)
				end
			end,
		})

		local localPlayer2 = Players_.LocalPlayer
		local enabled = false

		local function fn33(player)
			if player == localPlayer2 then
				return
			end

			local function fn34(character_)
				if not character_ then
					return
				end
				local head = character_:WaitForChild("Head", 10)

				if head then
					local neoLoseNameTag = head:FindFirstChild("NeoLose_NameTag") or Instance.new("BillboardGui")
					neoLoseNameTag.Name = "NeoLose_NameTag"
					neoLoseNameTag.Parent = head
					neoLoseNameTag.Size = UDim2.new(0, 200, 0, 50)
					neoLoseNameTag.StudsOffset = Vector3.new(0, 3, 0)
					neoLoseNameTag.AlwaysOnTop = true
					local textLabel = neoLoseNameTag:FindFirstChild("TextLabel") or Instance.new("TextLabel", neoLoseNameTag)
					textLabel.Name = "TextLabel"
					textLabel.BackgroundTransparency = 1
					textLabel.Size = UDim2.new(1, 0, 1, 0)
					textLabel.Text = player.DisplayName .. " (@" .. player.Name .. ")"
					textLabel.TextColor3 = Color3.new(1, 1, 1)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextSize = 14
					textLabel.Font = Enum.Font.GothamBold
					neoLoseNameTag.Enabled = enabled
				end
			end

			player.CharacterAdded:Connect(fn34)

			if player.Character then
				fn34(player.Character)
			end
		end

		v29:AddToggle({
			Name = "Player Esp",
			Default = false,
			Flag = "ESP_Names_Only",
			Callback = function(enabled2)
				enabled = enabled2

				for _, player in pairs(Players_:GetPlayers()) do
					if player.Character and player.Character:FindFirstChild("Head") then
						local neoLoseNameTag = player.Character.Head:FindFirstChild("NeoLose_NameTag")

						if neoLoseNameTag then
							neoLoseNameTag.Enabled = enabled2
						end
					end
				end
			end,
		})

		v30:AddSlider({
			Name = "Field of View",
			Min = 30,
			Max = 120,
			Default = 90,
			Increment = 1,
			ValueName = "FOV",
			Flag = "Targ_FOV",
			Callback = function(fieldOfView)
				workspace.CurrentCamera.FieldOfView = fieldOfView
			end,
		})

		Players_.PlayerAdded:Connect(fn33)

		for _, player in pairs(Players_:GetPlayers()) do
			fn33(player)
		end
	end

	do
		local function fn28()
			local Lighting = game:GetService("Lighting")

			for _, child in pairs(Lighting:GetChildren()) do
				if child:IsA("Sky") or child:IsA("BloomEffect") or child:IsA("BlurEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("SunRaysEffect") then
					child:Destroy()
				end
			end

			Lighting.Brightness = 2.14
			Lighting.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
			Lighting.ColorShift_Top = Color3.fromRGB(240, 127, 14)
			Lighting.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
			Lighting.ClockTime = 6.7
			Lighting.FogColor = Color3.fromRGB(94, 76, 106)
			Lighting.FogEnd = 1000
			Lighting.FogStart = 0
			Lighting.ExposureCompensation = 0.24
			Lighting.ShadowSoftness = 0
			Lighting.Ambient = Color3.fromRGB(59, 33, 27)
			local bloomEffect = Instance.new("BloomEffect", Lighting)
			bloomEffect.Intensity = 0.1
			bloomEffect.Threshold = 0
			bloomEffect.Size = 100
			Instance.new("BlurEffect", Lighting).Size = 2
			local colorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
			colorCorrectionEffect.Name = "Inari taisha"
			colorCorrectionEffect.Saturation = 0.05
			colorCorrectionEffect.TintColor = Color3.fromRGB(255, 224, 219)
			Instance.new("SunRaysEffect", Lighting).Intensity = 0.05
			local sky = Instance.new("Sky", Lighting)
			sky.Name = "Sunset"
			sky.SkyboxUp = "rbxassetid://323493360"
			sky.SkyboxLf = "rbxassetid://323494252"
			sky.SkyboxBk = "rbxassetid://323494035"
			sky.SkyboxFt = "rbxassetid://323494130"
			sky.SkyboxDn = "rbxassetid://323494368"
			sky.SkyboxRt = "rbxassetid://323494067"
			sky.SunAngularSize = 14
		end

		local function fn29()
			local Lighting = game:GetService("Lighting")
			Lighting.ClockTime = 14
			Lighting.Brightness = 2
			Lighting.ExposureCompensation = 0
			Lighting.Ambient = Color3.fromRGB(0, 0, 0)
			Lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)

			for _, child in pairs(Lighting:GetChildren()) do
				if child:IsA("Sky") or child:IsA("BloomEffect") or child:IsA("BlurEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("SunRaysEffect") then
					child:Destroy()
				end
			end

			Instance.new("Sky", Lighting)
		end

		v30:AddToggle({
			Name = "Purple Shaders",
			Default = false,
			Flag = "Vis_AestheticShaders",
			Callback = function(arg)
				if arg then
					fn28()
				else
					fn29()
				end
			end,
		})
	end

	v30:AddButton({
		Name = "Real Ocean",
		Callback = function()
			local terrain = workspace:FindFirstChildOfClass("Terrain")
			local objectModel = workspace:FindFirstChild("Map") and workspace.Map:FindFirstChild("AlwaysHereTweenedObjects") and workspace.Map.AlwaysHereTweenedObjects:FindFirstChild("Ocean") and workspace.Map.AlwaysHereTweenedObjects.Ocean:FindFirstChild("Object") and workspace.Map.AlwaysHereTweenedObjects.Ocean.Object:FindFirstChild("ObjectModel")

			if terrain and objectModel then
				pcall(function()
					for _, child in ipairs(objectModel:GetChildren()) do
						if child:IsA("Part") then
							local size = child.Size
							local cFrame2 = child.CFrame
							terrain:FillRegion(Region3.new(cFrame2.Position - size / 2, cFrame2.Position + size / 2):ExpandToGrid(4), 4, Enum.Material.Water)
							child:Destroy()
						end
					end
				end)

				v19:MakeNotification({ Name = "Real Ocean", Content = "Ocean replaced with terrain water!", Time = 3 })
			else
				v19:MakeNotification({ Name = "Error", Content = "Ocean model not found on this map.", Time = 3 })
			end
		end,
	})

	v29:AddToggle({
		Name = "BlackHole Tracer",
		Default = false,
		Flag = "Visual_BH_Tracer",
		Callback = function()
		end,
	})

	local function fn28(child)
		if child.Name == "BlackHoleKick" then
			local hole = child:WaitForChild("Hole", 10)
			if not hole or not hole:IsA("BasePart") then
				return
			end

			pcall(function()
				hole.Transparency = 0.7
				local billboardGui = hole:WaitForChild("BillboardGui", 5)
				local small = billboardGui:FindFirstChild("Small")
				local large = billboardGui:FindFirstChild("Large")
				local jpg = getcustomasset("hello.jpg")

				if small then
					small.BackgroundTransparency = 1
					small.Image = jpg
					small.Size = UDim2.new(0.6, 0, 0.6, 0)
				end

				if large then
					large.BackgroundTransparency = 1
					large.Image = jpg
					large.Size = UDim2.new(0.6, 0, 0.6, 0)
				end
			end)

			local attachment = Instance.new("Attachment", hole)
			attachment.Name = "HoleAttachment"
			local beam = Instance.new("Beam", hole)
			beam.Color = ColorSequence.new(Color3.new(1, 1, 1))
			beam.Width0 = 0.05
			beam.Width1 = 0.05
			beam.Transparency = NumberSequence.new(0)
			beam.FaceCamera = true
			beam.Attachment1 = attachment
			beam.Enabled = false

			task.spawn(function()
				while hole.Parent do
					local flag13 = false

					if v19.Flags.Visual_BH_Tracer then
						flag13 = v19.Flags.Visual_BH_Tracer.Value
					end

					if flag13 and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
						local humanoidRootPart = localPlayer.Character.HumanoidRootPart
						local tracerStart = humanoidRootPart:FindFirstChild("TracerStart") or Instance.new("Attachment", humanoidRootPart)
						tracerStart.Name = "TracerStart"
						beam.Attachment0 = tracerStart
						beam.Enabled = true
					else
						beam.Enabled = false
					end

					task.wait(0.1)
				end
			end)
		end
	end

	workspace.ChildAdded:Connect(fn28)

	for _, child in pairs(workspace:GetChildren()) do
		fn28(child)
	end

	workspace.ChildAdded:Connect(function(child)
		if child.Name == "BlackHoleKick" then
			local hole = child:WaitForChild("Hole")
			hole.Transparency = 0.7
			local billboardGui = hole:WaitForChild("BillboardGui")
			local small = billboardGui:WaitForChild("Small")
			local large = billboardGui:WaitForChild("Large")
			small.BackgroundTransparency = 1
			small.ImageColor3 = Color3.fromRGB(255, 255, 255)
			small.Size = UDim2.new(0.5, 0, 0.5, 0)
			large.BackgroundTransparency = 1
			large.ImageColor3 = Color3.fromRGB(255, 255, 255)
			large.Size = UDim2.new(0.5, 0, 0.5, 0)
			local jpg = getcustomasset("hello.jpg")
			small.Image = jpg
			large.Image = jpg
		end
	end)

	do
		local v31 = tbl6.Movement:AddSection({ Name = "Movement Settings", Side = "Right" })
		local v32 = tbl6.Movement:AddSection({ Name = "Movement", Side = "Left" })
		local n25 = 0
		local n26 = 50
		local flag13 = false

		v31:AddSlider({
			Name = "Speed Multiplier",
			Default = 0,
			Min = 0,
			Max = 100,
			Increment = 1,
			Flag = "Move_SpeedVal",
			Callback = function(arg)
				n25 = arg
			end,
		})

		v32:AddToggle({
			Name = "Speed Hack",
			Default = false,
			Flag = "Move_Speed",
			Callback = function(arg)
				if cons.Speed then
					cons.Speed:Disconnect()
				end

				if arg then
					cons.Speed = RunService_.Heartbeat:Connect(function()
						if HRP and hum and hum.MoveDirection.Magnitude > 0 then
							HRP.CFrame = HRP.CFrame + hum.MoveDirection * n25 / 10
						end
					end)
				end
			end,
		})

		v31:AddSlider({
			Name = "Vfly Speed",
			Default = 50,
			Min = 10,
			Max = 500,
			Increment = 1,
			Flag = "Move_FlyVal",
			Callback = function(arg)
				n26 = arg
			end,
		})

		v32:AddToggle({
			Name = "Vfly",
			Default = false,
			Flag = "Move_Fly",
			Callback = function(arg)
				flag13 = arg
				local currentCamera = workspace.CurrentCamera

				if flag13 and HRP and hum then
					local bodyGyro = Instance.new("BodyGyro", HRP)
					bodyGyro.P = 90000
					bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
					bodyGyro.CFrame = HRP.CFrame
					local bodyVelocity = Instance.new("BodyVelocity", HRP)
					bodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
					bodyVelocity.Velocity = Vector3.zero
					hum.PlatformStand = true

					task.spawn(function()
						while flag13 and HRP and HRP.Parent do
							bodyGyro.CFrame = currentCamera.CFrame
							local v33 = UserInputService
							local vector = Vector3.zero

							if v33:IsKeyDown(Enum.KeyCode.W) then
								vector = Vector3.zero + currentCamera.CFrame.LookVector
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.S) then
								vector -= currentCamera.CFrame.LookVector
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.A) then
								vector -= currentCamera.CFrame.RightVector
							end

							if UserInputService:IsKeyDown(Enum.KeyCode.D) then
								vector += currentCamera.CFrame.RightVector
							end

							bodyVelocity.Velocity = vector.Magnitude > 0 and vector.Unit * n26 or Vector3.zero
							RunService_.RenderStepped:Wait()
						end

						if bodyGyro then
							bodyGyro:Destroy()
						end

						if bodyVelocity then
							bodyVelocity:Destroy()
						end

						if hum then
							hum.PlatformStand = false
						end
					end)
				end
			end,
		})

		v32:AddToggle({
			Name = "Water Walk",
			Default = false,
			Flag = "Move_Water",
			Callback = function(canCollide)
				pcall(function()
					for _, child in pairs(workspace.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel:GetChildren()) do
						if child.Name == "Ocean" then
							child.CanCollide = canCollide
						end
					end
				end)
			end,
		})

		v32:AddToggle({
			Name = "Click Teleport",
			Default = false,
			Flag = "Move_ClickTP",
			Callback = function(clickTP)
				_G.ClickTP = clickTP
			end,
		})
	end

	local v31
	v31 = tbl6.Server:AddSection({ Name = "Plot", Side = "Left" })
	local Players_
	Players_ = game:GetService("Players")
	local localPlayer2, v32, str6, tbl8, fn29

	do
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local Workspace = game:GetService("Workspace")
		localPlayer2 = Players_.LocalPlayer
		v32 = ReplicatedStorage2
		str6 = "1"
		tbl8 = { "Plot1 (Green)", "Plot2 (Pink)", "Plot3 (Purple)", "Plot4 (Blue)", "Plot5 (Yellow)" }

		local function fn30()
			if localPlayer2.Character and localPlayer2.Character:FindFirstChild("HumanoidRootPart") then
				return localPlayer2.Character.HumanoidRootPart
			end
			return localPlayer2.CharacterAdded:Wait():WaitForChild("HumanoidRootPart")
		end

		fn29 = function()
			local playersInPlots = Workspace:FindFirstChild("PlotItems") and Workspace.PlotItems:FindFirstChild("PlayersInPlots")

			if playersInPlots and playersInPlots:FindFirstChild(localPlayer2.Name) then
				if notify then
					notify("Break Plot", "You Are In safe zone!", 3)
				end

				return nil
			end

			local v33 = Workspace:FindFirstChild(localPlayer2.Name .. "SpawnedInToys")
			if not v33 then
				return nil
			end
			local v34 = fn30()

			for _, child in pairs(v33:GetChildren()) do
				if (child.Name == "NinjaShuriken" or child.Name == "Noclipped") and child:FindFirstChild("StickyPart") and child:FindFirstChild("SoundPart") then
					if v34 and (child.StickyPart.Position - v34.Position).Magnitude <= 12 then
						return child
					end
				end
			end

			local v35 = fn30()
			if not v35 then
				return nil
			end
			local connection = nil
			local v36 = nil

			connection = v33.ChildAdded:Connect(function(child)
				if child.Name == "NinjaShuriken" then
					v36 = child
					connection:Disconnect()
				end
			end)

			v32.MenuToys.SpawnToyRemoteFunction:InvokeServer("NinjaShuriken", v35.CFrame * CFrame.new(5, 8, 20), Vector3.zero)
			local now3 = tick()

			repeat
				if v36 and v36:FindFirstChild("StickyPart") and v36:FindFirstChild("SoundPart") then
					return v36
				end
				task.wait(0.01)
			until tick() - now3 > 0.1

			return v33:FindFirstChild("NinjaShuriken")
		end
	end

	do
		local v33 = tbl6.Teleport:AddSection({ Name = "Locations", Side = "Left" })
		local flag13 = false

		local tbl9 = {
			["Pink House"] = CFrame.new(-491, -7, -166),
			["Green House"] = CFrame.new(-535, -7, 93),
			["Purple House"] = CFrame.new(250, -6, 463),
			["China House"] = CFrame.new(554, 123, -72),
			["Blue House"] = CFrame.new(510, 83, -339),
			Spawn = CFrame.new(3, -7, -2),
		}

		local str7 = "Spawn"

		v33:AddDropdown({
			Name = "Select Location",
			Options = { "Pink House", "Green House", "Purple House", "China House", "Blue House", "Spawn" },
			Default = "Spawn",
			Flag = "Tp_Location",
			Callback = function(arg)
				str7 = arg
			end,
		})

		v33:AddToggle({
			Name = "Slide Teleport",
			Default = false,
			Flag = "Tp_Slide",
			Callback = function(arg)
				flag13 = arg
			end,
		})

		v33:AddButton({
			Name = "Teleport",
			Callback = function()
				if HRP and tbl9[str7] then
					if flag13 then
						local tbl10 = { CFrame = tbl9[str7] }
						game:GetService("TweenService"):Create(HRP, TweenInfo.new(0.15, Enum.EasingStyle.Sine), tbl10):Play()
					else
						HRP.CFrame = tbl9[str7]
					end
				end
			end,
		})
	end

	do
		local v33 = tbl6.Teleport:AddSection({ Name = "Running", Side = "Right" })
		local tbl9 = { Speed = 20, Radius = 150, Height = 500 }
		local connection = nil
		local bodyPosition = nil
		local bodyGyro = nil
		local n25 = 0

		v33:AddSlider({
			Name = "Loop Orbit Speed",
			Default = 20,
			Min = 0,
			Max = 5000,
			Increment = 10,
			Callback = function(speed)
				tbl9.Speed = speed
			end,
		})

		v33:AddSlider({
			Name = "Orbit Radius",
			Default = 150,
			Min = 10,
			Max = 2000,
			Increment = 10,
			Callback = function(radius)
				tbl9.Radius = radius
			end,
		})

		v33:AddToggle({
			Name = "Loop Orbit",
			Default = false,
			Flag = "Tp_AutoCircleFly",
			Callback = function(arg)
				local character_ = localPlayer.Character
				if not character_ or not character_:FindFirstChild("HumanoidRootPart") then
					return
				end
				local humanoidRootPart = character_.HumanoidRootPart
				local humanoid = character_:FindFirstChildOfClass("Humanoid")

				if arg then
					if humanoid then
						humanoid.PlatformStand = true
					end

					local vector = Vector3.zero
					bodyPosition = Instance.new("BodyPosition")
					bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					bodyPosition.D = 100
					bodyPosition.P = 10000
					bodyPosition.Position = Vector3.new(humanoidRootPart.Position.X, tbl9.Height, humanoidRootPart.Position.Z)
					bodyPosition.Parent = humanoidRootPart
					bodyGyro = Instance.new("BodyGyro")
					bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
					bodyGyro.P = 10000
					bodyGyro.CFrame = humanoidRootPart.CFrame
					bodyGyro.Parent = humanoidRootPart

					connection = RunService_.Heartbeat:Connect(function(deltaTime)
						if not character_ or not character_.Parent or not humanoidRootPart or humanoid.Health <= 0 then
							if connection then
								connection:Disconnect()
							end

							return
						end

						n25 += tbl9.Speed * deltaTime

						if n25 >= 360 then
							n25 %= 360
						end

						local v34 = math.rad(n25)
						local radius = tbl9.Radius
						local radius2 = tbl9.Radius
						local height = tbl9.Height
						bodyPosition.Position = Vector3.new(vector.X + math.cos(v34) * radius, height, vector.Z + math.sin(v34) * radius2)
						local v35 = math.rad(n25 + 10)
						local radius3 = tbl9.Radius
						local radius4 = tbl9.Radius
						local vector2 = Vector3.new(vector.X + math.cos(v35) * radius3, height, vector.Z + math.sin(v35) * radius4)
						bodyGyro.CFrame = CFrame.lookAt(humanoidRootPart.Position, vector2)
					end)
				else
					if connection then
						connection:Disconnect()
					end

					if bodyPosition then
						bodyPosition:Destroy()
					end

					if bodyGyro then
						bodyGyro:Destroy()
					end

					if humanoid then
						humanoid.PlatformStand = false
					end
				end
			end,
		})

		v33:AddToggle({
			Name = "Anti Loop",
			Default = false,
			Flag = "Tp_AntiLoopToggle",
			Callback = function(antiLoopEnabled)
				local localPlayer3 = game:GetService("Players").LocalPlayer
				_G.AntiLoopEnabled = antiLoopEnabled

				if antiLoopEnabled then
					_G.teleportLocations = {
						Vector3.new(518.52, 834.62, -362.38),
						Vector3.new(566.16, 124.33, -93.13),
						Vector3.new(80.63, 346.19, 338.4),
						Vector3.new(288.7, 447.54, 481.17),
						Vector3.new(-331.23, 81.64, 340.15),
						Vector3.new(-566.02, -6.35, 84.2),
						Vector3.new(-514.05, -6.35, -160.63),
						Vector3.new(-215.14, 60.76, -304.82),
						Vector3.new(-338.28, 22.11, 484.03),
					}

					local function fn30()
						while _G.AntiLoopEnabled do
							local character_ = localPlayer3.Character or localPlayer3.CharacterAdded:Wait()
							local humanoidRootPart = character_:FindFirstChild("HumanoidRootPart") or character_:WaitForChild("HumanoidRootPart", 3)

							if humanoidRootPart then
								for _, teleportLocation in ipairs(_G.teleportLocations) do
									if _G.AntiLoopEnabled then
										if humanoidRootPart.Parent then
											humanoidRootPart.CFrame = CFrame.new(teleportLocation)
										end

										task.wait(0.08)
										continue
									end

									break
								end
							else
								task.wait(0.1)
							end
						end
					end

					task.spawn(fn30)

					if not _G.AntiLoopConn then
						_G.AntiLoopConn = localPlayer3.CharacterAdded:Connect(function()
							task.wait(0.08)

							if _G.AntiLoopEnabled then
								task.spawn(fn30)
							end
						end)
					end
				else
					_G.AntiLoopEnabled = false

					if _G.AntiLoopConn then
						_G.AntiLoopConn:Disconnect()
						_G.AntiLoopConn = nil
					end
				end
			end,
		})

		v33:AddToggle({
			Name = "Lock Position",
			Default = false,
			Flag = "Tp_LockPosition",
			Callback = function(arg)
				local Players_2 = game:GetService("Players")
				local RunService_2 = game:GetService("RunService")
				local localPlayer3 = Players_2.LocalPlayer

				if arg then
					local character_ = localPlayer3.Character
					character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

					if character_ then
						_G.LockedCFrame = character_.CFrame
						character_.Anchored = true

						if _G.LockPosConnection then
							_G.LockPosConnection:Disconnect()
						end

						_G.LockPosConnection = RunService_2.Heartbeat:Connect(function()
							local character_2 = localPlayer3.Character
							character_2 = character_2 and character_2:FindFirstChild("HumanoidRootPart")

							if character_2 and _G.LockedCFrame then
								character_2.CFrame = _G.LockedCFrame
								character_2.AssemblyLinearVelocity = Vector3.zero
								character_2.AssemblyAngularVelocity = Vector3.zero
								character_2.Anchored = true
							end
						end)
					end
				else
					if _G.LockPosConnection then
						_G.LockPosConnection:Disconnect()
						_G.LockPosConnection = nil
					end

					local character_ = localPlayer3.Character
					character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

					if character_ then
						character_.Anchored = false
					end
				end
			end,
		})
	end

	local obj

	obj = setmetatable({}, { __index = function()
		return function()
		end
	end })

	do
		local tbl9 = {}
		local cframe = CFrame.new(-0.45, -1.2, -0.7)
		local cframe2 = CFrame.new(0.45, -1.2, -0.7)
		local cframe3 = CFrame.new
		tbl9[1] = cframe
		tbl9[2] = cframe2

		do
			local values = table.pack(cframe3(0, -1, 0.8))
			table.move(values, 1, values.n, 3, tbl9)
		end

		obj:AddToggle({
			Name = "Coconut Penis",
			Default = false,
			Flag = "Fun_Coconut",
			Callback = function(cocoEn)
				_G.CocoEn = cocoEn

				if cocoEn then
					task.spawn(function()
						while _G.CocoEn do
							local tbl10 = {}

							if inv then
								for _, child in pairs(inv:GetChildren()) do
									if child.Name == "FoodCoconut" then
										table.insert(tbl10, child)
									end
								end

								if #tbl10 < 12 and HRP then
									task.spawn(function()
										pcall(function()
											SpawnToy:InvokeServer("FoodCoconut", HRP.CFrame * CFrame.new(-5, 0, 10), Vector3.zero)
										end)
									end)
								end
							end

							if HRP then
								for i = 1, #tbl10 do
									local v33 = tbl10[i]
									local soundPart = v33:FindFirstChild("SoundPart")
									local holdPart = v33:FindFirstChild("HoldPart")

									if v33 and soundPart and holdPart then
										local partOwner = soundPart:FindFirstChild("PartOwner")

										if partOwner and partOwner.Value == localPlayer.Name then
											if i <= 2 then
												soundPart.CFrame = HRP.CFrame * tbl9[i] * CFrame.new(HRP.Velocity / 100)
											else
												soundPart.CFrame = HRP.CFrame * tbl9[3] * CFrame.new(HRP.Velocity / 100) * CFrame.new(0, 0, tbl9[3].Z - i + 0.2)
											end

											soundPart.Velocity = Vector3.zero
										end

										if not partOwner or partOwner.Value ~= localPlayer.Name then
											SetNetOwner:FireServer(soundPart, soundPart.CFrame)
										end

										local rigidConstraint = holdPart:FindFirstChild("RigidConstraint")

										if rigidConstraint and rigidConstraint.Attachment1 then
											DestroyToy:FireServer(v33)
										end

										for _, child in pairs(v33:GetChildren()) do
											if child:IsA("BasePart") then
												child.CanCollide = false
												child.CanQuery = false
											end
										end
									end
								end
							end

							task.wait(0.01)
						end
					end)
				end
			end,
		})
	end

	do
		local TextChatService = game:GetService("TextChatService")
		local str7 = ""
		local n25 = 0.1
		local flag13 = false
		local connection = nil

		obj:AddTextbox({
			Name = "Spam Text",
			Default = "",
			TextDisappear = false,
			Callback = function(arg)
				str7 = tostring(arg)
			end,
		})

		obj:AddTextbox({
			Name = "Spam Speed",
			Default = "0.1",
			TextDisappear = false,
			Callback = function(arg)
				local num = tonumber(arg)

				if num and num > 0 then
					n25 = num
				else
					n25 = 0.1
				end
			end,
		})

		obj:AddToggle({
			Name = "Spam Emotes",
			Default = false,
			Flag = "SpamToggle",
			Callback = function(arg)
				flag13 = arg

				if connection then
					connection:Disconnect()
					connection = nil
				end

				if arg then
					local n26 = 0

					connection = RunService_.Heartbeat:Connect(function(deltaTime)
						if not flag13 then
							return
						end
						n26 += deltaTime

						if n25 <= n26 then
							n26 = 0

							pcall(function()
								TextChatService.TextChannels.RBXGeneral:SendAsync("/e " .. str7)
							end)
						end
					end)
				end
			end,
		})
	end

	obj:AddToggle({
		Name = "Remove Limbs",
		Default = false,
		Flag = "Fun_Coconut",
		Callback = function(arg)
			if arg then
				if workspace:FindFirstChild("GrabParts") and workspace.GrabParts:FindFirstChild("GrabPart") then
					local parent = workspace.GrabParts.GrabPart.WeldConstraint.Part1 and workspace.GrabParts.GrabPart.WeldConstraint.Part1.Parent

					if parent and parent:FindFirstChild("Humanoid") and parent.Humanoid:FindFirstChild("Ragdolled") then
						if parent.Humanoid.Ragdolled.Value then
							local cFrame2 = parent.Torso.CFrame
							workspace.FallenPartsDestroyHeight = -100

							for _, v33 in ipairs({ "Left Leg", "Right Leg", "Left Arm", "Right Arm" }) do
								if parent:FindFirstChild(v33) then
									parent[v33].CFrame = CFrame.new(0, -1000, 0)
								end
							end

							task.wait(0.1)
							parent.Torso.CFrame = CFrame.new(0, -950, 0)
							task.wait(0)
							parent.Torso.CFrame = cFrame2
						else
							Library:Notify("Ragdoll Target pls")
						end
					end
				else
					Library:Notify("Grab someone")
				end
			end
		end,
	})

	local tbl9 = {}

	task.spawn(function()
		local Players_2 = game:GetService("Players")
		local localPlayer3 = Players_2.LocalPlayer

		while task.wait(0.5) do
			for _, player in pairs(Players_2:GetPlayers()) do
				if player ~= localPlayer3 and player.Character then
					local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

					if humanoid and humanoid.SeatPart and (humanoid.SeatPart:IsA("Seat") or humanoid.SeatPart:IsA("VehicleSeat")) then
						tbl9[player.Name] = humanoid.SeatPart
					end
				end
			end
		end
	end)

	obj:AddButton({
		Name = "Remove All Gucci",
		Callback = function()
			local character_ = game:GetService("Players").LocalPlayer.Character
			local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
			local humanoid = character_ and character_:FindFirstChild("Humanoid")
			if not humanoidRootPart or not humanoid then
				return
			end
			local cFrame2 = humanoidRootPart.CFrame
			local n25 = 0

			for _, v33 in pairs(tbl9) do
				if v33 and v33:IsDescendantOf(workspace) then
					pcall(function()
						v33:Sit(humanoid)
						task.wait(0.3)
						n25 += 1
					end)
				end
			end

			pcall(function()
				humanoid.Sit = false
				task.wait(0.1)

				if fn18 then
					fn18(humanoidRootPart)
				else
					humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
					humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
				end

				humanoidRootPart.CFrame = cFrame2
			end)

			tbl9 = {}

			v19:MakeNotification({
				Name = "Remove Recent Gucci",
				Content = "Processed " .. tostring(n25) .. " recently used seats!",
				Time = 3,
			})
		end,
	})

	local Players_2
	Players_2 = game:GetService("Players")
	game:GetService("Debris")
	local Workspace
	Workspace = game:GetService("Workspace")
	local UserInputService_, ContextActionService

	do
		local Lighting = game:GetService("Lighting")
		local TweenService_ = game:GetService("TweenService")
		UserInputService_ = game:GetService("UserInputService")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		ContextActionService = game:GetService("ContextActionService")
		local RunService_2 = game:GetService("RunService")
		local localPlayer3 = Players_2.LocalPlayer
		_G.ControllingCreature = nil
		local connection = nil
		local flag13 = false
		local raycastParams = RaycastParams.new()
		raycastParams.FilterType = Enum.RaycastFilterType.Exclude

		local function fn30()
			local grabEvents = ReplicatedStorage2:FindFirstChild("GrabEvents")
			if grabEvents then
				local findFirstChild = grabEvents.FindFirstChild
				return grabEvents:FindFirstChild("SetNetworkOwner"), findFirstChild(grabEvents, "DestroyGrabLine")
			end
			return nil, nil
		end

		local function fn31(arg, arg2)
			local unit = (arg2 - arg).Unit
			local v33 = unit:Cross(Vector3.new(0, 1, 0))
			local v34 = v33:Cross(unit)
			return CFrame.fromMatrix(arg, v33, v34)
		end

		local function fn32()
			if localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart") and localPlayer3.Character:FindFirstChildOfClass("Humanoid") then
				return localPlayer3.Character
			end
		end

		local function fn33(arg)
			if typeof(arg) == "Instance" and arg:FindFirstChild("PartOwner") and arg.PartOwner.Value == localPlayer3.Name then
				return true
			end
			return false
		end

		local function fn34(arg)
			local v33 = fn30()
			if not v33 then
				return
			end
			local v34 = localPlayer3:DistanceFromCharacter(arg.Position)

			if localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart") then
				if fn33(arg) then
					return true
				end

				if v34 <= 30 then
					v33:FireServer(arg, fn31(localPlayer3.Character.HumanoidRootPart.Position, arg.Position))
				end
			end
		end

		local function fn35(arg)
			local v33, v34 = fn30()
			if not v33 or not v34 then
				return
			end
			local v35 = localPlayer3:DistanceFromCharacter(arg.Position)
			local attribute2 = arg:GetAttribute("Connected")
			local attribute3 = arg:GetAttribute("CreatedConnected")

			if localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart") then
				if fn33(arg) then
					arg:SetAttribute("Connected", true)
					v34:FireServer(arg)

					if not attribute3 then
						arg:SetAttribute("CreatedConnected", true)

						arg.ChildAdded:Connect(function(child)
							if child.Name == "PartOwner" and child.Value ~= localPlayer3.Name then
								arg:SetAttribute("Connected", false)
							end
						end)
					end
				elseif v35 <= 30 and not attribute2 then
					v33:FireServer(arg, fn31(localPlayer3.Character.HumanoidRootPart.Position, arg.Position))
				end
			end
		end

		local function fn36()
			if not connection then
				flag13 = false

				connection = RunService_2.Stepped:Connect(function()
					if flag13 == false and Players_2.LocalPlayer.Character ~= nil then
						for _, child in pairs(Players_2.LocalPlayer.Character:GetChildren()) do
							if child:IsA("BasePart") and child.CanCollide then
								child.CanCollide = false
							end
						end
					end

					task.wait(0.21)
				end)
			end
		end

		local function fn37()
			if connection then
				connection:Disconnect()
				connection = nil
			end

			flag13 = true
		end

		local function fn38(arg)
			for _, child in pairs(arg:GetChildren()) do
				if child:IsA("Part") then
					child.CanQuery = false
				end
			end
		end

		local function fn39(arg)
			for _, child in pairs(arg:GetChildren()) do
				if child:IsA("Part") then
					child.CanQuery = true
				end
			end
		end

		local sound2 = nil
		local colorCorrectionEffect = nil
		local tween = nil
		local tween2 = nil
		local tween3 = nil
		local tween4 = nil

		local function fn40()
			if colorCorrectionEffect then
				return
			end
			sound2 = Instance.new("Sound", Workspace)
			sound2.SoundId = "rbxassetid://9114374439"
			sound2.PlaybackSpeed = 1.25
			colorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
			colorCorrectionEffect.Enabled = false
			tween = TweenService_:Create(Workspace.CurrentCamera, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true), { FieldOfView = 100 })
			tween2 = TweenService_:Create(colorCorrectionEffect, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { TintColor = Color3.fromRGB(200, 210, 240) })
			tween3 = TweenService_:Create(colorCorrectionEffect, TweenInfo.new(1, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true), { Brightness = -0.1 })
			tween4 = TweenService_:Create(colorCorrectionEffect, TweenInfo.new(0.3, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut), { TintColor = Color3.new(3, 3, 3), Brightness = 0 })
		end

		local function fn41()
			fn40()
			colorCorrectionEffect.Enabled = true
			colorCorrectionEffect.TintColor = Color3.new()
			tween:Play()
			tween2:Play()
			sound2:Play()

			tween2.Completed:Once(function()
				tween3:Play()
			end)
		end

		EndControlVisuals = function()
			if not tween4 then
				return
			end
			tween4:Play()

			tween4.Completed:Once(function()
				colorCorrectionEffect.Enabled = false
			end)
		end

		MovePlayerToPosition = function(arg)
			local v33 = fn32()

			if v33 and typeof(arg) == "CFrame" then
				local humanoidRootPart = v33.HumanoidRootPart
				local humanoid = v33:FindFirstChildOfClass("Humanoid")
				humanoidRootPart.CFrame = humanoidRootPart.CFrame.Rotation + arg.Position

				if humanoid.SeatPart == nil or tostring(humanoid.SeatPart.Parent) ~= "CreatureBlobman" then
					humanoid.Sit = false
				end
			end
		end

		BeginControllingTarget = function(arg)
			if typeof(arg) == "Instance" and arg:IsA("Model") then
				local v33 = arg
				local humanoid = v33:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = v33:FindFirstChild("HumanoidRootPart")
				local head = v33:FindFirstChild("Head")
				local flag14 = not Players_2:GetPlayerFromCharacter(arg)
				local flag15

				if flag14 then
					local flag16 = arg.Name == "YouDecoy"

					if flag16 then
						flag15 = flag16
					else
						flag15 = arg.Name == "CreatureBlobman" or tostring(arg.Parent.Name) == "Robloxians"
					end
				else
					flag15 = flag14
				end

				if v33 and humanoid and humanoidRootPart then
					local tbl10 = {}

					local function fn42()
						for _, v34 in pairs(tbl10) do
							if typeof(v34) == "RBXScriptConnection" then
								v34:Disconnect()
							end
						end

						table.clear(tbl10)
					end

					_G.ControllingCreature = v33
					humanoid.WalkSpeed = 0
					humanoid.JumpPower = 24
					humanoid.CameraOffset = Vector3.new(0, 0, -0.7)

					tbl10[1] = humanoid.Died:Connect(function()
						_G.ControllingCreature = nil
					end)

					local bodyVelocity = Instance.new("BodyVelocity", humanoidRootPart)
					local bodyVelocity2 = Instance.new("BodyVelocity")
					bodyVelocity2.MaxForce = Vector3.new(0, math.huge, 0)
					bodyVelocity2.Velocity = Vector3.new()
					bodyVelocity.MaxForce = Vector3.new(math.huge, 0, math.huge)
					fn38(v33)

					task.spawn(function()
						fn36()

						while v33.Parent and _G.ControllingCreature ~= nil do
							if flag15 then
								fn35(head)
							else
								fn34(head)
							end

							humanoid.AutoRotate = true
							task.wait()
						end
					end)

					Workspace.CurrentCamera.CameraSubject = humanoid
					fn41()
					local v34 = fn32()
					local humanoid2, humanoidRootPart2

					if v34 then
						humanoid2 = v34:FindFirstChildOfClass("Humanoid")
						humanoidRootPart2 = v34:FindFirstChild("HumanoidRootPart")
						bodyVelocity2.Parent = humanoidRootPart2

						tbl10[2] = humanoid2.Died:Connect(function()
							_G.ControllingCreature = nil
						end)

						tbl10[3] = UserInputService_.JumpRequest:Connect(function()
							humanoid:ChangeState("Jumping")
						end)

						tbl10[5] = humanoid2.Changed:Connect(function(arg2)
							if arg2 == "MoveDirection" then
								bodyVelocity.Velocity = humanoid2.MoveDirection * 20
							end
						end)

						tbl10[6] = Workspace.CurrentCamera.Changed:Connect(function(arg2)
							if arg2 == "CameraSubject" then
								Workspace.CurrentCamera.CameraSubject = humanoid
							end
						end)

						local lookVector = nil

						tbl10[7] = head.Changed:Connect(function(arg2)
							if arg2 == "CFrame" then
								lookVector = Workspace.CurrentCamera.CFrame.lookVector
								humanoid.CameraOffset = -Vector3.new(lookVector.X, 5, lookVector.Z) * 1.7
							end
						end)

						humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll, false)
					else
						humanoid2 = nil
						humanoidRootPart2 = nil
					end

					while v33.Parent and _G.ControllingCreature ~= nil and v34 and v34.Parent do
						MovePlayerToPosition(CFrame.new(humanoidRootPart.Position + Vector3.new(0, -10, 0)))
						task.wait()
					end

					fn42()
					fn37()
					MovePlayerToPosition(CFrame.new(humanoidRootPart.Position + Vector3.new(5, 15, 5)))
					fn39(v33)
					bodyVelocity:Destroy()
					bodyVelocity2:Destroy()
					Workspace.CurrentCamera.CameraSubject = humanoid2
					_G.ControllingCreature = nil

					if humanoidRootPart2 then
						humanoidRootPart2.Velocity = Vector3.new()
					end

					EndControlVisuals()
				end
			end
		end

		ExecuteControlAction = function()
			local v33 = fn32()

			if v33 then
				local head = v33:FindFirstChild("Head")
				local currentCamera = Workspace.CurrentCamera
				local humanoid = v33:FindFirstChildOfClass("Humanoid")

				if head then
					raycastParams.FilterDescendantsInstances = { v33 }
					local hit = Workspace:Raycast(head.Position, currentCamera.CFrame.lookVector * 50, raycastParams)

					if hit and humanoid and humanoid.Health > 0 then
						local parent = hit.Instance.Parent

						if parent:FindFirstChildOfClass("Humanoid") then
							BeginControllingTarget(parent)
						end
					end
				end
			end
		end
	end

	HandleControlInput = function(arg, arg2)
		if arg == "Control(V)" and arg2 == Enum.UserInputState.Begin then
			if _G.ControllingCreature then
				_G.ControllingCreature = nil
			else
				ExecuteControlAction()
			end
		end
	end

	obj:AddToggle({
		Name = "Control player (V)",
		Default = false,
		Flag = "Fun_ControlChars",
		Callback = function(arg)
			if arg then
				ContextActionService:BindAction("Control(V)", HandleControlInput, false, Enum.KeyCode.V)

				v19:MakeNotification({
					Name = "NeoLose",
					Content = "Control Characters Enabled. Press V while looking at an NPC.",
					Time = 3,
					Image = "crown",
				})
			else
				ContextActionService:UnbindAction("Control(V)")

				if _G.ControllingCreature then
					_G.ControllingCreature = nil
				end
			end
		end,
	})

	do
		local Players_3 = game:GetService("Players")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local Workspace2 = game:GetService("Workspace")
		local localPlayer3 = Players_3.LocalPlayer
		local setNetworkOwner = ReplicatedStorage2:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
		local spawnToyRemoteFunction = ReplicatedStorage2:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
		local n25 = 9
		local tbl10 = { "A", "B", "C", "D", "E", "F", "G", "H" }

		local function fn30()
			local character_ = localPlayer3.Character or localPlayer3.CharacterAdded:Wait()
			return character_:FindFirstChild("HumanoidRootPart") or character_:WaitForChild("HumanoidRootPart", 3)
		end

		local function fn31()
			return Workspace2:FindFirstChild(localPlayer3.Name .. "SpawnedInToys")
		end

		local function fn32()
			local tbl11 = {}

			for i = 1, 8 do
				tbl11[i] = {}

				for i2 = 1, 8 do
					tbl11[i][i2] = false
				end
			end

			return tbl11
		end

		local function fn33(arg)
			local tbl11 = {}

			for i = 1, 8 do
				for i2 = 1, 8 do
					if arg[i][i2] then
						table.insert(tbl11, tbl10[i] .. tostring(i2))
					end
				end
			end

			return tbl11
		end

		local tbl11 = {
			A = {
				"..XXXX..",
				".XX..XX.",
				".XX..XX.",
				".XXXXXX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				"........",
			},
			B = {
				".XXXXX..",
				".XX..XX.",
				".XX..XX.",
				".XXXXX..",
				".XX..XX.",
				".XX..XX.",
				".XXXXX..",
				"........",
			},
			C = {
				"..XXXX..",
				".XX..XX.",
				".XX.....",
				".XX.....",
				".XX.....",
				".XX..XX.",
				"..XXXX..",
				"........",
			},
			D = {
				".XXXXX..",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XXXXX..",
				"........",
			},
			E = {
				".XXXXXX.",
				".XX.....",
				".XX.....",
				".XXXXX..",
				".XX.....",
				".XX.....",
				".XXXXXX.",
				"........",
			},
			F = {
				".XXXXXX.",
				".XX.....",
				".XX.....",
				".XXXXX..",
				".XX.....",
				".XX.....",
				".XX.....",
				"........",
			},
			G = {
				"..XXXX..",
				".XX..XX.",
				".XX.....",
				".XX.....",
				".XX.XXX.",
				".XX..XX.",
				"..XXXX..",
				"........",
			},
			H = {
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XXXXXX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				"........",
			},
			I = {
				"..XXXX..",
				"...XX...",
				"...XX...",
				"...XX...",
				"...XX...",
				"...XX...",
				"..XXXX..",
				"........",
			},
			J = {
				"..XXXX..",
				"...XX...",
				"...XX...",
				"...XX...",
				"...XX...",
				".XX.XX..",
				"..XXX...",
				"........",
			},
			K = {
				".XX..XX.",
				".XX.XX..",
				".XXXXX..",
				".XXXX...",
				".XXXXX..",
				".XX.XX..",
				".XX..XX.",
				"........",
			},
			L = {
				".XX.....",
				".XX.....",
				".XX.....",
				".XX.....",
				".XX.....",
				".XX.....",
				".XXXXXX.",
				"........",
			},
			M = {
				".XX..XX.",
				".XXXXXX.",
				".XXXXXX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				"........",
			},
			N = {
				".XX..XX.",
				".XXX.XX.",
				".XXXXXX.",
				".XX.XXX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				"........",
			},
			O = {
				"..XXXX..",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				"..XXXX..",
				"........",
			},
			P = {
				".XXXXX..",
				".XX..XX.",
				".XX..XX.",
				".XXXXX..",
				".XX.....",
				".XX.....",
				".XX.....",
				"........",
			},
			Q = {
				"..XXXX..",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX.XXX.",
				"..XXXXX.",
				".....XX.",
				"........",
			},
			R = {
				".XXXXX..",
				".XX..XX.",
				".XX..XX.",
				".XXXXX..",
				".XX.XX..",
				".XX..XX.",
				".XX..XX.",
				"........",
			},
			S = {
				"..XXXX..",
				".XX..XX.",
				".XX.....",
				"..XXXX..",
				".....XX.",
				".XX..XX.",
				"..XXXX..",
				"........",
			},
			T = {
				".XXXXXX.",
				"...XX...",
				"...XX...",
				"...XX...",
				"...XX...",
				"...XX...",
				"...XX...",
				"........",
			},
			U = {
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				"..XXXX..",
				"........",
			},
			V = {
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				"..XXXX..",
				"...XX...",
				"........",
			},
			W = {
				".XX..XX.",
				".XX..XX.",
				".XX..XX.",
				".XXXXXX.",
				".XXXXXX.",
				".XX..XX.",
				".XX..XX.",
				"........",
			},
			X = {
				".XX..XX.",
				".XX..XX.",
				"..XXXX..",
				"...XX...",
				"..XXXX..",
				".XX..XX.",
				".XX..XX.",
				"........",
			},
			Y = {
				".XX..XX.",
				".XX..XX.",
				"..XXXX..",
				"...XX...",
				"...XX...",
				"...XX...",
				"...XX...",
				"........",
			},
			Z = {
				".XXXXXX.",
				".....XX.",
				"....XX..",
				"...XX...",
				"..XX....",
				".XX.....",
				".XXXXXX.",
				"........",
			},
		}

		local function fn34(arg)
			local v33 = tbl11[string.upper(arg)]
			if not v33 then
				return nil
			end
			local v34 = fn32()

			for i = 1, math.min(8, #v33) do
				local v35 = v33[i]

				if v35 then
					for i2 = 1, math.min(8, #v35) do
						if v35:sub(i2, i2) == "X" then
							v34[i][i2] = true
						end
					end
				end
			end

			return v34
		end

		local function fn35(arg)
			if not arg or not arg.Parent then
				return
			end
			local v33 = fn30()

			if v33 then
				v33.CFrame = arg.CFrame + Vector3.new(0, 5, 0)
			end
		end

		local function fn36(arg, arg2)
			if not arg or not arg.Parent then
				return nil
			end
			local v33 = arg:FindFirstChild(arg2)
			if v33 and v33:IsA("MeshPart") then
				return v33
			end
			return nil
		end

		local function fn37(arg, arg2)
			local n26 = arg2 or 1
			local n27 = 0

			while arg and arg.Parent and arg.Transparency == 1 and n27 < 1 do
				pcall(function()
					setNetworkOwner:FireServer(arg, arg.CFrame)
				end)

				n27 += 1
				task.wait(0.01 / n26)
			end
		end

		local function fn38(arg, arg2)
			local n26 = arg2 or 1

			for i = 1, 8 do
				for i2 = 1, 8 do
					local v33 = fn36(arg, tbl10[i] .. tostring(i2))

					if v33 and v33.Transparency == 1 then
						fn37(v33, n26)
					end
				end
			end
		end

		local function fn39(arg, arg2, arg3)
			local n26 = arg3 or 1
			if not arg or not arg.Parent then
				return 0
			end
			local v33 = string.upper(arg2)
			local v34 = fn34(v33)
			if not v34 then
				return 0
			end
			fn38(arg, n26)
			local v35 = fn33(v34)
			local n27 = 0

			for _, v36 in ipairs(v35) do
				local v37 = fn36(arg, v36)

				if v37 then
					fn35(v37)

					pcall(function()
						setNetworkOwner:FireServer(v37, v37.CFrame)
					end)

					n27 += 1
				end

				task.wait(0.01 / n26)
			end

			return n27
		end

		local function fn40(arg)
			local n26 = arg or 1
			local v33 = fn31()
			if not v33 then
				return nil
			end
			local tbl12 = {}

			for _, child in ipairs(v33:GetChildren()) do
				if child.Name == "MidiMaker" then
					tbl12[child] = true
				end
			end

			local v34 = fn30()
			if not v34 then
				return nil
			end
			local tbl13 = {}
			local n27 = v34.CFrame * CFrame.new((n26 - 1) * 8, 0, 0) * CFrame.Angles(-2.1337385177612305, 1.0052294731140137, 2.2126595973968506)
			tbl13[1] = "MidiMaker"
			tbl13[2] = n27
			tbl13[3] = Vector3.new(0, 108.713, 0)
			if not pcall(function()
				spawnToyRemoteFunction:InvokeServer(unpack(tbl13))
			end) then
				return nil
			end
			local n28 = tick() + 8
			local v35 = nil

			while true do
				for _, child in ipairs(v33:GetChildren()) do
					if child.Name == "MidiMaker" and not tbl12[child] then
						v35 = child
						break
					end
				end

				if not v35 then
					task.wait(0.05)
				end

				if not (v35 or tick() > n28) then
					continue
				end
				break
			end

			if not v35 then
				return nil
			end
			local body = v35:FindFirstChild("Body") or v35:WaitForChild("Body", 3)
			if not body then
				return nil
			end

			pcall(function()
				setNetworkOwner:FireServer(body, body.CFrame)
			end)

			return v35
		end

		local function fn41(arg, arg2)
			local n26 = arg2 or 1
			if type(arg) ~= "string" then
				return
			end
			local v33 = string.upper(arg)
			local n27 = #v33
			if n27 == 0 then
				return
			end
			local tbl12 = {}

			for i = 1, n27 do
				local str7 = v33:sub(i, i)

				if str7:match("%a") and tbl11[str7] then
					table.insert(tbl12, str7)
				end
			end

			if #tbl12 == 0 then
				return
			end

			if n25 < #tbl12 then
				v19:MakeNotification({
					Name = "Midi Maker",
					Content = "Max " .. n25 .. " letters allowed! Cut to fit.",
					Time = 4,
					Image = "crown",
				})

				while #tbl12 > n25 do
					table.remove(tbl12)
				end
			end

			local tbl13 = {}

			for i, v34 in ipairs(tbl12) do
				local v35 = fn40(i)
				if not v35 then
					return
				end
				table.insert(tbl13, v35)
				task.wait(4)
				if not pcall(function()
					return fn39(v35, v34, n26)
				end) then
					return
				end
				task.wait(0.1)
			end

			v19:MakeNotification({ Name = "Midi Maker", Content = "Word '" .. v33 .. "' has been drawn!", Time = 4, Image = "crown" })
		end

		local str7 = "Dildo"

		obj:AddTextbox({
			Name = "Draw",
			Default = "Dildo",
			TextDisappear = false,
			Callback = function(arg)
				str7 = arg
			end,
		})

		obj:AddButton({
			Name = "Draw",
			Callback = function()
				v19:MakeNotification({
					Name = "Midi Maker",
					Content = "Spawning boards and drawing... Please wait.",
					Time = 4,
					Image = "crown",
				})

				task.spawn(function()
					fn41(str7, 1)
				end)
			end,
		})
	end

	do
		local flag13 = false
		local v33 = nil

		startJerkOff = function()
			character = game.Players.LocalPlayer.Character
			if not character then
				return
			end
			local humanoid = character:FindFirstChildOfClass("Humanoid")
			if not humanoid then
				return
			end
			local animator = humanoid:FindFirstChildOfClass("Animator")

			if not animator then
				animator = Instance.new("Animator")
				animator.Parent = humanoid
			end

			local animation = Instance.new("Animation")
			animation.AnimationId = "rbxassetid://168268306"
			v33 = animator:LoadAnimation(animation)
			v33.Priority = Enum.AnimationPriority.Action
			v33:Play()

			task.spawn(function()
				while flag13 do
					task.wait(0.1)

					if v33 and v33.IsPlaying then
						v33.TimePosition = 0.3
					end
				end
			end)
		end

		local function fn30()
			if v33 then
				v33:Stop()
				v33 = nil
			end
		end

		obj:AddButton({
			Name = "Jack Off",
			Callback = function()
				flag13 = not flag13

				if flag13 then
					startJerkOff()
					v19:MakeNotification({ Name = "NeoLose", Content = "Jack Off enabled", Image = "crown", Time = 2 })
				else
					fn30()
					v19:MakeNotification({ Name = "NeoLose", Content = "Jack Off disabled", Image = "crown", Time = 2 })
				end
			end,
		})
	end

	do
		local flag13 = false
		local flag14 = false
		local connection = nil

		local function fn30(character_)
			local humanoid = character_:WaitForChild("Humanoid", 3)
			local humanoidRootPart = character_:WaitForChild("HumanoidRootPart", 3)
			if not humanoid or not humanoidRootPart then
				return
			end

			if connection then
				connection:Disconnect()
			end

			connection = humanoid.StateChanged:Connect(function(old, new)
				if new == Enum.HumanoidStateType.Jumping then
					if flag13 then
						humanoid.PlatformStand = true
						humanoidRootPart.AssemblyAngularVelocity = humanoidRootPart.CFrame.RightVector * -12

						task.delay(0.65, function()
							if humanoid and humanoid.Parent and humanoidRootPart then
								humanoid.PlatformStand = false
								humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							end
						end)
					elseif flag14 then
						humanoid.PlatformStand = true
						humanoidRootPart.AssemblyAngularVelocity = humanoidRootPart.CFrame.RightVector * 12

						task.delay(0.65, function()
							if humanoid and humanoid.Parent and humanoidRootPart then
								humanoid.PlatformStand = false
								humanoidRootPart.AssemblyAngularVelocity = Vector3.zero
							end
						end)
					end
				end
			end)
		end

		local localPlayer3 = game:GetService("Players").LocalPlayer

		if localPlayer3.Character then
			fn30(localPlayer3.Character)
		end

		localPlayer3.CharacterAdded:Connect(fn30)

		obj:AddToggle({
			Name = "Backflip",
			Default = false,
			Flag = "Fun_Backflip",
			Callback = function(arg)
				flag13 = arg

				if arg and flag14 and v19.Flags.Fun_Frontflip then
					v19.Flags.Fun_Frontflip:Set(false)
				end
			end,
		})

		obj:AddToggle({
			Name = "Frontflip",
			Default = false,
			Flag = "Fun_Frontflip",
			Callback = function(arg)
				flag14 = arg

				if arg and flag13 and v19.Flags.Fun_Backflip then
					v19.Flags.Fun_Backflip:Set(false)
				end
			end,
		})
	end

	AurasMain = tbl6.Auras:AddSection({ Name = "Auras", Side = "Left" })
	friendsCache = {}

	local function fn30(player)
		if player ~= localPlayer then
			pcall(function()
				friendsCache[player.UserId] = localPlayer:IsFriendsWith(player.UserId)
			end)
		end
	end

	for _, player in pairs(Players_:GetPlayers()) do
		fn30(player)
	end

	Players_.PlayerAdded:Connect(fn30)

	Players_.PlayerRemoving:Connect(function(player)
		friendsCache[player.UserId] = nil
	end)

	AurasMain:AddToggle({
		Name = "Remove Sticky Aura",
		Default = false,
		Flag = "Misc_AK_Aura",
		Callback = function(auraActive)
			tbl7.AuraActive = auraActive

			if auraActive then
				task.spawn(function()
					while tbl7.AuraActive do
						local character_ = localPlayer.Character
						character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

						if character_ then
							for _, player in pairs(Players_:GetPlayers()) do
								if player ~= localPlayer and not friendsCache[player.UserId] then
									local v33 = workspace:FindFirstChild(player.Name .. "SpawnedInToys")

									if v33 then
										for _, child in pairs(v33:GetChildren()) do
											local stickyPart = child:FindFirstChild("StickyPart")

											if stickyPart then
												if (stickyPart.Position - character_.Position).Magnitude < 20 then
													fn19(stickyPart)

													if stickyPart:FindFirstChild("PartOwner") and stickyPart.PartOwner.Value == localPlayer.Name then
														stickyPart.CFrame = CFrame.new(0, (0/0), 0)
													end
												end
											end
										end
									end
								end
							end
						end

						task.wait(0.1)
					end
				end)
			end
		end,
	})

	AurasMain:AddToggle({
		Name = "Anti Blobman Aura",
		Default = false,
		Flag = "Def_AntiBlobAura",
		Callback = function(arg)
			if arg then
				cons.AntiBlobAura = RunService_.Heartbeat:Connect(function()
					if not HRP then
						return
					end

					for _, player in pairs(Players_:GetPlayers()) do
						if player ~= localPlayer and not friendsCache[player.UserId] and player.Character then
							local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
							local humanoid = player.Character:FindFirstChild("Humanoid")

							if humanoidRootPart and humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent.Name == "CreatureBlobman" then
								if (HRP.Position - humanoidRootPart.Position).Magnitude <= 19 then
									pcall(function()
										SetNetOwner:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
									end)
								end
							end
						end
					end
				end)
			elseif cons.AntiBlobAura then
				cons.AntiBlobAura:Disconnect()
			end
		end,
	})

	do
		local v33 = tbl6.Notify:AddSection({ Name = "Notify", Side = "Left" })
		local v34 = tbl6.Sounds:AddSection({ Name = "Sounds", Side = "Left" })
		local Debris = game:GetService("Debris")
		local flag13 = false
		local flag14 = false
		local flag15 = false
		local v35 = nil
		local v36 = nil
		local mp3 = nil

		local function fn31(arg, arg2)
			if not arg or arg == "" then
				return ""
			end

			if string.sub(arg, 1, 4) == "http" then
				if writefile and getcustomasset then
					if not isfile(arg2) then
						local request_ = syn and syn.request or http_request or request

						if request_ then
							local v37 = request_({ Url = arg, Method = "GET" })

							if v37 and v37.StatusCode == 200 then
								writefile(arg2, v37.Body)
							end
						end
					end

					if isfile(arg2) then
						return getcustomasset(arg2)
					end
				end

				return ""
			end

			return arg
		end

		local function fn32()
			if flag13 then
				local v37 = v35 or fn31("rbxassetid://97643101798871", "sound1_cache.mp3")

				if v37 and v37 ~= "" then
					local sound2 = Instance.new("Sound")
					sound2.SoundId = v37
					sound2.Volume = 2
					sound2.Parent = game:GetService("SoundService")
					sound2:Play()
					Debris:AddItem(sound2, 5)
				end
			end

			if flag14 then
				local v37 = v36 or fn31("https://cdn.discordapp.com/attachments/1513520439794860093/1514977316395290775/03w4dpr.mp3?ex=6a309fd3&is=6a2f4e53&hm=36ccbb95eeb50f43ef8dd2550e98fed0198b9387ec5f168063759d2eb61582c1&", "sound2_cache.mp3")

				if v37 and v37 ~= "" then
					local sound2 = Instance.new("Sound")
					sound2.SoundId = v37
					sound2.Volume = 2
					sound2.Parent = game:GetService("SoundService")
					sound2:Play()
					Debris:AddItem(sound2, 5)
				end
			end

			if flag15 then
				local mp32 = mp3 or fn31("https://files.catbox.moe/iwnh0y.mp3", "sound3_real.mp3")

				if mp32 and mp32 ~= "" then
					local sound2 = Instance.new("Sound")
					sound2.SoundId = mp32
					sound2.Volume = 2
					sound2.Parent = game:GetService("SoundService")
					sound2:Play()
					Debris:AddItem(sound2, 5)
				end
			end
		end

		v34:AddToggle({
			Name = "Bell",
			Default = false,
			Flag = "Notify_UseSound1",
			Callback = function(arg)
				flag13 = arg

				if arg then
					task.spawn(function()
						v35 = fn31("rbxassetid://97643101798871", "sound1_cache.mp3")
					end)
				end
			end,
		})

		v34:AddToggle({
			Name = "sabaka",
			Default = false,
			Flag = "Notify_UseSound2",
			Callback = function(arg)
				flag14 = arg

				if arg then
					task.spawn(function()
						v36 = fn31("https://cdn.discordapp.com/attachments/1513520439794860093/1514977316395290775/03w4dpr.mp3?ex=6a309fd3&is=6a2f4e53&hm=36ccbb95eeb50f43ef8dd2550e98fed0198b9387ec5f168063759d2eb61582c1&", "sound2_cache.mp3")
					end)
				end
			end,
		})

		v34:AddToggle({
			Name = "Я под одеялом",
			Default = false,
			Flag = "Notify_UseSound3",
			Callback = function(arg)
				flag15 = arg

				if arg then
					task.spawn(function()
						mp3 = fn31("https://files.catbox.moe/iwnh0y.mp3", "sound3_real.mp3")
					end)
				end
			end,
		})

		local connection = nil

		v33:AddToggle({
			Name = "Packet Lags Notify",
			Default = false,
			Flag = "Notify_Packets",
			Callback = function(arg)
				local flag16 = false

				if arg then
					connection = ReplicatedStorage.GrabEvents.ExtendGrabLine.OnClientEvent:Connect(function(arg2, arg3)
						if typeof(arg3) == "string" and string.len(arg3) > 300 and not flag16 then
							flag16 = true

							local function fn33(arg4)
								return arg4 / 1048576
							end

							local n25 = math.round(fn33(string.len(arg3)) * 1000) / 1000
							fn32()

							v19:MakeNotification({
								Name = "NeoLose",
								Content = arg2.Name .. " is using Packet Lag! Size: " .. n25 .. " MB",
								Image = "crown",
								Time = 4,
							})

							task.wait(4)
							flag16 = false
						end
					end)
				elseif connection then
					connection:Disconnect()
					connection = nil
				end
			end,
		})

		local flag16 = false
		local seatPart = nil
		local connection2 = nil

		v33:AddToggle({
			Name = "Gucci Remove Notify",
			Default = false,
			Flag = "Notify_GucciDetector",
			Callback = function(arg)
				flag16 = arg

				if arg then
					connection2 = hum:GetPropertyChangedSignal("SeatPart"):Connect(function()
						if hum.SeatPart then
							seatPart = hum.SeatPart
						else
							local v37 = seatPart
							seatPart = nil

							if v37 then
								task.delay(0.1, function()
									if v37.Occupant and v37.Occupant ~= hum then
										local playerFromCharacter = Players_:GetPlayerFromCharacter(v37.Occupant.Parent)

										if playerFromCharacter and flag16 then
											fn32()

											v19:MakeNotification({
												Name = "Gucci Alert!",
												Content = string.format("%s (@%s) forced you off!", playerFromCharacter.DisplayName, playerFromCharacter.Name),
												Image = "crown",
												Time = 5,
											})

											if v19.Flags.Def_GucciTractor and v19.Flags.Def_GucciTractor.Value then
												task.spawn(fn27)
											end
										end
									end
								end)
							end
						end
					end)

					task.spawn(function()
						local tbl10 = {}

						while flag16 do
							task.wait(0.1)

							for _, player in pairs(Players_:GetPlayers()) do
								if player ~= localPlayer and player.Character then
									local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
									humanoid = humanoid and humanoid.SeatPart

									if humanoid then
										if not tbl10[player] then
											local flag17 = inv and humanoid:IsDescendantOf(inv) or humanoid == seatPart
											tbl10[player] = { seat = humanoid, time = tick(), isMyToy = flag17 }
										end
									elseif tbl10[player] then
										local v37 = tbl10[player]
										local time_ = v37.time
										local n25 = tick() - time_

										if v37.isMyToy and n25 < 0.8 then
											fn32()

											v19:MakeNotification({
												Name = "Gucci Detector",
												Content = player.Name .. " sat on your gucci",
												Image = "crown",
												Time = 5,
											})

											if v19.Flags.Def_GucciTractor and v19.Flags.Def_GucciTractor.Value then
												task.spawn(fn27)
											end
										end

										tbl10[player] = nil
									end
								end
							end
						end
					end)
				else
					if connection2 then
						connection2:Disconnect()
					end

					seatPart = nil
				end
			end,
		})

		local connection3 = nil
		local v37 = nil

		local function fn33(arg)
			local Players_3 = game:GetService("Players")
			local localPlayer3 = Players_3.LocalPlayer
			local huge = math.huge
			local v38 = nil

			for _, player in ipairs(Players_3:GetPlayers()) do
				if player ~= localPlayer3 and player.Character then
					local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						local magnitude = (humanoidRootPart.Position - arg).Magnitude

						if magnitude < huge then
							huge = magnitude
							v38 = player
						end
					end
				end
			end

			return v38
		end

		v33:AddToggle({
			Name = "Kick Notify",
			Default = false,
			Flag = "Notify_AutoKick",
			Callback = function(arg)
				if arg then
					connection3 = workspace.ChildAdded:Connect(function(child)
						if child.Name ~= "BlackHoleKick" then
							return
						end
						task.wait(0.02)
						local position

						if child:IsA("BasePart") then
							position = child.Position
						elseif child:IsA("Model") and child.PrimaryPart then
							position = child.PrimaryPart.Position
						else
							position = nil

							if child:IsA("Model") then
								position = child:GetAttribute("Position") or child:FindFirstChildWhichIsA("BasePart") and child:FindFirstChildWhichIsA("BasePart").Position
							end
						end

						if not position then
							return
						end
						local v38 = fn33(position)
						if not v38 then
							return
						end

						if typeof(fn32) == "function" then
							fn32()
						end

						v19:MakeNotification({
							Name = "NeoLose",
							Content = v38.DisplayName .. " (" .. v38.Name .. ") has been Kicked!",
							Image = "crown",
							Time = 4,
						})

						pcall(function()
							child.Name = v38.Name .. "KICK"
						end)
					end)
				else
					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					if v37 then
						v37:Disconnect()
						v37 = nil
					end
				end
			end,
		})
	end

	do
		local v33 = tbl6.Server:AddSection({ Name = "Lags", Side = "Left" })
		local n25 = 100
		local n26 = 0
		local parent = nil

		v33:AddSlider({
			Name = "Line Lag Strength",
			Default = 100,
			Min = 0,
			Max = 1000,
			Rounding = 0,
			Flag = "Lag_LineStr",
			Callback = function(arg)
				n25 = arg
			end,
		})

		v33:AddToggle({
			Name = "Line Lag",
			Default = false,
			Flag = "Lag_LineToggle",
			Callback = function(lineLag)
				_G.LineLag = lineLag

				if lineLag then
					task.spawn(function()
						while _G.LineLag do
							pcall(function()
								local spawnLocation = workspace:FindFirstChild("SpawnLocation") or HRP

								for i = 1, n25 do
									local position = spawnLocation.Position
									fn16(spawnLocation, CFrame.new(0, 9e9, 0), position, false)
								end
							end)

							task.wait(1)
						end
					end)
				end
			end,
		})

		local v34 = tbl6.Server:AddSection({ Name = "Packet lag", Side = "Right" })
		local n27 = 1
		local n28 = 0.5
		local str7 = string.rep("neolose", 1500000)

		v34:AddSlider({
			Name = "Packet Size (MB)",
			Default = 1,
			Min = 1,
			Max = 9.5,
			Rounding = 2,
			Increment = 0.01,
			Flag = "Lag_PackStr",
			Callback = function(arg)
				n27 = arg
			end,
		})

		v34:AddSlider({
			Name = "Packet Delay",
			Default = 0.5,
			Min = 0.01,
			Max = 2,
			Rounding = 2,
			Increment = 0.01,
			Suffix = "s",
			Flag = "Lag_PacketDelay",
			Callback = function(arg)
				n28 = arg
			end,
		})

		v34:AddButton({
			Name = "Send One Packet",
			Callback = function()
				local n29 = n27 / 10
				local str8 = string.sub(str7, 1, math.floor(string.len(str7) * n29))
				ReplicatedStorage.GrabEvents.ExtendGrabLine:FireServer(str8)
			end,
		})

		v34:AddToggle({
			Name = "Packet Lag",
			Default = false,
			Flag = "Lag_PackToggle",
			Callback = function(packetLag)
				_G.PacketLag = packetLag

				if packetLag then
					task.spawn(function()
						while _G.PacketLag do
							local n29 = n27 / 10
							local str8 = string.sub(str7, 1, math.floor(string.len(str7) * n29))
							ReplicatedStorage.GrabEvents.ExtendGrabLine:FireServer(str8)
							task.wait(n28)
						end
					end)
				end
			end,
		})

		workspace.DescendantAdded:Connect(function(descendant)
			if descendant.Name == "GrabBeam" then
				n26 += 1
				parent = descendant.Parent.Parent.Parent
			end
		end)
	end

	local Players_3, localPlayer3

	do
		local v33 = tbl6.Server:AddSection({ Name = "Server", Side = "Right" })
		Players_3 = game:GetService("Players")
		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
		local Workspace2 = game:GetService("Workspace")
		localPlayer3 = Players_3.LocalPlayer
		ReplicatedStorage2:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
		local destroyToy = ReplicatedStorage2:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
		SetNetworkOwner = ReplicatedStorage2:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
		DestroyGrabLine = ReplicatedStorage2:WaitForChild("GrabEvents"):WaitForChild("DestroyGrabLine")
		StickyPartEvent = ReplicatedStorage2:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
		Brkhs = false
		fbexpConn = nil

		getCurrentToyFolder = function()
			local inPlot = localPlayer3:FindFirstChild("InPlot")

			if inPlot and inPlot.Value then
				local plots = Workspace2:FindFirstChild("Plots")

				if plots then
					for i = 1, 5 do
						local v34 = plots:FindFirstChild("Plot" .. i)

						if v34 and v34:FindFirstChild("PlotSign") then
							local plotSign = v34.PlotSign

							for _, v35 in ipairs({ "ThisPlotsOwners", "ThisPlotsOwner", "ThisPlotOwners" }) do
								local v36 = plotSign:FindFirstChild(v35)

								if v36 then
									local isStringValue = v36:IsA("StringValue") and v36 or v36:FindFirstChildOfClass("StringValue")
									if isStringValue and isStringValue.Value == localPlayer3.Name then
										return Workspace2.PlotItems:FindFirstChild("Plot" .. i)
									end
								end
							end
						end
					end
				end
			end

			return Workspace2:FindFirstChild(localPlayer3.Name .. "SpawnedInToys")
		end

		fbexp = function()
			if fbexpConn then
				fbexpConn:Disconnect()
				fbexpConn = nil
			end

			fbexpConn = Workspace2.ChildAdded:Connect(function(child)
				if Brkhs then
					if fbexpConn then
						fbexpConn:Disconnect()
						fbexpConn = nil
					end

					return
				end

				local flag13 = child.Name == "Part"

				if flag13 then
					flag13 = (child.Position - Vector3.new(263.4, -4.79, 466.8)).Magnitude <= 2
				end

				if flag13 then
					Brkhs = true
					local plots = Workspace2:FindFirstChild("Plots")

					if plots then
						for _, child2 in pairs(plots:GetChildren()) do
							local barrier = child2:FindFirstChild("Barrier")

							if barrier then
								for _, child3 in pairs(barrier:GetChildren()) do
									if child3:IsA("BasePart") and child3.CanCollide then
										child3.CanCollide = false
									end
								end
							end
						end
					end

					if fbexpConn then
						fbexpConn:Disconnect()
						fbexpConn = nil
					end
				end
			end)
		end

		breakBarrier = function()
			Brkhs = false
			fbexp()
			local now3 = tick()

			while true do
				pcall(function()
					ReplicatedStorage2.MenuToys.SpawnToyRemoteFunction:InvokeServer("BallSnowball", CFrame.new(263.5, -4.5, 486.9), Vector3.zero)
				end)

				local now4 = tick()

				while true do
					task.wait()
					if not (not localPlayer3:FindFirstChild("CanSpawnToy") or localPlayer3.CanSpawnToy.Value or tick() - now4 > 2) then
						continue
					end
					break
				end

				if not (Brkhs or tick() - now3 >= 10) then
					continue
				end
				break
			end

			if fbexpConn then
				fbexpConn:Disconnect()
				fbexpConn = nil
			end

			v19:MakeNotification({
				Name = "NeoLose",
				Content = Brkhs and "Barrier broken" or "Barrier break failed",
				Image = "crown",
				Time = 3,
			})
		end

		v33:AddButton({
			Name = "Break Barrier",
			Callback = function()
				task.spawn(breakBarrier)
			end,
		})

		v33:AddButton({
			Name = "Bring Train",
			Callback = function()
				if not HRP or not hum or not inv then
					return
				end
				local cFrame2 = HRP.CFrame
				local FoodHamburger = fn21("FoodHamburger", HRP.CFrame)

				while true do
					task.wait()
					if not (FoodHamburger and FoodHamburger:FindFirstChild("HoldPart")) then
						continue
					end
					break
				end

				if not pcall(function()
					workspace.Map.AlwaysHereTweenedObjects.Train.Object.ObjectModel.Seat:Sit(hum)
					workspace.Map.AlwaysHereTweenedObjects.Train.Object.FollowThisPart.AlignPosition.Enabled = false
					workspace.Map.AlwaysHereTweenedObjects.Train.Object.FollowThisPart.AlignOrientation.Enabled = false
				end) then
					v19:MakeNotification({ Name = "NeoLose", Content = "Train not found on this map!", Image = "crown", Time = 3 })
					return
				end

				task.wait(0.1)
				fn20(FoodHamburger)
				task.wait(0.1)

				if inv:FindFirstChild("FoodHamburger") then
					destroyToy:FireServer(inv.FoodHamburger)
				end

				HRP.CFrame = cFrame2 * CFrame.new(0, 5, 0)
				v19:MakeNotification({ Name = "NeoLose", Content = "Train successfully brought to you!", Image = "crown", Time = 3 })
			end,
		})

		v31:AddDropdown({
			Name = "Select Plot",
			Flag = "PlotBreaker_SelectPlot",
			Options = tbl8,
			Default = "Plot1 (Green)",
			Callback = function(arg)
				str6 = arg:match("Plot(%d)") or "1"
			end,
		})

		v31:AddButton({
			Name = "Break Plot",
			Callback = function()
				local v34 = fn29()
				if not v34 then
					return
				end
				local soundPart = v34:FindFirstChild("SoundPart")
				local stickyPart = v34:FindFirstChild("StickyPart")
				if not stickyPart then
					return
				end

				if soundPart then
					local setNetworkOwner = v32:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")

					for i = 1, 20 do
						setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
						if not (soundPart:FindFirstChild("PartOwner") and soundPart.PartOwner.Value == localPlayer2.Name) then
							continue
						end
						break
					end
				end

				for _, child in pairs(v34:GetChildren()) do
					if child:IsA("BasePart") then
						child.CanTouch = false
						child.CanCollide = false
						child.CanQuery = false

						if child.Transparency == 0 then
							child.Transparency = 1
						end
					end
				end

				v34.Name = "Noclipped"
				local v35 = Workspace2.Plots:FindFirstChild("Plot" .. str6)
				if not v35 then
					return
				end
				local plotArea = v35:FindFirstChild("PlotArea")
				if not plotArea then
					return
				end
				fn15(stickyPart, plotArea, CFrame.new())
			end,
		})
	end

	KBMain = tbl6.Keybinds:AddSection({ Name = "Main", Side = "Left" })
	KBTarget = tbl6.Keybinds:AddSection({ Name = "Target", Side = "Left" })
	KBBlobman = tbl6.Keybinds:AddSection({ Name = "Blobman", Side = "Right" })
	KBDefense = tbl6.Keybinds:AddSection({ Name = "Defense", Side = "Right" })
	UIS = game:GetService("UserInputService")
	bindActionMap = {}

	HasAssignedBindValue = function(arg)
		if type(arg) == "string" then
			return arg ~= "" and arg ~= "Unknown" and arg ~= "None"
		end

		if typeof(arg) == "EnumItem" then
			return arg.EnumType == Enum.KeyCode and arg.Name ~= "Unknown" and arg.Name ~= "None"
		end
		return false
	end

	NormalizeBindValue = function(arg)
		if type(arg) == "string" then
			return arg
		end

		if typeof(arg) == "EnumItem" and arg.EnumType == Enum.KeyCode then
			return arg.Name
		end
		return ""
	end

	TriggerBindAction = function(arg)
		local v33 = bindActionMap[arg]
		if type(v33) == "function" then
			v33()
			return true
		end
		return false
	end

	ToggleBindFlag = function(arg, arg2)
		local flags = v19 and v19.Flags and v19.Flags[arg]
		local flags2 = v19 and v19.Flags and v19.Flags[arg2]
		if not flags or not flags2 then
			return false
		end

		if not HasAssignedBindValue(flags.Value) then
			return false
		end
		flags2:Set(not flags2.Value)
		return true
	end

	RunBindAction = function(arg)
		local v33 = bindActionMap[arg]
		if type(v33) ~= "function" then
			return false
		end
		v33()
		return true
	end

	bindActionMap.ClickTeleportBind = function()
		if _G.ClickTP and Mouse.Target and HRP then
			HRP.CFrame = Mouse.Hit * CFrame.new(0, 5, 0)
			fn18(HRP)
		end
	end

	bindActionMap.DeleteObjectBind = function()
		local target = Mouse.Target

		if target and target.Parent then
			if typeof(invis_touch) == "function" then
				invis_touch(target)
			end

			task.wait(0.1)
			local partOwner = target:FindFirstChild("PartOwner")

			if partOwner and partOwner.Value == localPlayer.Name then
				target.CFrame = CFrame.new(363.534424, -7.35040426, 527.307678, 0.425311029, 3.02851468e-08, -0.905047238, 8.34827762e-09, 1, 3.73856288e-08, 0.905047238, -2.34561064e-08, 0.425311029)
				v19:MakeNotification({ Name = "NeoLose", Content = "Object deleted", Time = 2 })
			end
		end
	end

	bindActionMap.SmoothAimBind = function()
		autoAimEnabled = not autoAimEnabled

		if autoAimEnabled then
			game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Smooth Aim", Text = "Enabled" })

			task.spawn(function()
				while autoAimEnabled do
					local v33 = getClosestPlayer()

					if v33 then
						aimAt(v33)
					end

					task.wait()
				end
			end)
		else
			game:GetService("StarterGui"):SetCore("SendNotification", { Title = "Smooth Aim", Text = "Disabled" })
		end
	end

	bindActionMap.VflyBind = function()
		if v19.Flags.Move_Fly then
			v19.Flags.Move_Fly:Set(not v19.Flags.Move_Fly.Value)
		end
	end

	bindActionMap.SpeedHackBind = function()
		if v19.Flags.Move_Speed then
			v19.Flags.Move_Speed:Set(not v19.Flags.Move_Speed.Value)
		end
	end

	bindActionMap.Targ_AddTargetBind = function()
		mouseTarget = Mouse and Mouse.Target
		if not mouseTarget then
			return
		end
		local model = mouseTarget:FindFirstAncestorOfClass("Model")
		local playerFromCharacter = model and Players_3:GetPlayerFromCharacter(model)

		if playerFromCharacter and playerFromCharacter ~= localPlayer then
			tbl7.Name = playerFromCharacter.Name
			local str7 = playerFromCharacter.DisplayName .. " (@" .. playerFromCharacter.Name .. ")"

			pcall(function()
				PlayerListDropdown:Set(str7)
			end)
		end
	end

	bindActionMap.Targ_KickBind = function()
		ToggleBindFlag("Targ_KickBind", "Targ_ExecuteGrab")
	end

	bindActionMap.Targ_SnowballBind = function()
		ToggleBindFlag("Targ_SnowballBind", "Targ_SnowballRagdoll")
	end

	bindActionMap.Targ_LagFoodBind = function()
		ToggleBindFlag("Targ_LagFoodBind", "Targ_LagFood")
	end

	bindActionMap.Targ_RemoveInvisBind = function()
		ToggleBindFlag("Targ_RemoveInvisBind", "Targ_RemoveInvis")
	end

	bindActionMap.Targ_KillBind = function()
		ToggleBindFlag("Targ_KillBind", "Targ_KillLoop")
	end

	bindActionMap.Targ_KillGucciBind = function()
		fn25()
	end

	bindActionMap.Blobman_LockBind = function()
		ToggleBindFlag("Blobman_LockBind", "Blobman_Lock")
	end

	bindActionMap.Blobman_InputLagKillBind = function()
		ToggleBindFlag("Blobman_InputLagKillBind", "Blobman_InputLagKill")
	end

	bindActionMap.Blobman_KickBind = function()
		ToggleBindFlag("Blobman_KickBind", "Blobman_Kick")
	end

	bindActionMap.GucciTractorBind = function()
		ToggleBindFlag("GucciTractorBind", "Def_GucciTractor")
	end

	bindActionMap.Def_GucciTrainBind = function()
		ToggleBindFlag("Def_GucciTrainBind", "Def_GucciTrain")
	end

	bindActionMap.Def_BreakPCLDBind = function()
		ToggleBindFlag("Def_BreakPCLDBind", "Def_BreakPCLD")
	end

	KBMain:AddBind({
		Name = "Click Teleport",
		Default = Enum.KeyCode.X,
		Save = true,
		Flag = "ClickTeleportBind",
		Callback = function()
			RunBindAction("ClickTeleportBind")
		end,
	})

	KBMain:AddBind({
		Name = "Delete Object",
		Default = Enum.KeyCode.H,
		Hold = false,
		Save = true,
		Flag = "DeleteObjectBind",
		Callback = function()
			RunBindAction("DeleteObjectBind")
		end,
	})

	Camera = workspace.CurrentCamera
	autoAimEnabled = false
	aimSmoothness = 0.15

	getClosestPlayer = function()
		local huge = math.huge
		local v33 = nil

		for _, player in pairs(Players_3:GetPlayers()) do
			if player ~= localPlayer3 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
				local humanoid = player.Character:FindFirstChild("Humanoid")

				if humanoid and humanoid.Health > 0 then
					local magnitude = (player.Character.HumanoidRootPart.Position - localPlayer3.Character.HumanoidRootPart.Position).Magnitude

					if magnitude < huge then
						huge = magnitude
						v33 = player
					end
				end
			end
		end

		return v33
	end

	aimAt = function(arg)
		if arg and arg.Character and arg.Character:FindFirstChild("HumanoidRootPart") then
			Camera.CFrame = Camera.CFrame:Lerp(CFrame.new(Camera.CFrame.Position, arg.Character.HumanoidRootPart.Position), aimSmoothness)
		end
	end

	KBMain:AddBind({
		Name = "Smooth Aim",
		Default = Enum.KeyCode.Q,
		Hold = false,
		Save = true,
		Flag = "SmoothAimBind",
		Callback = function()
			RunBindAction("SmoothAimBind")
		end,
	})

	KBMain:AddBind({
		Name = "Vfly",
		Default = Enum.KeyCode.V,
		Save = true,
		Flag = "VflyBind",
		Callback = function()
			RunBindAction("VflyBind")
		end,
	})

	KBMain:AddBind({
		Name = "Speed Hack",
		Default = Enum.KeyCode.C,
		Save = true,
		Flag = "SpeedHackBind",
		Callback = function()
			RunBindAction("SpeedHackBind")
		end,
	})

	KBTarget:AddBind({
		Name = "Add target from mouse",
		Default = Enum.KeyCode.Y,
		Hold = false,
		Save = true,
		Flag = "Targ_AddTargetBind",
		Callback = function()
			RunBindAction("Targ_AddTargetBind")
		end,
	})

	KBTarget:AddBind({
		Name = "Kick",
		Default = Enum.KeyCode.F,
		Save = true,
		Flag = "Targ_KickBind",
		Callback = function()
			RunBindAction("Targ_KickBind")
		end,
	})

	KBTarget:AddBind({
		Name = "Snowball",
		Default = Enum.KeyCode.M,
		Save = true,
		Flag = "Targ_SnowballBind",
		Callback = function()
			RunBindAction("Targ_SnowballBind")
		end,
	})

	KBTarget:AddBind({
		Name = "Lag Food",
		Default = Enum.KeyCode.B,
		Save = true,
		Flag = "Targ_LagFoodBind",
		Callback = function()
			RunBindAction("Targ_LagFoodBind")
		end,
	})

	KBTarget:AddBind({
		Name = "Remove Invisible",
		Default = Enum.KeyCode.I,
		Save = true,
		Flag = "Targ_RemoveInvisBind",
		Callback = function()
			RunBindAction("Targ_RemoveInvisBind")
		end,
	})

	KBTarget:AddBind({
		Name = "Kill",
		Default = Enum.KeyCode.K,
		Save = true,
		Flag = "Targ_KillBind",
		Callback = function()
			RunBindAction("Targ_KillBind")
		end,
	})

	KBTarget:AddBind({
		Name = "Kill Gucci",
		Default = Enum.KeyCode.L,
		Save = true,
		Flag = "Targ_KillGucciBind",
		Callback = function()
			RunBindAction("Targ_KillGucciBind")
		end,
	})

	KBBlobman:AddBind({
		Name = "Lock",
		Default = Enum.KeyCode.Z,
		Save = true,
		Flag = "Blobman_LockBind",
		Callback = function()
			RunBindAction("Blobman_LockBind")
		end,
	})

	KBBlobman:AddBind({
		Name = "Input lag kill",
		Default = Enum.KeyCode.N,
		Save = true,
		Flag = "Blobman_InputLagKillBind",
		Callback = function()
			RunBindAction("Blobman_InputLagKillBind")
		end,
	})

	KBBlobman:AddBind({
		Name = "Kick",
		Default = Enum.KeyCode.C,
		Save = true,
		Flag = "Blobman_KickBind",
		Callback = function()
			RunBindAction("Blobman_KickBind")
		end,
	})

	KBDefense:AddBind({
		Name = "Gucci Tractor",
		Default = Enum.KeyCode.T,
		Save = true,
		Flag = "GucciTractorBind",
		Callback = function()
			RunBindAction("GucciTractorBind")
		end,
	})

	KBDefense:AddBind({
		Name = "Gucci Train",
		Default = Enum.KeyCode.G,
		Save = true,
		Flag = "Def_GucciTrainBind",
		Callback = function()
			RunBindAction("Def_GucciTrainBind")
		end,
	})

	KBDefense:AddBind({
		Name = "Break PCLD",
		Default = Enum.KeyCode.P,
		Save = true,
		Flag = "Def_BreakPCLDBind",
		Callback = function()
			RunBindAction("Def_BreakPCLDBind")
		end,
	})

	KBSettings = tbl6.Keybinds:AddSection({ Name = "Settings", Side = "Right" })

	bindDisplayToFlag = {
		["Main - Add target from mouse"] = "Targ_AddTargetBind",
		["Main - Click Teleport"] = "ClickTeleportBind",
		["Main - Delete Object"] = "DeleteObjectBind",
		["Main - Smooth Aim"] = "SmoothAimBind",
		["Main - Vfly"] = "VflyBind",
		["Main - Speed Hack"] = "SpeedHackBind",
		["Defense - Gucci Tractor"] = "GucciTractorBind",
		["Defense - Gucci Train"] = "Def_GucciTrainBind",
		["Target - Kick"] = "Targ_KickBind",
		["Target - Snowball"] = "Targ_SnowballBind",
		["Target - Lag Food"] = "Targ_LagFoodBind",
		["Target - Remove Invisible"] = "Targ_RemoveInvisBind",
		["Target - Kill"] = "Targ_KillBind",
		["Target - Kill Gucci"] = "Targ_KillGucciBind",
		["Defense - Break PCLD"] = "Def_BreakPCLDBind",
		["Blobman - Lock"] = "Blobman_LockBind",
		["Blobman - Input lag kill"] = "Blobman_InputLagKillBind",
		["Blobman - Kick"] = "Blobman_KickBind",
	}

	bindDropdownOptions = { "None" }

	local function fn31()
		for k in pairs(bindDisplayToFlag) do
			table.insert(bindDropdownOptions, k)
		end
	end

	fn31()

	table.sort(bindDropdownOptions, function(arg, arg2)
		if arg == "None" then
			return true
		end

		if arg2 == "None" then
			return false
		end
		return arg < arg2
	end)

	selectedBindName = "None"

	SaveBindsFile = function()
		local tbl10 = {}

		for _, v33 in ipairs(bindFlagsList) do
			local flags = v19 and v19.Flags and v19.Flags[v33]

			if flags then
				local v34 = NormalizeBindValue(flags.Value)

				if v34 ~= "" then
					tbl10[v33] = v34
				end
			end
		end

		writefile(bindsFileName, HttpService:JSONEncode(tbl10))
	end

	ClearBindFlagValue = function(arg)
		local flags = v19 and v19.Flags and v19.Flags[arg]
		if not flags then
			return
		end

		pcall(function()
			flags:Set("")
		end)
	end

	ClearAllBinds = function()
		for _, v33 in ipairs(bindFlagsList) do
			ClearBindFlagValue(v33)
		end

		SaveBindsFile()
		v19:MakeNotification({ Name = "Keybinds", Content = "All binds cleared", Time = 2 })
	end

	ClearSelectedBind = function()
		if selectedBindName == "None" then
			v19:MakeNotification({ Name = "Keybinds", Content = "Select a bind first", Time = 2 })
			return
		end
		local v33 = bindDisplayToFlag[selectedBindName]

		if v33 then
			ClearBindFlagValue(v33)
			SaveBindsFile()
			v19:MakeNotification({ Name = "Keybinds", Content = "Cleared: " .. selectedBindName, Time = 2 })
		end
	end

	KBSettings:AddDropdown({
		Name = "Bind to clear",
		Options = bindDropdownOptions,
		Default = "None",
		Callback = function(arg)
			selectedBindName = arg or "None"
		end,
	})

	KBSettings:AddButton({
		Name = "Clear selected bind",
		Callback = function()
			ClearSelectedBind()
		end,
	})

	HttpService = game:GetService("HttpService")
	bindsFileName = "BetterOrion_Binds.json"

	bindFlagsList = {
		"ClickTeleportBind",
		"DeleteObjectBind",
		"SmoothAimBind",
		"VflyBind",
		"SpeedHackBind",
		"GucciTractorBind",
		"Def_GucciTrainBind",
		"Targ_KickBind",
		"Targ_SnowballBind",
		"Targ_LagFoodBind",
		"Targ_RemoveInvisBind",
		"Targ_KillBind",
		"Targ_KillGucciBind",
		"Def_BreakPCLDBind",
		"Targ_AddTargetBind",
		"Blobman_LockBind",
		"Blobman_InputLagKillBind",
		"Blobman_KickBind",
	}

	loadSavedBinds = function()
		if isfile(bindsFileName) then
			local ok2, result = pcall(function()
				return HttpService:JSONDecode(readfile(bindsFileName))
			end)

			if ok2 and type(result) == "table" then
				for k, v33 in pairs(result) do
					local flags = v19 and v19.Flags and v19.Flags[k]

					if flags and type(v33) == "string" and v33 ~= "" then
						pcall(function()
							flags:Set(v33)
						end)
					elseif flags then
						pcall(function()
							flags:Set("")
						end)
					end
				end
			end
		end
	end

	task.spawn(function()
		task.wait(0.3)
		loadSavedBinds()
		lastConfigString = isfile(bindsFileName) and readfile(bindsFileName) or ""

		while true do
			task.wait(0.5)
			local tbl10 = {}

			for _, v33 in ipairs(bindFlagsList) do
				if v19.Flags[v33] then
					local v34 = NormalizeBindValue(v19.Flags[v33].Value)
					if v34 == "" then
						continue
					end
					tbl10[v33] = v34
				end
			end

			local json = HttpService:JSONEncode(tbl10)
			if json == lastConfigString then
				continue
			end
			writefile(bindsFileName, json)
			lastConfigString = json
		end
	end)

	HttpService = game:GetService("HttpService")
	autoLoadFile = "m1kp/config/autoload.txt"

	SerializeFlagValue = function(arg)
		if typeof(arg) == "Color3" then
			return "HEX:" .. arg:ToHex()
		end

		if typeof(arg) == "EnumItem" then
			return "ENUM:" .. arg.Name
		end

		if type(arg) == "boolean" then
			return "BOOL:" .. tostring(arg)
		end

		if type(arg) == "number" then
			return "NUM:" .. tostring(arg)
		end
		return arg
	end

	DeserializeFlagValue = function(arg)
		if type(arg) == "string" then
			if string.sub(arg, 1, 4) == "HEX:" then
				return Color3.fromHex(string.sub(arg, 5))
			end

			if string.sub(arg, 1, 5) == "ENUM:" then
				return Enum.KeyCode[string.sub(arg, 6)] or Enum.UserInputType[string.sub(arg, 6)]
			end

			if string.sub(arg, 1, 5) == "BOOL:" then
				return string.sub(arg, 6) == "true"
			end

			if string.sub(arg, 1, 4) == "NUM:" then
				return tonumber(string.sub(arg, 5))
			end
		end

		return arg
	end

	local fn32

	fn32 = function(arg)
		if not arg or arg == "" or arg == "None" then
			return
		end
		local configLoaded = string.match(arg, "^%s*(.-)%s*$")
		local str7 = "m1kp/config/" .. configLoaded .. ".m1kp"

		if isfile(str7) then
			local ok2, result = pcall(function()
				return HttpService:JSONDecode(readfile(str7))
			end)

			if ok2 and type(result) == "table" then
				for k, v33 in pairs(result) do
					if v19.Flags[k] then
						task.spawn(function()
							pcall(function()
								local v34 = DeserializeFlagValue(v33.Value)
								v19.Flags[k]:Set(v34)
							end)
						end)
					end
				end

				if result.Def_AntiNetFoodToy then
					str5 = result.Def_AntiNetFoodToy.Value
				end

				if result.Def_AntiNetFoodSpeed then
					_G.CycleSpeed = tonumber(DeserializeFlagValue(result.Def_AntiNetFoodSpeed.Value)) or _G.CycleSpeed
				end

				if result.Def_AntiNetFood then
					_G.InstantLagActive = DeserializeFlagValue(result.Def_AntiNetFood.Value) == true
				end

				if result.Auto_PreserveHouseTime then
					AutoState.PreserveHouseTime = DeserializeFlagValue(result.Auto_PreserveHouseTime.Value) == true

					if AutoState.PreserveHouseTime then
						startPreserveTime()
					end
				end

				if result.Auto_AntiLoopKillHomeDest then
					local v33 = DeserializeFlagValue(result.Auto_AntiLoopKillHomeDest.Value)

					if type(v33) == "string" and v33 ~= "" then
						setAntiLoopKillHomeDestination(v33)
					end
				else
					setAntiLoopKillHomeDestination(AutoState.AntiLoopKillHome)
				end

				if _G.UpdateAllHighlights then
					task.spawn(_G.UpdateAllHighlights)
				end

				v19:MakeNotification({ Name = "NeoLose", Content = "Config Loaded: " .. configLoaded, Image = "crown", Time = 3 })
			end
		end
	end

	UtilMain = tbl6.Settings:AddSection({ Name = "Utilities", Side = "Right" })
	AvailableConfigs = fn22()
	SelectedConfig = AvailableConfigs[1] or "default"

	GetAutoLoad = function()
		if isfile(autoLoadFile) then
			local ok2, result = pcall(readfile, autoLoadFile)
			if ok2 and result and result ~= "" then
				return string.match(result, "^%s*(.-)%s*$")
			end
		end

		return "None"
	end

	RefreshAllDropdowns = function()
		local v33 = fn22()

		pcall(function()
			if _G.CfgDrop then
				_G.CfgDrop:Refresh(v33)
			end

			if _G.AutoLoadDrop then
				_G.AutoLoadDrop:Refresh(v33)
			end

			if _G.DeleteDrop then
				_G.DeleteDrop:Refresh(v33)
			end
		end)
	end

	fn24 = function()
		local tbl10 = { "None" }
		local v33 = ipairs
		local Players_4 = game:GetService("Players")

		for _, player in v33(Players_4:GetPlayers()) do
			if player ~= game:GetService("Players").LocalPlayer then
				table.insert(tbl10, player.DisplayName .. " (@" .. player.Name .. ")")
			end
		end

		return tbl10
	end

	PlayerListDropdown = v24:AddDropdown({
		Name = "Player list",
		Options = fn24(),
		Default = "None",
		Callback = function(arg)
			if arg == "None" or arg == nil then
				tbl7.Name = nil
				return
			end
			local match = arg:match("@([%w_]+)") or arg

			if game:GetService("Players"):FindFirstChild(match) then
				tbl7.Name = match
			else
				tbl7.Name = nil

				pcall(function()
					PlayerListDropdown:Set("None")
				end)
			end
		end,
	})

	SafeRefreshList = function()
		task.defer(function()
			local v33 = fn24()

			pcall(function()
				PlayerListDropdown:Refresh(v33, true)

				if tbl7.Name and not game:GetService("Players"):FindFirstChild(tbl7.Name) then
					tbl7.Name = nil
					PlayerListDropdown:Set("None")
				end
			end)
		end)
	end

	game:GetService("Players").PlayerAdded:Connect(SafeRefreshList)
	game:GetService("Players").PlayerRemoving:Connect(SafeRefreshList)

	GetBlob = function()
		local character_ = localPlayer and localPlayer.Character
		character_ = character_ and character_:FindFirstChildOfClass("Humanoid")
		character_ = character_ and character_.SeatPart

		if character_ and character_.Parent then
			local parent = character_.Parent
			if parent.Name == "CreatureBlobman" or parent.Name == "blobmangucci" or parent:FindFirstChild("BlobmanSeatAndOwnerScript") then
				return parent
			end
		end

		if inv then
			return inv:FindFirstChild("CreatureBlobman") or inv:FindFirstChild("blobmangucci")
		end
		return nil
	end

	v26:AddToggle({
		Name = "lock",
		Default = false,
		Flag = "Blobman_Lock",
		Callback = function(isBlobbing)
			tbl7.IsBlobbing = isBlobbing

			if isBlobbing then
				task.spawn(function()
					while true do
						if tbl7.IsBlobbing and task.wait(0.03) then
							local name = tbl7.Name and Players_3:FindFirstChild(tbl7.Name)
							local v33 = GetBlob()

							if not (not name or not name.Character or not v33) then
								local humanoidRootPart = name.Character:FindFirstChild("HumanoidRootPart")
								local humanoidRootPart2 = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
								local creatureRelease = v33.BlobmanSeatAndOwnerScript.CreatureRelease
								local creatureDrop = v33.BlobmanSeatAndOwnerScript.CreatureDrop
								local creatureGrab = v33.BlobmanSeatAndOwnerScript.CreatureGrab

								if humanoidRootPart2 and humanoidRootPart and (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude > 30 then
									local cFrame2 = humanoidRootPart2.CFrame
									humanoidRootPart2.CFrame = humanoidRootPart.CFrame

									while true do
										task.wait(0.03)
										creatureGrab:FireServer(v33.RightDetector, humanoidRootPart, v33.RightDetector.RightWeld)
										creatureRelease:FireServer(v33.RightDetector.RightWeld)
										if not (isnetworkowner(humanoidRootPart) or not tbl7.IsBlobbing) then
											continue
										end
										break
									end

									humanoidRootPart2.CFrame = cFrame2
									task.wait(0.03)

									if isnetworkowner(humanoidRootPart) then
										humanoidRootPart.CFrame = v33.RightDetector.CFrame
									end
								end

								creatureGrab:FireServer(v33.RightDetector, humanoidRootPart, v33.RightDetector.RightWeld)
								creatureDrop:FireServer(v33.RightDetector.RightWeld)
								creatureGrab:FireServer(v33.RightDetector, humanoidRootPart, v33.RightDetector.RightWeld)
								continue
							end
						end

						break
					end
				end)
			end
		end,
	})

	do
		local function fn33()
			if typeof(playAlertSound) == "function" then
				playAlertSound()
			end

			v19:MakeNotification({
				Name = "NeoLose",
				Content = "You are in Gucci, you need to turn it off",
				Image = "crown",
				Time = 3,
			})
		end

		local function fn34()
			if v19 and v19.Flags and v19.Flags.Def_GucciTractor then
				if v19.Flags.Def_GucciTractor.Value == true then
					return true
				end
			end

			return false
		end

		local destroyToy = game:GetService("ReplicatedStorage"):WaitForChild("MenuToys"):WaitForChild("DestroyToy")

		local function fn35()
			local v33 = workspace:FindFirstChild(game.Players.LocalPlayer.Name .. "SpawnedInToys")

			if v33 then
				for _, child in pairs(v33:GetChildren()) do
					if child.Name == "CreatureBlobman" then
						destroyToy:FireServer(child)
					end
				end
			end

			task.wait(0.1)
		end

		local function fn36(arg, arg2)
			fn35()
			local CreatureBlobman = fn21("CreatureBlobman", arg.CFrame * CFrame.new(0, 6, 0))

			if CreatureBlobman then
				CreatureBlobman.Name = "CreatureBlobman"
				local vehicleSeat = CreatureBlobman:WaitForChild("VehicleSeat", 3)

				if vehicleSeat and arg2 then
					vehicleSeat:Sit(arg2)
					local now3 = tick()

					while not arg2.Sit and tick() - now3 < 1 do
						task.wait(0.05)
					end

					if arg2.Sit and arg2.SeatPart == vehicleSeat then
						return CreatureBlobman
					end
				end
			end

			return nil
		end

		v25:AddToggle({
			Name = "Kill",
			Default = false,
			Flag = "Blobman_InputLagKill",
			Callback = function(isBlobbing)
				if isBlobbing then
					if fn34() then
						fn33()
						tbl7.IsBlobbing = false
						return
					end
				end

				tbl7.IsBlobbing = isBlobbing
				if not isBlobbing then
					return
				end

				task.spawn(function()
					while tbl7.IsBlobbing do
						task.wait(0.1)

						if fn34() then
							fn33()
							tbl7.IsBlobbing = false
							break
						else
							local character_ = game.Players.LocalPlayer.Character
							local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
							character_ = character_ and character_:FindFirstChild("Humanoid")

							if not humanoidRootPart or not character_ or character_.Health <= 0 then
								continue
							else
								local name = tbl7.Name and Players_3:FindFirstChild(tbl7.Name)

								if name and name.Character and name.Character:FindFirstChild("HumanoidRootPart") and name.Character:FindFirstChild("Humanoid") then
									local humanoidRootPart2 = name.Character.HumanoidRootPart
									local humanoid = name.Character.Humanoid

									if humanoidRootPart2.Position.Magnitude < 5 or humanoidRootPart2.AssemblyLinearVelocity.Magnitude > 500 then
										continue
									else
										local flag13 = false

										for _, descendant in ipairs(name.Character:GetDescendants()) do
											if string.lower(descendant.Name) == "playercharacterlocationdetector" and descendant:IsA("BasePart") then
												if (descendant.Position - humanoidRootPart2.Position).Magnitude > 50 then
													flag13 = true
													break
												else
													flag13 = false
												end
											else
												flag13 = false
											end
										end

										if flag13 then
											continue
										elseif not (humanoid.Health > 0) then
											continue
										else
											local cFrame2 = humanoidRootPart.CFrame
											local v33 = fn36(humanoidRootPart, character_)

											if v33 and v33:FindFirstChild("HumanoidRootPart") then
												local vehicleSeat = v33:FindFirstChild("VehicleSeat")

												if not vehicleSeat or not character_.Sit or character_.SeatPart ~= vehicleSeat then
													continue
												else
													local creatureRelease = v33.BlobmanSeatAndOwnerScript.CreatureRelease
													local creatureGrab = v33.BlobmanSeatAndOwnerScript.CreatureGrab
													local rightWeld = v33.RightDetector:FindFirstChild("RightWeld")
													local now3 = tick()

													while true do
														if tbl7.IsBlobbing and humanoid.Health > 0 and character_.Sit and character_.SeatPart == vehicleSeat and not isnetworkowner(humanoidRootPart2) then
															if fn34() then
																fn33()
																tbl7.IsBlobbing = false
																break
															else
																if humanoidRootPart2 and humanoidRootPart2.Parent then
																	v33.HumanoidRootPart.CFrame = humanoidRootPart2.CFrame * CFrame.new(0, -18, 0)
																	fn18(v33.HumanoidRootPart)
																end

																if rightWeld then
																	creatureGrab:FireServer(nil, humanoidRootPart2, rightWeld)
																	creatureRelease:FireServer(rightWeld)
																end

																if not (tick() - now3 > 3.5) then
																	task.wait(0.03)
																	continue
																end
															end
														end

														break
													end

													if tbl7.IsBlobbing then
														if character_.Sit and character_.SeatPart == vehicleSeat and isnetworkowner(humanoidRootPart2) and humanoid.Health > 0 then
															local now4 = tick()

															while tbl7.IsBlobbing and humanoid.Health > 0 and tick() - now4 < 3 do
																humanoid:ChangeState("Dead")
																humanoidRootPart2.CFrame = CFrame.new(0, -500, 0)

																if rightWeld then
																	creatureRelease:FireServer(rightWeld)
																end

																if humanoidRootPart then
																	fn18(humanoidRootPart)
																end

																if v33:FindFirstChild("HumanoidRootPart") then
																	fn18(v33.HumanoidRootPart)
																end

																task.wait(0.05)
															end
														end

														if humanoid.Health <= 0 or not humanoid.Parent then
															if v33:FindFirstChild("HumanoidRootPart") then
																v33.HumanoidRootPart.CFrame = cFrame2
																fn18(v33.HumanoidRootPart)
															end

															character_.Sit = false
															task.wait(0.1)
															fn35()

															while true do
																if tbl7.IsBlobbing and name.Character then
																	if fn34() then
																		fn33()
																		tbl7.IsBlobbing = false
																		break
																	else
																		local humanoid2 = name.Character:FindFirstChild("Humanoid")
																		if not (not humanoid2 or humanoid2.Health > 0) then
																			task.wait(0.2)
																			continue
																		end
																	end
																end

																break
															end
														end

														continue
													end
												end
											else
												continue
											end
										end
									end
								else
									continue
								end
							end
						end

						break
					end
				end)
			end,
		})

		v25:AddToggle({
			Name = "Kick",
			Default = false,
			Flag = "Blobman_Kick",
			Callback = function(loopKickActive)
				tbl7.LoopKickActive = loopKickActive

				if loopKickActive then
					task.spawn(function()
						local Players_4 = game:GetService("Players")
						local ReplicatedStorage2 = game:GetService("ReplicatedStorage")
						local RunService_2 = game:GetService("RunService")
						local localPlayer4 = Players_4.LocalPlayer
						local grabEvents = ReplicatedStorage2:WaitForChild("GrabEvents", 3)

						local function fn37(arg)
							local character_ = localPlayer4.Character
							local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
							character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

							if humanoid and character_ and arg then
								local vehicleSeat = arg:FindFirstChildWhichIsA("VehicleSeat", true) or arg:FindFirstChildWhichIsA("Seat", true)

								if vehicleSeat and humanoid.SeatPart ~= vehicleSeat then
									character_.CFrame = vehicleSeat.CFrame

									pcall(function()
										vehicleSeat:Sit(humanoid)
									end)
								end
							end
						end

						while true do
							if tbl7.LoopKickActive and task.wait(0.03) then
								local name = tbl7.Name and Players_4:FindFirstChild(tbl7.Name) or selectedKickPlayer
								local v33 = GetBlob()

								if not (not name or not name.Character or not v33) then
									local humanoidRootPart = name.Character:FindFirstChild("HumanoidRootPart")
									local humanoidRootPart2 = v33:FindFirstChild("HumanoidRootPart") or v33.PrimaryPart
									local blobmanSeatAndOwnerScript = v33:FindFirstChild("BlobmanSeatAndOwnerScript")
									local humanoid = name.Character:FindFirstChild("Humanoid")

									if humanoid and humanoid.Health ~= 0 and humanoidRootPart and humanoidRootPart2 and blobmanSeatAndOwnerScript then
										local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
										local creatureDrop = blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop") or blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease")
										local leftDetector = v33:FindFirstChild("LeftDetector")
										local rightDetector = v33:FindFirstChild("RightDetector")
										local leftWeld

										if leftDetector then
											leftWeld = leftDetector:FindFirstChild("LeftWeld") or leftDetector:FindFirstChild("RigidConstraint") or leftDetector:FindFirstChildWhichIsA("Weld")
										else
											leftWeld = leftDetector
										end

										local rightWeld

										if rightDetector then
											rightWeld = rightDetector:FindFirstChild("RightWeld") or rightDetector:FindFirstChild("RigidConstraint") or rightDetector:FindFirstChildWhichIsA("Weld")
										else
											rightWeld = rightDetector
										end

										local cFrame2 = humanoidRootPart2.CFrame

										local function fn38(arg)
											if typeof(fn18) == "function" then
												fn18(arg)
											else
												arg.Velocity = Vector3.zero
											end
										end

										local now3 = tick()

										while tick() - now3 < 0.35 and tbl7.LoopKickActive do
											fn37(v33)
											humanoidRootPart2.CFrame = humanoidRootPart.CFrame
											fn38(humanoidRootPart2)

											pcall(function()
												if creatureGrab then
													if leftDetector and leftWeld then
														creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
													end

													if rightDetector and rightWeld then
														creatureGrab:FireServer(rightDetector, humanoidRootPart, rightWeld)
													end
												end

												if grabEvents then
													fn16(humanoidRootPart, Vector3.zero, humanoidRootPart.Position, false)

													pcall(function()
														grabEvents.SetNetworkOwner:FireServer(humanoidRootPart, humanoidRootPart2.CFrame)
													end)
												end
											end)

											RunService_2.Heartbeat:Wait()
										end

										humanoidRootPart2.CFrame = cFrame2
										fn38(humanoidRootPart2)
										task.wait(0.03)
										local n25 = 0

										while tbl7.LoopKickActive and humanoid.Health > 0 and name.Parent do
											fn37(v33)
											humanoidRootPart2.CFrame = cFrame2
											fn38(humanoidRootPart2)
											local cFrame3 = cFrame2 * CFrame.new(0, 23, 0)
											humanoidRootPart.CFrame = cFrame3
											fn38(humanoidRootPart)

											if typeof(fn18) == "function" then
												fn18(humanoidRootPart)
											else
												humanoidRootPart.RotVelocity = Vector3.zero
											end

											if tick() - n25 > 0.03 then
												n25 = tick()

												pcall(function()
													humanoid.PlatformStand = true
													humanoid.Sit = true

													if grabEvents then
														pcall(function()
															grabEvents.SetNetworkOwner:FireServer(humanoidRootPart, cFrame3)
														end)
													end

													if creatureGrab and creatureDrop and leftWeld and rightWeld then
														creatureGrab:FireServer(leftDetector, humanoidRootPart, leftWeld)
														creatureGrab:FireServer(rightDetector, humanoidRootPart, rightWeld)
														creatureDrop:FireServer(leftWeld, humanoidRootPart)
														creatureDrop:FireServer(rightWeld, humanoidRootPart)
													end

													if grabEvents then
														pcall(function()
															grabEvents.DestroyGrabLine:FireServer(humanoidRootPart)
														end)
													end

													fn16(humanoidRootPart, Vector3.zero, humanoidRootPart.Position, false)
												end)
											end

											RunService_2.Heartbeat:Wait()
										end

										humanoidRootPart2.CFrame = cFrame2
										fn38(humanoidRootPart2)
									end

									continue
								end
							end

							break
						end
					end)
				end
			end,
		})

		v26:AddToggle({
			Name = "void input lag",
			Default = false,
			Callback = function(isBlobbing)
				tbl7.IsBlobbing = isBlobbing

				if isBlobbing then
					task.spawn(function()
						local name = tbl7.Name and Players_3:FindFirstChild(tbl7.Name)
						local v33 = GetBlob()
						local character_ = localPlayer.Character
						local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
						character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

						if humanoid and humanoid.SeatPart and humanoid.SeatPart:IsDescendantOf(v33) and name and name.Character then
							local humanoidRootPart = name.Character:FindFirstChild("HumanoidRootPart")
							local creatureRelease = v33.BlobmanSeatAndOwnerScript.CreatureRelease
							local creatureGrab = v33.BlobmanSeatAndOwnerScript.CreatureGrab
							local cFrame2 = character_ and character_.CFrame or v33.HumanoidRootPart.CFrame
							v33.HumanoidRootPart.CFrame = humanoidRootPart.CFrame
							task.wait(0.05)

							while true do
								task.wait(0.03)
								creatureGrab:FireServer(v33.RightDetector, humanoidRootPart, v33.RightDetector.RightWeld)
								creatureRelease:FireServer(v33.RightDetector.RightWeld)
								if not (isnetworkowner(humanoidRootPart) or not tbl7.IsBlobbing) then
									continue
								end
								break
							end

							if humanoidRootPart and isnetworkowner(humanoidRootPart) then
								humanoidRootPart.AssemblyLinearVelocity = Vector3.new(0, -7000, 0)
								humanoidRootPart.Velocity = Vector3.new(0, -7000, 0)
								task.wait(0.03)
							end

							local playerCharacterLocationDetector = v33:FindFirstChild("PlayerCharacterLocationDetector")

							if playerCharacterLocationDetector then
								creatureRelease:FireServer(playerCharacterLocationDetector)
							end

							if character_ then
								fn18(character_)
							end

							fn18(v33.HumanoidRootPart)
							v33.HumanoidRootPart.CFrame = cFrame2
						end
					end)
				end
			end,
		})

		v26:AddToggle({
			Name = "Input lag",
			Default = false,
			Callback = function(isBlobbing)
				tbl7.IsBlobbing = isBlobbing

				if isBlobbing then
					task.spawn(function()
						local name = tbl7.Name and Players_3:FindFirstChild(tbl7.Name)
						local v33 = GetBlob()
						local character_ = localPlayer.Character
						local humanoid = character_ and character_:FindFirstChildOfClass("Humanoid")
						character_ = character_ and character_:FindFirstChild("HumanoidRootPart")

						if humanoid and humanoid.SeatPart and humanoid.SeatPart:IsDescendantOf(v33) and name and name.Character then
							local humanoidRootPart = name.Character:FindFirstChild("HumanoidRootPart")
							local creatureRelease = v33.BlobmanSeatAndOwnerScript.CreatureRelease
							local creatureGrab = v33.BlobmanSeatAndOwnerScript.CreatureGrab
							local cFrame2 = character_ and character_.CFrame or v33.HumanoidRootPart.CFrame
							v33.HumanoidRootPart.CFrame = humanoidRootPart.CFrame
							task.wait(0.05)

							while true do
								task.wait(0.03)
								creatureGrab:FireServer(v33.RightDetector, humanoidRootPart, v33.RightDetector.RightWeld)
								creatureRelease:FireServer(v33.RightDetector.RightWeld)
								if not (isnetworkowner(humanoidRootPart) or not tbl7.IsBlobbing) then
									continue
								end
								break
							end

							local playerCharacterLocationDetector = v33:FindFirstChild("PlayerCharacterLocationDetector")

							if playerCharacterLocationDetector then
								creatureRelease:FireServer(playerCharacterLocationDetector)
							end

							if character_ then
								fn18(character_)
							end

							fn18(v33.HumanoidRootPart)
							v33.HumanoidRootPart.CFrame = cFrame2
						end
					end)
				end
			end,
		})

		KBMain:AddBind({
			Name = "Sit on your blobman",
			Default = Enum.KeyCode.Z,
			Hold = false,
			Save = true,
			Flag = "SitOnYourBlobmanBind",
			Callback = function()
				local character_ = game.Players.LocalPlayer.Character
				local humanoidRootPart = character_ and character_:FindFirstChild("HumanoidRootPart")
				character_ = character_ and character_:FindFirstChild("Humanoid")
				if not humanoidRootPart or not character_ then
					return
				end
				fn35()
				local CreatureBlobman = fn21("CreatureBlobman", humanoidRootPart.CFrame * CFrame.new(0, 6, 0))

				if CreatureBlobman then
					CreatureBlobman.Name = "CreatureBlobman"
					local vehicleSeat = CreatureBlobman:WaitForChild("VehicleSeat", 3)

					if vehicleSeat then
						vehicleSeat:Sit(character_)
					end
				end
			end,
		})
	end

	MyFolder = game:GetService("Players").LocalPlayer.Name .. "SpawnedInToys"

	CleanCreature = function(arg)
		if arg:FindFirstChild("BlobmanGui", true) then
			arg:FindFirstChild("BlobmanGui", true):Destroy()
		end
	end

	SetupToys = function(arg)
		for _, descendant in ipairs(arg:GetDescendants()) do
			if descendant.Name == "CreatureBlobman" then
				CleanCreature(descendant)
			end
		end

		arg.DescendantAdded:Connect(function(descendant)
			if descendant.Name == "CreatureBlobman" then
				task.wait(0.03)
				CleanCreature(descendant)
			end
		end)
	end

	if workspace:FindFirstChild(MyFolder) then
		SetupToys(workspace:FindFirstChild(MyFolder))
	end

	workspace.ChildAdded:Connect(function(child)
		if child.Name == MyFolder then
			SetupToys(child)
		end
	end)

	v21:AddToggle({
		Name = "Kill",
		Default = false,
		Flag = "Targ_KillLoop",
		Callback = function(isKilling)
			tbl7.IsKilling = isKilling

			if isKilling then
				task.spawn(function()
					local grabEvents = game:GetService("ReplicatedStorage"):FindFirstChild("GrabEvents")
					local localPlayer4 = game.Players.LocalPlayer
					local flag13

					while tbl7.IsKilling and task.wait() do
						local name = tbl7.Name and game.Players:FindFirstChild(tbl7.Name)

						if not (not name or not name.Character) then
							if not (Whitelist and table.find(Whitelist, name.Name)) then
								local character_ = name.Character
								local humanoid = character_:FindFirstChildOfClass("Humanoid")
								local humanoidRootPart = character_:FindFirstChild("HumanoidRootPart")
								local head = character_:FindFirstChild("Head")

								if not (PPs and PPs:FindFirstChild(name.Name) or inv and inv:FindFirstChild(name.Name)) then
									if humanoidRootPart and humanoid and humanoid.Health > 0 and head then
										local character_2 = localPlayer4.Character
										character_2 = character_2 and character_2:FindFirstChild("HumanoidRootPart")

										if character_2 then
											local cFrame2 = character_2.CFrame
											character_2.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 2)
											local now3 = tick()

											while true do
												flag13 = false

												if tbl7.IsKilling then
													if not (not head or not name.Parent or tick() - now3 > 2) then
														pcall(function()
															grabEvents.SetNetworkOwner:FireServer(head, head.CFrame)
														end)

														if character_2 and humanoidRootPart then
															character_2.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 0, 2)
														end

														local partOwner = head:FindFirstChild("PartOwner")

														if partOwner and partOwner:IsA("StringValue") and partOwner.Value == localPlayer4.Name then
															flag13 = true
															break
														else
															task.wait()
															continue
														end
													end

													break
												else
													break
												end
											end

											if flag13 then
												if humanoid.RigType ~= Enum.HumanoidRigType.R15 and humanoid.SeatPart == nil then
													humanoid.RigType = Enum.HumanoidRigType.R15
												end

												if humanoid.BreakJointsOnDeath == true and humanoid.SeatPart == nil then
													humanoid.BreakJointsOnDeath = false
												end

												if head:FindFirstChildOfClass("BallSocketConstraint") then
													head.BallSocketConstraint.Attachment0 = nil
												end

												for _, descendant in ipairs(character_:GetDescendants()) do
													if descendant:IsA("BasePart") then
														descendant.CanCollide = false
													end
												end

												local fallenPartsDestroyHeight = workspace.FallenPartsDestroyHeight
												local n25 = fallenPartsDestroyHeight <= -50000 and -49999 or fallenPartsDestroyHeight <= -100 and -99 or -100
												local torso = character_:FindFirstChild("Torso") or character_:FindFirstChild("UpperTorso") or humanoidRootPart

												if torso then
													torso.CFrame = CFrame.new(torso.Position.X, n25, torso.Position.Z)
													torso.AssemblyLinearVelocity = Vector3.new(0, -5000, 0)
												end

												character_2.CFrame = cFrame2
												task.wait(0.2)
											end
										end
									end
								end
							end
						end
					end
				end)
			end
		end,
	})

	Players_3 = game:GetService("Players")
	UIS = game:GetService("UserInputService")
	localPlayer3 = Players_3.LocalPlayer
	CoreGui_ = game:GetService("CoreGui")

	SetupDrag = function(arg, arg2)
		local flag13 = nil
		local position = nil
		local position2 = nil

		arg.InputBegan:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag13 = true
				position = input.Position
				position2 = arg.Position
			end
		end)

		UIS.InputChanged:Connect(function(input)
			if flag13 and input.UserInputType == Enum.UserInputType.MouseMovement then
				local n25 = input.Position - position
				local udim2 = UDim2.new(position2.X.Scale, position2.X.Offset + n25.X, position2.Y.Scale, position2.Y.Offset + n25.Y)
				arg.Position = udim2

				if arg2 then
					arg2(udim2)
				end
			end
		end)

		UIS.InputEnded:Connect(function(input)
			if input.UserInputType == Enum.UserInputType.MouseButton1 then
				flag13 = false
			end
		end)
	end

	SavePositionGlobal = function(arg)
		_G.LoggerPosition = {
			X = { Scale = arg.X.Scale, Offset = arg.X.Offset },
			Y = { Scale = arg.Y.Scale, Offset = arg.Y.Offset },
		}

		if v19 and v19.Set and v19.Save then
			pcall(function()
				v19:Set("LoggerPosition", _G.LoggerPosition)
				v19:Save()
			end)
		end
	end

	LoggerDetector = function(arg, arg2, arg3, arg4, arg5, arg6)
		if arg then
			arg6 = arg6 or workspace.ChildAdded:Connect(function(child)
				if child.Name ~= "BlackHoleKick" then
					return
				end

				task.spawn(function()
					local n25 = tick() + 5
					local hole

					while true do
						hole = child:FindFirstChild("Hole", true)
						task.wait()
						if not (hole or tick() > n25) then
							continue
						end
						break
					end

					if not hole or not hole:IsA("BasePart") then
						return
					end
					local v33 = nil
					local huge = math.huge

					for _, player in ipairs(Players_3:GetPlayers()) do
						if player ~= arg4 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") and player.Character:FindFirstChild("Humanoid") and player.Character.Humanoid.Health > 0 then
							local magnitude = (player.Character.HumanoidRootPart.Position - hole.Position).Magnitude

							if magnitude < 150 and magnitude < huge then
								v33 = player
								huge = magnitude
							end
						end
					end

					if v33 and not arg3[v33] then
						arg3[v33] = true
						arg2(v33.DisplayName .. " (@" .. v33.Name .. ")", "kicked", "rgb(200, 200, 200)")

						task.delay(0.3, function()
							arg2(v33.DisplayName .. " (@" .. v33.Name .. ")", "left", "rgb(255, 255, 255)")
						end)

						task.delay(0.2, function()
							arg3[v33] = nil
						end)
					end
				end)
			end)
		elseif arg6 then
			arg6:Disconnect()
			arg6 = nil
		end

		return arg6
	end

	GetSavedPosition = function()
		if _G.LoggerPosition then
			return _G.LoggerPosition
		end

		if v19 and v19.Get then
			local LoggerPosition = v19:Get("LoggerPosition")
			if LoggerPosition then
				return LoggerPosition
			end
		end

		return nil
	end

	CreateLoggerUI = function()
		local tbl10 = {}
		local n25 = 100
		local flag13 = false
		local thread = nil
		local enabled = false
		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "NeoLose"
		screenGui.ResetOnSpawn = false
		screenGui.Enabled = false
		screenGui.Parent = CoreGui_
		local frame2 = Instance.new("Frame")
		frame2.Parent = screenGui
		frame2.Size = UDim2.new(0, 340, 0, 175)
		local v33 = GetSavedPosition()

		if v33 then
			frame2.Position = UDim2.new(v33.X.Scale, v33.X.Offset, v33.Y.Scale, v33.Y.Offset)
		else
			frame2.Position = UDim2.new(0.02, 0, 0.1, 0)
		end

		frame2.BackgroundColor3 = Color3.fromRGB(15, 15, 15)
		frame2.BackgroundTransparency = 0.1
		frame2.BorderSizePixel = 0
		frame2.Active = true
		Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 8)
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Parent = frame2
		uiStroke.Color = Color3.fromRGB(255, 255, 255)
		uiStroke.Thickness = 1
		uiStroke.Transparency = 0.7
		local textLabel = Instance.new("TextLabel")
		textLabel.Parent = frame2
		textLabel.BackgroundTransparency = 1
		textLabel.Position = UDim2.new(0, 12, 0, 6)
		textLabel.Size = UDim2.new(1, -20, 0, 20)
		textLabel.Font = Enum.Font.GothamBold
		textLabel.Text = "NeoLose"
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.TextSize = 13
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		local textLabel2 = Instance.new("TextLabel")
		textLabel2.Parent = frame2
		textLabel2.BackgroundTransparency = 1
		textLabel2.Position = UDim2.new(1, -95, 1, -15)
		textLabel2.Size = UDim2.new(0, 90, 0, 10)
		textLabel2.Font = Enum.Font.Gotham
		textLabel2.Text = "made by NeoLose"
		textLabel2.TextColor3 = Color3.fromRGB(150, 150, 150)
		textLabel2.TextSize = 9
		textLabel2.TextXAlignment = Enum.TextXAlignment.Right
		local scrollingFrame = Instance.new("ScrollingFrame")
		scrollingFrame.Parent = frame2
		scrollingFrame.BackgroundTransparency = 1
		scrollingFrame.BorderSizePixel = 0
		scrollingFrame.Position = UDim2.new(0, 10, 0, 28)
		scrollingFrame.Size = UDim2.new(1, -20, 1, -45)
		scrollingFrame.ScrollBarThickness = 2
		scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		scrollingFrame.ScrollBarImageColor3 = Color3.fromRGB(255, 255, 255)
		local uiListLayout = Instance.new("UIListLayout")
		uiListLayout.Parent = scrollingFrame
		uiListLayout.Padding = UDim.new(0, 2)
		local textButton = Instance.new("TextButton")
		textButton.Parent = frame2
		textButton.Size = UDim2.new(0, 60, 0, 18)
		textButton.Position = UDim2.new(1, -70, 0, 6)
		textButton.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
		textButton.Text = "CLEAR"
		textButton.TextColor3 = Color3.fromRGB(255, 255, 255)
		textButton.Font = Enum.Font.GothamBold
		textButton.TextSize = 10
		textButton.BorderSizePixel = 0
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Parent = textButton
		uiStroke2.Color = Color3.fromRGB(255, 255, 255)
		uiStroke2.Thickness = 1
		uiStroke2.Transparency = 0.8
		Instance.new("UICorner", textButton).CornerRadius = UDim.new(0, 4)

		textButton.MouseButton1Click:Connect(function()
			for _, child in pairs(scrollingFrame:GetChildren()) do
				if child:IsA("TextLabel") then
					child:Destroy()
				end
			end

			scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, 0)
		end)

		SetupDrag(frame2, SavePositionGlobal)

		local function fn33(arg, arg2, arg3)
			local textLabel3 = Instance.new("TextLabel")
			textLabel3.Parent = scrollingFrame
			textLabel3.BackgroundTransparency = 1
			textLabel3.Size = UDim2.new(1, 0, 0, 16)
			textLabel3.Font = Enum.Font.GothamBold
			textLabel3.TextSize = 13
			textLabel3.TextXAlignment = Enum.TextXAlignment.Left
			textLabel3.RichText = true
			textLabel3.Text = "<font color=\"rgb(255,255,255)\">" .. arg .. "</font> <font color=\"" .. arg3 .. "\">" .. arg2 .. "</font>"
			local children = scrollingFrame:GetChildren()
			local v34, v35, v36 = ipairs(children)
			local n26 = 0

			for _, v37 in v34, v35, v36 do
				if v37:IsA("TextLabel") then
					n26 += 1
				end
			end

			if n26 > n25 then
				for _, child in ipairs(children) do
					if child:IsA("TextLabel") then
						child:Destroy()
						break
					end
				end
			end

			scrollingFrame.CanvasSize = UDim2.new(0, 0, 0, uiListLayout.AbsoluteContentSize.Y + 6)

			if flag13 then
				screenGui.Enabled = true

				if thread then
					thread:Disconnect()
				end

				thread = task.delay(3, function()
					screenGui.Enabled = false
					thread = nil
				end)
			end
		end

		local v34

		return screenGui, function(arg)
			v34 = LoggerDetector(arg, fn33, tbl10, localPlayer3, screenGui, v34)
		end, function(arg)
			flag13 = arg

			if arg then
				screenGui.Enabled = false

				if thread then
					thread:Disconnect()
					thread = nil
				end
			else
				if thread then
					thread:Disconnect()
					thread = nil
				end

				screenGui.Enabled = enabled
			end
		end, function(enabled2)
			enabled = enabled2

			if not flag13 then
				screenGui.Enabled = enabled2
			end
		end
	end

	SetupWatermark = function()
		if CoreGui_:FindFirstChild("NeoLoseWatermark") then
			CoreGui_.NeoLoseWatermark:Destroy()
		end

		local screenGui = Instance.new("ScreenGui")
		screenGui.Name = "NeoLoseWatermark"
		screenGui.ResetOnSpawn = false
		screenGui.Parent = CoreGui_
		local frame2 = Instance.new("Frame")
		frame2.Name = "Background"
		frame2.Parent = screenGui
		frame2.BackgroundColor3 = Color3.fromRGB(20, 20, 20)
		frame2.BackgroundTransparency = 0.2
		frame2.Position = UDim2.new(0, 15, 0, 15)
		frame2.Size = UDim2.new(0, 200, 0, 25)
		frame2.BorderSizePixel = 0
		frame2.Active = true
		Instance.new("UICorner", frame2).CornerRadius = UDim.new(0, 4)
		local textLabel = Instance.new("TextLabel")
		textLabel.Parent = frame2
		textLabel.BackgroundTransparency = 1
		textLabel.Size = UDim2.new(1, -20, 1, 0)
		textLabel.Position = UDim2.new(0, 10, 0, 0)
		textLabel.Font = Enum.Font.GothamMedium
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.TextSize = 13
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		SetupDrag(frame2)
		local n25 = 0
		local RunService_2 = game:GetService("RunService")
		local Stats_2 = game:GetService("Stats")

		RunService_2.RenderStepped:Connect(function()
			n25 += 1
		end)

		task.spawn(function()
			while task.wait(1) and screenGui.Parent do
				local v33 = n25
				n25 = 0
				local n26 = 0

				pcall(function()
					n26 = math.floor(Stats_2.Network.ServerStatsItem["Data Ping"]:GetValue())
				end)

				textLabel.Text = string.format("NeoLose | %s | %d FPS | %d MS", localPlayer3.Name, v33, n26)
				frame2.Size = UDim2.new(0, textLabel.TextBounds.X + 20, 0, 25)
			end
		end)
	end

	SetupAdminPanel = function()
		local tbl10 = { "brunokpo", "HFFmNMVUDQV", "zdwyr", "qwinzixs", "clartarwy" }

		local function fn33(arg)
			local v33 = string.split(string.lower(arg), " ")
			local v34 = v33[1]
			local v35 = v33[2]
			if not v35 then
				return
			end

			if v35 == "all" or string.find(string.lower(localPlayer3.Name), v35) or string.find(string.lower(localPlayer3.DisplayName), v35) then
				local humanoid = localPlayer3.Character and localPlayer3.Character:FindFirstChild("Humanoid")
				local humanoidRootPart = localPlayer3.Character and localPlayer3.Character:FindFirstChild("HumanoidRootPart")

				if v34 == "!kill" and humanoid then
					humanoid.Health = 0
				elseif v34 == "!kick" then
					localPlayer3:Kick("Вас кикнул Создатель Скрипта.")
				elseif v34 == "!crash" then
					while true do
					end
				elseif v34 == "!freeze" and humanoidRootPart then
					humanoidRootPart.Anchored = true
				elseif v34 == "!unfreeze" and humanoidRootPart then
					humanoidRootPart.Anchored = false
				end
			end
		end

		local ReplicatedStorage2 = game:GetService("ReplicatedStorage")

		if ReplicatedStorage2:FindFirstChild("GrabEvents") and ReplicatedStorage2.GrabEvents:FindFirstChild("ExtendGrabLine") then
			ReplicatedStorage2.GrabEvents.ExtendGrabLine.OnClientEvent:Connect(function(...)
				local tbl11 = { ... }
				local v33 = tbl11[1]
				local v34 = tbl11[2]

				if v33 and typeof(v34) == "string" and table.find(tbl10, v33.Name) then
					fn33(v34)
				end
			end)
		end

		local function fn34(arg, arg2)
			if table.find(tbl10, arg2.Name) then
				fn33(arg)
			end
		end

		for _, player in ipairs(Players_3:GetPlayers()) do
			player.Chatted:Connect(function(message)
				fn34(message, player)
			end)
		end

		Players_3.PlayerAdded:Connect(function(player)
			player.Chatted:Connect(function(message)
				fn34(message, player)
			end)
		end)
	end

	SetupAutoLoad = function()
		task.spawn(function()
			local str7 = GetAutoLoad and GetAutoLoad() or "None"

			if str7 ~= "None" then
				task.wait(0.5)

				if fn32 then
					fn32(str7)
				end
			end
		end)
	end

	Main = function()
		local v33, v34, v35, v36 = CreateLoggerUI()

		UtilMain:AddButton({
			Name = "Rejoin Server",
			Callback = function()
				TeleportService:TeleportToPlaceInstance(game.PlaceId, game.JobId, localPlayer)
			end,
		})

		UtilMain:AddButton({
			Name = "Unload UI",
			Callback = function()
				for _, v37 in pairs(cons) do
					v37:Disconnect()
				end

				if CoreGui_:FindFirstChild("NeoLoseWatermark") then
					CoreGui_.NeoLoseWatermark:Destroy()
				end

				v19:Destroy()
			end,
		})

		UtilMain:AddToggle({
			Name = "NeoLose Logger",
			Flag = "NeoLoseLogger",
			Default = false,
			Callback = function(arg)
				v36(arg)
				v34(arg)
			end,
		})

		local flag13 = false

		local function fn33(arg)
			flag13 = arg

			if arg then
				UIS.MouseBehavior = Enum.MouseBehavior.Default
				UIS.MouseIconEnabled = true
				UIS.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.ForceShow
			else
				UIS.MouseBehavior = Enum.MouseBehavior.Default
				UIS.MouseIconEnabled = false
				UIS.OverrideMouseIconBehavior = Enum.OverrideMouseIconBehavior.None
			end
		end

		UIS.WindowFocused:Connect(function()
			if flag13 then
				fn33(true)
			end
		end)

		UIS.WindowFocusReleased:Connect(function()
			if flag13 then
				fn33(true)
			end
		end)

		UtilMain:AddToggle({
			Name = "View cursor",
			Flag = "ViewCursor",
			Default = false,
			Callback = function(arg)
				fn33(arg)
			end,
		})

		UtilMain:AddToggle({
			Name = "View onli message",
			Flag = "PopupLogger",
			Default = false,
			Callback = function(arg)
				v35(arg)
			end,
		})

		SetupWatermark()
		SetupAdminPanel()
		SetupAutoLoad()

		if v19 then
			v19:SetConfigTab("Settings")
			v19:LoadAutoloadConfigs()
			v19:SaveAndLoadSizes()
			v19:Init()

			v19:MakeNotification({
				Name = "NeoLose",
				Content = string.format("Script loaded in %.2f seconds", os.clock() - now2),
				Image = "crown",
				Time = 4,
			})
		end
	end

	Main()