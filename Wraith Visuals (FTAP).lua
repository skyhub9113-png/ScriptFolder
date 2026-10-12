LPH_CRASH = function() end
getgenv().SCRIPT_KEY = getgenv().SCRIPT_KEY or "WRAITH-FREE"

if getgenv().EXECUTING == "true" then
	warn("There is already an execution in progress. Please wait before executing another script.")
	return
end

getgenv().EXECUTING = "true"

spawn(function()
	task.wait(5)
	getgenv().EXECUTING = "false"
end)

if Faces.new(Enum.NormalId.Front, Enum.NormalId.Left, 1, 2).Front ~= true then
	LPH_CRASH()
end

do
	local ok, result = pcall(function()
		return pcall()
	end)

	if ok or result and not tostring(result):match("missing argument") then
		LPH_CRASH()
	end
end

if pcall(setmetatable, game, {}) or pcall(setfenv, 1, {}) then
	LPH_CRASH()
end

if Faces.new(Enum.NormalId.Front, Enum.NormalId.Left, 1, 2).Back ~= false then
	LPH_CRASH()
end

if pcall(function()
	game:GetService("RunsServices")
end) then
	LPH_CRASH()
end

if typeof(game:GetService("RunService").Heartbeat:Wait()) ~= "number" or game:GetService("RunService").Heartbeat:Wait() <= 0 then
	LPH_CRASH()
end

do
	local ok, result = pcall(function()
		return debug and debug.info and debug.info(2, "f")
	end)

	if not (ok and result) then
		LPH_CRASH()
	end
end

if debug.setmemorycategory("X") == debug.setmemorycategory("X") then
	LPH_CRASH()
end

if not utf8.graphemes then
	LPH_CRASH()
end

do
	local ok, result = pcall(function()
		return game:GetService("HttpService"):GetSecret("JUNKIE-DEVELOPMENT")
	end)

	if not result:match("Can't find secret with given key") then
		LPH_CRASH()
	end
end

if not SharedTable.new() then
	LPH_CRASH()
end

if #(function(arg)
	local v = Random.new(tick() * math.random() * math.random())
	local str = ""

	for i = 1, v:NextNumber(20, 30) do
		str ..= utf8.char(v:NextNumber(97, 8000))
	end

	return ("\0"):rep(25) .. str .. arg .. ("\0"):rep(25) .. str
end)("hi") < 150 then
	LPH_CRASH()
end

local flag = not setmetatable or not pcall or not debug or not rawget or not rawset or not pcall(rawset, {}, " ", " ") or not select or not select(2, pcall(rawget, debug, "info"))

if not flag then
	local v = print
	flag = not select(2, pcall(rawget, debug, "info"))(v, "s") == "[C]"
end

if not flag then
	local v = require
	flag = not select(2, pcall(rawget, debug, "info"))(v, "s") == "[C]"
end

if flag then
	LPH_CRASH()
end

local fn

fn = function() end

local v
v = debug.info(1, "l")
local v2 = debug.info(1, "l")

if isfunctionhooked then
	local flag2 = false

	pcall(function()
		flag2 = isfunctionhooked(os.time) or isfunctionhooked(loadstring) or isfunctionhooked(math.randomseed) or isfunctionhooked(request) or isfunctionhooked(game.HttpGet)
	end)

	pcall(function()
		if hookfunction and type(hookfunction) == "function" then
			local function fn2()
			end

			hookfunction(fn2, function()
				print("hellow")
			end)

			if not isfunctionhooked(fn2) then
				while true do
				end
			end
		end
	end)

	if flag2 then
		LPH_CRASH()
	end
end

if isreadonly then
	if not isreadonly(table) then
		LPH_CRASH()
	end

	if not isreadonly(math) then
		LPH_CRASH()
	end

	if not isreadonly(os) then
		LPH_CRASH()
	end

	if not isreadonly(string) and not identifyexecutor():match("^Velocity") then
		LPH_CRASH()
	end
end

if getrenv then
	if tostring ~= getrenv().tostring then
		LPH_CRASH()
	end

	if os.clock ~= getrenv().os.clock then
		LPH_CRASH()
	end

	if math.randomseed ~= getrenv().math.randomseed then
		LPH_CRASH()
	end

	if math.random ~= getrenv().math.random then
		LPH_CRASH()
	end

	if os.time ~= getrenv().os.time then
		LPH_CRASH()
	end

	if tonumber ~= getrenv().tonumber then
		LPH_CRASH()
	end
end

if os.time() < 1790089439 then
	fn("J2_116")
	LPH_CRASH()
end

if debug.info(1, "l") ~= v2 or debug.info(1, "l") ~= v then
	LPH_CRASH()
end

local v3
v3 = debug.info(1, "l")

local function fn2(arg)
	for i = 1, 197 do
		local ok, result = pcall(function()
			return coroutine.wrap(arg)
		end)

		if not ok then
			fn("J2_205")
			LPH_CRASH()
		end

		if type(result) == "function" then
			arg = result
		end
	end

	local ok, result = pcall(arg)
	if tostring(result or ""):find("C stack overflow") then
		return true
	end
	return false
end

if fn2(math.floor) then
	fn("J2_093")
	LPH_CRASH()
end

if fn2(os.clock) then
	fn("J2_216")
	LPH_CRASH()
end

if fn2(math.abs) then
	fn("J2_151")
	LPH_CRASH()
end

if fn2(math.min) then
	fn("J2_003")
	LPH_CRASH()
end

if fn2(os.time) then
	fn("J2_022")
	LPH_CRASH()
end

if fn2(task.spawn) then
	fn("J2_022")
	LPH_CRASH()
end

if fn2(request) and not identifyexecutor():match("^Hydrogen") and not identifyexecutor():match("^Xeno") and not identifyexecutor():match("^Solara") then
	fn("J2_260", "Executor compatibility error (" .. tostring(identifyexecutor()) .. ")")
	LPH_CRASH()
end

if fn2(math.random) then
	fn("J2_065")
	LPH_CRASH()
end

if fn2(math.max) then
	fn("J2_173")
	LPH_CRASH()
end

if pcall(function()
	return getfenv()["pr" .. nil .. "nt"]
end) then
	fn("J2_113")
	LPH_CRASH()
end

do
	local flag2 = false

	local tbl = {
		__tostring = function()
			flag2 = true
			return ""
		end,
		__eq = function()
			flag2 = true
			return false
		end,
		__index = function()
			flag2 = true

			return function()
				return ""
			end
		end,
		__concat = function()
			flag2 = true
			return ""
		end,
		__len = function()
			flag2 = true
			return 0
		end,
	}

	local tbl2 = {
		Url = setmetatable({}, tbl),
		Method = "GET",
		Headers = { Accept = "*/*", ["User-Agent"] = "Roblox/WinInet" },
	}

	setmetatable(tbl2, setmetatable({}, { __index = function()
		flag2 = true
		return nil
	end }))

	tbl2.Headers[setmetatable({}, tbl)] = "1"
	pcall(request, tbl2)

	if flag2 then
		fn("J2_260", "Executor compatibility error (" .. tostring(identifyexecutor()) .. ")")
		LPH_CRASH()
	end
end

local n
n = 0
local tbl

tbl = {
	_69daba07141b = true,
	_125832e667c3 = 81190,
	_569f0986ef19 = 3780163094,
	_846bfc68b4dd = 1044015999,
	["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"] = game:GetService("TeleportService"),
	_d61e975b4fc0 = false,
	_84af53f9999a = 57335,
	_dd86c6a105f7 = "G4Mc2I",
	_6715ec60c9e1 = 144693,
	_3c18b9204744 = game:GetService("HapticService"),
	_c629a42283de = "4AFiIH1",
	_73e8875f7866 = 2306984198,
	_b3e05ec6c78c = game:GetService("MemStorageService"),
	_1df71f523fbc = "dzfJ66XM",
	_48c58a330ad3 = 659109223,
	_25adf6988fc5 = false,
	_9d89b33a82c8 = 1304115778,
	_e08735dda13a = 90278,
	_922989094812 = "JaDkOR",
	_ecd5b9ef63cc = "60O2acrLw",
	_1a83c4135d98 = "" .. math.random(800, 999),
	_a564c08ca8f3 = 124832,
	_18b6b2cb0f2c = 127891,
}

tbl._7a53828b9027 = "_5d031f0da37d" .. tostring(tbl)
tbl._ada26ba60194 = {}
getfenv()[5542648] = 0
local n2
n2 = 3504
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", "")
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("၉်\u{EE0}ৡय़វ", getgenv().SCRIPT_KEY)

if tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("၉်\u{EE0}ৡय़វ") ~= getgenv().SCRIPT_KEY then
	LPH_CRASH()
end

local heartbeat
heartbeat = game:GetService("RunService").Heartbeat
local flag2
flag2 = true
local tbl2
tbl2 = {}
local tbl3
tbl3 = {}
local fn3

fn3 = function(arg, arg2, arg3, arg4)
	if arg4 ~= nil and arg4 == tbl2 then
		return tbl3
	end
	local flag3 = type(arg3) ~= "number"

	if not flag3 then
		local v4 = tostring
		flag3 = tostring(arg3) ~= v4(613993)
	end

	if flag3 then
		LPH_CRASH()
	end

	if arg3 - 613993 ~= 0 then
		LPH_CRASH()
	end

	if not rawequal(arg3, 613993) then
		LPH_CRASH()
	end

	if arg3 ~= 613993 == true then
		LPH_CRASH()
	end

	if not ({ [arg3] = true })[613993] == true then
		LPH_CRASH()
	end

	if not (not arg ~= arg2 == true) or not (arg ~= arg2 == false) then
		return false
	end
	local kind = type(arg)
	local kind2 = type(arg2)
	if kind ~= typeof(arg2) or typeof(arg) ~= kind2 then
		return false
	end
	local str = tostring(arg)
	local str2 = tostring(arg2)
	if #str ~= #str2 or str < str2 or str > str2 then
		return false
	end

	if not (rawequal(arg, arg2) and rawequal(arg2, arg) and rawequal(str, str2)) then
		return false
	end

	if arg == nil or arg2 == nil then
		if arg ~= arg2 then
			return false
		end
	end

	local tbl4 = { [arg] = true }
	if rawget(tbl4, arg2) ~= true then
		return false
	end
	rawset(tbl4, arg, nil)

	if type(arg) == type(arg2) and ({ number = true, string = true })[type(arg)] == true then
		if not (arg >= arg2 and arg <= arg2 and arg2 >= arg and arg2 <= arg) then
			return false
		end
	end

	if tostring(arg == arg2) ~= "true" or tostring(arg ~= arg2) ~= "false" then
		return false
	end
	local flag4 = type(arg) == type(arg2) and (type(arg) == "number" or type(arg) == "string")

	if flag4 then
		flag4 = {}
		local flag5 = arg == arg2
		local flag6 = arg2 == arg
		local v4 = rawequal(arg, arg2)
		local v5 = rawequal(arg2, arg)
		local flag7 = not (arg ~= arg2)
		local flag8 = arg2 >= arg and arg2 <= arg
		flag4[1] = flag5
		flag4[2] = flag6
		flag4[3] = v4
		flag4[4] = v5
		flag4[5] = flag7
		flag4[6] = flag8
		flag4[7] = arg2 == arg
		flag4[8] = arg <= arg2
		flag4[9] = arg2 >= arg
	end

	if not flag4 then
		flag4 = {}
		local v4 = rawequal(arg, arg2)
		local v5 = rawequal(arg2, arg)
		flag4[1] = arg == arg2
		flag4[2] = arg2 == arg
		flag4[3] = v4
		flag4[4] = v5
		flag4[5] = not (arg ~= arg2)
		flag4[6] = true
		flag4[7] = arg2 == arg
		flag4[8] = true
		flag4[9] = true
	end

	local flag5 = false

	setmetatable(flag4, {
		__newindex = function()
			flag5 = true
		end,
		__metatable = {},
	})

	local n3 = 1

	while n3 <= #flag4 do
		if flag4[n3] ~= true then
			return false
		end
		n3 += 1
	end

	flag4.b9tIyRdiWbd7XKVl = true
	if not flag5 or n3 - 1 ~= 9 then
		return false
	end
	local flag6 = arg ~= nil and arg2 ~= nil
	local flag7

	if flag6 then
		flag7 = not ({ [arg] = "VTrsuZWIm6Bus11gWy" })[arg2] or not ({ [arg2] = "VTrsuZWIm6Bus11gWy" })[arg]
	else
		flag7 = flag6
	end

	if flag7 then
		return false
	end
	return true
end

local fn4

fn4 = function(arg, arg2, arg3, arg4)
	if arg4 ~= nil and arg4 == tbl2 then
		return tbl3
	end
	local flag3 = type(arg3) ~= "number"

	if not flag3 then
		local v4 = tostring
		flag3 = tostring(arg3) ~= v4(317750)
	end

	if flag3 then
		LPH_CRASH()
	end

	if not rawequal(arg3, 317750) == true then
		LPH_CRASH()
	end

	if arg3 ~= 317750 then
		LPH_CRASH()
	end

	if arg3 - (1 - 2 * (3599375216 + 869574780 + 4120984596) % 4294967296) * (1 + ((2889058024 + 2689933023 + 3025178681) % 4294967296 * 67108864 + (607489960 + 4046678848 + 3935765784) % 4294967296) / 4503599627370496) * 2 ^ ((5830970931 + 3832627790 + 3221304208) % 4294967296 - 1023) ~= 0 then
		LPH_CRASH()
	end

	if not ({ [arg3] = true })[317750] then
		LPH_CRASH()
	end

	if flag2 then
		tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "bh44AAleCRqHMAiilLYU3PJFCvZIsaav10gyljN5")
	end

	n2 += 35
	if not (not arg ~= arg2 == true) or not (arg ~= arg2 == false) then
		return false
	end
	local flag4 = type(arg) == type(arg2)
	local flag5

	if flag4 then
		flag5 = type(arg) == "number" or type(arg) == "string"
	else
		flag5 = flag4
	end

	if flag5 then
		flag5 = not (arg >= arg2 and arg2 >= arg and arg <= arg2 and arg2 <= arg)
	end

	if flag5 then
		return false
	end
	local kind = type(arg)
	local kind2 = type(arg2)
	if kind ~= typeof(arg2) or typeof(arg) ~= kind2 then
		return false
	end
	local str = tostring(arg)
	local str2 = tostring(arg2)
	if #str ~= #str2 or str < str2 or str > str2 then
		return false
	end

	if not (rawequal(arg, arg2) and rawequal(arg2, arg) and rawequal(str, str2)) then
		return false
	end
	local flag6 = type(arg) == type(arg2) and (type(arg) == "number" or type(arg) == "string")

	if flag6 then
		flag6 = {}
		local flag7 = arg == arg2
		local flag8 = arg2 == arg
		local v4 = rawequal(arg, arg2)
		local v5 = rawequal(arg2, arg)
		local flag9 = not (arg ~= arg2)
		local flag10 = arg2 >= arg and arg2 <= arg
		flag6[1] = flag7
		flag6[2] = flag8
		flag6[3] = v4
		flag6[4] = v5
		flag6[5] = flag9
		flag6[6] = flag10
		flag6[7] = arg2 == arg
		flag6[8] = arg <= arg2
		flag6[9] = arg2 >= arg
		flag6[10] = not (arg ~= arg2)
	end

	if not flag6 then
		flag6 = {}
		local v4 = rawequal(arg, arg2)
		local v5 = rawequal(arg2, arg)
		flag6[1] = arg == arg2
		flag6[2] = arg2 == arg
		flag6[3] = v4
		flag6[4] = v5
		flag6[5] = not (arg ~= arg2)
		flag6[6] = true
		flag6[7] = arg2 == arg
		flag6[8] = true
		flag6[9] = true
		flag6[10] = not (arg ~= arg2)
	end

	local flag7 = false

	setmetatable(flag6, {
		__newindex = function()
			flag7 = true
		end,
		__metatable = {},
	})

	for i = 1, 10 do
		if not flag6[i] then
			return false
		end
	end

	flag6.vwpvDAvNpxoSCBG7 = true
	if flag7 ~= true or #flag6 ~= 10 then
		return false
	end

	if arg == nil or arg2 == nil then
		if arg ~= arg2 then
			return false
		end
	end

	local tbl4 = { [arg] = 350448 }
	local v4 = tbl4[arg2]
	tbl4[arg] = nil
	if v4 ~= 350448 then
		return false
	end

	if not (arg == arg2 and not (arg ~= arg2)) then
		return false
	end

	if arg ~= nil and arg2 ~= nil and (not ({ [arg] = "mhXR0hSksrSAFCJB5F" })[arg2] or not ({ [arg2] = "mhXR0hSksrSAFCJB5F" })[arg]) then
		return false
	end
	return true
end

if not fn4(317750, 317750, 317750) then
	fn("J2_202")
	LPH_CRASH()
end

spawn(function()
	local now = os.clock()
	local now2 = os.clock()
	task.wait(0.1)

	if now == now2 and now2 == os.clock() and fn3(now, now2, 613993) then
		LPH_CRASH()
	end

	local now3 = tick()
	local now4 = tick()
	task.wait(0.1)

	if now3 == now4 and now4 == tick() and fn3(now3, now4, 613993) then
		LPH_CRASH()
	end
end)

if debug.info(1, "l") ~= v3 or debug.info(1, "l") ~= v then
	LPH_CRASH()
end

local v4, v5, v6, fn5, fn6, fn7, fn8, fn9, fn10

do
	local v7 = debug.info(1, "l")

	local function fn11()
		local byte = string.byte
		local char = string.char
		local sub = string.sub
		local concat = table.concat
		local huge = math.huge

		local function fn12()
			error("J", 0)
		end

		local function fn13(arg)
			if arg >= 48 and arg <= 57 then
				return arg - 48
			end

			if arg >= 65 and arg <= 70 then
				return arg - 55
			end

			if arg >= 97 and arg <= 102 then
				return arg - 87
			end
			fn12()
		end

		local function fn14(arg, arg2, arg3)
			if arg2 + 3 > arg3 then
				fn12()
			end

			return fn13(byte(arg, arg2)) * 4096 + fn13(byte(arg, arg2 + 1)) * 256 + fn13(byte(arg, arg2 + 2)) * 16 + fn13(byte(arg, arg2 + 3)), arg2 + 4
		end

		local function fn15(arg)
			if arg < 128 then
				return char(arg)
			end

			if arg < 2048 then
				return char(192 + arg // 64, 128 + arg % 64)
			end

			if arg < 65536 then
				return char(224 + arg // 4096, 128 + arg // 64 % 64, 128 + arg % 64)
			end
			return char(240 + arg // 262144, 128 + arg // 4096 % 64, 128 + arg // 64 % 64, 128 + arg % 64)
		end

		local tbl4 = {
			[34] = "\"",
			[47] = "/",
			[92] = "\\",
			[98] = "\8",
			[102] = "\12",
			[110] = "\n",
			[114] = "\r",
			[116] = "\t",
		}

		local function fn16(arg, arg2, arg3)
			local tbl5 = {}
			local n3 = arg2 + 1
			local n4 = 0
			local v8 = n3

			while n3 <= arg3 do
				local v9 = byte(arg, n3)

				if v9 == 34 then
					if v8 < n3 then
						n4 += 1
						tbl5[n4] = sub(arg, v8, n3 - 1)
					end

					if n4 == 0 then
						return "", n3 + 1
					end

					if n4 == 1 then
						return tbl5[1], n3 + 1
					end
					return concat(tbl5), n3 + 1
				end

				if v9 == 92 then
					if v8 < n3 then
						n4 += 1
						tbl5[n4] = sub(arg, v8, n3 - 1)
					end

					n3 += 1

					if n3 > arg3 then
						fn12()
					end

					local v10 = byte(arg, n3)
					local v11 = tbl4[v10]

					if v11 then
						n3 += 1
					elseif v10 == 117 then
						local n5
						n5, n3 = fn14(arg, n3 + 1, arg3)

						if n5 >= 55296 and n5 <= 56319 and n3 + 5 <= arg3 and byte(arg, n3) == 92 and byte(arg, n3 + 1) == 117 then
							local v12, v13 = fn14(arg, n3 + 2, arg3)

							if v12 >= 56320 and v12 <= 57343 then
								n5 = 65536 + (n5 - 55296) * 1024 + v12 - 56320
								n3 = v13
							end
						end

						v11 = fn15(n5)
					else
						fn12()
					end

					n4 += 1
					tbl5[n4] = v11
					v8 = n3
				else
					if v9 < 32 then
						fn12()
					end

					n3 += 1
				end
			end

			fn12()
		end

		local function fn17(arg, arg2, arg3)
			local n3

			if byte(arg, arg2) ~= 45 then
				n3 = arg2
			else
				n3 = arg2 + 1
			end

			if arg3 < n3 then
				fn12()
			end

			local v8 = byte(arg, n3)

			if v8 == 48 then
				n3 += 1
				local v9 = byte(arg, n3)

				if v9 and v9 >= 48 and v9 <= 57 then
					fn12()
				end
			elseif v8 >= 49 and v8 <= 57 then
				while true do
					n3 += 1
					local v9 = byte(arg, n3)
					if not (not v9 or v9 < 48 or v9 > 57) then
						continue
					end
					break
				end
			else
				fn12()
			end

			local num = tonumber(sub(arg, arg2, n3 - 1))

			if not num or num ~= num or num <= -huge or num >= huge then
				fn12()
			end

			return num, n3
		end

		local fn18 = nil

		local function fn19(arg, arg2, arg3, arg4)
			local tbl5 = {}
			local n3 = arg2 + 1
			local n4 = 0
			if byte(arg, n3) == 93 then
				return tbl5, n3 + 1
			end
			local v8

			while true do
				local v9
				v9, v8 = fn18(arg, n3, arg3, arg4)
				n4 += 1
				tbl5[n4] = v9
				local v10 = byte(arg, v8)

				if v10 == 93 then
					break
				else
					if v10 ~= 44 then
						fn12()
					end

					n3 = v8 + 1
				end
			end

			return tbl5, v8 + 1
		end

		local function fn20(arg, arg2, arg3, arg4)
			local tbl5 = {}
			local n3 = arg2 + 1
			if byte(arg, n3) == 125 then
				return tbl5, n3 + 1
			end
			local v8

			while true do
				if byte(arg, n3) ~= 34 then
					fn12()
				end

				local v9, v10 = fn16(arg, n3, arg3)

				if byte(arg, v10) ~= 58 then
					fn12()
				end

				local v11
				v11, v8 = fn18(arg, v10 + 1, arg3, arg4)
				tbl5[v9] = v11
				local v12 = byte(arg, v8)

				if v12 ~= 125 then
					if v12 ~= 44 then
						fn12()
					end

					n3 = v8 + 1
					continue
				end

				break
			end

			return tbl5, v8 + 1
		end

		fn18 = function(arg, arg2, arg3, arg4)
			if arg4 > 8 or arg2 > arg3 then
				fn12()
			end

			local v8 = byte(arg, arg2)
			if v8 == 34 then
				return fn16(arg, arg2, arg3)
			end

			if v8 == 123 then
				return fn20(arg, arg2, arg3, arg4 + 1)
			end

			if v8 == 91 then
				return fn19(arg, arg2, arg3, arg4 + 1)
			end

			if v8 == 45 or v8 >= 48 and v8 <= 57 then
				return fn17(arg, arg2, arg3)
			end

			if v8 == 116 and sub(arg, arg2, arg2 + 3) == "true" then
				return true, arg2 + 4
			end

			if v8 == 102 and sub(arg, arg2, arg2 + 4) == "false" then
				return false, arg2 + 5
			end

			if v8 == 110 and sub(arg, arg2, arg2 + 3) == "null" then
				return nil, arg2 + 4
			end
			fn12()
		end

		local function fn21(arg)
			if type(arg) ~= "string" or #arg == 0 or #arg > 262144 then
				fn12()
			end

			local n3 = #arg
			local v8, v9 = fn18(arg, 1, n3, 0)

			if v9 <= n3 then
				fn12()
			end

			return v8
		end

		local tbl5 = { [8] = "\\b", [9] = "\\t", [10] = "\\n", [12] = "\\f", [13] = "\\r", [34] = "\\\"", [92] = "\\\\" }

		return fn21, function(arg)
			if type(arg) ~= "string" then
				fn12()
			end

			local tbl6 = { "\"" }
			local n3 = 1
			local n4 = 1

			for i = 1, #arg do
				local v8 = byte(arg, i)
				local v9 = tbl5[v8]

				if v9 or v8 < 32 then
					if n3 < i then
						n4 += 1
						tbl6[n4] = sub(arg, n3, i - 1)
					end

					n4 += 1
					tbl6[n4] = v9 or "\\u00" .. sub("0123456789ABCDEF", v8 // 16 + 1, v8 // 16 + 1) .. sub("0123456789ABCDEF", v8 % 16 + 1, v8 % 16 + 1)
					n3 = i + 1
				end
			end

			if n3 <= #arg then
				n4 += 1
				tbl6[n4] = sub(arg, n3)
			end

			tbl6[n4 + 1] = "\""
			return concat(tbl6)
		end
	end

	v4, v5 = fn11()
	n2 += 10

	if table.concat({ "ygS3ZWL", "Y0TurucS9vskXH1W0qJ", "eDkjLn6KcztHbYbwy", "a8", "lO", "9" }) ~= "ygS3ZWLY0TurucS9vskXH1W0qJeDkjLn6KcztHbYbwya8lO9" or table.concat({ "ygS3ZWL", "Y0TurucS9vskXH1W0qJ", "eDkjLn6KcztHbYbwy", "a8", "lO", "9" }) ~= "ygS3ZWLY0TurucS9vskXH1W0qJeDkjLn6KcztHbYbwya8lO9" then
		LPH_CRASH()
	end

	local str = "g\230\tj\133\174g\187r\243n<:\245O\165\127R\14Q\140h\5\155\171ك\31\25\205\224["
	n2 += 4

	local function fn12(arg, arg2)
		return function(arg3, arg4)
			local n3 = 0
			local n4 = 1

			while arg3 ~= 0 and arg4 ~= 0 do
				local n5 = arg3 % arg2
				local n6 = arg4 % arg2
				n3 += arg[n5][n6] * n4
				arg3 = (arg3 - n5) / arg2
				arg4 = (arg4 - n6) / arg2
				n4 *= arg2
			end

			return n3 + (arg3 + arg4) * n4
		end
	end

	local function fn13(arg)
		local v8 = fn12(arg, 2)

		return fn12(setmetatable({}, { __index = function(arg2, arg3)
			local obj = setmetatable({}, { __index = function(arg4, arg5)
				local v9 = v8(arg3, arg5)
				arg4[arg5] = v9
				return v9
			end })

			arg2[arg3] = obj
			return obj
		end }), 2 ^ (arg.n or 1))
	end

	v6 = fn13({ [0] = { [0] = 0, 1 }, { [0] = 1, 0 }, n = 4 })
	fn5 = nil

	fn5 = function(arg, arg2, arg3, ...)
		if arg2 then
			local v8 = v6(arg % 4294967296, arg2 % 4294967296)
			local v9

			if arg3 then
				v9 = fn5(v8, arg3, ...)
			else
				v9 = v8
			end

			return v9
		end

		if arg then
			return arg % 4294967296
		end
		return 0
	end

	fn6 = function(arg, arg2)
		if arg2 then
			local n3 = arg % 4294967296
			local n4 = arg2 % 4294967296
			return (n3 + n4 - v6(n3, n4)) / 2
		end

		if arg then
			return arg % 4294967296
		end
		return 4294967295
	end

	local function fn14(arg, arg2)
		local v8, v9, v10, v11 = string.byte(arg, arg2 + 1, arg2 + 4)
		return (v8 or 0) + (v9 or 0) * 256 + (v10 or 0) * 65536 + (v11 or 0) * 16777216
	end

	local function fn15(arg)
		local rshift = bit32.rshift
		return string.char(arg % 256, rshift(arg, 8) % 256, rshift(arg, 16) % 256, rshift(arg, 24) % 256)
	end

	local function fn16(arg, arg2, arg3)
		local lrotate = bit32.lrotate
		local v8 = arg[1]
		local v9 = arg[2]
		local v10 = arg[3]
		local v11 = arg[4]
		local n3 = arg[5]
		local n4 = arg[6]
		local n5 = arg[7]
		local n6 = arg[8]
		local n7 = arg2 % 4294967296
		local v12 = arg3[1]
		local v13 = arg3[2]
		local v14 = arg3[3]
		local n8 = 1634760805
		local n9 = 857760878
		local n10 = 2036477234
		local n11 = 1797285236

		for i = 1, 10 do
			local n12 = (n8 + v8) % 4294967296
			local v15 = lrotate(v6(n7, n12), 16)
			local n13 = (n3 + v15) % 4294967296
			local v16 = lrotate(v6(v8, n13), 12)
			local n14 = (n12 + v16) % 4294967296
			local v17 = lrotate(v6(v15, n14), 8)
			local n15 = (n13 + v17) % 4294967296
			local v18 = lrotate(v6(v16, n15), 7)
			local n16 = (n9 + v9) % 4294967296
			local v19 = lrotate(v6(v12, n16), 16)
			local n17 = (n4 + v19) % 4294967296
			local v20 = lrotate(v6(v9, n17), 12)
			local n18 = (n16 + v20) % 4294967296
			local v21 = lrotate(v6(v19, n18), 8)
			local n19 = (n17 + v21) % 4294967296
			local v22 = lrotate(v6(v20, n19), 7)
			local n20 = (n10 + v10) % 4294967296
			local v23 = lrotate(v6(v13, n20), 16)
			local n21 = (n5 + v23) % 4294967296
			local v24 = lrotate(v6(v10, n21), 12)
			local n22 = (n20 + v24) % 4294967296
			local v25 = lrotate(v6(v23, n22), 8)
			local n23 = (n21 + v25) % 4294967296
			local v26 = lrotate(v6(v24, n23), 7)
			local n24 = (n11 + v11) % 4294967296
			local v27 = lrotate(v6(v14, n24), 16)
			local n25 = (n6 + v27) % 4294967296
			local v28 = lrotate(v6(v11, n25), 12)
			local n26 = (n24 + v28) % 4294967296
			local v29 = lrotate(v6(v27, n26), 8)
			local n27 = (n25 + v29) % 4294967296
			local v30 = lrotate(v6(v28, n27), 7)
			local n28 = (n14 + v22) % 4294967296
			local v31 = lrotate(v6(v29, n28), 16)
			local n29 = (n23 + v31) % 4294967296
			local v32 = lrotate(v6(v22, n29), 12)
			n8 = (n28 + v32) % 4294967296
			v14 = lrotate(v6(v31, n8), 8)
			n5 = (n29 + v14) % 4294967296
			v9 = lrotate(v6(v32, n5), 7)
			local n30 = (n18 + v26) % 4294967296
			local v33 = lrotate(v6(v17, n30), 16)
			local n31 = (n27 + v33) % 4294967296
			local v34 = lrotate(v6(v26, n31), 12)
			n9 = (n30 + v34) % 4294967296
			n7 = lrotate(v6(v33, n9), 8)
			n6 = (n31 + n7) % 4294967296
			v10 = lrotate(v6(v34, n6), 7)
			local n32 = (n22 + v30) % 4294967296
			local v35 = lrotate(v6(v21, n32), 16)
			local n33 = (n15 + v35) % 4294967296
			local v36 = lrotate(v6(v30, n33), 12)
			n10 = (n32 + v36) % 4294967296
			v12 = lrotate(v6(v35, n10), 8)
			n3 = (n33 + v12) % 4294967296
			v11 = lrotate(v6(v36, n3), 7)
			local n34 = (n26 + v18) % 4294967296
			local v37 = lrotate(v6(v25, n34), 16)
			local n35 = (n19 + v37) % 4294967296
			local v38 = lrotate(v6(v18, n35), 12)
			n11 = (n34 + v38) % 4294967296
			v13 = lrotate(v6(v37, n11), 8)
			n4 = (n35 + v13) % 4294967296
			v8 = lrotate(v6(v38, n4), 7)
		end

		local n12 = (v8 + arg[1]) % 4294967296
		local n13 = (v9 + arg[2]) % 4294967296
		local n14 = (v10 + arg[3]) % 4294967296
		local n15 = (v11 + arg[4]) % 4294967296
		local n16 = (n3 + arg[5]) % 4294967296
		local n17 = (n4 + arg[6]) % 4294967296
		local n18 = (n5 + arg[7]) % 4294967296
		local n19 = (n6 + arg[8]) % 4294967296
		local n20 = (n7 + arg2) % 4294967296
		local n21 = (v12 + arg3[1]) % 4294967296
		local n22 = (v13 + arg3[2]) % 4294967296
		local n23 = (v14 + arg3[3]) % 4294967296
		return fn15((n8 + 1634760805) % 4294967296) .. fn15((n9 + 857760878) % 4294967296) .. fn15((n10 + 2036477234) % 4294967296) .. fn15((n11 + 1797285236) % 4294967296) .. fn15(n12) .. fn15(n13) .. fn15(n14) .. fn15(n15) .. fn15(n16) .. fn15(n17) .. fn15(n18) .. fn15(n19) .. fn15(n20) .. fn15(n21) .. fn15(n22) .. fn15(n23)
	end

	fn7 = function(arg, arg2, arg3, arg4)
		if #arg2 ~= 32 then
			error("Invalid key length")
		end

		if #arg3 ~= 12 then
			error("Invalid nonce length")
		end

		local tbl4 = {}
		local v8 = fn14(arg2, 0)
		local v9 = fn14(arg2, 4)
		local v10 = fn14(arg2, 8)
		local v11 = fn14(arg2, 12)
		local v12 = fn14(arg2, 16)
		local v13 = fn14(arg2, 20)
		local v14 = fn14(arg2, 24)
		tbl4[1] = v8
		tbl4[2] = v9
		tbl4[3] = v10
		tbl4[4] = v11
		tbl4[5] = v12
		tbl4[6] = v13
		tbl4[7] = v14

		do
			local values = table.pack(fn14(arg2, 28))
			table.move(values, 1, values.n, 8, tbl4)
		end

		local tbl5 = {}
		local v15 = fn14(arg3, 0)
		local v16 = fn14(arg3, 4)
		tbl5[1] = v15
		tbl5[2] = v16

		do
			local values = table.pack(fn14(arg3, 8))
			table.move(values, 1, values.n, 3, tbl5)
		end

		local tbl6 = {}
		local n3 = #arg
		arg4 = arg4 or 1
		local n4 = 0

		for i = 1, n3, 64 do
			local v17 = fn16(tbl4, arg4, tbl5)
			local n5 = i + 63

			if n3 < n5 then
				n5 = n3
			end

			local n6 = 1

			while i + 3 <= n5 do
				local v18, v19, v20, v21 = string.byte(arg, i, i + 3)
				local v22, v23, v24, v25 = string.byte(v17, n6, n6 + 3)
				n4 += 1
				tbl6[n4] = string.char(v6(v18, v22), v6(v19, v23), v6(v20, v24), v6(v21, v25))
				i += 4
				n6 += 4
			end

			if i <= n5 then
				local v18, v19, v20 = string.byte(arg, i, n5)
				local v21, v22, v23 = string.byte(v17, n6, n6 + n5 - i)
				local n7 = n5 - i + 1
				n4 += 1
				tbl6[n4] = string.sub(string.char(v6(v18, v21), v19 and v6(v19, v22) or 0, v20 and v6(v20, v23) or 0, 0), 1, n7)
			end

			arg4 += 1
		end

		return table.concat(tbl6)
	end

	fn8 = function()return{};end

	local function fn17(arg, arg2, arg3, arg4, arg5)
		local lrotate = bit32.lrotate
		local n3, n4, n5, n6, n7, n8, n9, n10

		if arg == str then
			n3 = 528734635
			n4 = 2773480762
			n5 = 1541459225
			n6 = 1013904242
			n7 = 2600822924
			n8 = 1779033703
			n9 = 1359893119
			n10 = 3144134277
		else
			n8 = fn14(arg, 0)
			n10 = fn14(arg, 4)
			n6 = fn14(arg, 8)
			n4 = fn14(arg, 12)
			n9 = fn14(arg, 16)
			n7 = fn14(arg, 20)
			n3 = fn14(arg, 24)
			n5 = fn14(arg, 28)
		end

		local n11 = arg3 % 4294967296
		local n12 = (arg3 - n11) * 2.3283064365386963e-10
		local v8 = fn14(arg2, 0)
		local v9 = fn14(arg2, 4)
		local v10 = fn14(arg2, 8)
		local v11 = fn14(arg2, 12)
		local v12 = fn14(arg2, 16)
		local v13 = fn14(arg2, 20)
		local v14 = fn14(arg2, 24)
		local v15 = fn14(arg2, 28)
		local v16 = fn14(arg2, 32)
		local v17 = fn14(arg2, 36)
		local v18 = fn14(arg2, 40)
		local v19 = fn14(arg2, 44)
		local v20 = fn14(arg2, 48)
		local v21 = fn14(arg2, 52)
		local v22 = fn14(arg2, 56)
		local v23 = fn14(arg2, 60)
		local n13 = 1779033703
		local n14 = 3144134277
		local n15 = 1013904242
		local n16 = 2773480762

		for i = 1, 7 do
			local n17 = (n8 + n9 + v8) % 4294967296
			local v24 = lrotate(v6(n11, n17), 16)
			local n18 = (n13 + v24) % 4294967296
			local v25 = lrotate(v6(n9, n18), 20)
			local n19 = (n17 + v25 + v9) % 4294967296
			local v26 = lrotate(v6(v24, n19), 24)
			local n20 = (n18 + v26) % 4294967296
			local v27 = lrotate(v6(v25, n20), 25)
			local n21 = (n10 + n7 + v10) % 4294967296
			local v28 = lrotate(v6(n12, n21), 16)
			local n22 = (n14 + v28) % 4294967296
			local v29 = lrotate(v6(n7, n22), 20)
			local n23 = (n21 + v29 + v11) % 4294967296
			local v30 = lrotate(v6(v28, n23), 24)
			local n24 = (n22 + v30) % 4294967296
			local v31 = lrotate(v6(v29, n24), 25)
			local n25 = (n6 + n3 + v12) % 4294967296
			local v32 = lrotate(v6(arg4, n25), 16)
			local n26 = (n15 + v32) % 4294967296
			local v33 = lrotate(v6(n3, n26), 20)
			local n27 = (n25 + v33 + v13) % 4294967296
			local v34 = lrotate(v6(v32, n27), 24)
			local n28 = (n26 + v34) % 4294967296
			local v35 = lrotate(v6(v33, n28), 25)
			local n29 = (n4 + n5 + v14) % 4294967296
			local v36 = lrotate(v6(arg5, n29), 16)
			local n30 = (n16 + v36) % 4294967296
			local v37 = lrotate(v6(n5, n30), 20)
			local n31 = (n29 + v37 + v15) % 4294967296
			local v38 = lrotate(v6(v36, n31), 24)
			local n32 = (n30 + v38) % 4294967296
			local v39 = lrotate(v6(v37, n32), 25)
			local n33 = (n19 + v31 + v16) % 4294967296
			local v40 = lrotate(v6(v38, n33), 16)
			local n34 = (n28 + v40) % 4294967296
			local v41 = lrotate(v6(v31, n34), 20)
			n8 = (n33 + v41 + v17) % 4294967296
			arg5 = lrotate(v6(v40, n8), 24)
			n15 = (n34 + arg5) % 4294967296
			n7 = lrotate(v6(v41, n15), 25)
			local n35 = (n23 + v35 + v18) % 4294967296
			local v42 = lrotate(v6(v26, n35), 16)
			local n36 = (n32 + v42) % 4294967296
			local v43 = lrotate(v6(v35, n36), 20)
			n10 = (n35 + v43 + v19) % 4294967296
			n11 = lrotate(v6(v42, n10), 24)
			n16 = (n36 + n11) % 4294967296
			n3 = lrotate(v6(v43, n16), 25)
			local n37 = (n27 + v39 + v20) % 4294967296
			local v44 = lrotate(v6(v30, n37), 16)
			local n38 = (n20 + v44) % 4294967296
			local v45 = lrotate(v6(v39, n38), 20)
			n6 = (n37 + v45 + v21) % 4294967296
			n12 = lrotate(v6(v44, n6), 24)
			n13 = (n38 + n12) % 4294967296
			n5 = lrotate(v6(v45, n13), 25)
			local n39 = (n31 + v27 + v22) % 4294967296
			local v46 = lrotate(v6(v34, n39), 16)
			local n40 = (n24 + v46) % 4294967296
			local v47 = lrotate(v6(v27, n40), 20)
			n4 = (n39 + v47 + v23) % 4294967296
			arg4 = lrotate(v6(v46, n4), 24)
			n14 = (n40 + arg4) % 4294967296
			n9 = lrotate(v6(v47, n14), 25)

			if i ~= 7 then
				local v48 = v8
				v8 = v10
				v10 = v11
				v11 = v18
				v18 = v20
				v20 = v17
				v17 = v19
				v19 = v13
				v13 = v48
				local v49 = v9
				v9 = v14
				v14 = v12
				v12 = v15
				v15 = v21
				v21 = v22
				v22 = v23
				v23 = v16
				v16 = v49
			end
		end

		return fn15(v6(n8, n13)) .. fn15(v6(n10, n14)) .. fn15(v6(n6, n15)) .. fn15(v6(n4, n16)) .. fn15(v6(n9, n11)) .. fn15(v6(n7, n12)) .. fn15(v6(n3, arg4)) .. fn15(v6(n5, arg5))
	end

	fn9 = function(arg)
		local n3 = #arg
		if n3 <= 64 then
			return fn17("g\230\tj\133\174g\187r\243n<:\245O\165\127R\14Q\140h\5\155\171ك\31\25\205\224[", arg, 0, n3, 11)
		end
		local n4 = 1
		local n5 = 0
		local str2 = "g\230\tj\133\174g\187r\243n<:\245O\165\127R\14Q\140h\5\155\171ك\31\25\205\224["
		local n6 = 0
		local n7 = 0
		local tbl4 = nil

		for i = 0, n3 - 64 - 1, 64 do
			local v8 = fn17(str2, string.sub(arg, i + 1, i + 64), n6, 64, n4 + n5)
			n7 += 1

			if n7 == 15 then
				n4 = 0
				n5 = 2
				str2 = v8
			else
				n4 = 0

				if n7 ~= 16 then
					str2 = v8
				else
					local n8 = n6 + 1
					tbl4 = tbl4 or {}

					while n8 % 2 == 0 do
						v8 = fn17("g\230\tj\133\174g\187r\243n<:\245O\165\127R\14Q\140h\5\155\171ك\31\25\205\224[", table.remove(tbl4) .. v8, 0, 64, 4)
						n8 = n8 / 2 // 1
					end

					table.insert(tbl4, v8)
					n6 += 1
					n4 = 1
					n5 = 0
					str2 = "g\230\tj\133\174g\187r\243n<:\245O\165\127R\14Q\140h\5\155\171ك\31\25\205\224["
					n7 = 0
				end
			end
		end

		local n8 = (n3 - 1) % 64 + 1
		local str3 = string.sub(arg, -n8)
		local n9

		if n6 > 0 then
			local v8 = fn17(str2, str3, n6, n8, n4 + 2)

			for i = #tbl4, 2, -1 do
				v8 = fn17("g\230\tj\133\174g\187r\243n<:\245O\165\127R\14Q\140h\5\155\171ك\31\25\205\224[", tbl4[i] .. v8, 0, 64, 4)
			end

			str3 = tbl4[1] .. v8
			n8 = 64
			str2 = "g\230\tj\133\174g\187r\243n<:\245O\165\127R\14Q\140h\5\155\171ك\31\25\205\224["
			n9 = 12
		else
			n9 = n4 + 10
		end

		return fn17(str2, str3, 0, n8, n9)
	end

	if ypcall ~= pcall then
		LPH_CRASH()
	end

	if pcall(request, "hi") then
		LPH_CRASH()
	end

	local function fn18(...)
		if not pcall(tostring, select(31, ...)) then
			LPH_CRASH()
		end
	end

	fn18(pcall(function()
		return 303070, 660605, 838053, 172011, 115784, 573959, 254985, 534878, 732390, 351999, 443723, 798396, 527484, 595054, 617308, 483381, 68310, 300074, 348385, 736643, 136436, 155841, 433250, 420495, 636766, 342686, 151409, 932615, 355331, nil
	end))

	local function fn19(...)
		if not pcall(type, select(31, ...)) then
			LPH_CRASH()
		end
	end

	fn19(pcall(function()
		return 524098, 955188, 177373, 143160, 514781, 338637, 652570, 446516, 748086, 336251, 537666, 638576, 200364, 333179, 493750, 550320, 583423, 733076, 268164, 44640, 640266, 903941, 139022, 603655, 606336, 381614, 551677, 974606, 601196, nil
	end))

	local flag3 = false

	pcall(function()
		flag3 = true
	end)

	while not flag3 do
	end

	local n3 = n + 1

	if n3 == 0 then
		fn("J2_158")
		LPH_CRASH()
	end

	task.spawn(function()
		while task.wait() do
			if not (n3 < 0) then
				continue
			end
			break
		end
	end)

	local ok, result = pcall(function()
		if newcclosure then
			task.spawn(newcclosure(function()
				n2 += 9
				tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "BJnBbv1sdkBR0kGYKM")
			end))
		end
	end)

	if not ok and (type(result) == "string" and result:find("expected lua") or result:find("than 0")) then
		fn("J2_220")
		LPH_CRASH()
	end

	task.spawn(function()
		for i = 1, 0 do
			pcall(setmetatable(setmetatable({}, { __call = function()
				n2 += 1
				tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "mAxlT")

				error(setmetatable({}, { __tostring = function()
					fn("J2_091")
					LPH_CRASH()
				end }))
			end }), { __tostring = function()
				fn("J2_104")
				LPH_CRASH()
			end }))
		end
	end)

	local tbl4 = {
		__tostring = print,
		__call = function()
			n2 += 18
			tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "YvJU2fxvvSjDkDiUbJLmnAp7yM8lZlUOslQE")

			if debug and debug.getconstants then
				if #debug.getconstants(3) < 5 and #debug.getconstants(3) ~= 0 then
					fn("J2_092")
					LPH_CRASH()
				end
			end
		end,
	}

	pcall(setmetatable(setmetatable({}, {}), tbl4))
	n2 += 29
	tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "bxC8TYFCRxnaj9Mtm6vZ")
	n2 += 9
	tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "UM9mrAsTacfe2V1")
	n2 += 56
	tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "5tYU")

	if #tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") + 3541 ~= n2 then
		fn("J2_100B")
		LPH_CRASH()
	end

	if #tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") ~= 133 then
		fn("J2_118")
		LPH_CRASH()
	end

	if n2 ~= 3674 then
		fn("J2_100D")
		LPH_CRASH()
	end

	fn10 = function(arg, arg2)
		if not rawequal(arg2, 381604) then
			fn("J2_183")
			LPH_CRASH()
		end

		if arg2 ~= 381604 then
			fn("J2_206")
			LPH_CRASH()
		end

		local flag4 = type(arg2) ~= "number"

		if not flag4 then
			local v8 = tostring
			flag4 = tostring(arg2) ~= v8(381604)
		end

		if flag4 then
			fn("J2_146")
			LPH_CRASH()
		end

		if not ({ [arg2] = true })[(1 - 2 * (7205932936 + 1384001656 + 0) % 4294967296) * (1 + ((2730542392 + 2585150152 + 3304823808) % 4294967296 * 67108864 + (59142240 + 4235825056 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((2187378242 + 344800646 + 1762789449) % 4294967296 - 1023)] then
			fn("J2_127")
			LPH_CRASH()
		end

		if arg2 - 381604 ~= 0 then
			fn("J2_167")
			LPH_CRASH()
		end

		local str2 = tostring(arg)

		if str2 == "" then
			crash_client("oth-1")
		end

		local str3 = str2:gsub(("%s: "):format(type(arg)), "")
		local str4

		if str3:sub(1, 2) == "0x" then
			str4 = str3:sub(3)
		else
			str4 = str3
		end

		local n4 = 0

		for i = 1, #str4 do
			local str5 = str4:sub(i, i)
			local n5 = 0

			for i2 = 1, 16 do
				if ("0123456789abcdef"):sub(i2, i2) == str5 then
					n5 = i2 - 1
					break
				end
			end

			n4 = (n4 * 16 + n5) % 9007199254740991
		end

		return n4
	end

	if debug.info(1, "l") ~= v7 or debug.info(1, "l") ~= v then
		fn("J2_048")
		LPH_CRASH()
	end
end

local v7
v7 = debug.info(1, "l")
local v8 = elapsedTime()

if type(v8) ~= "number" or not rawequal(v8, v8) or v8 * 0 ~= 0 or v8 + 0 ~= v8 then
	fn("J2_RVS")
	LPH_CRASH()
end

do
	local n3 = math.random(1, 100000)

	if (type(n3) ~= "number" or not rawequal(n3, n3)) == true then
		fn("J2_214")
		LPH_CRASH()
	end

	if n3 * 0 ~= 0 then
		fn("J2_214")
		LPH_CRASH()
	end

	local n4 = n3 // 1

	if type(n4) ~= "number" then
		fn("J2_MS14")
		LPH_CRASH()
	end

	if n4 ~= n3 == true then
		fn("J2_MS14")
		LPH_CRASH()
	end

	if not rawequal(n4, n3) == true then
		fn("J2_MS14")
		LPH_CRASH()
	end

	if not (not (n3 < 1) and not (n3 > 100000) and not (n3 % 1 ~= 0)) then
		fn("J2_218")
		LPH_CRASH()
	end
end

local str = tostring({})

if type(str) ~= "string" then
	fn("J2_SOF8")
	LPH_CRASH()
end

if not str:match("^table: 0x[%da-fA-F]+$") then
	fn("J2_SOF8")
	LPH_CRASH()
end

if type(debug) ~= "table" then
	fn("J2_086")
	LPH_CRASH()
end

if type(debug.info) ~= "function" then
	fn("J2_086")
	LPH_CRASH()
end

if type(debug.traceback) ~= "function" then
	fn("J2_086")
	LPH_CRASH()
end

local str2 = table.concat({ "cFW", "itnho7qUrzQA8NyPcdba", "MLZuR1PihIk", "XJnKX3VMG0x0" })

if (type(str2) ~= "string" or str2 ~= "cFWitnho7qUrzQA8NyPcdbaMLZuR1PihIkXJnKX3VMG0x0") == true then
	fn("J2_219")
	LPH_CRASH()
end

if tostring({}) == tostring({}) then
	fn("J2_HP2")
	LPH_CRASH()
end

do
	local v9 = Random.new():NextInteger(1, 9999999)
	local v10 = Random.new():NextInteger(1, 9999999)
	local v11 = Random.new():NextInteger(1, 9999999)

	if v9 == v10 and v10 == v11 then
		fn("J2_025")
		LPH_CRASH()
	end

	if type(v9) ~= "number" == true then
		fn("J2_006")
		LPH_CRASH()
	end

	if v9 * 0 ~= 0 == true then
		fn("J2_006")
		LPH_CRASH()
	end

	if v9 // 1 ~= v9 then
		fn("J2_006")
		LPH_CRASH()
	end
end

do
	local now = os.time()
	local unixTimestamp = DateTime.now().UnixTimestamp

	if not (not (type(now) ~= "number") and not (type(unixTimestamp) ~= "number")) then
		fn("J2_200")
		LPH_CRASH()
	end

	if now - unixTimestamp > 2 then
		fn("J2_200")
		LPH_CRASH()
	end

	if unixTimestamp - now > 2 then
		fn("J2_200")
		LPH_CRASH()
	end
end

local part
part = Instance.new("Part")
local Stats
Stats = game:GetService("Stats")
local n3

do
	local v9 = getconnections
	local flag3 = false
	local result = nil

	if v9 then
		flag3, result = pcall(v9, heartbeat)
	end

	local n4 = (flag3 and type(result) == "table" and #result or 0) * 5789

	if n4 * 0 ~= 0 then
		n4 = 0
	end

	if n4 < 0 then
		n4 = -n4
	end

	local n5 = (12801250 + n4 // 1 % 9999999 + 1987850) % 9999999
	local str3 = getrenv
	str3 = str3 and str3() or nil
	str3 = str3 and tostring(str3) or ""
	local n6 = 5381

	for i = 1, #str3 do
		n6 = (n6 * 33 + string.byte(str3, i)) % 9999999
	end

	n6 = #str3 > 0 and n6 or 0

	if n6 * 0 ~= 0 then
		n6 = 0
	end

	if n6 < 0 then
		n6 = -n6
	end

	local n7 = ((n5 + n6 // 1 % 9999999) * 27 + 9647537) % 9999999
	local getstack = debug and (debug.getstack or debug.stack)
	local flag4 = false
	local result2 = nil

	if getstack then
		flag4, result2 = pcall(getstack, 1)
	end

	local n8 = (flag4 and type(result2) == "table" and #result2 or 0) * 7597

	if n8 * 0 ~= 0 then
		n8 = 0
	end

	if n8 < 0 then
		n8 = -n8
	end

	local n9 = (n7 + (n8 // 1 % 9999999 + 6384481) * 75) % 9999999
	local generatekey = crypt and crypt.generatekey
	local str4 = ""

	if generatekey then
		str4 = generatekey()
	end

	local n10 = 5381

	for i = 1, #str4 do
		n10 = (n10 * 33 + string.byte(str4, i)) % 9999999
	end

	n10 = #str4 > 0 and n10 or 0

	if n10 * 0 ~= 0 then
		n10 = 0
	end

	if n10 < 0 then
		n10 = -n10
	end

	local n11 = (n9 * 25 + n10 // 1 % 9999999 + 8168440) % 9999999
	local n12 = #(gethui and gethui() or game:GetService("CoreGui")):GetChildren() * 5933

	if n12 * 0 ~= 0 then
		n12 = 0
	end

	local n13

	if n12 < 0 then
		n13 = -n12
	else
		n13 = n12
	end

	n3 = (n11 + (n13 // 1 % 9999999 + 6578634) * 87) % 9999999
end

local n4

do
	local Players = game:GetService("Players")
	local n5 = Players.RespawnTime * 8189 + Players.PreferredPlayers * 7871 + game:GetService("SoundService").RolloffScale * 7489

	if n5 * 0 ~= 0 then
		n5 = 0
	end

	if n5 < 0 then
		n5 = -n5
	end

	local n6 = ((7529551 + n5 // 1 % 9999999) * 51 + 7558749) % 9999999
	local n7 = time() * 6413

	if n7 * 0 ~= 0 then
		n7 = 0
	end

	if n7 < 0 then
		n7 = -n7
	end

	local n8 = (n6 * 27 + n7 // 1 % 9999999 + 6217780) % 9999999
	local Players2 = game:GetService("Players")
	local n9 = Players2.MaxPlayers * 7927 + (Players2.CharacterAutoLoads and 2749 or 2731)

	if n9 * 0 ~= 0 then
		n9 = 0
	end

	if n9 < 0 then
		n9 = -n9
	end

	local n10 = (n8 * 85 + n9 // 1 % 9999999 + 9599969) % 9999999
	local n11 = tick() * 6419 + os.clock() * 6161

	if n11 * 0 ~= 0 then
		n11 = 0
	end

	if n11 < 0 then
		n11 = -n11
	end

	local n12 = ((n10 + n11 // 1 % 9999999) * 21 + 6043415) % 9999999
	local systemLocaleId = game:GetService("LocalizationService").SystemLocaleId
	local n13 = 5381

	for i = 1, #systemLocaleId do
		n13 = (n13 * 33 + string.byte(systemLocaleId, i)) % 9999999
	end

	if n13 * 0 ~= 0 then
		n13 = 0
	end

	local n14

	if n13 < 0 then
		n14 = -n13
	else
		n14 = n13
	end

	n4 = (n12 + n14 // 1 % 9999999 * 79 + 8128033) % 9999999
end

local n5

do
	local ok, result = pcall(function()
		local serverStatsItem = Stats.Network.ServerStatsItem
		return (tonumber(serverStatsItem.TotalInDataBW:GetValueString()) or 0) * 5425 + (tonumber(serverStatsItem.TotalOutDataBW:GetValueString()) or 0) * 5963
	end)

	if not ok or type(result) ~= "number" then
		result = 0
	end

	if result * 0 ~= 0 then
		result = 0
	end

	if result < 0 then
		result = -result
	end

	local n6 = (3622494 + result // 1 % 9999999 * 59 + 3601912) % 9999999

	local ok2, result2 = pcall(function()
		local serverStatsItem = Stats.Network.ServerStatsItem
		return (tonumber(serverStatsItem.TotalRakIn:GetValueString()) or 0) * 8009 + (tonumber(serverStatsItem.TotalRakOut:GetValueString()) or 0) * 6365
	end)

	if not ok2 or type(result2) ~= "number" then
		result2 = 0
	end

	if result2 * 0 ~= 0 then
		result2 = 0
	end

	if result2 < 0 then
		result2 = -result2
	end

	local n7 = (n6 + result2 // 1 % 9999999 * 63 + 5604926) % 9999999

	local ok3, result3 = pcall(function()
		local serverStatsItem = Stats.Network.ServerStatsItem
		return (tonumber(serverStatsItem["Data Ping"]:GetValueString():split("(")[1]) or 0) * 8021 + (tonumber(serverStatsItem["Send kBps"]:GetValueString()) or 0) * 5095
	end)

	if not ok3 or type(result3) ~= "number" then
		result3 = 0
	end

	if result3 * 0 ~= 0 then
		result3 = 0
	end

	if result3 < 0 then
		result3 = -result3
	end

	local n8 = (n7 + result3 // 1 % 9999999 * 27 + 6901019) % 9999999

	local ok4, result4 = pcall(function()
		local receivedDataPackets = Stats.Network.ServerStatsItem["Received Data Packets"]
		local size = receivedDataPackets.Size
		return receivedDataPackets:GetValue() * 7973 + size:GetValue() * 5705
	end)

	if not ok4 or type(result4) ~= "number" then
		result4 = 0
	end

	if result4 * 0 ~= 0 then
		result4 = 0
	end

	if result4 < 0 then
		result4 = -result4
	end

	local n9 = (n8 + result4 // 1 % 9999999 * 77 + 6275622) % 9999999

	local ok5, result5 = pcall(function()
		return tonumber(Stats.Network.ServerStatsItem.ElapsedTime:GetValueString()) or 0
	end)

	if not ok5 or type(result5) ~= "number" then
		result5 = 0
	end

	if result5 * 0 ~= 0 then
		result5 = 0
	end

	if result5 < 0 then
		result5 = -result5
	end

	n5 = ((n9 + result5 // 1 % 9999999) * 51 + 2149940) % 9999999
end

local n6

do
	local currentCamera = workspace.CurrentCamera
	local n7 = currentCamera.FieldOfView * 5783 + currentCamera.DiagonalFieldOfView * 7895 + currentCamera.MaxAxisFieldOfView * 7697

	if n7 * 0 ~= 0 then
		n7 = 0
	end

	if n7 < 0 then
		n7 = -n7
	end

	local n8 = (5499303 + (n7 // 1 % 9999999 + 3640527) * 17) % 9999999
	local cFrame = workspace.CurrentCamera.CFrame
	local rightVector = cFrame.RightVector
	local upVector = cFrame.UpVector
	local n9 = rightVector.X * 5405 + rightVector.Y * 7135 + rightVector.Z * 7949 + upVector.X * 6097 + upVector.Y * 7411 + upVector.Z * 6737

	if n9 * 0 ~= 0 then
		n9 = 0
	end

	if n9 < 0 then
		n9 = -n9
	end

	local n10 = ((n8 + n9 // 1 % 9999999) * 59 + 8718521) % 9999999
	local cFrame2 = workspace.CurrentCamera.CFrame
	local n11 = cFrame2.X * 6805 + cFrame2.Y * 5891 + cFrame2.Z * 5941

	if n11 * 0 ~= 0 then
		n11 = 0
	end

	if n11 < 0 then
		n11 = -n11
	end

	local n12 = (n10 + n11 // 1 % 9999999 * 81 + 4781060) % 9999999
	local position = workspace.CurrentCamera.Focus.Position
	local n13 = position.X * 5831 + position.Y * 7511 + position.Z * 7313

	if n13 * 0 ~= 0 then
		n13 = 0
	end

	if n13 < 0 then
		n13 = -n13
	end

	local n14 = (n12 * 55 + n13 // 1 % 9999999 + 6466254) % 9999999
	local viewportSize = workspace.CurrentCamera.ViewportSize
	local n15 = viewportSize.X * 8129 + viewportSize.Y * 7681

	if n15 * 0 ~= 0 then
		n15 = 0
	end

	if n15 < 0 then
		n15 = -n15
	end

	n6 = (n14 * 55 + n15 // 1 % 9999999 + 9085862) % 9999999
end

local n7

do
	local ok, result = pcall(function()
		return Stats.PerformanceStats.Memory.CoreScriptMemory:GetValue() * 1000000 * 6659
	end)

	if not ok or type(result) ~= "number" then
		result = 0
	end

	if result * 0 ~= 0 then
		result = 0
	end

	if result < 0 then
		result = -result
	end

	local n8 = (2350978 + (result // 1 % 9999999 + 4530308) * 75) % 9999999

	local ok2, result2 = pcall(function()
		return Stats.FrameRateManager.AveragePresent:GetValue() * 1e9 * 6065
	end)

	if not ok2 or type(result2) ~= "number" then
		result2 = 0
	end

	if result2 * 0 ~= 0 then
		result2 = 0
	end

	if result2 < 0 then
		result2 = -result2
	end

	local n9 = (n8 * 67 + result2 // 1 % 9999999 + 3900392) % 9999999

	local ok3, result3 = pcall(function()
		return Stats.PerformanceStats.Memory.CoreMemory:GetValue() * 1000000 * 8039
	end)

	if not ok3 or type(result3) ~= "number" then
		result3 = 0
	end

	if result3 * 0 ~= 0 then
		result3 = 0
	end

	if result3 < 0 then
		result3 = -result3
	end

	local n10 = (n9 + result3 // 1 % 9999999 * 25 + 6119150) % 9999999

	local ok4, result4 = pcall(function()
		return Stats.MemoryTrackingEnabled and Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Sounds) * 1000000 * 5585 or 0
	end)

	if not ok4 or type(result4) ~= "number" then
		result4 = 0
	end

	if result4 * 0 ~= 0 then
		result4 = 0
	end

	local n11

	if result4 < 0 then
		n11 = -result4
	else
		n11 = result4
	end

	local n12 = (n10 + n11 // 1 % 9999999 * 41 + 3433924) % 9999999

	local ok5, result5 = pcall(function()
		return Stats.PerformanceStats.CPU:GetValue() * 1000000 * 7369
	end)

	if not ok5 or type(result5) ~= "number" then
		result5 = 0
	end

	if result5 * 0 ~= 0 then
		result5 = 0
	end

	if result5 < 0 then
		result5 = -result5
	end

	local n13 = ((n12 + result5 // 1 % 9999999) * 77 + 8393980) % 9999999

	local ok6, result6 = pcall(function()
		return Stats.Workspace.Heartbeat:GetValue() * 1e9 * 7895
	end)

	if not ok6 or type(result6) ~= "number" then
		result6 = 0
	end

	if result6 * 0 ~= 0 then
		result6 = 0
	end

	local n14

	if result6 < 0 then
		n14 = -result6
	else
		n14 = result6
	end

	local n15 = (n13 * 47 + n14 // 1 % 9999999 + 4888064) % 9999999

	local ok7, result7 = pcall(function()
		return Stats.Workspace.FPS:GetValue() * 1000000 * 5093
	end)

	if not ok7 or type(result7) ~= "number" then
		result7 = 0
	end

	if result7 * 0 ~= 0 then
		result7 = 0
	end

	if result7 < 0 then
		result7 = -result7
	end

	local n16 = ((n15 + result7 // 1 % 9999999) * 71 + 3700934) % 9999999

	local ok8, result8 = pcall(function()
		return Stats.ShadowsTriangleCount * 7103
	end)

	if not ok8 or type(result8) ~= "number" then
		result8 = 0
	end

	if result8 * 0 ~= 0 then
		result8 = 0
	end

	if result8 < 0 then
		result8 = -result8
	end

	local n17 = (n16 + result8 // 1 % 9999999 * 85 + 7203254) % 9999999

	local ok9, result9 = pcall(function()
		return Stats.MemoryTrackingEnabled and Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.Signals) * 1000000 * 5453 or 0
	end)

	if not ok9 or type(result9) ~= "number" then
		result9 = 0
	end

	if result9 * 0 ~= 0 then
		result9 = 0
	end

	if result9 < 0 then
		result9 = -result9
	end

	local n18 = ((n17 + result9 // 1 % 9999999) * 19 + 4005539) % 9999999

	local ok10, result10 = pcall(function()
		return Stats.SceneTriangleCount * 7277
	end)

	if not ok10 or type(result10) ~= "number" then
		result10 = 0
	end

	if result10 * 0 ~= 0 then
		result10 = 0
	end

	if result10 < 0 then
		result10 = -result10
	end

	local n19 = ((n18 + result10 // 1 % 9999999) * 23 + 8716739) % 9999999

	local ok11, result11 = pcall(function()
		return Stats.MemoryTrackingEnabled and Stats:GetMemoryUsageMbForTag(Enum.DeveloperMemoryTag.GraphicsParticles) * 1000000 * 7909 or 0
	end)

	if not ok11 or type(result11) ~= "number" then
		result11 = 0
	end

	if result11 * 0 ~= 0 then
		result11 = 0
	end

	if result11 < 0 then
		result11 = -result11
	end

	local n20 = (n19 + result11 // 1 % 9999999 * 91 + 1481893) % 9999999

	local ok12, result12 = pcall(function()
		return Stats.DataSendKbps * 5327 + Stats.DataReceiveKbps * 7169
	end)

	if not ok12 or type(result12) ~= "number" then
		result12 = 0
	end

	if result12 * 0 ~= 0 then
		result12 = 0
	end

	if result12 < 0 then
		result12 = -result12
	end

	n7 = (n20 + (result12 // 1 % 9999999 + 133076) * 33) % 9999999
end

local n8

do
	local Lighting = game:GetService("Lighting")
	local moonDirection = Lighting:GetMoonDirection()
	local n9 = moonDirection.X * 7763 + moonDirection.Y * 8123 + moonDirection.Z * 6107 + Lighting:GetMoonPhase() * 6167

	if n9 * 0 ~= 0 then
		n9 = 0
	end

	if n9 < 0 then
		n9 = -n9
	end

	local n10 = (1545952 + (n9 // 1 % 9999999 + 696445) * 95) % 9999999
	local sunDirection = game:GetService("Lighting"):GetSunDirection()
	local n11 = sunDirection.X * 7751 + sunDirection.Y * 7073 + sunDirection.Z * 6707

	if n11 * 0 ~= 0 then
		n11 = 0
	end

	local n12

	if n11 < 0 then
		n12 = -n11
	else
		n12 = n11
	end

	local n13 = (n10 + (n12 // 1 % 9999999 + 8411555) * 37) % 9999999
	local Lighting2 = game:GetService("Lighting")
	local n14 = Lighting2.FogEnd * 5285 + Lighting2.ShadowSoftness * 6671 + Lighting2.GeographicLatitude * 5423

	if n14 * 0 ~= 0 then
		n14 = 0
	end

	if n14 < 0 then
		n14 = -n14
	end

	local n15 = (n13 + n14 // 1 % 9999999 * 3 + 75765) % 9999999
	local Lighting3 = game:GetService("Lighting")
	local n16 = Lighting3.ClockTime * 7411 + Lighting3.Brightness * 5987 + Lighting3.ExposureCompensation * 6299

	if n16 * 0 ~= 0 then
		n16 = 0
	end

	if n16 < 0 then
		n16 = -n16
	end

	local n17 = (n15 + n16 // 1 % 9999999 * 51 + 8071278) % 9999999
	local n18 = game:GetService("Lighting"):GetMinutesAfterMidnight() * 7367

	if n18 * 0 ~= 0 then
		n18 = 0
	end

	if n18 < 0 then
		n18 = -n18
	end

	local n19 = ((n17 + n18 // 1 % 9999999) * 33 + 5836172) % 9999999
	local n20 = workspace.Gravity * 1000 // 1
	local n21 = workspace:GetNumAwakeParts() * 6787 + n20 + workspace.AirDensity * 100000 // 1

	if n21 * 0 ~= 0 then
		n21 = 0
	end

	if n21 < 0 then
		n21 = -n21
	end

	local n22 = (786040437 + n21 // 1 % 9999999 + 3101208) % 9999999
	local size = workspace.Terrain.Size
	local n23 = size.X * 6341 + size.Y * 8113 + size.Z * 7027

	if n23 * 0 ~= 0 then
		n23 = 0
	end

	local n24

	if n23 < 0 then
		n24 = -n23
	else
		n24 = n23
	end

	local n25 = (n22 * 29 + n24 // 1 % 9999999 + 9357413) % 9999999
	local globalWind = workspace.GlobalWind
	local position = workspace.WorldPivot.Position
	local n26 = globalWind.X * position.X + globalWind.Y * position.Y + globalWind.Z * position.Z

	if n26 * 0 ~= 0 then
		n26 = 0
	end

	if n26 < 0 then
		n26 = -n26
	end

	local n27 = ((n25 + n26 // 1 % 9999999) * 83 + 4608342) % 9999999
	local terrain = workspace.Terrain
	local n28 = terrain.Mass + terrain.WaterWaveSpeed * 5537 + terrain.WaterWaveSize * 6517

	if n28 * 0 ~= 0 then
		n28 = 0
	end

	if n28 < 0 then
		n28 = -n28
	end

	local n29 = (n27 * 67 + n28 // 1 % 9999999 + 1602812) % 9999999
	local position2 = workspace.WorldPivot.Position
	local n30 = position2.X * 5767 + position2.Y * 5633 + position2.Z * 7489

	if n30 * 0 ~= 0 then
		n30 = 0
	end

	if n30 < 0 then
		n30 = -n30
	end

	local n31 = (n29 * 3 + n30 // 1 % 9999999 + 1359191) % 9999999

	local ok, result = pcall(function()
		return Stats.Network.ServerStatsItem.Stats.totalBytesSent:GetValue() * 5597
	end)

	if not ok or type(result) ~= "number" then
		result = 0
	end

	if result * 0 ~= 0 then
		result = 0
	end

	if result < 0 then
		result = -result
	end

	local n32 = (1596354 + (result // 1 % 9999999 + 4359775) * 55) % 9999999

	local ok2, result2 = pcall(function()
		local dataPingDetails = Stats.Network.ServerStatsItem.DataPingDetails
		local unrelLRakRecvToAppPop = dataPingDetails.unrelLRakRecvToAppPop
		return dataPingDetails.unrelLDeserializeToProcess:GetValue() * 6635 + unrelLRakRecvToAppPop:GetValue() * 8071
	end)

	if not ok2 or type(result2) ~= "number" then
		result2 = 0
	end

	if result2 * 0 ~= 0 then
		result2 = 0
	end

	if result2 < 0 then
		result2 = -result2
	end

	local n33 = (n32 + (result2 // 1 % 9999999 + 8248232) * 63) % 9999999

	local ok3, result3 = pcall(function()
		local dataPingDetails = Stats.Network.ServerStatsItem.DataPingDetails
		local estTotal = dataPingDetails.EstTotal
		local n34 = dataPingDetails.unrelEstTotal:GetValue() * 7297 + estTotal:GetValue() * 6035
		local measuredTotal = dataPingDetails.MeasuredTotal
		return n34 + dataPingDetails.unrelMeasuredTotal:GetValue() * 6959 + measuredTotal:GetValue() * 7601
	end)

	if not ok3 or type(result3) ~= "number" then
		result3 = 0
	end

	if result3 * 0 ~= 0 then
		result3 = 0
	end

	if result3 < 0 then
		result3 = -result3
	end

	local n34 = (n33 + (result3 // 1 % 9999999 + 3316967) * 7) % 9999999

	local ok4, result4 = pcall(function()
		return Stats.Network.ServerStatsItem.Stats.bytesSentPerSec:GetValue() * 7205
	end)

	if not ok4 or type(result4) ~= "number" then
		result4 = 0
	end

	if result4 * 0 ~= 0 then
		result4 = 0
	end

	if result4 < 0 then
		result4 = -result4
	end

	local n35 = (n34 + result4 // 1 % 9999999 * 73 + 3544173) % 9999999

	local ok5, result5 = pcall(function()
		local stats = Stats.Network.ServerStatsItem.Stats
		local numberOfUnsplitMessages = stats.numberOfUnsplitMessages
		return stats.numberOfSplitMessages:GetValue() * 6457 + numberOfUnsplitMessages:GetValue() * 6809 + stats.connectionStartTime:GetValue() * 6181
	end)

	if not ok5 or type(result5) ~= "number" then
		result5 = 0
	end

	if result5 * 0 ~= 0 then
		result5 = 0
	end

	if result5 < 0 then
		result5 = -result5
	end

	n8 = (((((9217602 + n3 * 425) % 9999999 + n5 * 539) % 9999999 + n7 * 283) % 9999999 + n31 * 419) % 9999999 * 37 + ((((7562997 + n4 * 665) % 9999999 + n6 * 281) % 9999999 + n19 * 715) % 9999999 + (n35 * 5 + result5 // 1 % 9999999 + 3832190) % 9999999 * 641) % 9999999) % 9999999
end

do
	local ok, result = pcall(function()
		local Stats2 = game:GetService("Stats")
		return Stats2.PrimitivesCount + Stats2.MovingPrimitivesCount
	end)

	if not ok or type(result) ~= "number" then
		result = 0
	end

	if result * 0 ~= 0 then
		result = 0
	end

	if result < 0 then
		result = -result
	end

	local n9 = (2588842 + (result // 1 % 9999999 + 6094940) * 47) % 9999999

	local ok2, result2 = pcall(function()
		local localPlayer = game:GetService("Players").LocalPlayer
		local character = localPlayer and localPlayer.Character
		character = character and character.Humanoid
		local moveVelocity = character and character:GetMoveVelocity()
		return moveVelocity and moveVelocity.X * 1e9 * 4049 + moveVelocity.Y * 1e9 * 4027 + moveVelocity.Z * 1e9 * 4003 or 0
	end)

	if not ok2 or type(result2) ~= "number" then
		result2 = 0
	end

	if result2 * 0 ~= 0 then
		result2 = 0
	end

	if result2 < 0 then
		result2 = -result2
	end

	local n10 = (5171295 + (result2 // 1 % 9999999 + 1994917) * 53) % 9999999

	local ok3, result3 = pcall(function()
		local localPlayer = game:GetService("Players").LocalPlayer
		local character = localPlayer and localPlayer.Character

		if character and character.Humanoid then
		end

		local head = character and character.Head
		character = character and character.HumanoidRootPart
		head = head and head.CFrame
		character = character and character.CFrame
		return head and character and ((head.X - character.X) * 5003 + (head.Y - character.Y) * 5007 + (head.Z - character.Z) * 5013 + (head.LookVector.X - character.LookVector.X) * 5019 + (head.LookVector.Y - character.LookVector.Y) * 5027 + (head.RightVector.Y - character.RightVector.Y) * 5039) * 1e9 or 0
	end)

	if not ok3 or type(result3) ~= "number" then
		result3 = 0
	end

	if result3 * 0 ~= 0 then
		result3 = 0
	end

	if result3 < 0 then
		result3 = -result3
	end

	local n11 = ((n9 + result3 // 1 % 9999999) * 83 + 9220301) % 9999999

	local ok4, result4 = pcall(function()
		local localPlayer = game:GetService("Players").LocalPlayer
		localPlayer = localPlayer and localPlayer:GetMouse()
		local hit = localPlayer and localPlayer.Hit
		return hit and (hit.LookVector.X * 6037 + hit.LookVector.Y * 6043 + hit.LookVector.Z * 6047 + hit.RightVector.Y * 6053) * 1e9 or 0
	end)

	if not ok4 or type(result4) ~= "number" then
		result4 = 0
	end

	if result4 * 0 ~= 0 then
		result4 = 0
	end

	if result4 < 0 then
		result4 = -result4
	end

	local n12 = ((n10 + result4 // 1 % 9999999) * 45 + 1280350) % 9999999
	local v9 = game:GetService("HttpService"):GenerateGUID(false)
	local byte = string.byte
	local n13 = 5381

	for i = 1, #v9 do
		n13 = (n13 * 33 + byte(v9, i)) % 9999999
	end

	if n13 * 0 ~= 0 then
		n13 = 0
	end

	local n14

	if n13 < 0 then
		n14 = -n13
	else
		n14 = n13
	end

	local n15 = (n11 + n14 // 1 % 9999999 * 31 + 5705154) % 9999999
	local screenResolution = game:GetService("GuiService"):GetScreenResolution()
	local n16 = screenResolution.X * 4099 + screenResolution.Y

	if n16 * 0 ~= 0 then
		n16 = 0
	end

	if n16 < 0 then
		n16 = -n16
	end

	local n17 = ((n12 + n16 // 1 % 9999999) * 65 + 5398645) % 9999999
	local n18 = workspace:GetServerTimeNow() * 1000 // 1

	if n18 * 0 ~= 0 then
		n18 = 0
	end

	if n18 < 0 then
		n18 = -n18
	end

	local n19 = (n15 + (n18 // 1 % 9999999 + 5234046) * 83) % 9999999
	local n20 = game:GetService("SoundService"):GetMixerTime() * 1000000

	if n20 * 0 ~= 0 then
		n20 = 0
	end

	if n20 < 0 then
		n20 = -n20
	end

	local n21 = (n17 * 17 + n20 // 1 % 9999999 + 3467108) % 9999999

	local ok5, result5 = pcall(function()
		local playSessionId = game:GetPlaySessionId()
		local byte2 = string.byte
		local n22 = 5381

		for i = 1, #playSessionId do
			n22 = (n22 * 33 + byte2(playSessionId, i)) % 9999999
		end

		return n22
	end)

	if not ok5 or type(result5) ~= "number" then
		result5 = 0
	end

	if result5 * 0 ~= 0 then
		result5 = 0
	end

	local n22

	if result5 < 0 then
		n22 = -result5
	else
		n22 = result5
	end

	local n23 = (n19 * 83 + n22 // 1 % 9999999 + 5970575) % 9999999
	local n24 = collectgarbage("count") * 1000 // 1

	if n24 * 0 ~= 0 then
		n24 = 0
	end

	if n24 < 0 then
		n24 = -n24
	end

	local n25 = ((n21 + n24 // 1 % 9999999) * 67 + 9632715) % 9999999

	local ok6, result6 = pcall(function()
		local localPlayer = game:GetService("Players").LocalPlayer
		local character = localPlayer and localPlayer.Character
		local humanoid = character and character.Humanoid
		humanoid = character and humanoid and (humanoid and humanoid.RigType.Value == 0 and character["Left Arm"] or character.LeftUpperArm)
		humanoid = humanoid and humanoid.CFrame
		return humanoid and (humanoid.X * 4217 + humanoid.Y * 4219 + humanoid.Z * 4223 + humanoid.LookVector.X * 4229 + humanoid.LookVector.Y * 4235 + humanoid.RightVector.Y * 4247) * 1e9 or 0
	end)

	if not ok6 or type(result6) ~= "number" then
		result6 = 0
	end

	if result6 * 0 ~= 0 then
		result6 = 0
	end

	if result6 < 0 then
		result6 = -result6
	end

	local n26 = (n23 * 43 + result6 // 1 % 9999999 + 2720264) % 9999999
	local n27 = Random.new():NextInteger(1, 9999999)

	if n27 * 0 ~= 0 then
		n27 = 0
	end

	if n27 < 0 then
		n27 = -n27
	end

	local n28 = (n25 + n27 // 1 % 9999999 * 95 + 6170200) % 9999999
	local n29 = #game:GetService("Players"):GetPlayers()

	if n29 * 0 ~= 0 then
		n29 = 0
	end

	if n29 < 0 then
		n29 = -n29
	end

	local n30 = (n26 * 73 + n29 // 1 % 9999999 + 6912700) % 9999999

	local ok7, result7 = pcall(function()
		local localPlayer = game:GetService("Players").LocalPlayer
		localPlayer = localPlayer and localPlayer.Character
		localPlayer = localPlayer and localPlayer.HumanoidRootPart
		localPlayer = localPlayer and localPlayer.RootJoint
		local transform = localPlayer and localPlayer.Transform
		return transform and transform.X * 1e9 * 3169 + transform.Y * 1e9 * 3167 + transform.Z * 1e9 * 3137 + transform.LookVector.Z * 1e9 * 3121 or 0
	end)

	if not ok7 or type(result7) ~= "number" then
		result7 = 0
	end

	if result7 * 0 ~= 0 then
		result7 = 0
	end

	if result7 < 0 then
		result7 = -result7
	end

	local n31 = (n28 + (result7 // 1 % 9999999 + 2716057) * 19) % 9999999
	local n32 = game.PlaceId + game.PlaceVersion * 4099

	if n32 * 0 ~= 0 then
		n32 = 0
	end

	if n32 < 0 then
		n32 = -n32
	end

	part:SetAttribute("_e8ea3e91", (n8 + ((n30 + n32 // 1 % 9999999 * 43 + 833594) % 9999999 * 4099 + n31) % 9999999 + 1) % 9999999 // 1 + 1)
end

for i = 1, 40 do
	local v9 = part
	local setAttribute = v9.SetAttribute
	local n9

	if tostring({}) < tostring({}) then
		n9 = part:GetAttribute("_e8ea3e91") + 1
	else
		n9 = part:GetAttribute("_e8ea3e91") * 2
	end

	setAttribute(v9, "_e8ea3e91", n9 % 9999998 + 1)
end

local attribute
attribute = part:GetAttribute("_e8ea3e91")
tbl._b3e05ec6c78c:SetItem(tbl._7a53828b9027, tostring(bit32.bxor(3201088250, attribute)))

if tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_y8BzdmltviPvsBa") ~= tostring(bit32.bxor(3201088250, attribute)) and not identifyexecutor():match("^Synapse") then
	fn("J2_182")
	LPH_CRASH()
end

local v9

do
	local tbl4 = { 1, 2, 3, 4 }
	local v10 = fn8()

	for i = 1, 24 do
		local tbl5 = {}

		for i2 = 1, 33 do
			if i2 % 4 == 0 then
				tbl5[i2] = { i2 }
			elseif i2 % 4 == 1 then
				tbl5[i2] = buffer.create(8)
			elseif i2 % 4 == 2 then
				tbl5[i2] = table.clone(tbl4)
			else
				tbl5[i2] = newproxy(true)
			end
		end

		v10[fn8()] = tick() * 250 + i * 12
	end

	for i = 1, 20 do
		local tbl5 = {}

		for i2 = 1, 33 do
			if i2 % 4 == 0 then
				tbl5[i2] = { i2 }
			elseif i2 % 4 == 1 then
				tbl5[i2] = buffer.create(8)
			elseif i2 % 4 == 2 then
				tbl5[i2] = table.clone(tbl4)
			else
				tbl5[i2] = newproxy(true)
			end
		end

		v10[buffer.create(12)] = tick() * 250 + i * 12
	end

	local n9 = 0

	for _, v11 in v10, nil, nil do
		n9 = ((n9 + v11 // 1) % 4294967296 * 1664525 + 1013904223) % 4294967296
	end

	local n10 = 0 + n9
	local tbl5 = {}

	for i = 1, 58 do
		local tbl6 = {}

		for i2 = 1, 33 do
			if i2 % 4 == 0 then
				tbl6[i2] = { i2 }
			elseif i2 % 4 == 1 then
				tbl6[i2] = buffer.create(8)
			elseif i2 % 4 == 2 then
				tbl6[i2] = table.clone(tbl4)
			else
				tbl6[i2] = newproxy(true)
			end
		end

		tbl5[newproxy(false)] = tick() * 100 + i * 53
	end

	local n11 = 0

	for _, v11 in tbl5, nil, nil do
		n11 = ((n11 + v11 // 1) % 4294967296 * 1664525 + 1013904223) % 4294967296
	end

	local n12 = n10 + n11
	local tbl6 = {}

	for i = 1, 63 do
		local tbl7 = {}

		for i2 = 1, 33 do
			if i2 % 4 == 0 then
				tbl7[i2] = { i2 }
			elseif i2 % 4 == 1 then
				tbl7[i2] = buffer.create(8)
			elseif i2 % 4 == 2 then
				tbl7[i2] = table.clone(tbl4)
			else
				tbl7[i2] = newproxy(true)
			end
		end

		tbl6[{}] = math.random(1, 9999999) + i * 31
	end

	local n13 = 0

	for _, v11 in tbl6, nil, nil do
		n13 = ((n13 + v11) % 4294967296 * 1664525 + 1013904223) % 4294967296
	end

	local n14 = n12 + n13
	local tbl7 = {}

	for i = 1, 49 do
		local tbl8 = {}

		for i2 = 1, 33 do
			if i2 % 4 == 0 then
				tbl8[i2] = { i2 }
			elseif i2 % 4 == 1 then
				tbl8[i2] = buffer.create(8)
			elseif i2 % 4 == 2 then
				tbl8[i2] = table.clone(tbl4)
			else
				tbl8[i2] = newproxy(true)
			end
		end

		tbl7[buffer.create(8)] = os.clock() * 1000 + i * 17
	end

	local n15 = 0

	for _, v11 in tbl7, nil, nil do
		n15 = ((n15 + v11 // 1) % 4294967296 * 1664525 + 1013904223) % 4294967296
	end

	local n16 = (n14 + n15) % 9999999 + 1
	local n17 = 0

	while true do
		n17 += 1

		if tostring({}) < tostring({}) then
			n16 = (n16 + 34) % 9999999
		else
			n16 = (n16 * 9 + 661) % 9999999
		end

		if n17 ~= 16 then
			continue
		end
		break
	end

	local n18 = 0

	while true do
		n18 += 1
		local v11 = tostring
		local v12 = fn8()
		local v13 = v11(v12)
		local v14 = tostring
		local v15 = fn8()

		if v13 < v14(v15) then
			n16 = (n16 + 9) % 9999999
		else
			n16 = (n16 * 8 + 451) % 9999999
		end

		if n18 ~= 17 then
			continue
		end
		break
	end

	local part2 = Instance.new("Part")
	part2:SetAttribute("_3c4e12b9221a", 1)
	part2:SetAttribute("_3b2d25d39295", 0)
	local n19 = 620483
	local n20 = 0
	local n21 = 0
	local n22 = 0
	local n23 = 1

	while true do
		if not rawequal(n19, 620483) or type(n19) ~= "number" then
			fn("J2_006")
			LPH_CRASH()
		end

		local n24 = math.random(800, 999)

		if type(n24) ~= "number" or n24 < 800 or n24 > 999 or n24 ~= math.floor(n24) or not fn3(math.floor(n24), n24 // 1, 613993) then
			fn("J2_MS17")
			LPH_CRASH()
		end

		local n25 = math.random(800, 999)

		if type(n25) ~= "number" or n25 < 800 or n25 > 999 or n25 ~= math.floor(n25) or not fn3(math.floor(n25), n25 // 1, 613993) then
			fn("J2_169")
			LPH_CRASH()
		end

		n21 = n24 == n20 and n21 + 1 or 0

		if n21 >= 3 then
			fn("J2_050")
			LPH_CRASH()
		end

		if part2:GetAttribute("_3c4e12b9221a") <= 9999 or part2:GetAttribute("_3c4e12b9221a") < 9999 then
			if n22 ~= 0 and getfenv()[getfenv()[5542648]] == nil then
				fn("J2_HP4")
				LPH_CRASH()
			end

			if getfenv()[getfenv()[5542648]] == nil and n22 ~= 0 then
				fn("J2_RVP5")
				LPH_CRASH()
			end

			part2:SetAttribute("_3c4e12b9221a", part2:GetAttribute("_3c4e12b9221a") + n24)
			part2:SetAttribute("_3b2d25d39295", part2:GetAttribute("_3b2d25d39295") + 1)
			getfenv()[5542648] = n24
			getfenv()[n24] = n24
			n22 += 1

			if n22 > 20 then
				fn("J2_171")
				LPH_CRASH()
			end

			n23 += n25
			n20 = n24
			continue
		end

		break
	end

	if not fn3(n22, part2:GetAttribute("_3b2d25d39295"), 613993) or n22 < 11 or part2:GetAttribute("_3b2d25d39295") < 11 or n23 + 1000 <= 9999 then
		fn("J2_082")
		LPH_CRASH()
	end

	if n23 < 10000 then
		n23 += 1000
	end

	local n24 = (n16 + part2:GetAttribute("_3c4e12b9221a") + n23) % 9999999 + 1
	getfenv()[676] = n24
	writefile(tbl._1a83c4135d98, n24 .. "")
	v9 = n24
end

if v9 .. "" ~= getfenv()[676] .. "" then
	fn("J2_RVP1")
	LPH_CRASH()
end

tbl._3c18b9204744:SetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.Small, v9 % 928980 / 928980)
tbl._21cbdb7c3d0e = tbl._3c18b9204744:GetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.Small)

if tbl._21cbdb7c3d0e == nil or tbl._21cbdb7c3d0e == v9 % 928980 / 928980 then
	fn("J2_181")
	LPH_CRASH()
end

local v10

local function fn11()
	return 500000
end

v10 = fn11(584174)
local flag3 = nil

for i = 1, 3 do
	local tbl4 = {}

	for i2 = 1, 51 do
		tbl4[{}] = math.random(1, 9999999) + i2
	end

	local n9 = 0

	for _, v11 in tbl4, nil, nil do
		n9 = ((n9 + v11) % 4294967296 * 1664525 + 1013904223) % 4294967296
	end

	local n10 = n9 % 99999
	flag3 = flag3 and n10 == flag3

	if flag3 then
		fn("J2_037")
		LPH_CRASH()
	end

	v10 += n10
	flag3 = n10
end

local n9
local str3 = tostring(({}).n) .. tostring({}) .. game:GetService("HttpService"):GenerateGUID(false) .. tick()
n9 = 0

for i = 1, #str3 do
	n9 = (n9 * 51 + string.byte(str3, i) + 3551) % 1000000 + 1
end

local n10 = 31

while n10 > 0 do
	if tostring({}) < tostring({}) then
		n9 = (n9 + 37) % 1000000
	else
		n9 = (n9 * 6 + 181) % 1000000
	end

	n10 -= 1
end

local str4 = tostring({})

while str4 == tostring({}) do
	str4 = tostring({})
end

local n11
local v11 = game
n11 = Random.new(v9):NextInteger(1, 9999999) + #v11:GetDescendants()

if getinstances then
	n11 += #getinstances()
end

if getnilinstances then
	n11 += #getnilinstances()
end

local n12

do
	local kind = typeof(http.request)

	if kind == "number" or kind == "string" or kind == "boolean" then
		kind = "" .. http.request
	elseif kind == "table" then
		kind = "{}"
	elseif kind == "function" then
		kind = "function: " .. (tostring(http.request):match("0x%x+") or "0x1")
	end

	local n13 = 0

	for i = 4, #kind do
		local v12 = kind:byte(i)
		n13 = (n13 * 16 + (v12 >= 65 and v12 <= 70 and v12 - 65 + 10 or v12 >= 48 and v12 <= 57 and v12 - 48 or v12 >= 97 and v12 <= 102 and v12 - 97 + 10 or 0)) % 9007199254740991
	end

	local n14 = n9 % 100000 + n13 / 1000000000000037 // 1 * 521 + (tonumber(tostring(buffer.create(8)):match("0x(%x+)") or "1", 16) + tonumber(tostring({}):match("0x(%x+)") or "1", 16) + tonumber(tostring(newproxy()):match("0x(%x+)") or "1", 16)) % 10000 + 1
	local DebugSettings = settings():GetService("DebugSettings")
	local instanceCount = DebugSettings.InstanceCount
	n12 = n14 + #listfiles("") + instanceCount + DebugSettings.JobCount + settings():GetService("NetworkSettings").FreeMemoryMBytes // 1
end

if settings():getService("DebugSettings") then
	n12 += settings():getService("DebugSettings").PlayerCount
end

local n13

do
	local kind = typeof(isfunctionhooked)

	if kind == "number" or kind == "string" or kind == "boolean" then
		kind = "" .. isfunctionhooked
	elseif kind == "table" then
		kind = "{}"
	elseif kind == "function" then
		kind = "function: " .. (tostring(isfunctionhooked):match("0x%x+") or "0x1")
	end

	local n14 = 0

	for i = 4, #kind do
		local v12 = kind:byte(i)
		local n15 = n14 * 16
		local n16 = v12 >= 97 and v12 <= 102 and v12 - 97 + 10

		if not n16 then
			n16 = v12 >= 48 and v12 <= 57 and v12 - 48
		end

		n14 = (n15 + (n16 or v12 >= 65 and v12 <= 70 and v12 - 65 + 10 or 0)) % 9007199254740991
	end

	n13 = n9 / 1000 // 1 % 100000 + n14 / 1250000000000029 // 1 * 53 + 1 + 1
end

wait(0.1)

if getscriptbytecode then
	local character = game:GetService("Players").LocalPlayer.Character
	character = character and character:FindFirstChild("Animate")
	character = character and getscriptbytecode(character)

	if type(character) == "string" then
		n13 += #character
	end
end

tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}", n11)

if (attribute % attribute ~= 0 or n11 % n11 ~= 0) == true then
	fn("J2_MS22")
	LPH_CRASH()
end

local n14 = 0

for k in {
	[attribute] = true,
	[v9] = true,
	[v10] = true,
	[n9] = true,
	[n12] = true,
	[n13] = true,
	[n11] = true,
}, nil, nil do
	n14 += 1
end

if n14 < 4 then
	fn("J2_162")
	LPH_CRASH()
end

if (attribute < 1 or attribute > 9999999 or v9 < 1 or v9 > 9999999 or v10 < 1 or v10 > 1051288) == true then
	fn("J2_011")
	LPH_CRASH()
end

if v10 % 1 ~= 0 or n9 < 0 or n9 > 1000000 or n9 % 1 ~= 0 or n12 < 1 then
	fn("J2_011")
	LPH_CRASH()
end

if not (not (n12 > 1e9) and not (n13 < 2) and not (n13 > 1e9) and not (n11 < 1) and not (n11 > 99999999)) then
	fn("J2_011")
	LPH_CRASH()
end

if not rawequal(attribute, attribute) then
	fn("J2_REQ1")
	LPH_CRASH()
end

if not rawequal(v9, getfenv()[676]) == true then
	fn("J2_REQ1")
	LPH_CRASH()
end

if not rawequal(n11, n11) then
	fn("J2_REQ1")
	LPH_CRASH()
end

if attribute - part:GetAttribute("_e8ea3e91") ~= 0 then
	fn("J2_164")
	LPH_CRASH()
end

if n11 - n11 ~= 0 then
	fn("J2_164")
	LPH_CRASH()
end

if not tostring(attribute):match("^%d+$") or not tostring(n11):match("^%d+$") then
	fn("J2_MS08")
	LPH_CRASH()
end

if not (not (type(attribute) ~= "number") and not (type(v9) ~= "number") and not (type(v10) ~= "number")) then
	fn("J2_SOF3")
	LPH_CRASH()
end

if not (not (type(n9) ~= "number") and not (type(n12) ~= "number")) then
	fn("J2_SOF3")
	LPH_CRASH()
end

if type(n13) ~= "number" or type(n11) ~= "number" then
	fn("J2_SOF3")
	LPH_CRASH()
end

if attribute * 0 ~= 0 or v9 * 0 ~= 0 then
	fn("J2_120")
	LPH_CRASH()
end

if v10 * 0 ~= 0 or n9 * 0 ~= 0 then
	fn("J2_120")
	LPH_CRASH()
end

if n11 * 0 ~= 0 then
	fn("J2_120")
	LPH_CRASH()
end

if attribute + 0 ~= attribute == true then
	fn("J2_098")
	LPH_CRASH()
end

if n11 + 0 ~= n11 == true then
	fn("J2_098")
	LPH_CRASH()
end

local n15 = (attribute + n11) // 1

if not (not (type(n15) ~= "number") and not (n15 * 0 ~= 0)) then
	fn("J2_HP1")
	LPH_CRASH()
end

if n15 ~= n15 // 1 then
	fn("J2_HP1")
	LPH_CRASH()
end

if attribute // 1 ~= attribute then
	fn("J2_MS11")
	LPH_CRASH()
end

if v9 // 1 ~= v9 == true then
	fn("J2_MS11")
	LPH_CRASH()
end

if n11 // 1 ~= n11 then
	fn("J2_MS11")
	LPH_CRASH()
end

if attribute / attribute ~= 1 or n11 / n11 ~= 1 then
	fn("J2_123")
	LPH_CRASH()
end

n2 += 47
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "qsiUaKQ9tIgRk")

if fn4(attribute, n11, 317750) or attribute == n11 or n11 .. "" == attribute then
	fn("J2_MS04")
	LPH_CRASH()
end

n2 += 15
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "che1c2suhbxG")
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("ယ\u{C76}\u{992}ஙခউୖ", (#getgenv().SCRIPT_KEY + n11 + n13 // 10000 + 1 + n12 // 10000 + 1 + n9 + v10 + v9 + attribute) / 100000 * 1000 * 0.2 // 1)
part:SetAttribute("_24bb5bf6", attribute % 999999)
part:SetAttribute("_d1c0fc67", v10 % 999999)
part:SetAttribute("_fca7580c", n9 % 999999)
part:SetAttribute("_97bf9c4a", bit32.bxor(n12 % 999999, n13 % 999999))
local sound
sound = Instance.new("Sound")
sound.Name = "_296341070dd7" .. n11 % 10000
sound.Volume = n12 % 100 / 100
sound.Pitch = n13 % 200 / 100
sound.TimePosition = attribute % 1000 / 10
local teleportOptions
teleportOptions = Instance.new("TeleportOptions")

teleportOptions:SetTeleportData({
	_6a246ed42fa2 = attribute % 999999 .. "_" .. getfenv()[676] % 999999,
	_fc2656845eed = v10 % 999999,
	_0bb5b8129d8a = n9 % 999999,
	_aab243b91c04 = bit32.bxor(n12 % 999999, n11 % 999999),
	_c61bf283209a = bit32.bxor(bit32.bxor(attribute % 999999, v10 % 999999), n13 % 999999),
	_c580447280eb = os.time(),
	_7213ab2430e5 = n12 % 10000 .. n13 % 10000,
})

local proxy
proxy = newproxy(true)
local intValue
intValue = Instance.new("IntValue")
local v12
v12 = { DisplayOrder = n9 }
local frame
frame = Instance.new("Frame")
intValue.Name = (attribute + v9 + v10 + n9 + n12 // 10000 + 1 + n13 // 10000 + 1 + n11 + #getgenv().SCRIPT_KEY) / 100000 * 1000 * 0.2 // 1
n2 += 55
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "Yxbx6tcCdc74BVpqlPca")
getfenv()[45] = attribute
getfenv()[180] = v9
getfenv()[235] = bit32.bxor(n9 % 4294967295, n11 % 4294967295)

do
	local bxor = bit32.bxor
	local bxor2 = bit32.bxor
	getfenv()[160] = bxor(bit32.bxor(attribute % 4294967295, v9 % 4294967295), bxor2(v10 % 4294967295, n11 % 4294967295))
end

debug.setmemorycategory("_mt0qn9wG" .. tostring((attribute % 690740 * 109 + 2042) % 690740))
n2 += 37
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "bkAdkYIcsossTVMgb")
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "QbOpZwQp9")

if fn10({}, 381604) == "" then
	fn("J2_224")
	LPH_CRASH()
end

n2 += 54
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "jmaixqH2ZdsBnhZ")

if debug.info(1, "l") ~= v7 or debug.info(1, "l") ~= v then
	fn("J2_145")
	LPH_CRASH()
end

local bindableEvent, v13, n16

do
	local v14 = debug.info(1, "l")

	if restorefunction then
		pcall(restorefunction, request)
	end

	if isfunctionhooked and isfunctionhooked(request) then
		fn("J2_039")
		LPH_CRASH()
	end

	bindableEvent = Instance.new("BindableEvent")
	local n17 = 0
	tbl._3c18b9204744:SetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.RightTrigger, v10 % 997684 / 997684)
	tbl._5de065987796 = tbl._3c18b9204744:GetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.RightTrigger)

	if tbl._5de065987796 == nil or tbl._5de065987796 == v10 % 997684 / 997684 then
		fn("J2_223")
		LPH_CRASH()
	end

	if tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_ZkNICbWDzZFseiR") ~= tostring(bit32.bxor(3201088250, attribute)) and not identifyexecutor():match("^Synapse") then
		fn("J2_SOF4")
		LPH_CRASH()
	end

	local bxor = bit32.bxor
	tbl._b3e05ec6c78c:SetItem(tbl._7a53828b9027, tostring(bit32.bxor(bit32.bxor(n12, n9, v10), bit32.bxor(attribute, 3201063167, n13), bxor(n11, v9))))
	local flag4 = not tbl._b3e05ec6c78c:HasItem(tbl._7a53828b9027)

	if not flag4 then
		local v15 = tostring
		local bxor2 = bit32.bxor
		local bxor3 = bit32.bxor
		flag4 = tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_hYR0S9ccVeB3vU2") ~= v15(bxor2(bit32.bxor(n12, n9, v10), bit32.bxor(attribute, 3201063167, n13), bxor3(n11, v9)))
	end

	if flag4 and not identifyexecutor():match("^Synapse") then
		fn("J2_RV2")
		LPH_CRASH()
	end

	local function fn12()
		error("devirt: symbolic next pc/mode: (r26 Add 1) / 144 (at 144:10)")
	end

	do
		local X21 = ((17 * n11 % 1117171 + 63 * (n12 // 10000 + 1) % 1117171) % 1117171 + 910453) % 1117171
		v13 = {
			_ee0f3e929e5b670b5da9a93b = true,
			_d46878ac2c396a0c65ef5205 = true,
			_0e747abf4734a5bc5eb78668 = "FREE",
			_aee181111a577dbaff8ee5db = 0,
			_21d4aa286d7e96854cf5d3e4 = X21,
			_1ee6134e48d0111e4ebb8e2a = (121 * v10 % 894013 + 109 * attribute % 894013 + 33 * X21 % 894013 + 892761) % 894013,
			_eed515e5f3af81405f035388 = 2 * attribute - 3 * v9 + 385,
			_f0b1bb247a648bfcdabac559 = 4 * v9 - attribute - 533,
			_d3bb9b60fccdfa04958d33a2 = 2553 + 5 * n11 + 2 * attribute + 8 * v9,
			_c629ea669c28aad52c4a600f = 5 * v10 + 3 * n9 - 781,
			_1ce96b8f45f63448e1817363 = 5 * n9 - 2 * v10 + 625,
			_e4fa81e286c02bf6b556f92c = 151,
			_ec8fe2ebd679f92d820192f1 = 0,
			_7a229333e1626642d38af047 = "_34baa8de05ae8cd174a7f75e",
		}
	end
	tbl._ada26ba60194 = nil
	local str5 = tostring(v13._0e747abf4734a5bc5eb78668 or "")
	local str6 = tostring(v13._aee181111a577dbaff8ee5db or "")
	n16 = (#str6 * 53 + (str5:byte(1) or 0) * 33 + #str5 * 101 + (type(v13._1ee6134e48d0111e4ebb8e2a) == "number" and v13._1ee6134e48d0111e4ebb8e2a % 894013 or 0) * 97 + (str6:byte(#str6) or 0) * 105 + (type(v13._21d4aa286d7e96854cf5d3e4) == "number" and v13._21d4aa286d7e96854cf5d3e4 % 1117171 or 0) * 81) % 2147483629
	do end
	local flag5 = tbl._b3e05ec6c78c:HasItem(tbl._7a53828b9027)

	if flag5 then
		local v15 = tostring
		local bxor2 = bit32.bxor
		local bxor3 = bit32.bxor
		flag5 = tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_IBWrIA01NbgcZ4h") == v15(bxor2(bit32.bxor(attribute, v9, n12), bit32.bxor(v10, n13, n11), bxor3(3201171184, n9)))
	end

	if not flag5 and not identifyexecutor():match("^Synapse") then
		fn("J2_052")
		LPH_CRASH()
	end

	local bxor2 = bit32.bxor
	tbl._b3e05ec6c78c:SetItem(tbl._7a53828b9027, tostring(bit32.bxor(bit32.bxor(n9, attribute, v10), bit32.bxor(n13, 3201146101, n16), bxor2(n12, v9, n11))))
	local v15 = tostring
	local bxor3 = bit32.bxor
	local bxor4 = bit32.bxor

	if (tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_lba8HdIYAjczHj3") ~= v15(bxor3(bit32.bxor(n9, attribute, v10), bit32.bxor(n13, 3201146101, n16), bxor4(n12, v9, n11))) or not tbl._b3e05ec6c78c:HasItem(tbl._7a53828b9027)) and not identifyexecutor():match("^Synapse") then
		fn("J2_042")
		LPH_CRASH()
	end

	n2 += 10
	tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "zawQXhELAQW9A")

	if debug.info(1, "l") ~= v14 or debug.info(1, "l") ~= v then
		fn("J2_004")
		LPH_CRASH()
	end
end

debug.info(1, "l")

do end

local flag4 = tbl._b3e05ec6c78c:HasItem(tbl._7a53828b9027)

if flag4 then
	local v14 = tostring
	local bxor = bit32.bxor
	local bxor2 = bit32.bxor
	flag4 = tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_Gy7aC5FSy3W5bjH") == v14(bxor(bit32.bxor(n9, attribute, v10), bit32.bxor(n13, 3201146101, n16), bxor2(n12, v9, n11)))
end

if not flag4 and not identifyexecutor():match("^Synapse") then
	fn("J2_149")
	LPH_CRASH()
end

tbl._b3e05ec6c78c:SetItem(tbl._7a53828b9027, tostring(bit32.bxor(bit32.bxor(n12, v9, 3201118966), bit32.bxor(n9, attribute, n16), bit32.bxor(n11, v10, n13))))
local flag5 = tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_yi8cxoqmjBOeD75") == "_yi8cxoqmjBOeD75"

if not flag5 then
	local v14 = tostring
	local bxor = bit32.bxor
	flag5 = tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_yi8cxoqmjBOeD75") ~= v14(bxor(bit32.bxor(n12, v9, 3201118966), bit32.bxor(n9, attribute, n16), bit32.bxor(n11, v10, n13)))
end

if flag5 and not identifyexecutor():match("^Synapse") then
	fn("J2_195")
	LPH_CRASH()
end

if not fn4(debug.setmemorycategory("_mt0qn9wG" .. tostring((n11 % 690740 * 109 + 2042) % 690740)), "_mt0qn9wG" .. tostring((attribute % 690740 * 109 + 2042) % 690740), 317750) then
	fn("J2_080")
	LPH_CRASH()
end

do end

do
	local v14 = tbl._b3e05ec6c78c:HasItem(tbl._7a53828b9027)
	local flag6

	if v14 then
		local v15 = tostring
		local bxor = bit32.bxor
		flag6 = tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_hb2cOfIw1sV6zsq") == v15(bxor(bit32.bxor(n12, v9, 3201118966), bit32.bxor(n9, attribute, n16), bit32.bxor(n11, v10, n13)))
	else
		flag6 = v14
	end

	if not flag6 and not identifyexecutor():match("^Synapse") then
		fn("J2_074")
		LPH_CRASH()
	end
end

local bxor = bit32.bxor
tbl._b3e05ec6c78c:SetItem(tbl._7a53828b9027, tostring(bit32.bxor(bit32.bxor(n16, v9, n11), bit32.bxor(attribute, 3201224939, n9), bxor(n13, n12, v10))))

do
	local v14 = tostring
	local bxor2 = bit32.bxor

	if (tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_cUnJTSG2vr4Nigb") == v14(bxor2(bit32.bxor(n16, v9, n11), bit32.bxor(attribute, 3201224939, n9), bit32.bxor(n13, n12, v10))) and tbl._b3e05ec6c78c:HasItem(tbl._7a53828b9027)) ~= true and not identifyexecutor():match("^Synapse") then
		fn("J2_057")
		LPH_CRASH()
	end
end

if not (v13._ee0f3e929e5b670b5da9a93b and v13._ee0f3e929e5b670b5da9a93b == true and v13._ee0f3e929e5b670b5da9a93b == true) then
	return 0
end

if not (v13._d46878ac2c396a0c65ef5205 == true and true == v13._d46878ac2c396a0c65ef5205 and false ~= v13._d46878ac2c396a0c65ef5205 and fn3(v13._d46878ac2c396a0c65ef5205, true, 613993) and not fn3(v13._d46878ac2c396a0c65ef5205, false, 613993) and ({ [true] = true })[v13._d46878ac2c396a0c65ef5205] and not ({ [false] = true })[v13._d46878ac2c396a0c65ef5205]) then
	fn("Invalid key provided, check key validity or reset HWID! (" .. v13._0e747abf4734a5bc5eb78668 .. ")")
	return 0
end

local flag6

if type(v13._d3bb9b60fccdfa04958d33a2) ~= "number" or type(v13._eed515e5f3af81405f035388) ~= "number" or 3 * (v13._d3bb9b60fccdfa04958d33a2 - 2553 - 5 * n11 + -2 * attribute) + 4 * (v13._eed515e5f3af81405f035388 - 385 - 2 * attribute + -3 * v9) ~= 0 then
	flag6 = true
elseif type(v13._c629ea669c28aad52c4a600f) ~= "number" or type(v13._1ce96b8f45f63448e1817363) ~= "number" then
	flag6 = true
else
	flag6 = false

	if 6 * (v13._c629ea669c28aad52c4a600f - -781 - 5 * v10 + 3 * n9) + 5 * (v13._1ce96b8f45f63448e1817363 - 625 - -2 * v10 + 5 * n9) ~= 0 then
		flag6 = true
	end
end

if not flag6 and (type(v13._eed515e5f3af81405f035388) ~= "number" or type(v13._f0b1bb247a648bfcdabac559) ~= "number" or 5 * (v13._eed515e5f3af81405f035388 - 385) - 5 * (2 * attribute + -3 * v9) ~= 6 * (-1 * attribute + 4 * v9) - 6 * (v13._f0b1bb247a648bfcdabac559 - -533) or type(v13._f0b1bb247a648bfcdabac559) ~= "number" or type(v13._c629ea669c28aad52c4a600f) ~= "number" or 7 * (v13._f0b1bb247a648bfcdabac559 - -533 - -1 * attribute + 4 * v9) + 6 * (v13._c629ea669c28aad52c4a600f - -781 - 5 * v10 + 3 * n9) ~= 0 or type(v13._f0b1bb247a648bfcdabac559) ~= "number" or type(v13._1ce96b8f45f63448e1817363) ~= "number" or 7 * (v13._f0b1bb247a648bfcdabac559 - -533) + 5 * (v13._1ce96b8f45f63448e1817363 - 625) ~= 7 * (-1 * attribute + 4 * v9) + 5 * (-2 * v10 + 5 * n9)) then
	flag6 = true
end

if flag6 then
	fn("J2_115")
	LPH_CRASH()
end

local fc3c5cb58bdba857e0aa5190, n2d669ad54f500e563a8ddc2b, fe65b2bfdae03b049f406e1a, n6f6128df9fcb67717c6fbb1f, n55ec1ef4ab8ed1d39ad2003a, n8384f199148c3b3f3d08d03a, tbl4
local aee181111a577dbaff8ee5db = v13._aee181111a577dbaff8ee5db
fc3c5cb58bdba857e0aa5190 = v13._fc3c5cb58bdba857e0aa5190 or 0
n2d669ad54f500e563a8ddc2b = v13._2d669ad54f500e563a8ddc2b or 0
fe65b2bfdae03b049f406e1a = v13._fe65b2bfdae03b049f406e1a or 0
n6f6128df9fcb67717c6fbb1f = v13._6f6128df9fcb67717c6fbb1f or 0
n55ec1ef4ab8ed1d39ad2003a = v13._55ec1ef4ab8ed1d39ad2003a or 0
n8384f199148c3b3f3d08d03a = v13._8384f199148c3b3f3d08d03a or 0
tbl4 = {}

if type(v13._21d4aa286d7e96854cf5d3e4) ~= "number" then
	fn("J2_097")
	LPH_CRASH()
end

if v13._21d4aa286d7e96854cf5d3e4 % 1 ~= 0 or v13._21d4aa286d7e96854cf5d3e4 < 0 or v13._21d4aa286d7e96854cf5d3e4 >= 1117171 or not (v13._21d4aa286d7e96854cf5d3e4 == ((17 * n11 % 1117171 % 1117171 + 63 * (n12 // 10000 + 1) % 1117171) % 1117171 + 910453) % 1117171) then
	fn("J2_097")
	LPH_CRASH()
end

if type(v13._1ee6134e48d0111e4ebb8e2a) ~= "number" or type(v13._21d4aa286d7e96854cf5d3e4) ~= "number" then
	fn("J2_001")
	LPH_CRASH()
end

if v13._1ee6134e48d0111e4ebb8e2a % 1 ~= 0 or v13._1ee6134e48d0111e4ebb8e2a < 0 or v13._1ee6134e48d0111e4ebb8e2a >= 894013 or (121 * v10 % 894013 + 109 * attribute % 894013 + 33 * v13._21d4aa286d7e96854cf5d3e4 % 894013 + 892761) % 894013 ~= v13._1ee6134e48d0111e4ebb8e2a or not fn3(v13._1ee6134e48d0111e4ebb8e2a, (121 * v10 % 894013 + 109 * attribute % 894013 + 33 * v13._21d4aa286d7e96854cf5d3e4 % 894013 + 892761) % 894013, 613993) then
	fn("J2_001")
	LPH_CRASH()
end

if type(aee181111a577dbaff8ee5db) == "number" and aee181111a577dbaff8ee5db > 0 and os.time() > aee181111a577dbaff8ee5db + 300 then
	fn("J2_100")
	LPH_CRASH()
end

n2 += 4
tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("።ಘ૿ාॼ", tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") .. "sV9u4igBw")
local n17
n17 = 0
local n18
n18 = 3
local now
now = os.clock()

if frame.Size.X.Scale ~= v10 or frame.Size.X.Offset ~= n9 then
	fn("J2_SOF9")
	LPH_CRASH()
end

do
	local n19 = (2097152 + (v13._1ee6134e48d0111e4ebb8e2a - 33 * v13._21d4aa286d7e96854cf5d3e4 % 894013 + 109 * attribute % 894013 + 121 * v10 % 894013) % 894013) % 4294967296
	local n20 = (1620148400 + bit32.bxor(n2 % 4294967296, 3495817888) + bit32.bxor(n19, 2933973557) + 2806283758) % 4294967296
	local n21 = n20 % 4294967296
	local v14 = table.pack(bit32.band(n21 + 1058566571, 4294967295))
	local v15 = table.pack(bit32.band(v14[1], 65535))
	local n22 = 3323587475 + bit32.band(61088 * v15[1] + bit32.lshift(bit32.band(61088 * bit32.rshift(v14[1], 16) + 55482 * v15[1], 65535), 16), 4294967295) % 4294967296
	local v16 = table.pack(bit32.band(bit32.band(3323587475, n21 + 1058566571), 4294967295))
	local v17 = table.pack(bit32.band(v16[1], 65535))
	local n23 = bit32.band(65534 * v17[1] + bit32.lshift(bit32.band(65534 * bit32.rshift(v16[1], 16) + 65535 * v17[1], 65535), 16), 4294967295) % 4294967296
	local v18 = table.pack(bit32.band(bit32.bnot(n21 + 1058566571), 4294967295))
	local v19 = table.pack(bit32.band(v18[1], 65535))
	local n24 = (n22 + n23 + 3636129439 + bit32.band(61087 * v19[1] + bit32.lshift(bit32.band(61087 * bit32.rshift(v18[1], 16) + 55482 * v19[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n25 = n20 % 4294967296
	local v20 = table.pack(bit32.band(n25 + 3983499141, 4294967295))
	local v21 = table.pack(bit32.band(v20[1], 65535))
	local n26 = 3272268784 + bit32.band(56976 * v21[1] + bit32.lshift(bit32.band(56976 * bit32.rshift(v20[1], 16) + 51097 * v21[1], 65535), 16), 4294967295) % 4294967296
	local v22 = table.pack(bit32.band(bit32.bor(n25 + 3983499141, 1953553767), 4294967295))
	local v23 = table.pack(bit32.band(v22[1], 65535))
	local n27 = bit32.band(17120 * v23[1] + bit32.lshift(bit32.band(17120 * bit32.rshift(v22[1], 16) + 28876 * v23[1], 65535), 16), 4294967295) % 4294967296
	local v24 = table.pack(bit32.band(bit32.bxor(1953553767, n25 + 3983499141), 4294967295))
	local v25 = table.pack(bit32.band(v24[1], 65535))
	local n28 = (n26 + n27 + bit32.band(56977 * v25[1] + bit32.lshift(bit32.band(56977 * bit32.rshift(v24[1], 16) + 51097 * v25[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n29 = n20 % 4294967296
	local v26 = table.pack(bit32.band(n29 + 187406107, 4294967295))
	local v27 = table.pack(bit32.band(v26[1], 65535))
	local n30 = 3721905306 + bit32.band(44254 * v27[1] + bit32.lshift(bit32.band(44254 * bit32.rshift(v26[1], 16) + 22502 * v27[1], 65535), 16), 4294967295) % 4294967296
	local v28 = table.pack(bit32.band(bit32.band(n29 + 187406107, 2436075779), 4294967295))
	local v29 = table.pack(bit32.band(v28[1], 65535))
	local n31 = bit32.band(42564 * v29[1] + bit32.lshift(bit32.band(42564 * bit32.rshift(v28[1], 16) + 20530 * v29[1], 65535), 16), 4294967295) % 4294967296
	local v30 = table.pack(bit32.band(bit32.bxor(2436075779, n29 + 187406107), 4294967295))
	local v31 = table.pack(bit32.band(v30[1], 65535))
	local n32 = (n30 + n31 + bit32.band(21283 * v31[1] + bit32.lshift(bit32.band(21283 * bit32.rshift(v30[1], 16) + 43033 * v31[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n33 = n20 % 4294967296
	local v32 = table.pack(bit32.band(n33 + 637763353, 4294967295))
	local v33 = table.pack(bit32.band(v32[1], 65535))
	local n34 = 2698265605 + bit32.band(65535 * v33[1] + bit32.lshift(bit32.band(65535 * bit32.rshift(v32[1], 16) + 65535 * v33[1], 65535), 16), 4294967295) % 4294967296
	local v34 = table.pack(bit32.band(bit32.bor(n33 + 637763353, 2902784257), 4294967295))
	local v35 = table.pack(bit32.band(v34[1], 65535))
	local v36 = tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]

	if n2 - (1 - 2 * n24) * (1 + (n32 * 67108864 + (n34 + bit32.band(2 * v35[1] + bit32.lshift(bit32.band(2 * bit32.rshift(v34[1], 16) + 0 * v35[1], 65535), 16), 4294967295) % 4294967296 + 2988884730) % 4294967296) / 4503599627370496) * 2 ^ (n28 - 1023) ~= #v36:GetTeleportSetting("።ಘ૿ාॼ") then
		fn("J2_MS15")
		LPH_CRASH()
	end
end

if getfenv()[45] ~= attribute or not fn4(getfenv()[45], part:GetAttribute("_e8ea3e91"), 317750) then
	fn("J2_RVM")
	LPH_CRASH()
end

if getfenv()[180] ~= v9 or not fn4(getfenv()[180], v9, 317750) or v9 .. "" ~= readfile(tbl._1a83c4135d98) or not fn3(v9 .. "", readfile(tbl._1a83c4135d98), 613993) then
	fn("J2_131")
	LPH_CRASH()
end

do
	local n21cbdb7c3d0e = tbl._21cbdb7c3d0e
	local flag7 = tbl._3c18b9204744:GetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.Small) ~= n21cbdb7c3d0e

	if not flag7 then
		local n21cbdb7c3d0e2 = tbl._21cbdb7c3d0e
		flag7 = not fn3(tbl._3c18b9204744:GetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.Small), n21cbdb7c3d0e2, 613993)
	end

	if flag7 then
		fn("J2_072")
		LPH_CRASH()
	end
end

do
	local n5de065987796 = tbl._5de065987796
	local flag7 = tbl._3c18b9204744:GetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.RightTrigger) ~= n5de065987796

	if not flag7 then
		local n5de0659877962 = tbl._5de065987796
		flag7 = not fn3(tbl._3c18b9204744:GetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.RightTrigger), n5de0659877962, (1 - 2 * (3470168674 + 824798622 + 0) % 4294967296) * (1 + ((6803504312 + 536771450 + 5556108366) % 4294967296 * 67108864 + (2699937474 + 1595029822 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((5181085374 + 973772216 + 2435078044) % 4294967296 - 1023))
	end

	if flag7 then
		fn("J2_066")
		LPH_CRASH()
	end
end

tbl._3c18b9204744:SetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.Small, 0)
tbl._3c18b9204744:SetMotor(Enum.UserInputType.Gamepad8, Enum.VibrationMotor.RightTrigger, 0)

if delfile then
	delfile(tbl._1a83c4135d98)
end

if getfenv()[235] ~= bit32.bxor(n9 % 4294967295, n11 % 4294967295) then
	fn("J2_070")
	LPH_CRASH()
end

do
	local v14 = getfenv()[160]
	local v15 = bit32.bxor(attribute % 4294967295, v9 % 4294967295)
	local v16 = fn5(v10 % 4294967295, n11 % 4294967295)
	local flag7 = v14 ~= fn5(v15, v16)
	local flag8

	if flag7 then
		flag8 = flag7
	else
		local v17 = getfenv()[160]
		local v18 = bit32.bxor(attribute % 4294967295, v9 % 4294967295)
		local v19 = fn5(v10 % 4294967295, n11 % 4294967295)
		flag8 = not fn4(v17, fn5(v18, v19), 317750)
	end

	if flag8 then
		fn("J2_045")
		LPH_CRASH()
	end
end

if not (((v13._eed515e5f3af81405f035388 - 385) * 4 - (v13._f0b1bb247a648bfcdabac559 - -533) * -3) / 5 == attribute and ((v13._f0b1bb247a648bfcdabac559 - -533) * 2 - (v13._eed515e5f3af81405f035388 - 385) * -1) / 5 == v9 and fn4((2 * (v13._f0b1bb247a648bfcdabac559 - -533) - -1 * (v13._eed515e5f3af81405f035388 - 385)) / 5, v9, 317750) and fn4((4 * (v13._eed515e5f3af81405f035388 - 385) - -3 * (v13._f0b1bb247a648bfcdabac559 - -533)) / 5, attribute, 317750) and ((v13._eed515e5f3af81405f035388 - 385) * 4 - (v13._f0b1bb247a648bfcdabac559 - -533) * -3) / 5 == attribute and ((v13._eed515e5f3af81405f035388 - 385) * 4 - (v13._f0b1bb247a648bfcdabac559 - -533) * -3) / 5 == attribute and (4 * (v13._eed515e5f3af81405f035388 - 385) + 3 * (v13._f0b1bb247a648bfcdabac559 - -533)) / 5 == ((v13._eed515e5f3af81405f035388 - 385) * 4 - (v13._f0b1bb247a648bfcdabac559 - -533) * -3) / 5 and (4 * (v13._eed515e5f3af81405f035388 - 385) - -3 * (v13._f0b1bb247a648bfcdabac559 - -533)) / 5 == (-3 * (v13._f0b1bb247a648bfcdabac559 - -533) - 4 * (v13._eed515e5f3af81405f035388 - 385)) / -5) then
	return 0
end

if fn5(2945835765, attribute % 4294967295) ~= bit32.bxor(2945835765, attribute % 4294967295) or bit32.bxor(attribute % 4294967295, 3938219750) ~= fn5(attribute % 4294967295, 3938219750) then
	return 0
end

local n19, n20, v14, n21

do
	local n22 = n17 + 1
	local v15 = bit32.bxor(0, 1)
	local n23 = n18 + 1
	if fn6(n22, 255) ~= 1 or n22 + 16 ~= 17 or n22 ~= 1 then
		return 0
	end

	if #tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") + 3620 ~= n2 then
		fn("J2_217")
		LPH_CRASH()
	end

	local n24 = now - os.clock()
	if not (((v13._c629ea669c28aad52c4a600f - -781) * 5 - (v13._1ce96b8f45f63448e1817363 - 625) * 3) / 31 == v10 and fn4(((v13._c629ea669c28aad52c4a600f - -781) * 5 - (v13._1ce96b8f45f63448e1817363 - 625) * 3) / 31, v10, 317750) and (5 * (v13._1ce96b8f45f63448e1817363 - 625) + 2 * (v13._c629ea669c28aad52c4a600f - -781)) / 31 == n9 and fn4(((v13._1ce96b8f45f63448e1817363 - 625) * 5 - (v13._c629ea669c28aad52c4a600f - -781) * -2) / 31, n9, 317750)) then
		return 0
	end

	if not ((5 * (v13._1ce96b8f45f63448e1817363 - 625) + 2 * (v13._c629ea669c28aad52c4a600f - -781)) / 31 == n9 and fn3((5 * (v13._1ce96b8f45f63448e1817363 - 625) + 2 * (v13._c629ea669c28aad52c4a600f - -781)) / 31, n9, 613993)) then
		return 0
	end

	if bit32.bxor(2127028767, v9 % 4294967295) ~= fn5(2127028767, v9 % 4294967295) or fn5(v9 % 4294967295, bit32.bxor(attribute % 4294967295, 3938219750)) ~= bit32.bxor(v9 % 4294967295, bit32.bxor(attribute % 4294967295, 3938219750)) then
		return 0
	end
	local n25 = n22 + 1
	local v16 = fn5(v15, 1)
	local n26 = n23 * 2
	if not (fn4(n25, 2, 317750) and bit32.band(n25, 255) == 2 and n25 * 2 == 4 and n25 == 2) then
		return 0
	end
	local n27 = n24 + os.clock()
	if not (((v13._1ce96b8f45f63448e1817363 - 625) * 5 - (v13._c629ea669c28aad52c4a600f - -781) * -2) / 31 == n9 and fn4((5 * (v13._1ce96b8f45f63448e1817363 - 625) + 2 * (v13._c629ea669c28aad52c4a600f - -781)) / 31, n9, 317750)) then
		return 0
	end
	local flag7 = fn5(792251988, v10 % 4294967295) ~= bit32.bxor(792251988, v10 % 4294967295)
	local flag8

	if flag7 then
		flag8 = flag7
	else
		local bxor2 = bit32.bxor
		local v17 = bit32.bxor(attribute % 4294967295, 3938219750)
		local v18 = fn5(v9 % 4294967295, bit32.bxor(attribute % 4294967295, 3938219750))
		local v19 = fn5(v17, v18)
		local v20 = bxor2(v10 % 4294967295, v19)
		local bxor3 = bit32.bxor
		local v21 = bit32.bxor(attribute % 4294967295, 3938219750)
		local v22 = fn5(v9 % 4294967295, bit32.bxor(attribute % 4294967295, 3938219750))
		flag8 = v20 ~= fn5(v10 % 4294967295, bxor3(v21, v22))
	end

	if flag8 then
		return 0
	end
	local n28 = n25 + 5
	local v17 = bit32.bxor(v16, 5)
	local n29 = n26 - 1
	if n28 ~= 7 or fn4(n28, 7, 317750) == false or fn6(n28, 127) ~= 7 or n28 - 7 ~= 0 then
		return 0
	end
	local n30 = n27 - os.clock()
	if false and ((2553 + -2 * (-3 * (v13._f0b1bb247a648bfcdabac559 - -533) - 4 * (v13._eed515e5f3af81405f035388 - 385)) / -5 - v13._d3bb9b60fccdfa04958d33a2) / -5 == n11 and fn4(n11, (2553 + -2 * (4 * (v13._eed515e5f3af81405f035388 - 385) - -3 * (v13._f0b1bb247a648bfcdabac559 - -533)) / 5 - v13._d3bb9b60fccdfa04958d33a2) / -5, 317750)) then
		return 0
	end
	local teleportSetting = tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}")

	while teleportSetting ~= n11 do
		task.wait(1)
		teleportSetting = tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}")
	end

	if not fn4(teleportSetting, n11, (1 - 2 * (5447395820 + 3142538772 + 0) % 4294967296) * (1 + ((2053953236 + 2289007916 + 4261208576) % 4294967296 * 67108864 + (1560424698 + 2039360294 + 695182304) % 4294967296) / 4503599627370496) * 2 ^ ((4666650271 + 3237400950 + 685884412) % 4294967296 - 1023)) or not fn4(n11, teleportSetting, 317750) then
		while teleportSetting == n11 do
			task.wait(1)
		end
	end

	local bxor2 = bit32.bxor
	local bxor3 = bit32.bxor
	if fn5(fn5(2945835765, attribute % 4294967295), n11 % 4294967295) ~= bxor2(bxor3(2945835765, part:GetAttribute("_e8ea3e91") % 4294967295), n11 % 4294967295) then
		return 0
	end
	local n31 = n28 + 3
	local v18 = fn5(v17, 3)
	local n32 = n29 + 4
	if fn6(n31, 255) ~= 10 or n31 ~= 10 or fn4(n31, 10, 317750) == false then
		return 0
	end

	if v12.DisplayOrder ~= n9 or not fn4(v12.DisplayOrder, n9, 317750) then
		fn("J2_083")
		LPH_CRASH()
	end

	n19 = n30 + os.clock()
	local n33 = (v13._e4fa81e286c02bf6b556f92c - 151) / 20
	if false and (fn4(#getgenv().SCRIPT_KEY, n33, 317750) and (v13._e4fa81e286c02bf6b556f92c - 151) / 20 == #getgenv().SCRIPT_KEY) then
		return 0
	end

	if tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("ယ\u{C76}\u{992}ஙခউୖ") ~= (#getgenv().SCRIPT_KEY + n11 + n13 // 10000 + 1 + n12 // 10000 + 1 + n9 + v10 + v9 + attribute) / 100000 * 1000 * 0.2 // 1 or not fn4(tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("ယ\u{C76}\u{992}ஙခউୖ"), (part:GetAttribute("_e8ea3e91") + v9 + v10 + n9 + n12 // 10000 + 1 + n13 // 10000 + 1 + n11 + #getgenv().SCRIPT_KEY) / 100000 * 1000 * 0.2 // 1, 317750) or not fn4((#getgenv().SCRIPT_KEY + n11 + n13 // 10000 + 1 + n12 // 10000 + 1 + n9 + v10 + v9 + attribute) / 100000 * 1000 * 0.2 // 1, tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("ယ\u{C76}\u{992}ஙခউୖ"), 317750) then
		fn("J2_SOF")
		LPH_CRASH()
	end

	if bit32.bxor(bit32.bxor(2127028767, v9 % 4294967295), #getgenv().SCRIPT_KEY) ~= fn5(fn5(2127028767, v9 % 4294967295), #getgenv().SCRIPT_KEY) then
		return 0
	end
	n20 = n31 + 7
	v14 = bit32.bxor(v18, 7)
	n21 = n32 * 3 - 1
end

if not (v12.DisplayOrder == n9 or fn4(v12.DisplayOrder, n9, 317750)) then
	return 0
end

local n22 = 7774046 + v13._ec8fe2ebd679f92d820192f1 * 3

if bindableEvent:GetAttribute("_cce5992f6842") ~= n22 then
	fn("J2_129")
	LPH_CRASH()
end

local ec8fe2ebd679f92d820192f1 = v13._ec8fe2ebd679f92d820192f1

if false and (((v13._eed515e5f3af81405f035388 - 385) * 4 - (v13._f0b1bb247a648bfcdabac559 - -533) * -3) / 5 + ((v13._f0b1bb247a648bfcdabac559 - -533) * 2 - (v13._eed515e5f3af81405f035388 - 385) * -1) / 5 + (5 * (v13._c629ea669c28aad52c4a600f - -781) - 3 * (v13._1ce96b8f45f63448e1817363 - 625)) / 31 + ((v13._1ce96b8f45f63448e1817363 - 625) * 5 - (v13._c629ea669c28aad52c4a600f - -781) * -2) / 31 + n12 // 10000 + 1 + n13 // 10000 + 1 + (2553 + -2 * ((v13._eed515e5f3af81405f035388 - 385) * 4 - (v13._f0b1bb247a648bfcdabac559 - -533) * -3) / 5 - v13._d3bb9b60fccdfa04958d33a2) / -5 + #getgenv().SCRIPT_KEY) / 100000 * 1000 * 0.2 // 1 * 5 % 1198882 ~= ec8fe2ebd679f92d820192f1 then
	return 0
end

do
	local thread = coroutine.create(function()
		return 17
	end)

	if tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}") ~= n11 or not fn4(tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}"), n11, 317750) or not fn4(n11, tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}"), 317750) then
		fn("J2_180")
		LPH_CRASH()
	end

	local v15, v16 = coroutine.resume(thread)
	if not v15 or v16 ~= n20 then
		return
	end
end

if fn5(attribute % 4294967295, v9 % 4294967295, v10 % 4294967295, 3938219750) ~= bit32.bxor(attribute % 4294967295, v9 % 4294967295, v10 % 4294967295, 3938219750) then
	return
end

local n23

do
	local n24 = 0

	if not proxy or type(proxy) ~= "userdata" or rawequal(proxy, nil) then
		fn("J2_107")
		LPH_CRASH()
	end

	if not intValue or typeof(intValue) ~= "Instance" or intValue.ClassName ~= "IntValue" then
		fn("J2_D1")
		LPH_CRASH()
	end

	if not (v14 == fn5(fn5(fn5(fn5(1, 1), 5), 3), 7) and fn4(v14, 1, 317750) and v14 == 1) then
		return 0
	end
	local n25 = n24 + 1
	if not (fn4(n20, 17, 317750) and n20 == 17 and bit32.band(n20, 255) == 17 and n20 + 17 == 34 and n20 * 2 == 34 and n20 - 17 == 0) then
		return 0
	end
	local n26 = n25 + 1
	if not (17 == n20 and fn4(17, n20, 317750) and n20 % 4294967296 == 17 and fn6(n20, 31) == 17) then
		return 0
	end
	local n27 = n26 + 1
	local bxor2 = bit32.bxor
	if fn5(fn5(2945835765, attribute % 4294967295), n11 % 4294967295) ~= bxor2(bit32.bxor(2945835765, attribute % 4294967295), n11 % 4294967295) then
		return 0
	end
	local n28 = n27 + 1
	if not (bit32.bxor(bit32.bxor(2127028767, v9 % 4294967295), #getgenv().SCRIPT_KEY) == fn5(fn5(2127028767, v9 % 4294967295), #getgenv().SCRIPT_KEY) and fn4(bit32.bxor(bit32.bxor(2127028767, v9 % 4294967295), #getgenv().SCRIPT_KEY), bit32.bxor(bit32.bxor(2127028767, v9 % 4294967295), #getgenv().SCRIPT_KEY), 317750)) then
		return 0
	end
	local n29 = n28 + 1
	if fn5(792251988, v10 % 4294967295) ~= bit32.bxor(792251988, v10 % 4294967295) then
		return 0
	end
	local n30 = n19 - os.clock()
	local n31 = n29 + 1
	if not (n30 < 0 and n30 > -2 and n30 < 0 == true) then
		return 0
	end
	n23 = n31 + 1
end

if intValue.Name ~= (part:GetAttribute("_e8ea3e91") + v9 + v10 + n9 + n12 // 10000 + 1 + n13 // 10000 + 1 + n11 + #getgenv().SCRIPT_KEY) / 100000 * 1000 * 0.2 // 1 .. "" or not fn4(intValue.Name, (v9 + attribute + n12 // 10000 + 1 + #getgenv().SCRIPT_KEY + v10 + n13 // 10000 + 1 + n9 + n11) / 100000 * 1000 * 0.2 // 1 .. "", 317750) then
	fn("J2_055")
	LPH_CRASH()
end

local flag7
flag7 = false

if not (fn5(n20, 17) == 0 and fn6((-1 - n20) % 4294967296, 255) == 238) then
	return 0
end

if not (({ [7] = true })[n23] or ({ false, [8] = false, [4] = false, [0] = false, false, [5] = false, [6] = false, false })[n23]) then
	fn("J2_269")
	LPH_CRASH()
end

if not ({
	[0] = false,
	[14] = false,
	[3] = false,
	[32] = true,
	[9] = false,
	[33] = false,
	[7] = false,
	[22] = false,
	[24] = false,
	[4] = false,
	[8] = false,
	[15] = false,
	[12] = false,
	[11] = false,
	[16] = false,
	[31] = false,
	[6] = false,
	[48] = false,
})[n21] then
	fn("J2_061")
	LPH_CRASH()
end

if not (({ [39] = true })[n23 + n21] or ({
	[10] = false,
	[38] = false,
	[24] = false,
	[3] = false,
	[7] = false,
	[17] = false,
	[0] = false,
	[40] = false,
	[32] = false,
	[31] = false,
})[n23 + n21]) then
	fn("J2_018")
	LPH_CRASH()
end

if fn4(fn10({}, (1 - 2 * (8175579528 + 414355064 + 0) % 4294967296) * (1 + ((5138223202 + 472133098 + 3010160052) % 4294967296 * 67108864 + (7839598508 + 1439806792 + 3605496588) % 4294967296) / 4503599627370496) * 2 ^ ((4138025028 + 96212632 + 60730677) % 4294967296 - 1023)), "", (1 - 2 * (7037236912 + 1935479568 + 3912185408) % 4294967296) * (1 + ((3862704954 + 2424774342 + 2316690432) % 4294967296 * 67108864 + (7276110662 + 1313823930 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((4041566553 + 944240512 + 3604128568) % 4294967296 - 1023)) or fn4(fn10({}, 381604), " ", 317750) then
	fn("J2_MS16")
	LPH_CRASH()
end

if fn4(fn10({}, 381604), fn10({}, 381604), 317750) then
	fn("J2_035")
	LPH_CRASH()
end

if fn4(fn10({}, 381604), fn10({}, 381604), (1 - 2 * (3952781112 + 342186184 + 0) % 4294967296) * (1 + ((2929586048 + 4168806528 + 1505777152) % 4294967296 * 67108864 + (1648279388 + 2646687908 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((3944590779 + 3110319144 + 1535025710) % 4294967296 - 1023)) then
	fn("J2_159")
	LPH_CRASH()
end

local fn12

fn12 = function()
end

local function fn13()
end

if fn4(fn10(fn12, 381604), fn10(fn13, 381604), 317750) then
	fn("J2_CFE_D")
	LPH_CRASH()
end

if fn4(fn10(coroutine.create(function()
end), (1 - 2 * (7416649960 + 2003699498 + 3464552430) % 4294967296) * (1 + ((2832270648 + 3617201145 + 2171044559) % 4294967296 * 67108864 + (8589934592 + 8589934592) % 4294967296) / 4503599627370496) * 2 ^ ((4923671823 + 158788504 + 3507475306) % 4294967296 - 1023)), fn10(coroutine.create(function()
end), 381604), (1 - 2 * (6798229712 + 1791704880 + 0) % 4294967296) * (1 + ((2354192658 + 4184340718 + 2065636352) % 4294967296 * 67108864 + (3798516726 + 1765246394 + 7321138768) % 4294967296) / 4503599627370496) * 2 ^ ((5249818880 + 595967488 + 2744149265) % 4294967296 - 1023)) then
	fn("J2_CFM_D")
	LPH_CRASH()
end

tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:SetTeleportSetting("ယ\u{C76}\u{992}ஙခউୖ", 111)

if not fn4(tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("ယ\u{C76}\u{992}ஙခউୖ"), 111, 317750) then
	fn("J2_RV4")
	LPH_CRASH()
end

if part:GetAttribute("_24bb5bf6") ~= attribute % 999999 or not fn3(part:GetAttribute("_24bb5bf6"), attribute % 999999, 613993) then
	fn("J2_160")
	LPH_CRASH()
end

local flag8 = part:GetAttribute("_d1c0fc67") ~= v10 % 999999

if not flag8 then
	local attribute2 = part:GetAttribute("_d1c0fc67")
	local v15 = table.pack(65535)
	local n24 = (5004196854 + 4121147493 + bit32.band(65535 * v15[1] + bit32.lshift(bit32.band(4294836225 + 32767 * v15[1], 65535), 16), 4294967295) % 4294967296 + 1612073892) % 4294967296
	local v16 = table.pack(64494)
	flag8 = not fn4(attribute2, v10 % 999999, (1 - 2 * n24) * (1 + ((5186277976 + 3915422632 + 3797436416) % 4294967296 * 67108864 + (7418362488 + 1171572104 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((3901813528 + 3664258238 + bit32.band(65535 * v16[1] + bit32.lshift(bit32.band(4294836225 + 32767 * v16[1], 65535), 16), 4294967295) % 4294967296 + 1023862825) % 4294967296 - 1023))
end

if flag8 then
	fn("J2_MS07")
	LPH_CRASH()
end

if part:GetAttribute("_fca7580c") ~= n9 % 999999 or not fn4(part:GetAttribute("_fca7580c"), n9 % 999999, 317750) then
	fn("J2_084")
	LPH_CRASH()
end

if part:GetAttribute("_97bf9c4a") ~= bit32.bxor(n12 % 999999, n13 % 999999) or not fn4(part:GetAttribute("_97bf9c4a"), bit32.bxor(n12 % 999999, n13 % 999999), 317750) or fn4(part:GetAttribute("_97bf9c4a"), bit32.bxor(n12 % 999999, n13 % 999999), 317750) == false then
	fn("J2_201")
	LPH_CRASH()
end

if sound.Name ~= "_296341070dd7" .. n11 % 10000 or not fn4(sound.Name, "_296341070dd7" .. n11 % 10000, 317750) then
	fn("J2_075")
	LPH_CRASH()
end

if math.abs(sound.TimePosition - attribute % 1000 / 10) > 0.1 or not fn4(sound.TimePosition * 10 // 1, attribute % 1000, 317750) then
	fn("J2_112")
	LPH_CRASH()
end

do
	local teleportData

	repeat
		task.wait(0)
		teleportData = teleportOptions:GetTeleportData()
	until teleportData ~= nil

	if fn4(teleportData, nil, 317750) or not fn4(teleportData ~= nil, true, 317750) then
		fn("J2_033")
		LPH_CRASH()
	end

	if teleportData._aab243b91c04 ~= bit32.bxor(n12 % 999999, n11 % 999999) or not fn4(teleportData._aab243b91c04, bit32.bxor(n12 % 999999, n11 % 999999), 317750) then
		fn("J2_210")
		LPH_CRASH()
	end

	if (teleportData._c61bf283209a ~= bit32.bxor(bit32.bxor(attribute % 999999, v10 % 999999), n13 % 999999) or not fn4(teleportData._c61bf283209a, bit32.bxor(bit32.bxor(attribute % 999999, v10 % 999999), n13 % 999999), 317750) or fn4(teleportData._c61bf283209a, bit32.bxor(bit32.bxor(attribute % 999999, v10 % 999999), n13 % 999999), 317750) == false) ~= false then
		fn("J2_126")
		LPH_CRASH()
	end

	if (teleportData._7213ab2430e5 ~= tostring(n12 % 10000) .. tostring(n13 % 10000) or not fn4(teleportData._7213ab2430e5, tostring(n12 % 10000) .. tostring(n13 % 10000), 317750)) == true then
		fn("J2_143")
		LPH_CRASH()
	end

	if teleportData._fc2656845eed ~= v10 % 999999 or teleportData._0bb5b8129d8a ~= n9 % 999999 or not fn4(teleportData._fc2656845eed, v10 % 999999, 317750) or not fn4(teleportData._0bb5b8129d8a, n9 % 999999, 317750) then
		fn("J2_MS10")
		LPH_CRASH()
	end

	if (teleportData._6a246ed42fa2 ~= tostring(attribute % 999999) .. "_" .. tostring(v9 % 999999) or not fn4(teleportData._6a246ed42fa2, tostring(attribute % 999999) .. "_" .. tostring(v9 % 999999), 317750)) == true then
		fn("J2_012")
		LPH_CRASH()
	end

	local c580447280eb = teleportData._c580447280eb
	local flag9 = os.time() - c580447280eb > 60

	if not flag9 then
		local c580447280eb2 = teleportData._c580447280eb
		flag9 = not fn4(os.time() - c580447280eb2 > 60, false, 317750)
	end

	if flag9 then
		fn("J2_002")
		LPH_CRASH()
	end
end

if not fn4(debug.setmemorycategory("_mt0qn9wG" .. tostring((v10 % 690740 * 109 + 2042) % 690740)), "_mt0qn9wG" .. tostring((n11 % 690740 * 109 + 2042) % 690740), 317750) then
	fn("J2_147")
	LPH_CRASH()
end

do
	local n747c5b467d3651116e6cde93 = v13._747c5b467d3651116e6cde93
	local flag9 = type(n747c5b467d3651116e6cde93) == "string" and #n747c5b467d3651116e6cde93 == 32
	local n24 = -1

	if flag9 then
		n24 = 216613

		for i = 1, 32 do
			n24 = (n24 * 257 + n747c5b467d3651116e6cde93:byte(i)) % 1048573
		end
	end

	local n25 = (584600580 + bit32.bxor((2097152 + (v13._21d4aa286d7e96854cf5d3e4 - 17 * n11 % 1117171 + 63 * (n12 // 10000 + 1) % 1117171) % 1117171) % 4294967296, 3495817888) + bit32.bxor(n2 % 4294967296, 2933973557) + bit32.bxor((4194304 + n24) % 4294967296, 2372129226) + 1335278461) % 4294967296
	local n26 = n25 % 4294967296
	local v15 = table.pack(bit32.band(n26 + 3119837790, 4294967295))
	local v16 = table.pack(bit32.band(v15[1], 65535))
	local n27 = 3325537915 + bit32.band(7709 * v16[1] + bit32.lshift(bit32.band(7709 * bit32.rshift(v15[1], 16) + 62723 * v16[1], 65535), 16), 4294967295) % 4294967296
	local v17 = table.pack(bit32.band(bit32.bor(954481527, n26 + 3119837790), 4294967295))
	local v18 = table.pack(bit32.band(v17[1], 65535))
	local n28 = bit32.band(50118 * v18[1] + bit32.lshift(bit32.band(50118 * bit32.rshift(v17[1], 16) + 5625 * v18[1], 65535), 16), 4294967295) % 4294967296
	local v19 = table.pack(bit32.band(bit32.bxor(954481527, n26 + 3119837790), 4294967295))
	local v20 = table.pack(bit32.band(v19[1], 65535))
	local n29 = (n27 + n28 + bit32.band(7710 * v20[1] + bit32.lshift(bit32.band(7710 * bit32.rshift(v19[1], 16) + 62723 * v20[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n30 = n25 % 4294967296
	local v21 = table.pack(bit32.band(n30 + 2971193502, 4294967295))
	local v22 = table.pack(bit32.band(v21[1], 65535))
	local n31 = 2366109904 + bit32.band(11020 * v22[1] + bit32.lshift(bit32.band(11020 * bit32.rshift(v21[1], 16) + 15798 * v22[1], 65535), 16), 4294967295) % 4294967296
	local v23 = table.pack(bit32.band(bit32.band(805838268, n30 + 2971193502), 4294967295))
	local v24 = table.pack(bit32.band(v23[1], 65535))
	local n32 = bit32.band(43496 * v24[1] + bit32.lshift(bit32.band(43496 * bit32.rshift(v23[1], 16) + 33939 * v24[1], 65535), 16), 4294967295) % 4294967296
	local v25 = table.pack(bit32.band(bit32.bxor(805838268, n30 + 2971193502), 4294967295))
	local v26 = table.pack(bit32.band(v25[1], 65535))
	local n33 = (n31 + n32 + bit32.band(54517 * v26[1] + bit32.lshift(bit32.band(54517 * bit32.rshift(v25[1], 16) + 49737 * v26[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n34 = n25 % 4294967296
	local v27 = table.pack(bit32.band(n34 + 392741976, 4294967295))
	local v28 = table.pack(bit32.band(v27[1], 65535))
	local n35 = 1297871614 + bit32.band(64478 * v28[1] + bit32.lshift(bit32.band(64478 * bit32.rshift(v27[1], 16) + 17155 * v28[1], 65535), 16), 4294967295) % 4294967296
	local v29 = table.pack(bit32.band(bit32.bor(2547273073, n34 + 392741976), 4294967295))
	local v30 = table.pack(bit32.band(v29[1], 65535))
	local n36 = bit32.band(2116 * v30[1] + bit32.lshift(bit32.band(2116 * bit32.rshift(v29[1], 16) + 31224 * v30[1], 65535), 16), 4294967295) % 4294967296
	local v31 = table.pack(bit32.band(bit32.bxor(2547273073, n34 + 392741976), 4294967295))
	local v32 = table.pack(bit32.band(v31[1], 65535))
	local n37 = (n35 + n36 + bit32.band(64479 * v32[1] + bit32.lshift(bit32.band(64479 * bit32.rshift(v31[1], 16) + 17155 * v32[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n38 = n25 % 4294967296
	local v33 = table.pack(bit32.band(bit32.band(n38 + 2442040999, 276684736), 4294967295))
	local v34 = table.pack(bit32.band(v33[1], 65535))

	if n2 ~= (1 - 2 * n29) * (1 + (n37 * 67108864 + (4088595328 + n38 + 2442040999 + bit32.band(65534 * v34[1] + bit32.lshift(bit32.band(65534 * bit32.rshift(v33[1], 16) + 65535 * v34[1], 65535), 16), 4294967295) % 4294967296 + 4778024000) % 4294967296) / 4503599627370496) * 2 ^ (n33 - 1023) then
		fn("J2_046")
		LPH_CRASH()
	end
end

if n2 - 3400 ~= #tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") then
	fn("J2_117")
	LPH_CRASH()
end

if tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}") ~= n11 or not fn4(tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}"), n11, 317750) or not fn4(n11, tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("\u{9D9}ୋี\u{CF7}\u{C76}"), 317750) then
	fn("J2_CFM_S")
	LPH_CRASH()
end

if not ({
	[bit32.bxor(2072256, 306612, 57935, 213157)] = true,
	[0] = false,
	false,
	[57935] = false,
	[64758] = false,
	[18036] = false,
	[30451] = false,
})[fn5(n21 * 64758, n20 * 18036, v14 * 57935, n23 * 30451)] then
	fn("J2_222")
	LPH_CRASH()
end

do
	local n24 = (2942999909 + bit32.bxor((2097152 + (v13._1ee6134e48d0111e4ebb8e2a - 33 * v13._21d4aa286d7e96854cf5d3e4 % 894013 - 121 * v10 % 894013 - 109 * attribute % 894013) % 894013) % 4294967296, 3495817888) + bit32.bxor(n2 % 4294967296, 2933973557) + 2806283758) % 4294967296
	local n25 = n24 % 4294967296
	local v15 = table.pack(bit32.band(n25 + 3468691784, 4294967295))
	local v16 = table.pack(bit32.band(v15[1], 65535))
	local n26 = 1333811346 + bit32.band(12315 * v16[1] + bit32.lshift(bit32.band(12315 * bit32.rshift(v15[1], 16) + 33567 * v16[1], 65535), 16), 4294967295) % 4294967296
	local v17 = table.pack(bit32.band(bit32.band(n25 + 3468691784, 2764080854), 4294967295))
	local v18 = table.pack(bit32.band(v17[1], 65535))
	local n27 = bit32.band(53220 * v18[1] + bit32.lshift(bit32.band(53220 * bit32.rshift(v17[1], 16) + 31968 * v18[1], 65535), 16), 4294967295) % 4294967296
	local v19 = table.pack(bit32.band(bit32.bor(2764080854, n25 + 3468691784), 4294967295))
	local v20 = table.pack(bit32.band(v19[1], 65535))
	local n28 = (n26 + n27 + bit32.band(53222 * v20[1] + bit32.lshift(bit32.band(53222 * bit32.rshift(v19[1], 16) + 31968 * v20[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n29 = n24 % 4294967296
	local v21 = table.pack(bit32.band(n29 + 386257841, 4294967295))
	local v22 = table.pack(bit32.band(v21[1], 65535))
	local n30 = 3465964892 + bit32.band(53555 * v22[1] + bit32.lshift(bit32.band(53555 * bit32.rshift(v21[1], 16) + 39157 * v22[1], 65535), 16), 4294967295) % 4294967296
	local v23 = table.pack(bit32.band(bit32.band(3976615220, n29 + 386257841), 4294967295))
	local v24 = table.pack(bit32.band(v23[1], 65535))
	local n31 = bit32.band(11980 * v24[1] + bit32.lshift(bit32.band(11980 * bit32.rshift(v23[1], 16) + 26378 * v24[1], 65535), 16), 4294967295) % 4294967296
	local v25 = table.pack(bit32.band(bit32.bor(n29 + 386257841, 3976615220), 4294967295))
	local v26 = table.pack(bit32.band(v25[1], 65535))
	local n32 = (n30 + n31 + bit32.band(11982 * v26[1] + bit32.lshift(bit32.band(11982 * bit32.rshift(v25[1], 16) + 26378 * v26[1], 65535), 16), 4294967295) % 4294967296) % 4294967296
	local n33 = n24 % 4294967296
	local v27 = table.pack(bit32.band(n33 + 3922435977, 4294967295))
	local v28 = table.pack(bit32.band(v27[1], 65535))
	local n34 = 2744741527 + bit32.band(65535 * v28[1] + bit32.lshift(bit32.band(65535 * bit32.rshift(v27[1], 16) + 65535 * v28[1], 65535), 16), 4294967295) % 4294967296
	local v29 = table.pack(bit32.band(bit32.bor(3193036055, n33 + 3922435977), 4294967295))
	local v30 = table.pack(bit32.band(v29[1], 65535))
	local n35 = (n34 + bit32.band(2 * v30[1] + bit32.lshift(bit32.band(2 * bit32.rshift(v29[1], 16) + 0 * v30[1], 65535), 16), 4294967295) % 4294967296 + 2652157010) % 4294967296
	local n36 = n24 % 4294967296
	local v31 = table.pack(bit32.band(n36 + 171090213, 4294967295))
	local v32 = table.pack(bit32.band(v31[1], 65535))
	local n37 = 3877869060 + bit32.band(5100 * v32[1] + bit32.lshift(bit32.band(5100 * bit32.rshift(v31[1], 16) + 15956 * v32[1], 65535), 16), 4294967295) % 4294967296
	local v33 = table.pack(bit32.band(bit32.band(n36 + 171090213, 3761446579), 4294967295))
	local v34 = table.pack(bit32.band(v33[1], 65535))
	local n38 = bit32.band(55336 * v34[1] + bit32.lshift(bit32.band(55336 * bit32.rshift(v33[1], 16) + 33623 * v34[1], 65535), 16), 4294967295) % 4294967296
	local v35 = table.pack(bit32.band(bit32.bxor(3761446579, n36 + 171090213), 4294967295))
	local v36 = table.pack(bit32.band(v35[1], 65535))

	if n2 ~= (1 - 2 * n28) * (1 + (n35 * 67108864 + (n37 + n38 + bit32.band(60437 * v36[1] + bit32.lshift(bit32.band(60437 * bit32.rshift(v35[1], 16) + 49579 * v36[1], 65535), 16), 4294967295) % 4294967296) % 4294967296) / 4503599627370496) * 2 ^ (n32 - 1023) then
		fn("J2_172")
		LPH_CRASH()
	end
end

if fn4(1, 2, 317750, tbl2) ~= tbl3 then
	fn("J2_176")
	LPH_CRASH()
end

local v15 = table.pack(52095)

if fn3(1, 2, (1 - 2 * (6068802912 + 2521131680 + 0) % 4294967296) * (1 + ((5806297060 + 1314860529 + bit32.band(65535 * v15[1] + bit32.lshift(bit32.band(4283367600 + 32767 * v15[1], 65535), 16), 4294967295) % 4294967296 + 3616260650) % 4294967296 * 67108864 + (2415086528 + 246080896 + 1633799872) % 4294967296) / 4503599627370496) * 2 ^ ((5197614190 + 1174531752 + 2217789692) % 4294967296 - 1023), tbl2) ~= tbl3 then
	fn("J2_CFE_S")
	LPH_CRASH()
end

if fn3(1, 1, 613993) ~= true then
	fn("J2_208")
	LPH_CRASH()
end

if fn4(0, 1, 317750) ~= false then
	fn("J2_176")
	LPH_CRASH()
end

if fn4(1, 1, 317750) ~= true then
	fn("J2_010")
	LPH_CRASH()
end

if fn4(1, 1, 317750) ~= true ~= false then
	fn("J2_015")
	LPH_CRASH()
end

if fn4(0, 1, 317750) ~= false then
	fn("J2_MS09")
	LPH_CRASH()
end

if fn3(0, 1, 613993) ~= false ~= false then
	fn("J2_CFE_S")
	LPH_CRASH()
end

if n2 ~= 5891 then
	fn("J2_101")
	LPH_CRASH()
end

if #tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("።ಘ૿ාॼ") ~= 2521 then
	fn("J2_MS06")
	LPH_CRASH()
end

flag2 = false

do
	local v16 = tostring
	local bxor2 = bit32.bxor

	if tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_ozKMvmkR3l0FxcP") ~= v16(bxor2(bit32.bxor(n16, v9, n11), bit32.bxor(attribute, 3201224939, n9), bit32.bxor(n13, n12, v10))) and not identifyexecutor():match("^Synapse") then
		fn("J2_049")
		LPH_CRASH()
	end
end

local bxor2 = bit32.bxor
tbl._b3e05ec6c78c:SetItem(tbl._7a53828b9027, tostring(bit32.bxor(bit32.bxor(3201201900, v9, attribute), bit32.bxor(n13, n9, n16), bxor2(n11, v10, n12))))
local flag9 = not tbl._b3e05ec6c78c:HasItem(tbl._7a53828b9027)

if not flag9 then
	local v16 = tostring
	local bxor3 = bit32.bxor
	flag9 = tbl._b3e05ec6c78c:GetItem(tbl._7a53828b9027, "_h4hwiqE4LFRq0Ai") ~= v16(bxor3(bit32.bxor(3201201900, v9, attribute), bit32.bxor(n13, n9, n16), bit32.bxor(n11, v10, n12)))
end

if flag9 and not identifyexecutor():match("^Synapse") then
	fn("J2_EQP2")
	LPH_CRASH()
end

if false then
	if restorefunction then
		pcall(restorefunction, request)
	end

	local value = 0
	debug.setmemorycategory("_6cc3aacb23c4_" .. "b6lD/" .. "ya2e~" .. tostring(205))
	local bindableEvent2 = Instance.new("BindableEvent")
	bindableEvent2:SetAttribute("_1208e31f44d4", 0)
	bindableEvent2:SetAttribute("_a2b8704f6e60", 0)
	bindableEvent2:SetAttribute("_1cb87fade2d2", false)
	bindableEvent2:SetAttribute("_a978855c24de", false)
	local flag10 = false
	local configuration = Instance.new("Configuration")
	local numberValue = Instance.new("NumberValue", configuration)
	numberValue.Name = "_ade90ac6ff52"
	numberValue.Value = 0
	local boolValue = Instance.new("BoolValue", configuration)
	boolValue.Name = "_77493ed6dd89"
	boolValue.Value = false
	local boolValue2 = Instance.new("BoolValue", configuration)
	boolValue2.Name = "_94eb07bb0dcb"
	boolValue2.Value = false
	local numberValue2 = Instance.new("NumberValue", configuration)
	numberValue2.Name = "_2aa779205244"
	numberValue2.Value = 0

	task.spawn(function()
		flag10 = true
		bindableEvent2:SetAttribute("_a978855c24de", true)
		boolValue.Value = true
		local n24 = ((4 * (v13._eed515e5f3af81405f035388 - 385) + 3 * (v13._f0b1bb247a648bfcdabac559 - -533)) / 5 + (2 * (v13._f0b1bb247a648bfcdabac559 - -533) + 1 * (v13._eed515e5f3af81405f035388 - 385)) / 5 + (5 * (v13._c629ea669c28aad52c4a600f - -781) + -3 * (v13._1ce96b8f45f63448e1817363 - 625)) / 31 + (5 * (v13._1ce96b8f45f63448e1817363 - 625) + 2 * (v13._c629ea669c28aad52c4a600f - -781)) / 31 + n12 // 10000 + 1 + n13 // 10000 + 1 + (v13._d3bb9b60fccdfa04958d33a2 - -2 * (4 * (v13._eed515e5f3af81405f035388 - 385) - -3 * (v13._f0b1bb247a648bfcdabac559 - -533)) / 5 - 2553) / 5 + #getgenv().SCRIPT_KEY) * 0.2 // 1

		if type(n24) ~= "number" or not rawequal(n24, n24) or n24 * 0 ~= 0 then
			fn("J2_089")
			LPH_CRASH()
		end

		if n24 + 0 ~= n24 or n24 // 1 ~= n24 or n24 - n24 ~= 0 then
			fn("J2_089")
			LPH_CRASH()
		end

		if not tostring(n24):match("^%-?%d+$") then
			fn("J2_100C")
			LPH_CRASH()
		end

		if (n24 < 0 or n24 > 99999999) == true then
			fn("J2_073")
			LPH_CRASH()
		end

		if n24 % 1 ~= 0 == true then
			fn("J2_073")
			LPH_CRASH()
		end

		local tbl5 = {
			{ 162, 194, 246, 27, 108, 178, 122, 37, 207, 35, 30, 247, 89, 69, 223, 88 },
			{ 172, 248, 163, 102, 13, 140, 222, 47, 211, 25, 49, 82, 210, 184, 114, 238 },
			{ 93, 97, 71, 131, 145, 170, 167, 129, 144, 61, 135, 1, 201, 103, 117, 38 },
			{ 216, 60, 50, 8, 32, 231, 250, 29, 123, 205, 241, 187, 158, 39, 245, 240 },
			{ 136, 128, 150, 53, 180, 19, 195, 78, 90, 235, 40, 221, 151, 176, 0, 191 },
			{ 208, 134, 92, 203, 33, 77, 85, 73, 185, 96, 149, 200, 31, 75, 179, 243 },
			{ 54, 12, 154, 253, 84, 153, 42, 28, 146, 190, 104, 169, 87, 67, 36, 148 },
			{ 230, 64, 209, 21, 142, 232, 55, 72, 20, 156, 48, 220, 119, 157, 44, 234 },
			{ 22, 173, 110, 2, 56, 126, 175, 133, 76, 116, 242, 214, 236, 193, 181, 182 },
			{ 206, 251, 152, 218, 5, 160, 91, 34, 255, 83, 166, 227, 197, 11, 124, 244 },
			{ 159, 233, 62, 143, 213, 3, 155, 168, 57, 252, 18, 224, 51, 165, 14, 109 },
			{ 4, 183, 79, 26, 164, 24, 171, 101, 98, 80, 115, 212, 130, 95, 46, 17 },
			{ 254, 118, 186, 120, 105, 219, 237, 188, 125, 94, 99, 204, 228, 217, 113, 106 },
			{ 58, 189, 249, 215, 121, 59, 68, 137, 225, 43, 63, 127, 107, 198, 199, 10 },
			{ 52, 6, 70, 147, 177, 174, 132, 15, 65, 81, 138, 41, 141, 66, 74, 86 },
			{ 229, 100, 45, 139, 192, 161, 239, 23, 202, 16, 9, 112, 226, 111, 7, 196 },
		}

		local tbl6 = {
			e = 0,
			["2"] = 1,
			["3"] = 2,
			a = 3,
			["0"] = 4,
			["1"] = 5,
			d = 6,
			["7"] = 7,
			["6"] = 8,
			b = 9,
			["4"] = 10,
			["5"] = 11,
			c = 12,
			["9"] = 13,
			f = 14,
			["8"] = 15,
		}

		local tbl7 = {}

		for i = 0, 15 do
			local v16 = table.create(16)

			for i2 = 0, 15 do
				local n25 = 0
				local n26 = 1
				local n27 = i
				local n28 = i2

				for i3 = 0, 3 do
					local n29 = n27 % 2
					local n30 = n28 % 2

					if n29 ~= n30 then
						n25 += n26
					end

					n27 = (n27 - n29) / 2
					n28 = (n28 - n30) / 2
					n26 *= 2
				end

				v16[i2] = n25
			end

			tbl7[i] = v16
		end

		local function fn14(arg, arg2)
			return tbl7[arg // 16][arg2 // 16] * 16 + tbl7[arg % 16][arg2 % 16]
		end

		debug.setmemorycategory("_6cc3aacb23c4_" .. "xHrq/" .. "ya2e~" .. tostring(205))
		local scriptKey = getgenv().SCRIPT_KEY
		local str5 = scriptKey .. "34704"
		local tbl8 = {}
		local v16 = bit32.bxor(2752786650, attribute % 4294967295)
		tbl8[tbl8] = v16
		local str6 = tostring({})
		local str7 = tostring({})

		if str6 == str7 or fn4(str6, str7, 317750) then
			fn("J2_157")
			LPH_CRASH()
		end

		local now2 = os.clock()
		local proxy2 = newproxy(false)
		local v17 = bit32.bxor(4000118914, v10 % 4294967295)
		getfenv()[proxy2] = v17
		local now3 = os.time()
		local tbl9 = {}
		local tbl10 = {}
		local tbl11 = {}

		for i = 1, 11 do
			local tbl12 = {}
			local tbl13 = {}
			tbl9[tbl12] = tbl13
			tbl10[tbl13] = i
			tbl11[tbl12] = tbl13
		end

		local n25 = 0
		local n26 = 0
		local n27 = 0

		for k, v18 in next, tbl9, nil do
			local v19 = tbl10[v18]

			if tbl11[k] == v18 then
				n25 += 1
			end

			n26 += 1
			n27 = (n27 * 127 + v19 * 37 + n26 + 51) % 2147483629
		end

		if n25 ~= 11 then
			fn("J2_198")
			LPH_CRASH()
		end

		local v18

		if not (#str5 > 64) then
			v18 = str5
		else
			v18 = fn9(str5)
		end

		if #v18 < 64 then
			v18 ..= string.rep("\0", 64 - #v18)
		end

		local v19 = table.create(64)
		local v20 = table.create(64)

		for i = 1, 64, 2 do
			local v21 = v18:byte(i)
			v19[i] = string.char(v6(v21, 54))
			v20[i] = string.char(v6(v21, 92))

			if i < 64 then
				local v22 = v18:byte(i + 1)
				v19[i + 1] = string.char(v6(v22, 54))
				v20[i + 1] = string.char(v6(v22, 92))
			end
		end

		local str8 = table.concat(v19)
		local str9 = table.concat(v20)
		local v21 = fn9
		local n3a755ae3a5888094a5845261 = v13._3a755ae3a5888094a5845261
		local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
		local placeId = game.PlaceId
		local jobId = game.JobId
		local gameId = game.GameId
		local v22 = game
		local v23 = fn9(str9 .. v21(str8 .. "{\"_e0f0390234ae48bfc1177d23\":\"" .. n3a755ae3a5888094a5845261 .. "\"" .. ",\"_501c70497382ade02be03871\":\"" .. RbxAnalyticsService:GetClientId() .. "\"" .. ",\"_7d45c68205c25e6cdf10dab8\":\"" .. scriptKey .. "\"" .. ",\"_66f5c068e2d0276379124504\":\"" .. n24 .. "\"" .. ",\"_29fa0c93707b34992e067040\":\"" .. placeId .. "\"" .. ",\"_1df6b2b38a351ec9d5c04083\":\"" .. "b7cc65a0ea91b9f83e1358d6" .. "\"" .. ",\"_19f0675850ac491919cfb707\":\"" .. jobId .. "\"" .. ",\"_b526a62af59ff3326e5d8840\":\"" .. gameId .. "\"" .. ",\"_b306c36ca75e47749210d03b\":\"" .. game:GetService("Players").LocalPlayer.Name .. "\"" .. ",\"_c86ba63ece52556c276bd9d0\":\"" .. v22:GetService("Players").LocalPlayer.UserId .. "\",\"_1593400442df464e41e19626\":\"34704\"}"))
		local str10 = ""

		for i = 1, #v23 do
			local v24 = string.byte(v23, i)
			str10 ..= ("0123456789abcdef"):sub(v24 // 16 + 1, v24 // 16 + 1) .. ("0123456789abcdef"):sub(v24 % 16 + 1, v24 % 16 + 1)
		end

		if bindableEvent:GetAttribute("_205d98893831") ~= 10511 + (v13._ee0f3e929e5b670b5da9a93b and 39376 or 0) ~= false then
			fn("J2_103")
			LPH_CRASH()
		end

		if not fn3(tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("ૢ၆ඳမዙ"), 5230307 - (v13._f719d9d304500667d70ed869 and 0 or 26644), 613993) then
			fn("J2_192")
			LPH_CRASH()
		end

		if not fn3(tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("ဈඟ၉๔ଇွ"), v13._ee0f3e929e5b670b5da9a93b and 1028368 or 1026379, 613993) then
			fn("J2_047")
			LPH_CRASH()
		end

		local flag11 = not (bindableEvent:GetAttribute("_c0e37f210b72") ~= 2030555 + (v13._d46878ac2c396a0c65ef5205 and 34026 or 0))

		if flag11 then
			flag11 = fn3(2030555 + (v13._d46878ac2c396a0c65ef5205 and 34026 or 0), bindableEvent:GetAttribute("_c0e37f210b72"), 613993)
		end

		if flag11 ~= true then
			fn("J2_MS23")
			LPH_CRASH()
		end

		if bindableEvent:GetAttribute("_ba7552d1a54b") ~= (v13._0e747abf4734a5bc5eb78668 or "") == true then
			fn("J2_170")
			LPH_CRASH()
		end

		if not fn3(tbl["௹ចං\u{EEE}ॣುળಚౣ\u{BD1}"]:GetTeleportSetting("ૺભጠ\u{BBD}ಾ"), not v13._d46878ac2c396a0c65ef5205 and 3092706 or 3109290, 613993) == true then
			fn("J2_189")
			LPH_CRASH()
		end

		local flag12 = bindableEvent:GetAttribute("_70a0d471e23d") ~= (not v13._f719d9d304500667d70ed869 and 4117574 or 4121927)

		if not flag12 then
			flag12 = not fn3(not v13._f719d9d304500667d70ed869 and 4117574 or 4121927, bindableEvent:GetAttribute("_70a0d471e23d"), 613993)
		end

		if flag12 then
			fn("J2_152")
			LPH_CRASH()
		end

		local n28 = v9 + 7290
		local n29 = v10 + 7105
		local n30 = n11 * 4 + 939
		local bindableEvent3 = Instance.new("BindableEvent")
		bindableEvent3:SetAttribute("_2e8931a7ebb6", n30)
		local str11 = "{\"_b306c36ca75e47749210d03b\":" .. v5(game:GetService("Players").LocalPlayer.Name) .. ",\"_7d45c68205c25e6cdf10dab8\":" .. v5(scriptKey) .. ",\"_29fa0c93707b34992e067040\":" .. v5(game.PlaceId .. "") .. ",\"_c86ba63ece52556c276bd9d0\":" .. v5(game:GetService("Players").LocalPlayer.UserId .. "") .. ",\"_cb4b92b5db72bc61b544dd69\":" .. (n30 .. "") .. ",\"_501c70497382ade02be03871\":" .. v5(game:GetService("RbxAnalyticsService"):GetClientId()) .. ",\"_1593400442df464e41e19626\":" .. v5("34704") .. ",\"_90f1870c126002b58c6e1bf4\":" .. v5(str10) .. ",\"_1df6b2b38a351ec9d5c04083\":" .. v5("b7cc65a0ea91b9f83e1358d6") .. ",\"_97ba245aecff5cc1c633eb61\":" .. (n28 .. "") .. ",\"_66f5c068e2d0276379124504\":" .. v5(n24 .. "") .. ",\"_b526a62af59ff3326e5d8840\":" .. v5(game.GameId .. "") .. ",\"_19f0675850ac491919cfb707\":" .. v5(game.JobId .. "") .. ",\"_7eb2bc9573fd4a6f7a850ae1\":" .. (n29 .. "") .. ",\"_e0f0390234ae48bfc1177d23\":" .. v5(v13._3a755ae3a5888094a5845261) .. "}"
		local tbl12 = {}

		for i = 1, #str11 do
			local v24 = string.byte(str11, i)
			local v25 = tbl5[v24 // 16 + 1][v24 % 16 + 1]
			tbl12[#tbl12 + 1] = ("e23a01d76b45c9f8"):sub(v25 // 16 + 1, v25 // 16 + 1)
			tbl12[#tbl12 + 1] = ("e23a01d76b45c9f8"):sub(v25 % 16 + 1, v25 % 16 + 1)
		end

		local ok, result = pcall(request, {
			Url = "https://heartbeat.jnkie.com/api/heartbeat/v4/init",
			Headers = { ["Content-Type"] = "text/plain" },
			Body = "v4.34704.2f8bc7dfb9553de165ee6a9c." .. table.concat(tbl12),
			Method = "POST",
		})

		local flag13 = ok and type(result) == "table" and type(result.Body) == "string" and result.StatusCode ~= 200 and #result.Body <= 4096
		local v24 = nil

		if flag13 then
			v24 = string.match(result.Body, "\"message\"%s*:%s*\"([^\"]*)\"")
			local flag14 = type(v24) == "string" and #v24 >= 10 and #v24 <= 240 and not string.find(v24, "%c") and not string.find(v24, "\\", 1, true)
			local v25 = nil

			if not flag14 then
				v24 = v25
			end
		end

		if not ok or type(result) ~= "table" or type(result.Body) ~= "string" or result.StatusCode ~= 200 or #result.Body == 0 or #result.Body % 2 ~= 0 or #result.Body > 262144 then
			fn("J2_102", v24 or "The protected session could not be initialized. Please restart and try again.")
			LPH_CRASH()
		end

		local function fn15(arg, arg2, arg3)
			if arg3 ~= 954770 or not rawequal(arg3, 954770) or type(arg3) ~= "number" then
				fn("J2_081")
				LPH_CRASH()
			end

			local v25 = fn9(arg2)
			local str12 = fn9(arg2 .. "cipher_nonce"):sub(1, 12)
			local str13 = ""

			for i = 1, #arg, 2 do
				local v26 = tbl6[arg:sub(i, i)]
				local v27 = tbl6[arg:sub(i + 1, i + 1)]

				if v26 ~= nil and v27 ~= nil then
					str13 ..= string.char(v26 * 16 + v27)
				end
			end

			if not (#str13 == #arg // 2) then
				return nil
			end
			local ok2, result2 = pcall(fn7, str13, v25, str12, 1)
			if not ok2 or type(result2) ~= "string" then
				return nil
			end
			local ok3, result3 = pcall(v4, result2)
			if not ok3 then
				return nil
			end
			return result3
		end

		local body = result.Body
		local v25 = table.pack(64493)
		local v26 = fn15(body, str5, (1 - 2 * (5467293169 + 694927302 + 6722681417) % 4294967296) * (1 + ((5357993474 + 2023814910 + 1263227904) % 4294967296 * 67108864 + (1495870182 + 2799097114 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((4965199743 + 2147483648 + bit32.band(65535 * v25[1] + bit32.lshift(bit32.band(4294836225 + 32767 * v25[1], 65535), 16), 4294967295) % 4294967296 + 3624734848) % 4294967296 - 1023))

		if not v26 == true then
			fn("J2_013")
			LPH_CRASH()
		end

		if not v26._dd3bcf3449f1329e3fe7e6dd then
			fn("J2_SOF7")
			LPH_CRASH()
		end

		if type(v26._82245283ce79a0f584076eee) ~= "string" then
			fn("J2_MS03")
			LPH_CRASH()
		end

		if #v26._82245283ce79a0f584076eee < 8 == true then
			fn("J2_MS03")
			LPH_CRASH()
		end

		if type(v26._c2f0fd7f307f0f25b71d9e28) ~= "string" then
			fn("J2_068")
			LPH_CRASH()
		end

		if #v26._c2f0fd7f307f0f25b71d9e28 < 8 then
			fn("J2_068")
			LPH_CRASH()
		end

		if type(v26._acf7457b721522dd26f35e8d) ~= "number" == true then
			fn("J2_099")
			LPH_CRASH()
		end

		if v26._acf7457b721522dd26f35e8d < 5 then
			fn("J2_099")
			LPH_CRASH()
		end

		if v26._acf7457b721522dd26f35e8d > 300 then
			fn("J2_099")
			LPH_CRASH()
		end

		if type(v26._3b552ae6736e933fdbb084d2) ~= "table" then
			fn("J2_213")
			LPH_CRASH()
		end

		if #v26._3b552ae6736e933fdbb084d2 ~= 3 == true then
			fn("J2_213")
			LPH_CRASH()
		end

		for i = 1, 3 do
			if not (not (type(v26._3b552ae6736e933fdbb084d2[i]) ~= "table") and not (#v26._3b552ae6736e933fdbb084d2[i] ~= 2)) then
				fn("J2_054")
				LPH_CRASH()
			end

			if (type(v26._3b552ae6736e933fdbb084d2[i][1]) ~= "number" or type(v26._3b552ae6736e933fdbb084d2[i][2]) ~= "number") == true then
				fn("J2_062")
				LPH_CRASH()
			end
		end

		local n3b552ae6736e933fdbb084d2 = v26._3b552ae6736e933fdbb084d2
		v26._3b552ae6736e933fdbb084d2 = { { n3b552ae6736e933fdbb084d2[2][1], n3b552ae6736e933fdbb084d2[2][2] }, { n3b552ae6736e933fdbb084d2[1][2], n3b552ae6736e933fdbb084d2[1][1] }, { n3b552ae6736e933fdbb084d2[3][1], n3b552ae6736e933fdbb084d2[3][2] } }

		if v26._5aa4a72b4c54e99bb9f4ed92 ~= n29 * 4 + -533 + n30 * -1 then
			fn("J2_197")
			LPH_CRASH()
		end

		if not (not (v26._0bed6f7224dc4c9e57d5df57 ~= n30 * 5 + -781 + 3 * n28) and fn3(v26._0bed6f7224dc4c9e57d5df57, n30 * 5 + -781 + 3 * n28, 613993)) then
			fn("J2_215")
			LPH_CRASH()
		end

		if not fn3(n30, bindableEvent3:GetAttribute("_2e8931a7ebb6"), 613993) then
			fn("J2_MS02")
			LPH_CRASH()
		end

		if v26._0a72bd987caadc892c1e6a2e ~= -3 * n29 + 385 + 2 * n28 == true then
			fn("J2_125")
			LPH_CRASH()
		end

		if os.clock() - now2 > 45 == true then
			fn("J2_108")
			LPH_CRASH()
		end

		if tbl8[tbl8] ~= v16 then
			fn("J2_177")
			LPH_CRASH()
		end

		if getfenv()[proxy2] ~= v17 then
			fn("J2_056")
			LPH_CRASH()
		end

		local now4 = os.time()

		if now4 < now3 then
			fn("J2_EQP1")
			LPH_CRASH()
		end

		if now4 - now3 > 60 then
			fn("J2_109")
			LPH_CRASH()
		end

		local n82245283ce79a0f584076eee = v26._82245283ce79a0f584076eee
		local c2f0fd7f307f0f25b71d9e28 = v26._c2f0fd7f307f0f25b71d9e28
		local n3b552ae6736e933fdbb084d22 = v26._3b552ae6736e933fdbb084d2

		local tbl13 = {
			385 + -3 * n3b552ae6736e933fdbb084d22[1][2] + n3b552ae6736e933fdbb084d22[1][1] * 2,
			4 * n3b552ae6736e933fdbb084d22[2][1] + -1 * n3b552ae6736e933fdbb084d22[2][2] + -533,
			n3b552ae6736e933fdbb084d22[3][2] * 3 + -781 + 5 * n3b552ae6736e933fdbb084d22[3][1],
		}

		if type(v26._cdcccf3dbc3146aa0cf16ff4) == "number" then
			fc3c5cb58bdba857e0aa5190 = v26._cdcccf3dbc3146aa0cf16ff4
		end

		if type(v26._b3ed568979fb394b83e7d1dc) == "number" then
			n2d669ad54f500e563a8ddc2b = v26._b3ed568979fb394b83e7d1dc
		end

		if type(v26._c0b8d3db1daa20286b434719) == "number" then
			fe65b2bfdae03b049f406e1a = v26._c0b8d3db1daa20286b434719
		end

		if type(v26._34f6398f50cd8ba4592e4959) == "number" then
			n6f6128df9fcb67717c6fbb1f = v26._34f6398f50cd8ba4592e4959
		end

		if type(v26._480d484c2b1a09deeecd2eeb) == "number" then
			n55ec1ef4ab8ed1d39ad2003a = v26._480d484c2b1a09deeecd2eeb
		end

		if type(v26._b38021e33d9b751125de762a) == "number" then
			n8384f199148c3b3f3d08d03a = v26._b38021e33d9b751125de762a
		end

		if type(v26._45f625ac9d4a694f56c9d2e8) == "table" then
			tbl4 = v26._45f625ac9d4a694f56c9d2e8
		end

		flag7 = true
		bindableEvent2:SetAttribute("_1cb87fade2d2", true)
		boolValue2.Value = true
		debug.setmemorycategory("_6cc3aacb23c4_" .. ((flag10 and "xHrq" or "b6lD") .. "/") .. ((flag7 and "1jP4" or "ya2e") .. "~") .. tostring((value * 91 + 205) % 256))

		if bindableEvent2:GetAttribute("_a978855c24de") ~= flag10 then
			fn("J2_038")
			LPH_CRASH()
		end

		if bindableEvent2:GetAttribute("_1cb87fade2d2") ~= flag7 then
			fn("J2_RV1")
			LPH_CRASH()
		end

		if bindableEvent2:GetAttribute("_a2b8704f6e60") ~= value then
			fn("J2_RV3")
			LPH_CRASH()
		end

		if boolValue.Value ~= flag10 then
			fn("J2_RVP3")
			LPH_CRASH()
		end

		if boolValue2.Value ~= flag7 then
			fn("J2_030")
			LPH_CRASH()
		end

		if numberValue.Value ~= value == true then
			fn("J2_191")
			LPH_CRASH()
		end

		if bindableEvent2:GetAttribute("_1208e31f44d4") ~= 0 or not fn3(bindableEvent2:GetAttribute("_1208e31f44d4"), 0, 613993) then
			fn("J2_SOF2")
			LPH_CRASH()
		end

		if numberValue2.Value ~= 0 or not fn3(numberValue2.Value, 0, 613993) then
			fn("J2_185")
			LPH_CRASH()
		end

		local str12 = "_6cc3aacb23c4_" .. ((flag10 and "xHrq" or "b6lD") .. "/") .. ((flag7 and "1jP4" or "ya2e") .. "~") .. tostring((value * 91 + 205) % 256)

		if debug.getmemorycategory() ~= str12 then
			fn("J2_114")
			LPH_CRASH()
		end

		local now5 = os.clock()
		local n31 = 4294967296

		local function fn16(arg, arg2)
			if arg2 > 31 or arg2 < -31 then
				return 0
			end

			if arg2 < 0 then
				return arg * 2 ^ (-arg2) % n31
			end
			return arg % n31 // 2 ^ arg2
		end

		local function fn17(arg, arg2)
			if arg2 > 31 or arg2 < -31 then
				return 0
			end

			if arg2 < 0 then
				return fn16(arg, -arg2)
			end
			return arg * 2 ^ arg2 % n31
		end

		local function fn18(arg, arg2)
			local n32 = arg % n31
			local n33 = arg2 % 32
			return (fn17(n32, n33) + fn16(n32, 32 - n33)) % n31
		end

		local function fn19(arg, arg2)
			local n32 = arg % n31
			local n33 = arg2 % n31
			local n34 = 0
			local n35 = 1

			for i = 0, 31 do
				local n36 = n32 % 2
				local n37 = n33 % 2

				if n36 ~= n37 then
					n34 += n35
				end

				n32 = (n32 - n36) / 2
				n33 = (n33 - n37) / 2
				n35 *= 2
			end

			return n34
		end

		bindableEvent2:SetAttribute("_1208e31f44d4", 0)
		numberValue2.Value = 0
		local str13 = n82245283ce79a0f584076eee .. scriptKey
		local flag14 = false
		local value2 = 0
		local tbl14 = nil
		local n32 = 0
		local n33 = 1

		while false do
			if not flag14 then
				local now6 = os.clock()

				repeat
					heartbeat:Wait()
				until os.clock() - now6 >= 60
			end

			local now6 = os.clock()
			local n34 = now6 - now5

			if n34 < 5 or n34 > 300 then
				fn("J2_MS13")
				LPH_CRASH()
			end

			if getfenv()[proxy2] ~= v17 then
				fn("J2_156")
				LPH_CRASH()
			end

			if tostring({}) == tostring({}) == true then
				fn("J2_HP3")
				LPH_CRASH()
			end

			if not (not (tbl8[tbl8] ~= v16) and fn4(tbl8[tbl8], v16, 317750)) then
				fn("J2_HB_REQ")
				LPH_CRASH()
			end

			if n2 < 5751 then
				fn("J2_051")
				LPH_CRASH()
			end

			local n35 = 0
			local n36 = 0
			local n37 = 0

			for k, v27 in next, tbl9, nil do
				local v28 = tbl10[v27]

				if tbl11[k] == v27 then
					n35 += 1
				end

				n36 += 1
				n37 = (n37 * 127 + v28 * 37 + n36 + 51) % 2147483629
			end

			if n35 ~= 11 or n37 ~= n27 then
				fn("J2_MS18")
				LPH_CRASH()
			end

			local now7 = os.time()

			if now7 < now3 then
				fn("J2_MS01")
				LPH_CRASH()
			end

			if bindableEvent2:GetAttribute("_a2b8704f6e60") ~= value ~= false then
				fn("J2_111")
				LPH_CRASH()
			end

			if bindableEvent2:GetAttribute("_a978855c24de") ~= flag10 ~= false then
				fn("J2_095")
				LPH_CRASH()
			end

			if boolValue.Value ~= flag10 or not fn3(boolValue.Value, flag10, 613993) then
				fn("J2_077")
				LPH_CRASH()
			end

			if not (not (bindableEvent2:GetAttribute("_1208e31f44d4") ~= value2) and fn3(bindableEvent2:GetAttribute("_1208e31f44d4"), value2, 613993)) then
				fn("J2_058")
				LPH_CRASH()
			end

			if numberValue.Value ~= value ~= false then
				fn("J2_076")
				LPH_CRASH()
			end

			if boolValue2.Value ~= flag7 then
				fn("J2_SOF5")
				LPH_CRASH()
			end

			if bindableEvent2:GetAttribute("_1cb87fade2d2") ~= flag7 then
				fn("J2_009")
				LPH_CRASH()
			end

			if numberValue2.Value ~= value2 or not fn3(numberValue2.Value, value2, 613993) then
				fn("J2_063")
				LPH_CRASH()
			end

			local str14 = "_6cc3aacb23c4_" .. ((flag10 and "xHrq" or "b6lD") .. "/") .. ((flag7 and "1jP4" or "ya2e") .. "~") .. tostring((value * 91 + 205) % 256)

			if debug.getmemorycategory() ~= str14 then
				fn("J2_087")
				LPH_CRASH()
			end

			local str15, n38, n39, n40

			if tbl14 then
				str15 = tbl14[1]
				n38 = tbl14[2]
				n39 = tbl14[3]
				n40 = tbl14[4]
				bindableEvent3:SetAttribute("_2e8931a7ebb6", n40)
			else
				local n41 = n24

				for i = 1, 37 do
					local n42

					if tostring({}) < tostring({}) then
						n42 = n41 + 1
					else
						n42 = n41 * 2
					end

					n41 = n42 % 10000
				end

				local str16 = n41 .. ""
				local n42 = 0

				for i = 1, #c2f0fd7f307f0f25b71d9e28 do
					n42 = (n42 * 31 + c2f0fd7f307f0f25b71d9e28:byte(i)) % 1000003
				end

				local n43 = tonumber(str16) or 0
				n38 = v9 + n42 + 7290
				n39 = v10 + n43 + 7105
				n40 = n11 * 4 + n42 + n43 + 939
				bindableEvent3:SetAttribute("_2e8931a7ebb6", n40)

				local function fn20(arg, arg2, arg3)
					if not (arg3 ~= 837267 or not rawequal(arg3, 837267) or type(arg3) ~= "number") then
						local n44 = 1779033703
						local n45 = 3144134277

						for i = 1, #arg2 do
							local byte = arg2.byte
							n44 = bit32.bxor(bit32.lrotate(n44, 5), byte(arg2, i))
							n45 = fn19(fn18(n45, 7), n44)
						end

						for i = 1, #arg do
							local v27 = arg:byte(i)
							n44 = fn19(fn18(n44, 5), v27)
							local bxor3 = bit32.bxor
							n45 = bit32.bxor(bit32.lrotate(n45, 13), bxor3(n44, v27))
						end

						local v27 = bit32.bxor(n44, bit32.rshift(n44, 16))
						local v28 = fn19(n45, fn16(n45, 16))
						return string.format("%08x%08x", v27, v28)
					end

					fn("J2_064")

					while true do
					end
				end

				local v27 = fn20(c2f0fd7f307f0f25b71d9e28 .. str16, scriptKey, 837267)
				local str17 = ",\"_680bac65a18a002c13c3b592\":" .. ((((((("{\"_fcab2ca6b196b4c3a2afeaed\":" .. n23 + n32 .. "") .. ",\"_556b1e92b39f7a87ddc57302\":") .. n2 + n32 * 50 .. "") .. ",\"_983785f48f67db9148b6f8d2\":") .. n20 + n32 * 3 .. "") .. ",\"_6731f39b0ae1b305eb5ca292\":") .. n21 + n32 * 2 .. "") .. "}"
				local str18 = ",\"_1c636286cdcc49f58991f7b3\":" .. "[" .. (tbl13[3] .. "") .. "," .. (tbl13[2] .. "") .. "," .. (tbl13[1] .. "") .. "]"
				local str19 = ",\"_7bc18246ca13993e122c0caa\":" .. value .. ""
				local str20 = ("{\"_f7c544c95c944346641e5337\":" .. n39 .. "") .. (",\"_150bf485e48850cfb3270de4\":" .. v5(str16)) .. (",\"_dc0e1de2498582ceb40b1689\":" .. n40 .. "") .. str17 .. (",\"_e7c66bb4ade0b169b5567491\":" .. v5(n82245283ce79a0f584076eee)) .. (",\"_76bb43584b53e9efc30a7134\":" .. n38 .. "") .. str18 .. str19 .. (",\"_891e2c13a1673ebe2fc67f14\":" .. v5(v27)) .. "}"

				local function fn21(arg, arg2, arg3)
					if arg2 ~= (1 - 2 * (973918238 + 3321049058 + 0) % 4294967296) * (1 + ((1652170088 + 2624271000 + 53288960) % 4294967296 * 67108864 + (7428962288 + 1659451350 + 3796488250) % 4294967296) / 4503599627370496) * 2 ^ ((6424507882 + 1597087120 + 568340631) % 4294967296 - 1023) or not rawequal(arg2, 397936) or type(arg2) ~= "number" then
						fn("J2_106")

						while true do
						end
					else
						if not (arg3 ~= 257204 or not rawequal(arg3, 257204) or type(arg3) ~= "number") then
							local n44 = 305419896

							for i = 1, #str13 do
								local byte = str13.byte
								n44 = bit32.bxor(bit32.lrotate(n44, 5), byte(str13, i))
							end

							local n45 = #str13
							local tbl15 = { "e", "2", "3", "a", "0", "1", "d", "7", "6", "b", "4", "5", "c", "9", "f", "8" }
							local v28 = table.create(#arg * 2)

							for i = 1, #arg do
								local n46 = (arg:byte(i) + str13:byte((i - 1) % n45 + 1)) % 256
								local bxor3 = bit32.bxor
								n44 = bit32.bxor(bit32.lrotate(n44, 7), bxor3(n44, 2654435769))
								local v29 = fn14(n46, n44 % 256)
								local n47 = i * 2
								v28[n47 - 1] = tbl15[v29 // 16 + 1]
								v28[n47] = tbl15[v29 % 16 + 1]
							end

							return table.concat(v28)
						end

						fn("J2_175")

						while true do
						end
					end
				end

				local v28 = fn21(str20, (1 - 2 * (1151913230 + 3763230340 + 7969758318) % 4294967296) * (1 + ((244887244 + 1619403060 + 2465439744) % 4294967296 * 67108864 + (8139716912 + 450217680 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((4852128631 + 4225684124 + 3807090174) % 4294967296 - 1023), 257204)
				local str21 = "{\"_0a57eac6c4e4b77f423c348d\":" .. v5(v28) .. ",\"_201963710f3bcd69b3e0e1d0\":" .. v5(n82245283ce79a0f584076eee) .. "}"
				local tbl15 = { "e", "2", "3", "a", "0", "1", "d", "7", "6", "b", "4", "5", "c", "9", "f", "8" }
				local tbl16 = {}

				for i = 1, #str21 do
					local v29 = string.byte(str21, i)
					local v30 = tbl5[v29 // 16 + 1][v29 % 16 + 1]
					local n44 = i * 2
					tbl16[n44 - 1] = tbl15[v30 // 16 + 1]
					tbl16[n44] = tbl15[v30 % 16 + 1]
				end

				str15 = ("v4." .. n82245283ce79a0f584076eee .. ".2f8bc7dfb9553de165ee6a9c.") .. table.concat(tbl16)
				tbl14 = { str15, n38, n39, n40 }
			end

			if isfunctionhooked and isfunctionhooked(request) then
				fn("J2_CFL_D")
				LPH_CRASH()
			end

			if restorefunction then
				pcall(restorefunction, request)
			end

			local ok2, result2 = pcall(request, {
				Url = "https://heartbeat.jnkie.com/api/heartbeat/v4/beat",
				Headers = { ["Content-Type"] = "text/plain" },
				Body = str15,
				Method = "POST",
			})

			if not ok2 or type(result2) ~= "table" or type(result2.Body) ~= "string" or result2.StatusCode ~= 200 or #result2.Body == 0 or #result2.Body % 2 ~= 0 or #result2.Body > 262144 then
				if type(result2) == "table" and type(result2.Body) == "string" then
					local ok3, result3 = pcall(v4, result2.Body)

					if ok3 and type(result3) == "table" and result3.action == "kill" then
						local flag15 = type(result3.message) == "string" and #result3.message > 0 and #result3.message <= 300
						local str16 = "Your session has been terminated, please contact the script owner."

						if flag15 then
							str16 = result3.message
						end

						fn(str16)
						LPH_CRASH()
					end
				end

				value2 += 1
				bindableEvent2:SetAttribute("_1208e31f44d4", value2)
				numberValue2.Value = value2

				if bindableEvent2:GetAttribute("_1208e31f44d4") ~= value2 or numberValue2.Value ~= value2 or not fn3(bindableEvent2:GetAttribute("_1208e31f44d4"), value2, 613993) or not fn3(numberValue2.Value, value2, 613993) then
					fn("J2_153")
					LPH_CRASH()
				end

				if value2 ~= 1 and value2 ~= 2 or not fn3(value2, 1, 613993) and not fn3(value2, 2, 613993) then
					fn("J2_187")
					LPH_CRASH()
				end

				local now8 = os.clock()

				repeat
					heartbeat:Wait()
				until os.clock() - now8 >= 10

				flag14 = true
				now5 = now6
				now3 = now7
				continue
			end

			local body2 = result2.Body
			local n41 = #body2 // 2
			local n42 = 305419896

			for i = 1, #str13 do
				local byte = str13.byte
				n42 = bit32.bxor(bit32.lrotate(n42, 5), byte(str13, i))
			end

			local n43 = #str13
			local v27 = table.create((n41 + 3) // 4)
			local flag15 = #body2 == 0 or #body2 % 2 ~= 0
			local n44 = 1
			local n45 = 0

			while n44 <= n41 do
				local v28 = nil
				local v29 = nil
				local v30 = nil
				local v31 = nil
				local n46 = 0

				for i = 1, 4 do
					if not (n41 < n44) then
						local n47 = tbl6[body2:sub(n44 * 2 - 1, n44 * 2 - 1)] and tbl6[body2:sub(n44 * 2, n44 * 2)] and tbl6[body2:sub(n44 * 2 - 1, n44 * 2 - 1)] * 16 + tbl6[body2:sub(n44 * 2, n44 * 2)] or nil

						if not n47 then
							flag15 = true
							break
						else
							local bxor3 = bit32.bxor
							n42 = bit32.bxor(bit32.lrotate(n42, 7), bxor3(n42, 2654435769))
							local n48 = (fn14(n47, n42 % 256) - str13:byte((n44 - 1) % n43 + 1) + 256) % 256

							if i == 1 then
								v28 = n48
							elseif i == 2 then
								v29 = n48
							elseif i ~= 3 then
								v31 = n48
							else
								v30 = n48
							end

							n44 += 1
							n46 = i
							continue
						end
					end

					break
				end

				if not flag15 then
					n45 += 1
					local v32 = string.char(v28, v29 or 0, v30 or 0, v31 or 0)
					v27[n45] = n46 == 4 and v32 or string.sub(v32, 1, n46)
					continue
				end

				break
			end

			local flag16 = false
			local result3 = nil

			if not flag15 then
				flag16, result3 = pcall(v4, table.concat(v27))
			end

			if not flag16 or type(result3) ~= "table" or not result3._f4ae2a9ed59aa5e338f11dda then
				if flag16 and type(result3) == "table" and result3.action == "kill" then
					fn("J2_187")
					LPH_CRASH()
				end

				value2 += 1
				bindableEvent2:SetAttribute("_1208e31f44d4", value2)
				numberValue2.Value = value2

				if bindableEvent2:GetAttribute("_1208e31f44d4") ~= value2 or numberValue2.Value ~= value2 or not fn3(bindableEvent2:GetAttribute("_1208e31f44d4"), value2, 613993) or not fn3(numberValue2.Value, value2, 613993) then
					fn("J2_154")
					LPH_CRASH()
				end

				if value2 ~= 1 and value2 ~= 2 or not fn3(value2, 1, 613993) and not fn3(value2, 2, 613993) then
					fn("J2_085")
					LPH_CRASH()
				end

				local now8 = os.clock()

				repeat
					heartbeat:Wait()
				until os.clock() - now8 >= 10

				flag14 = true
				now5 = now6
				now3 = now7
				continue
			end

			if (type(result3._156c08e4ffcfbfcf5010b41f) ~= "string" or #result3._156c08e4ffcfbfcf5010b41f < 8) == true then
				fn("J2_MS24")
				LPH_CRASH()
			end

			if type(result3._c908d5b54cf6d5cb3ae7a7ac) ~= "number" or result3._c908d5b54cf6d5cb3ae7a7ac < 0 then
				fn("J2_124")
				LPH_CRASH()
			end

			if type(result3._e6c9472947a0a544804b4bcf) ~= "table" or #result3._e6c9472947a0a544804b4bcf ~= 3 then
				fn("J2_212B")
				LPH_CRASH()
			end

			for i = 1, 3 do
				if (type(result3._e6c9472947a0a544804b4bcf[i]) ~= "table" or #result3._e6c9472947a0a544804b4bcf[i] ~= 2) == true then
					fn("J2_212C")
					LPH_CRASH()
				end
			end

			local e6c9472947a0a544804b4bcf = result3._e6c9472947a0a544804b4bcf
			result3._e6c9472947a0a544804b4bcf = { { e6c9472947a0a544804b4bcf[2][1], e6c9472947a0a544804b4bcf[2][2] }, { e6c9472947a0a544804b4bcf[1][2], e6c9472947a0a544804b4bcf[1][1] }, { e6c9472947a0a544804b4bcf[3][1], e6c9472947a0a544804b4bcf[3][2] } }

			if result3._c908d5b54cf6d5cb3ae7a7ac ~= n33 then
				fn("J2_270")
				LPH_CRASH()
			end

			n33 = result3._c908d5b54cf6d5cb3ae7a7ac + 1

			if result3._156c08e4ffcfbfcf5010b41f == c2f0fd7f307f0f25b71d9e28 or fn4(result3._156c08e4ffcfbfcf5010b41f, c2f0fd7f307f0f25b71d9e28, 317750) then
				fn("J2_027")
				LPH_CRASH()
			end

			if result3._ca61b3eae859049b9335fb00 ~= 2 * n38 + n39 * -3 + 385 == true then
				fn("J2_CFL_S")
				LPH_CRASH()
			end

			if result3._b8410bfc4db43ca028ff48f9 ~= -533 + -1 * n40 + n39 * 4 == true then
				fn("J2_RVP2")
				LPH_CRASH()
			end

			if not fn3(n40, bindableEvent3:GetAttribute("_2e8931a7ebb6"), 613993) == true then
				fn("J2_RVS")
				LPH_CRASH()
			end

			if (not (result3._3da7fe0264e108458119ea93 ~= 3 * n38 + -781 + 5 * n40) and fn3(result3._3da7fe0264e108458119ea93, 3 * n38 + -781 + 5 * n40, 613993)) ~= true then
				fn("J2_D2")
				LPH_CRASH()
			end

			if type(result3._09d37e3a8612d9c6017c70f3) == "number" then
				fc3c5cb58bdba857e0aa5190 = result3._09d37e3a8612d9c6017c70f3
			end

			if type(result3._9c9ecc25d7c5f022e710e227) == "number" then
				n2d669ad54f500e563a8ddc2b = result3._9c9ecc25d7c5f022e710e227
			end

			if type(result3._74da8be71040906ff16874ec) == "number" then
				fe65b2bfdae03b049f406e1a = result3._74da8be71040906ff16874ec
			end

			if type(result3._c482489a831db3f43e14863b) == "number" then
				n6f6128df9fcb67717c6fbb1f = result3._c482489a831db3f43e14863b
			end

			if type(result3._f13abd946e1531f43bb41690) == "number" then
				n55ec1ef4ab8ed1d39ad2003a = result3._f13abd946e1531f43bb41690
			end

			if type(result3._b3e6d1eec040270346a4982c) == "number" then
				n8384f199148c3b3f3d08d03a = result3._b3e6d1eec040270346a4982c
			end

			if type(result3._19449944f86def58b9bb94d8) == "table" then
				tbl4 = result3._19449944f86def58b9bb94d8
			end

			bindableEvent2:SetAttribute("_1208e31f44d4", 0)
			numberValue2.Value = 0
			n32 = result3._c908d5b54cf6d5cb3ae7a7ac
			c2f0fd7f307f0f25b71d9e28 = result3._156c08e4ffcfbfcf5010b41f
			local e6c9472947a0a544804b4bcf2 = result3._e6c9472947a0a544804b4bcf

			tbl13 = {
				2 * e6c9472947a0a544804b4bcf2[1][1] + 385 + -3 * e6c9472947a0a544804b4bcf2[1][2],
				e6c9472947a0a544804b4bcf2[2][1] * 4 + e6c9472947a0a544804b4bcf2[2][2] * -1 + -533,
				-781 + e6c9472947a0a544804b4bcf2[3][2] * 3 + e6c9472947a0a544804b4bcf2[3][1] * 5,
			}

			value += 1
			bindableEvent2:SetAttribute("_a2b8704f6e60", value)
			numberValue.Value = value
			debug.setmemorycategory("_6cc3aacb23c4_" .. ((flag10 and "xHrq" or "b6lD") .. "/") .. ((flag7 and "1jP4" or "ya2e") .. "~") .. tostring((value * 91 + 205) % 256))
			flag14 = false
			value2 = 0
			tbl14 = nil
			now5 = now6
			now3 = now7
		end
	end)

	if not flag10 or not fn4(flag10, true, (1 - 2 * (3931627250 + 363340046 + 0) % 4294967296) * (1 + ((4563488192 + 4019544640 + 21136896) % 4294967296 * 67108864 + (215538626 + 4079428670 + 0) % 4294967296) / 4503599627370496) * 2 ^ ((963003382 + 148519896 + 3183445059) % 4294967296 - 1023)) then
		fn("J2_161")
		LPH_CRASH()
	end

	if bindableEvent2:GetAttribute("_a978855c24de") ~= true then
		fn("J2_MS20")
		LPH_CRASH()
	end

	if boolValue.Value ~= true then
		fn("J2_036")
		LPH_CRASH()
	end

	local v16 = debug.getmemorycategory()

	if type(v16) ~= "string" or v16:sub(1, 18) ~= "_6cc3aacb23c4_b6lD" then
		fn("J2_199")
		LPH_CRASH()
	end

	task.defer(function()
		local now2 = os.clock()

		repeat
			heartbeat:Wait()
		until os.clock() - now2 >= 45

		if not flag7 or not fn4(flag7, true, 317750) then
			fn("J2_094")
			LPH_CRASH()
		end

		if bindableEvent2:GetAttribute("_1cb87fade2d2") ~= true then
			fn("J2_008")
			LPH_CRASH()
		end

		if boolValue2.Value ~= true then
			fn("J2_MS05")
			LPH_CRASH()
		end

		local v17 = value
		local now3 = os.clock()
		local n24 = 0
		local n25 = 0

		while false do
			local now4 = os.clock()

			repeat
				heartbeat:Wait()
			until os.clock() - now4 >= 130

			n24 += 1

			if not fn3(bindableEvent2:GetAttribute("_a978855c24de"), true, 613993) or bindableEvent2:GetAttribute("_a978855c24de") ~= true then
				fn("J2_MS21")
				LPH_CRASH()
			end

			if (boolValue2.Value ~= true or not flag7 or bindableEvent2:GetAttribute("_1cb87fade2d2") ~= true) == true then
				fn("J2_184")
				LPH_CRASH()
			end

			if not fn3(boolValue.Value, true, 613993) or boolValue.Value ~= true then
				fn("J2_029")
				LPH_CRASH()
			end

			local v18 = value
			local attribute2 = bindableEvent2:GetAttribute("_a2b8704f6e60")
			local value2 = numberValue.Value

			if type(v18) ~= "number" then
				fn("J2_225")
				LPH_CRASH()
			end

			if type(attribute2) ~= "number" then
				fn("J2_225")
				LPH_CRASH()
			end

			if type(value2) ~= "number" == true then
				fn("J2_225")
				LPH_CRASH()
			end

			if (v18 ~= attribute2 or v18 ~= value2) ~= false then
				fn("J2_155")
				LPH_CRASH()
			end

			if not fn3(v18, attribute2, 613993) or not fn3(v18, value2, 613993) then
				fn("J2_125")
				LPH_CRASH()
			end

			local attribute3 = bindableEvent2:GetAttribute("_1208e31f44d4")
			local value3 = numberValue2.Value

			if type(attribute3) ~= "number" then
				fn("J2_197")
				LPH_CRASH()
			end

			if attribute3 < 0 then
				fn("J2_197")
				LPH_CRASH()
			end

			if attribute3 > 2 then
				fn("J2_197")
				LPH_CRASH()
			end

			if attribute3 ~= value3 ~= false then
				fn("J2_215")
				LPH_CRASH()
			end

			local v19 = fn3
			local v20 = table.pack(64493)

			if not v19(attribute3, value3, (1 - 2 * (4102095696 + 3182754597 + 1305084299) % 4294967296) * (1 + ((3233038282 + 2652010166 + 2716368384) % 4294967296 * 67108864 + (4047932879 + 2213966810 + 2328034903) % 4294967296) / 4503599627370496) * 2 ^ ((3953511252 + 166634216 + 2303946157 + bit32.band(28077 * v20[1] + bit32.lshift(bit32.band(1840026195 + 35155 * v20[1], 65535), 16), 4294967295) % 4294967296) % 4294967296 - 1023)) == true then
				fn("J2_186")
				LPH_CRASH()
			end

			if os.clock() - now3 < n24 * 130 * 0.5 ~= false then
				fn("J2_RVP2")
				LPH_CRASH()
			end

			if v18 <= v17 and flag10 then
				n25 += 1

				if n25 > 1 or not fn3(n25, 1, 613993) then
					fn("Connection unstable, ensure your connection is stable.")
					LPH_CRASH()
				end

				v17 = v18
				continue
			end

			n25 = 0
			v17 = v18
		end
	end)
else
	tbl._b3e05ec6c78c:RemoveItem(tbl._7a53828b9027)
end

if false and UserSettings().GameSettings:GetTutorialState("ហೄ\u{ABB}\u{BD6}") and not fn3(UserSettings().GameSettings:GetTutorialState("ហೄ\u{ABB}\u{BD6}"), true, 613993) then
	fn("J2_194")

	while true do
	end
else
	local tbl5 = _G_DUMP_PROTECT or {}
	local flag10 = true

	local function fn14(arg)
		local str5 = ""

		for i = 1, arg do
			local n24 = math.random(1, 63)
			str5 ..= ("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789_"):sub(n24, n24)
		end

		return str5
	end

	local tbl6 = {}
	local tbl7 = {}
	local tbl8 = {}

	local tbl9 = {
		"local function %s() local a = game:GetService('Players') return a end",
		"local %s = function(x) return x * 2 + math.random() end",
		"local %s = {enabled = true, value = %d, key = '%s'}",
		"getgenv().%s = function() return '%s' end",
		"local %s = Instance.new('Part') %s.Name = '%s'",
		"local %s = game:GetService('RunService').Heartbeat:Connect(function() end)",
		"local %s = coroutine.create(function() while true do task.wait() end end)",
		"local %s = setmetatable({}, {__index = function() return '%s' end})",
	}

	task.spawn(function()
		for i = 1, 0 do
			local tbl10 = {}

			for i2 = 1, math.random(50, 200) do
				local v16 = fn14(math.random(8, 32))
				local n24 = math.random(1, 5)

				if n24 == 1 then
					tbl10[v16] = math.random(-999999, 999999)
				elseif n24 == 2 then
					tbl10[v16] = fn14(math.random(16, 128))
				elseif n24 == 3 then
					tbl10[v16] = math.random() > 0.5
				elseif n24 == 4 then
					tbl10[v16] = function()
						return fn14(32)
					end
				else
					local tbl11 = {}
					local v17 = fn14(16)
					local n25 = math.random()
					tbl11[1] = v17
					tbl11[2] = n25

					do
						local values = table.pack(fn14(16))
						table.move(values, 1, values.n, 3, tbl11)
					end

					tbl10[v16] = tbl11
				end
			end

			tbl6[fn14(16)] = tbl10

			if i % 50 == 0 then
				task.wait()
			end
		end

		for i = 1, 0 do
			local v16 = tbl9[math.random(1, #tbl9)]
			local format = string.format
			local v17 = fn14(math.random(8, 24))
			local n24 = math.random(1, 99999)
			local v18 = fn14(math.random(8, 16))
			local v19 = fn14(math.random(8, 16))
			local v20 = table.pack(fn14(math.random(8, 16)))
			v20.n = 6 + v20.n - 1
			table.move(v20, 1, v20.n, 6, v20)
			v20[1] = v16
			v20[2] = v17
			v20[3] = n24
			v20[4] = v18
			v20[5] = v19
			tbl7[i] = format(table.unpack(v20, 1, v20.n))

			if i % 100 == 0 then
				task.wait()
			end
		end

		for i = 1, 0 do
			local tbl10 = {}
			local tbl11 = tbl10

			for i2 = 1, 10 do
				tbl11[fn14(8)] = {}
				tbl11[fn14(8)] = fn14(64)
				tbl11[fn14(8)] = math.random(-999999, 999999)

				tbl11[fn14(8)] = function()
					return fn14(32)
				end

				tbl11 = tbl11[fn14(8)] or {}
			end

			tbl8[i] = tbl10

			if i % 20 == 0 then
				task.wait()
			end
		end

		for i = 1, 0 do
			local str5 = "_" .. fn14(math.random(16, 32))
			getgenv()[str5] = tbl6[next(tbl6)] or fn14(128)

			if i % 50 == 0 then
				task.wait()
			end
		end

		for i = 1, 0 do
			tbl5[fn14(16)] = {
				FireServer = function()
				end,
				InvokeServer = function()
				end,
				Connect = function()
					return { Disconnect = function()
					end }
				end,
				Name = fn14(16),
				Parent = game,
				ClassName = "RemoteEvent",
			}

			if i % 25 == 0 then
				task.wait()
			end
		end
	end)

	task.spawn(function()
		while false do
			task.wait(5)

			for i = 1, 50 do
				tbl6[fn14(math.random(12, 24))] = {
					[fn14(8)] = math.random(-999999, 999999),
					[fn14(8)] = fn14(math.random(32, 128)),
					[fn14(8)] = function()
						return fn14(16)
					end,
				}
			end

			local n24 = 0

			for k in pairs(tbl6) do
				n24 += 1

				if n24 > 600 then
					tbl6[k] = nil
				end
			end
		end
	end)

	task.spawn(function()
		local Players
		Players = game:GetService("Players")
		local RunService
		RunService = game:GetService("RunService")
		local TweenService
		TweenService = game:GetService("TweenService")
		local UserInputService
		UserInputService = game:GetService("UserInputService")
		local Lighting
		Lighting = game:GetService("Lighting")
		local Workspace
		Workspace = game:GetService("Workspace")
		local TeleportService
		TeleportService = game:GetService("TeleportService")
		local VirtualInputManager
		VirtualInputManager = game:GetService("VirtualInputManager")
		local TextService
		TextService = game:GetService("TextService")
		game:GetService("Stats")
		local HttpService
		HttpService = game:GetService("HttpService")
		local SoundService
		SoundService = game:GetService("SoundService")
		local localPlayer
		localPlayer = Players.LocalPlayer

		do
			local function fn15(arg)
				local ok, result = pcall(function()
					return game:HttpGet(arg, true)
				end)

				if not ok or type(result) ~= "string" or result == "" then
					local request_ = request or http_request or syn and syn.request

					if request_ then
						local ok2, result2 = pcall(function()
							return request_({ Url = arg, Method = "GET" })
						end)

						if ok2 and result2 then
							result = result2.Body or result2.body
						end
					end
				end

				if type(result) ~= "string" or result == "" then
					return nil
				end
				local tbl10 = {}

				for match in result:gmatch("[^\r\n]+") do
					local str5 = match:gsub("^%s+", ""):gsub("%s+$", ""):gsub("^\0199\00187\00191", "")

					if str5 ~= "" and not str5:find("%s") then
						tbl10[str5:lower()] = true
					end
				end

				return tbl10
			end

			local ids = fn15("https://raw.githubusercontent.com/Birmap2314/HUJFIUHSUIFDH/refs/heads/main/ids")
			local ids2 = fn15("https://raw.githubusercontent.com/Birmap2314/HUJFIUHSUIFDH/refs/heads/main/ids2")
			local str5 = ("@" .. localPlayer.Name):lower()
			local str6 = localPlayer.Name:lower()
			local str7 = tostring(localPlayer.UserId):lower()

			if ids then
				ids = ids[str5] or ids[str6]
			end

			if false then
				pcall(function()
					localPlayer:Kick("This account is not authorized to use this script.")
				end)

				return
			end
		end

		local playerGui
		playerGui = localPlayer:WaitForChild("PlayerGui")
		local currentCamera
		currentCamera = Workspace.CurrentCamera

		Workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			currentCamera = Workspace.CurrentCamera
		end)

		local mouse
		mouse = localPlayer:GetMouse()

		for _, v16 in ipairs({
			"LogoUI",
			"WraithWatermark",
			"WraithTargetHUD",
			"WraithMinimalNotify",
			"WraithScreenArrows",
			"WraithMusicPlayer",
			"WraithBoxSkeletonESP",
			"WraithHugeSnowZone",
			"DynamicIsland",
			"WraithLocalSelfChams",
			"WraithWindUIError",
			"WraithWalkDirection",
		}) do
			pcall(function()
				local v17 = playerGui:FindFirstChild(v16)

				if v17 then
					v17:Destroy()
				end
			end)
		end

		pcall(function()
			local wraithWalkDirection = Workspace:FindFirstChild("WraithWalkDirection")

			if wraithWalkDirection then
				wraithWalkDirection:Destroy()
			end
		end)

		local tbl10

		tbl10 = {
			assetId = "rbxassetid://129691721280832",
			logoSize = 320,
			breatheAmp = 0.05,
			breatheFreq = 0.3,
			gradHeight = 380,
			pulseFreq = 0.4,
			lineDist = 160,
			lineThickness = 2,
			maxLines = 80,
			repelForce = 260,
			bounceCooldown = 0.35,
		}

		local tbl11
		tbl11 = {}

		do
			local color = Color3.fromRGB(168, 85, 247)
			local color2 = Color3.fromRGB(147, 51, 234)
			local color3 = Color3.fromRGB(126, 34, 206)
			local color4 = Color3.fromRGB
			tbl11[1] = color
			tbl11[2] = color2
			tbl11[3] = color3

			do
				local values = table.pack(color4(192, 132, 252))
				table.move(values, 1, values.n, 4, tbl11)
			end
		end

		local tbl12
		tbl12 = {}

		do
			local color = Color3.fromRGB(168, 85, 247)
			local color2 = Color3.fromRGB(147, 51, 234)
			local color3 = Color3.fromRGB
			tbl12[1] = color
			tbl12[2] = color2

			do
				local values = table.pack(color3(126, 34, 206))
				table.move(values, 1, values.n, 3, tbl12)
			end
		end

		local screenGui
		screenGui = Instance.new("ScreenGui")
		screenGui.Name = "LogoUI"
		screenGui.ResetOnSpawn = false
		screenGui.IgnoreGuiInset = true
		screenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		screenGui.Parent = playerGui
		local blurEffect
		blurEffect = Instance.new("BlurEffect")
		blurEffect.Size = 20
		blurEffect.Parent = Lighting
		local frame2
		frame2 = Instance.new("Frame", screenGui)
		frame2.Size = UDim2.new(1, 0, 1, 0)
		frame2.BackgroundColor3 = Color3.fromRGB(8, 4, 24)
		frame2.BackgroundTransparency = 0.4
		frame2.ZIndex = 1
		local fn15

		fn15 = function(arg, arg2, arg3)
			return Color3.new(arg.R + (arg2.R - arg.R) * arg3, arg.G + (arg2.G - arg.G) * arg3, arg.B + (arg2.B - arg.B) * arg3)
		end

		local frame3
		frame3 = Instance.new("Frame", screenGui)
		frame3.AnchorPoint = Vector2.new(0.5, 0.5)
		frame3.Position = UDim2.new(0.5, 0, 0.5, 0)
		frame3.Size = UDim2.new(0, tbl10.logoSize, 0, tbl10.logoSize)
		frame3.BackgroundTransparency = 1
		frame3.ZIndex = 10
		local imageLabel = Instance.new("ImageLabel", frame3)
		imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
		imageLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageLabel.Size = UDim2.new(1, 0, 1, 0)
		imageLabel.Image = tbl10.assetId
		imageLabel.BackgroundTransparency = 1
		imageLabel.ScaleType = Enum.ScaleType.Fit
		imageLabel.ZIndex = 10
		local tbl13
		local tbl14 = { 380, 470, 580 }
		tbl13 = {}

		for i = 1, 3 do
			local frame4 = Instance.new("Frame", screenGui)
			frame4.AnchorPoint = Vector2.new(0.5, 0.5)
			frame4.Position = UDim2.new(0.5, 0, 0.5, 0)
			frame4.Size = UDim2.new(0, tbl14[i], 0, tbl14[i])
			frame4.BackgroundTransparency = 1
			frame4.ZIndex = 3
			local uiStroke = Instance.new("UIStroke", frame4)
			uiStroke.Thickness = 1.8 - i * 0.3
			uiStroke.Color = tbl12[1]
			uiStroke.Transparency = 0.35 + i * 0.12
			local uiStroke2 = Instance.new("UIStroke", frame4)
			uiStroke2.Thickness = 3.5
			uiStroke2.Color = tbl12[1]
			uiStroke2.Transparency = 0.75
			Instance.new("UICorner", frame4).CornerRadius = UDim.new(1, 0)

			tbl13[i] = {
				frame = frame4,
				stroke = uiStroke,
				glow = uiStroke2,
				baseSize = tbl14[i],
				rotDir = i % 2 == 1 and 1 or -1,
				rotSpeed = 8 + i * 6,
				colorPhase = i * 0.8,
				currentRadius = tbl14[i] / 2,
			}
		end

		local fn16, v16, tbl15, fn17, fn18, fn19, fn20, v17, v18, v19
		local v20, v21, v22, v23

		do
			local function createFrame(zIndex)
				local frame4 = Instance.new("Frame", screenGui)
				frame4.AnchorPoint = Vector2.new(0, 1)
				frame4.Position = UDim2.new(0, 0, 1, 0)
				frame4.Size = UDim2.new(1, 0, 0, tbl10.gradHeight)
				frame4.BackgroundTransparency = 1
				frame4.ZIndex = zIndex
				return frame4
			end

			local v24 = createFrame(2)
			local v25 = createFrame(3)
			local v26 = createFrame(4)
			local uiGradient = Instance.new("UIGradient", v24)
			uiGradient.Rotation = 90
			local colorSequence = ColorSequence.new
			local tbl16 = {}
			local v27 = ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 4, 24))
			local v28 = ColorSequenceKeypoint.new(0.3, Color3.fromRGB(50, 10, 120))
			local v29 = ColorSequenceKeypoint.new(0.7, Color3.fromRGB(109, 40, 217))
			tbl16[1] = v27
			tbl16[2] = v28
			tbl16[3] = v29

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(168, 85, 247)))
				table.move(values, 1, values.n, 4, tbl16)
			end

			uiGradient.Color = colorSequence(tbl16)
			local numberSequence = NumberSequence.new
			local tbl17 = {}
			local v30 = NumberSequenceKeypoint.new(0, 1)
			local v31 = NumberSequenceKeypoint.new(0.15, 0.5)
			tbl17[1] = v30
			tbl17[2] = v31

			do
				local values = table.pack(NumberSequenceKeypoint.new(1, 0))
				table.move(values, 1, values.n, 3, tbl17)
			end

			uiGradient.Transparency = numberSequence(tbl17)
			local uiGradient2 = Instance.new("UIGradient", v25)
			uiGradient2.Rotation = 90
			local colorSequence2 = ColorSequence.new
			local tbl18 = {}
			local v32 = ColorSequenceKeypoint.new(0, Color3.fromRGB(8, 4, 24))
			local v33 = ColorSequenceKeypoint.new(0.4, Color3.fromRGB(100, 23, 130))
			local v34 = ColorSequenceKeypoint.new(0.8, Color3.fromRGB(147, 51, 234))
			tbl18[1] = v32
			tbl18[2] = v33
			tbl18[3] = v34

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(192, 132, 252)))
				table.move(values, 1, values.n, 4, tbl18)
			end

			uiGradient2.Color = colorSequence2(tbl18)
			local numberSequence2 = NumberSequence.new
			local tbl19 = {}
			local v35 = NumberSequenceKeypoint.new(0, 1)
			local v36 = NumberSequenceKeypoint.new(0.3, 0.7)
			tbl19[1] = v35
			tbl19[2] = v36

			do
				local values = table.pack(NumberSequenceKeypoint.new(1, 0.1))
				table.move(values, 1, values.n, 3, tbl19)
			end

			uiGradient2.Transparency = numberSequence2(tbl19)
			local uiGradient3 = Instance.new("UIGradient", v26)
			uiGradient3.Rotation = 0
			local colorSequence3 = ColorSequence.new
			local tbl20 = {}
			local v37 = ColorSequenceKeypoint.new(0, Color3.fromRGB(168, 85, 247))
			local v38 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(192, 132, 252))
			tbl20[1] = v37
			tbl20[2] = v38

			do
				local values = table.pack(ColorSequenceKeypoint.new(1, Color3.fromRGB(126, 34, 206)))
				table.move(values, 1, values.n, 3, tbl20)
			end

			uiGradient3.Color = colorSequence3(tbl20)
			local numberSequence3 = NumberSequence.new
			local tbl21 = {}
			local v39 = NumberSequenceKeypoint.new(0, 1)
			local v40 = NumberSequenceKeypoint.new(0.38, 0.4)
			local v41 = NumberSequenceKeypoint.new(0.62, 0.4)
			tbl21[1] = v39
			tbl21[2] = v40
			tbl21[3] = v41

			do
				local values = table.pack(NumberSequenceKeypoint.new(1, 1))
				table.move(values, 1, values.n, 4, tbl21)
			end

			uiGradient3.Transparency = numberSequence3(tbl21)
			local tbl22 = {}

			for i = 1, tbl10.maxLines do
				local frame4 = Instance.new("Frame", screenGui)
				frame4.BackgroundColor3 = tbl11[1]
				frame4.BorderSizePixel = 0
				frame4.BackgroundTransparency = 1
				frame4.ZIndex = 19
				tbl22[i] = frame4
			end

			local tbl23 = {}

			local function fn21(arg)
				local n24 = math.random(4)

				if n24 == 1 then
					arg.startX = math.random()
					arg.startY = -0.02
				elseif n24 == 2 then
					local startY = math.random()
					arg.startX = 1.02
					arg.startY = startY
				elseif n24 == 3 then
					arg.startX = math.random()
					arg.startY = 1.02
				else
					local startY = math.random()
					arg.startX = -0.02
					arg.startY = startY
				end

				arg.targetX = 0.25 + math.random() * 0.5
				arg.targetY = 0.25 + math.random() * 0.5
				arg.curveAmp = (math.random() - 0.5) * 0.3
				arg.curvePhase = math.random() * 3.1415926535897931
				arg.sizeBase = 10 + math.random() * 5
				local v42 = tbl11[math.random(#tbl11)]
				arg.f.BackgroundColor3 = v42
				arg.glow.Color = v42
				arg.dur = math.random() * 3 + 3.5
				arg.life = 0
				arg.rotDir = math.random() > 0.5 and 1 or -1
				arg.rotSpeed = math.random() * 60 + 30
				arg.px = 0
				arg.py = 0
				arg.velX = 0
				arg.velY = 0
				arg.bounceTimer = 0
			end

			for i = 1, 22 do
				local frame4 = Instance.new("Frame", screenGui)
				frame4.Size = UDim2.new(0, 14, 0, 14)
				frame4.AnchorPoint = Vector2.new(0.5, 0.5)
				frame4.BackgroundColor3 = tbl11[math.random(#tbl11)]
				frame4.BorderSizePixel = 0
				frame4.ZIndex = 20
				Instance.new("UICorner", frame4).CornerRadius = UDim.new(1, 0)
				local uiStroke = Instance.new("UIStroke", frame4)
				uiStroke.Thickness = 1
				uiStroke.Color = frame4.BackgroundColor3
				uiStroke.Transparency = 0.5
				tbl23[i] = { f = frame4, glow = uiStroke, life = math.random() * 5 }
				fn21(tbl23[i])
			end

			local n24 = 0
			local connection = nil

			connection = RunService.RenderStepped:Connect(function(deltaTime)
				if not screenGui or not screenGui.Parent then
					if connection then
						connection:Disconnect()
					end

					return
				end

				n24 += deltaTime
				local absoluteSize = screenGui.AbsoluteSize
				local n25 = math.max(absoluteSize.X, 1)
				local n26 = math.max(absoluteSize.Y, 1)
				local n27 = n25 * 0.5
				local n28 = n26 * 0.5
				local n29 = n24 % 4 / 4
				local n30 = n29 < 0.5 and 2 * n29 * n29 or 1 - math.pow(-2 * n29 + 2, 2) / 2
				local rotation = math.floor(n24 / 4) * 360 + n30 * 360 + math.sin(n24 * 3) * 10
				local n31 = 1 + 0.08 * math.sin(n24 * 1.8)
				local n32 = 1 + 0.08 * math.cos(n24 * 1.8)
				local n33 = 1 + tbl10.breatheAmp * math.sin(n24 * tbl10.breatheFreq * 3.1415926535897931 * 2)
				frame3.Rotation = rotation
				frame3.Size = UDim2.new(0, tbl10.logoSize * n33 * n31, 0, tbl10.logoSize * n33 * n32)
				frame3.Position = UDim2.new(0.5, math.sin(n24 * 0.7) * 6, 0.5, math.cos(n24 * 1.1) * 6)
				local n34 = n24 * 0.15
				local n35 = #tbl12
				local n36 = math.floor(n34) % n35 + 1
				local n37 = n36 % #tbl12 + 1
				local n38 = n34 - math.floor(n34)
				local v42 = fn15(tbl12[n36], tbl12[n37], n38 * n38 * (3 - 2 * n38))
				local n39 = 0.5 + 0.5 * math.sin(n24 * 0.6)

				for i, v43 in ipairs(tbl13) do
					v43.frame.Rotation = n24 * v43.rotSpeed * v43.rotDir
					local n40 = 1 + 0.06 * math.sin(n24 * (0.7 + i * 0.2) + v43.colorPhase)
					v43.frame.Size = UDim2.new(0, v43.baseSize * n40, 0, v43.baseSize * n40)
					v43.currentRadius = v43.baseSize / 2 * n40
					v43.stroke.Transparency = 0.35 + i * 0.1 + n39 * 0.08
					v43.stroke.Color = v42
					v43.glow.Color = v42
					v43.glow.Transparency = 0.75 + n39 * 0.1
				end

				local n40 = 0.5 + 0.5 * math.sin(n24 * tbl10.pulseFreq * 3.1415926535897931 * 2)
				local n41 = 0.5 + 0.5 * math.sin(n24 * tbl10.pulseFreq * 3.1415926535897931 * 2 + 2.1991148575128552)
				v24.Size = UDim2.new(1, 0, 0, tbl10.gradHeight * (0.8 + n40 * 0.4))
				v25.Size = UDim2.new(1, 0, 0, tbl10.gradHeight * (0.6 + n41 * 0.6))
				v26.Size = UDim2.new(1, 0, 0, 100 + n40 * 80)
				uiGradient3.Offset = Vector2.new(math.sin(n24 * 0.8) * 0.9, 0)
				local currentRadius = tbl13[3].currentRadius

				for _, v43 in ipairs(tbl23) do
					v43.life = v43.life + deltaTime

					if v43.dur < v43.life then
						fn21(v43)
					end

					local n42 = v43.life / v43.dur
					local px, py

					if v43.bounceTimer > 0 then
						v43.bounceTimer = v43.bounceTimer - deltaTime
						v43.velX = v43.velX * 0.95
						v43.velY = v43.velY * 0.95
						px = v43.px + v43.velX * deltaTime
						py = v43.py + v43.velY * deltaTime
					else
						local n43 = 1 - math.pow(1 - n42, 3)
						local n44 = v43.startX + (v43.targetX - v43.startX) * n43
						local n45 = v43.startY + (v43.targetY - v43.startY) * n43
						local n46 = v43.targetX - v43.startX
						local n47 = v43.targetY - v43.startY
						local n48 = n46 * n46 + n47 * n47

						if n48 > 0 then
							local v44 = math.sqrt(n48)
							local curveAmp = v43.curveAmp
							local n49 = math.sin(n42 * 3.1415926535897931 + v43.curvePhase) * curveAmp
							n44 += -n47 / v44 * n49
							n45 += n46 / v44 * n49
						end

						px = n44 * n25
						py = n45 * n26
					end

					local n43 = px - n27
					local n44 = py - n28
					local n45 = n43 * n43 + n44 * n44

					if n45 < currentRadius * currentRadius and n45 > 0.01 then
						local v44 = math.sqrt(n45)
						local n46 = n43 / v44
						local n47 = n44 / v44
						px = n27 + n46 * (currentRadius + 2)
						py = n28 + n47 * (currentRadius + 2)
						local n48 = (math.random() - 0.5) * 0.5
						local v45 = math.cos(n48)
						local v46 = math.sin(n48)
						v43.velX = (n46 * v45 - n47 * v46) * tbl10.repelForce
						v43.velY = (n46 * v46 + n47 * v45) * tbl10.repelForce
						v43.bounceTimer = tbl10.bounceCooldown
					end

					v43.px = px
					v43.py = py
					v43.f.Position = UDim2.new(v43.px / n25, 0, v43.py / n26, 0)
					local v44 = math.sin(n42 * 3.1415926535897931)
					v43.f.BackgroundTransparency = 1 - v44 * 0.9
					v43.glow.Transparency = 0.5 + (1 - v44) * 0.4
					v43.f.Size = UDim2.new(0, v43.sizeBase * (1 - n42 * 0.3), 0, v43.sizeBase * (1 - n42 * 0.3))
					v43.f.Rotation = n24 * v43.rotSpeed * v43.rotDir
				end

				local n42 = tbl10.lineDist * tbl10.lineDist
				local n43 = 1

				for i = 1, #tbl23 do
					local v43 = tbl23[i]
					local v44 = math.sin(v43.life / v43.dur * 3.1415926535897931)

					if v44 < 0.1 then
						continue
					else
						for i2 = i + 1, #tbl23 do
							if not (tbl10.maxLines < n43) then
								local v45 = tbl23[i2]
								local v46 = math.sin(v45.life / v45.dur * 3.1415926535897931)

								if not (v46 < 0.1) then
									local n44 = v45.px - v43.px
									local n45 = v45.py - v43.py
									local n46 = n44 * n44 + n45 * n45

									if n46 < n42 and n46 > 0 then
										local v47 = math.sqrt(n46)
										local v48 = tbl22[n43]
										n43 += 1
										local n47 = 1 - v47 / tbl10.lineDist
										v48.Size = UDim2.new(0, v47, 0, tbl10.lineThickness)
										v48.Position = UDim2.new(0, (v43.px + v45.px) / 2, 0, (v43.py + v45.py) / 2)
										v48.AnchorPoint = Vector2.new(0.5, 0.5)
										v48.Rotation = math.deg(math.atan2(n45, n44))
										v48.BackgroundTransparency = 1 - n47 * 0.75 * math.min(v44, v46)
										v48.BackgroundColor3 = v42
									end
								end

								continue
							end

							break
						end

						if not (tbl10.maxLines < n43) then
							continue
						end
					end

					break
				end

				for i = n43, #tbl22 do
					tbl22[i].BackgroundTransparency = 1
					tbl22[i].Size = UDim2.new(0, 0, 0, 0)
				end
			end)

			local str5 = "WraithBeta"

			fn16 = function(arg)
				return type(arg) == "function"
			end

			local function fn22(arg)
				if fn16(isfolder) then
					local ok, result = pcall(isfolder, arg)
					if ok and result then
						return true
					end
				end

				if fn16(makefolder) then
					if pcall(makefolder, arg) then
						return true
					end
				end

				return false
			end

			fn22("WraithBeta")

			local function fn23(arg)
				return str5 .. "/" .. arg
			end

			local tbl24 = {
				fn23("windui_cache.lua"),
				str5 .. "windui_cache.lua",
				"wraith_windui_cache.lua",
				"windui_cache.lua",
			}

			local tbl25 = {
				"https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua",
				"https://raw.githubusercontent.com/Footagesus/WindUI/main/main.lua",
				"https://github.com/Footagesus/WindUI/releases/latest/download/main.lua",
				"https://cdn.jsdelivr.net/gh/Footagesus/WindUI@main/dist/main.lua",
				"https://cdn.jsdelivr.net/gh/Footagesus/WindUI@main/main.lua",
				"https://raw.githack.com/Footagesus/WindUI/main/dist/main.lua",
				"https://ghproxy.net/https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua",
				"https://mirror.ghproxy.com/https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua",
				"https://gh.llkk.cc/https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua",
				"https://hub.gitmirror.com/https://raw.githubusercontent.com/Footagesus/WindUI/main/dist/main.lua",
			}

			local v42 = nil
			local str6 = nil
			v16 = nil

			local function fn24(arg)
				pcall(function()
					if not screenGui or not screenGui.Parent then
						return
					end
					local wraithLoaderStatus = screenGui:FindFirstChild("WraithLoaderStatus")

					if not wraithLoaderStatus then
						wraithLoaderStatus = Instance.new("TextLabel")
						wraithLoaderStatus.Name = "WraithLoaderStatus"
						wraithLoaderStatus.AnchorPoint = Vector2.new(0.5, 0)
						wraithLoaderStatus.Position = UDim2.new(0.5, 0, 0.5, tbl10.logoSize / 2 + 28)
						wraithLoaderStatus.Size = UDim2.fromOffset(700, 30)
						wraithLoaderStatus.BackgroundTransparency = 1
						wraithLoaderStatus.TextColor3 = Color3.fromRGB(235, 225, 255)
						wraithLoaderStatus.TextTransparency = 0.04
						wraithLoaderStatus.Font = Enum.Font.GothamMedium
						wraithLoaderStatus.TextSize = 13
						wraithLoaderStatus.Parent = screenGui
					end

					wraithLoaderStatus.Text = tostring(arg or "")
				end)
			end

			local function fn25(arg)
				return type(arg) == "string" and #arg > 500 and not arg:lower():find("<!doctype html", 1, true) and not arg:lower():find("<html", 1, true)
			end

			local function fn26(arg, arg2)
				if not fn25(arg) then
					str6 = "Invalid/HTML response"
					return false
				end
				local loadstring_ = getgenv and getgenv().loadstring or loadstring
				if type(loadstring_) ~= "function" then
					str6 = "loadstring is not supported"
					return false
				end
				local v43, v44 = loadstring_(arg)
				if type(v43) ~= "function" then
					str6 = "Compile err: " .. tostring(v44)
					return false
				end
				local ok, result = pcall(v43)

				if ok and type(result) == "table" then
					v42 = result
					v16 = arg2
					fn24("Loaded WindUI from " .. tostring(arg2))
					return true
				end

				local windUI = getgenv and getgenv().WindUI or _G.WindUI

				if type(windUI) == "table" then
					v42 = windUI
					v16 = arg2
					fn24("Loaded WindUI from " .. tostring(arg2))
					return true
				end

				str6 = tostring(result or v44 or "unknown error")
				return false
			end

			local function fn27(arg)
				if fn16(isfile) then
					local ok, result = pcall(isfile, arg)
					if not ok or not result then
						return nil
					end
				end

				if fn16(readfile) then
					local ok, result = pcall(readfile, arg)
					if ok and type(result) == "string" and #result > 0 then
						return result
					end
				end

				return nil
			end

			local function fn28(arg)
				if not fn25(arg) or not fn16(writefile) then
					return
				end
				fn22("WraithBeta")

				for _, v43 in ipairs(tbl24) do
					pcall(writefile, v43, arg)
				end
			end

			local function fn29(arg)
				local ok, result = pcall(function()
					return game:HttpGet(arg, true)
				end)

				if ok and type(result) == "string" and #result > 0 then
					return result
				end
				local request_ = syn and syn.request or http_request or request or http and http.request

				if type(request_) == "function" then
					local ok2, result2 = pcall(request_, { Url = arg, Method = "GET" })

					if ok2 and result2 then
						local body = result2.Body or result2.body
						if type(body) == "string" and #body > 0 then
							return body
						end
					end
				end

				str6 = tostring(result)
				return nil
			end

			for _, v43 in ipairs(tbl24) do
				fn24("Checking cache: " .. v43)
				local v44 = fn27(v43)
				if not (v44 and fn26(v44, "cache: " .. v43)) then
					continue
				end
				break
			end

			local flag11 = not v42

			if flag11 then
				for i, v43 in ipairs(tbl25) do
					fn24("Downloading WindUI (" .. i .. "/" .. #tbl25 .. ")")
					local v44 = fn29(v43)

					if v44 and fn26(v44, v43) then
						fn28(v44)
						break
					else
						task.wait(0.05)
					end
				end
			end

			if flag11 then
				warn("Failed to load WindUI: " .. tostring(str6))

				if playerGui then
					local screenGui2 = Instance.new("ScreenGui")
					screenGui2.Name = "WraithWindUIError"
					screenGui2.ResetOnSpawn = false
					screenGui2.IgnoreGuiInset = true
					screenGui2.Parent = playerGui
					local textLabel = Instance.new("TextLabel", screenGui2)
					textLabel.AnchorPoint = Vector2.new(0.5, 0.5)
					textLabel.Position = UDim2.fromScale(0.5, 0.5)
					textLabel.Size = UDim2.fromOffset(500, 80)
					textLabel.BackgroundColor3 = Color3.fromRGB(16, 8, 28)
					textLabel.BackgroundTransparency = 0.08
					textLabel.TextColor3 = Color3.fromRGB(255, 220, 255)
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextSize = 14
					textLabel.TextWrapped = true
					textLabel.Text = "Wraith: WindUI could not be loaded. Please check your internet / HttpGet executor settings."
					Instance.new("UICorner", textLabel).CornerRadius = UDim.new(0, 14)
					local uiStroke = Instance.new("UIStroke", textLabel)
					uiStroke.Color = Color3.fromRGB(168, 85, 247)
					uiStroke.Thickness = 1.5
					uiStroke.Transparency = 0.25
				end

				if connection then
					connection:Disconnect()
				end

				pcall(function()
					if screenGui then
						screenGui:Destroy()
					end
				end)

				pcall(function()
					if blurEffect then
						blurEffect:Destroy()
					end
				end)

				return
			end

			local tweenInfo = TweenInfo.new(0.6, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

			for _, descendant in ipairs(screenGui:GetDescendants()) do
				pcall(function()
					if descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
						TweenService:Create(descendant, tweenInfo, { ImageTransparency = 1, BackgroundTransparency = 1 }):Play()
					elseif descendant:IsA("TextLabel") or descendant:IsA("TextButton") or descendant:IsA("TextBox") then
						TweenService:Create(descendant, tweenInfo, { TextTransparency = 1, BackgroundTransparency = 1 }):Play()
					elseif descendant:IsA("Frame") then
						TweenService:Create(descendant, tweenInfo, { BackgroundTransparency = 1 }):Play()
					elseif descendant:IsA("UIStroke") then
						TweenService:Create(descendant, tweenInfo, { Transparency = 1 }):Play()
					end
				end)
			end

			TweenService:Create(frame2, tweenInfo, { BackgroundTransparency = 1 }):Play()

			pcall(function()
				TweenService:Create(blurEffect, tweenInfo, { Size = 0 }):Play()
			end)

			task.wait(0.65)

			if connection then
				connection:Disconnect()
			end

			pcall(function()
				if screenGui then
					screenGui:Destroy()
				end
			end)

			pcall(function()
				if blurEffect then
					blurEffect:Destroy()
				end
			end)

			if v42.Window then
				pcall(function()
					v42.Window:Destroy()
				end)

				v42.Window = nil
			end

			tbl15 = {
				IncludeLocal = false,
				UiVisible = true,
				ShimmerEnabled = true,
				ShimmerSpeed = 1,
				ShimmerIntensity = 0.5,
				ConfigFile = fn23("config.json"),
				Config = {},
			}

			fn17 = function(arg, arg2)
				tbl15.Config[arg] = arg2
			end

			fn18 = function(arg, arg2)
				local v43 = tbl15.Config[arg]
				if v43 == nil then
					return arg2
				end
				return v43
			end

			fn19 = function()
				fn22("WraithBeta")

				local ok, result = pcall(function()
					return HttpService:JSONEncode(tbl15.Config)
				end)

				if ok and fn16(writefile) then
					pcall(function()
						writefile(tbl15.ConfigFile, result)
					end)
				end
			end

			fn20 = function()
				if fn16(isfile) and fn16(readfile) and isfile(tbl15.ConfigFile) then
					local ok, config = pcall(function()
						return HttpService:JSONDecode(readfile(tbl15.ConfigFile))
					end)

					if ok and type(config) == "table" then
						tbl15.Config = config
					end
				end
			end

			fn20()

			local v43 = v42:CreateWindow({
				Title = "Wraith beta",
				Icon = "rbxassetid://129691721280832",
				Theme = "Dark",
				Size = UDim2.fromOffset(720, 500),
				Transparency = 0.15,
				Blurring = true,
				MinimizeKeybind = Enum.KeyCode.RightAlt,
			})

			task.spawn(function()
				local CoreGui = nil

				pcall(function()
					CoreGui = game:GetService("CoreGui")
				end)

				local tbl26 = { playerGui }

				if CoreGui then
					table.insert(tbl26, CoreGui)
				end

				local now2 = tick()

				while tick() - now2 < 8 do
					for _, v44 in ipairs(tbl26) do
						if v44 then
							for _, descendant in ipairs(v44:GetDescendants()) do
								if descendant:IsA("ImageLabel") or descendant:IsA("ImageButton") then
									if descendant.Image == "rbxassetid://129691721280832" or descendant.Image == "rbxassetid://129691721280832/" then
										if descendant.AbsoluteSize.X <= 38 and descendant.AbsoluteSize.Y <= 38 then
											descendant.Size = UDim2.fromOffset(36, 36)
											descendant.Position = UDim2.new(0, 4, 0.5, 0)
											descendant.AnchorPoint = Vector2.new(0, 0.5)
											descendant.ScaleType = Enum.ScaleType.Fit
											descendant.BackgroundTransparency = 1
										end
									end
								end
							end
						end
					end

					task.wait(0.5)
				end
			end)

			v17 = v43:Tab({ Title = "Visuals | ESP", Icon = "eye" })
			v18 = v43:Tab({ Title = "Visuals | HUD", Icon = "crosshair" })
			v19 = v43:Tab({ Title = "Visuals | World", Icon = "globe" })
			v20 = v43:Tab({ Title = "Visuals | Camera", Icon = "camera" })
			v21 = v43:Tab({ Title = "Visuals | Effects", Icon = "sparkles" })
			v22 = v43:Tab({ Title = "Visuals | Audio", Icon = "music" })
			v23 = v43:Tab({ Title = "Visuals | Utility", Icon = "settings" })
		end

		local fn21
		fn21 = nil
		local wraithNotify

		do
			local screenGui2 = Instance.new("ScreenGui")
			screenGui2.Name = "WraithMinimalNotify"
			screenGui2.IgnoreGuiInset = true
			screenGui2.ResetOnSpawn = false
			screenGui2.DisplayOrder = 1000000
			screenGui2.Parent = playerGui
			local frame4 = Instance.new("Frame", screenGui2)
			frame4.AnchorPoint = Vector2.new(1, 0)
			frame4.Position = UDim2.new(1, -16, 0, 16)
			frame4.Size = UDim2.fromOffset(270, 500)
			frame4.BackgroundTransparency = 1
			local uiListLayout = Instance.new("UIListLayout", frame4)
			uiListLayout.Padding = UDim.new(0, 6)
			uiListLayout.HorizontalAlignment = Enum.HorizontalAlignment.Right
			uiListLayout.VerticalAlignment = Enum.VerticalAlignment.Top
			uiListLayout.SortOrder = Enum.SortOrder.LayoutOrder
			local n24 = 0

			wraithNotify = function(arg)
				local tbl16 = arg or {}
				n24 += 1
				local text = tostring(tbl16.Title or "Wraith")
				local text2 = tostring(tbl16.Description or tbl16.Text or "")
				local n25 = tonumber(tbl16.Duration) or 2.6
				local color = tbl16.Color or Color3.fromRGB(168, 85, 247)
				local frame5 = Instance.new("Frame")
				frame5.LayoutOrder = -n24
				frame5.Size = UDim2.fromOffset(0, 44)
				frame5.BackgroundColor3 = Color3.fromRGB(7, 7, 10)
				frame5.BackgroundTransparency = 0.08
				frame5.BorderSizePixel = 0
				frame5.ClipsDescendants = true
				frame5.Parent = frame4
				Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 10)
				local uiStroke = Instance.new("UIStroke", frame5)
				uiStroke.Color = color
				uiStroke.Thickness = 1
				uiStroke.Transparency = 0.22
				local frame6 = Instance.new("Frame", frame5)
				frame6.Size = UDim2.new(0, 3, 1, -12)
				frame6.Position = UDim2.fromOffset(8, 6)
				frame6.BackgroundColor3 = color
				frame6.BorderSizePixel = 0
				Instance.new("UICorner", frame6).CornerRadius = UDim.new(1, 0)
				local textLabel = Instance.new("TextLabel", frame5)
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.fromOffset(18, 5)
				textLabel.Size = UDim2.new(1, -26, 0, 16)
				textLabel.Font = Enum.Font.GothamBold
				textLabel.TextSize = 12
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextColor3 = Color3.fromRGB(245, 245, 250)
				textLabel.Text = text
				textLabel.TextTruncate = Enum.TextTruncate.AtEnd
				local textLabel2 = Instance.new("TextLabel", frame5)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Position = UDim2.fromOffset(18, 21)
				textLabel2.Size = UDim2.new(1, -26, 0, 16)
				textLabel2.Font = Enum.Font.Gotham
				textLabel2.TextSize = 11
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.TextColor3 = Color3.fromRGB(170, 170, 180)
				textLabel2.Text = text2
				textLabel2.TextTruncate = Enum.TextTruncate.AtEnd
				TweenService:Create(frame5, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(260, 44) }):Play()

				if fn21 and tbl16.SyncIsland ~= false then
					pcall(fn21, text2 ~= "" and text2 or text, tbl16.Type or "Info")
				end

				task.delay(n25, function()
					if frame5 and frame5.Parent then
						TweenService:Create(frame5, TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.fromOffset(0, 44), BackgroundTransparency = 1 }):Play()
						task.wait(0.22)

						if frame5 then
							frame5:Destroy()
						end
					end
				end)
			end
		end

		pcall(function()
			_G.WraithNotify = wraithNotify

			if getgenv then
				getgenv().WraithNotify = wraithNotify
			end
		end)

		do
			local flag11 = false
			local v24 = nil

			local function fn22()
				if v24 and v24.Parent then
					return v24
				end
				local tbl16 = { playerGui }

				pcall(function()
					table.insert(tbl16, game:GetService("CoreGui"))
				end)

				pcall(function()
					if gethui then
						table.insert(tbl16, gethui())
					end
				end)

				local n24 = -math.huge
				local v25 = nil

				for _, v26 in ipairs(tbl16) do
					if v26 then
						for _, child in ipairs(v26:GetChildren()) do
							if child:IsA("ScreenGui") and not child.Name:find("Watermark") and not child.Name:find("TargetHUD") and not child.Name:find("Music") and not child.Name:find("Dynamic") and not child.Name:find("Logo") and not child.Name:find("ScreenArrows") and not child.Name:find("HugeSnow") then
								local displayOrder = child.DisplayOrder or 0

								if displayOrder >= n24 and child:FindFirstChildWhichIsA("Frame", true) then
									n24 = displayOrder
									v25 = child
								end

								local flag12 = false
								local flag13 = false

								for _, descendant in ipairs(child:GetDescendants()) do
									local isImageLabel = descendant:IsA("ImageLabel") or descendant:IsA("ImageButton")

									if isImageLabel then
										isImageLabel = string.find(descendant.Image or "", "129691721280832", 1, true)
									end

									if isImageLabel then
										flag12 = true
									end

									if descendant:IsA("TextLabel") or descendant:IsA("TextButton") then
										if string.lower(descendant.Text or ""):find("wraith beta", 1, true) then
											flag13 = true
											break
										end
									end
								end

								if flag13 or flag12 or child.Name:find("WindUI") or child.Name:find("Wind") then
									v24 = child
									return child
								end
							end
						end
					end
				end

				if v25 then
					v24 = v25
					return v25
				end
				return nil
			end

			task.delay(0.5, fn22)

			local function fn23(uiVisible)
				tbl15.UiVisible = uiVisible
				flag11 = not uiVisible
				local v25 = fn22()
				if not v25 then
					return
				end

				pcall(function()
					v25.Enabled = uiVisible
				end)
			end

			UserInputService.InputBegan:Connect(function(input, gameProcessed)
				if input.KeyCode == Enum.KeyCode.RightShift or input.KeyCode == Enum.KeyCode.RightAlt then
					flag11 = not flag11
					fn23(not flag11)
					return
				end

				if gameProcessed then
					return
				end
			end)
		end

		do
			local flag11 = false
			local color = Color3.fromRGB(168, 85, 247)
			local str5 = "Glow"
			local v24 = v17:Section({ Title = "Chams" })

			v24:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
				end,
			})

			v24:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg
				end,
			})

			v24:Dropdown({
				Title = "Mode",
				Values = { "Glow", "Blur" },
				Value = "Glow",
				Callback = function(arg)
					str5 = arg
				end,
			})

			RunService.Heartbeat:Connect(function()
				for _, player in pairs(Players:GetPlayers()) do
					if not (player == localPlayer and not tbl15.IncludeLocal) then
						local character = player.Character

						if character then
							local wraithHighlight = character:FindFirstChild("WraithHighlight")

							if flag11 then
								if not wraithHighlight then
									wraithHighlight = Instance.new("Highlight", character)
									wraithHighlight.Name = "WraithHighlight"
								end

								wraithHighlight.FillColor = color
								wraithHighlight.OutlineColor = color
								wraithHighlight.OutlineTransparency = str5 == "Blur" and 0.5 or 0
								wraithHighlight.FillTransparency = str5 == "Blur" and 0.7 or 0.5
							elseif wraithHighlight then
								wraithHighlight:Destroy()
							end
						end
					end
				end
			end)
		end

		do
			local flag11 = false
			local color = Color3.fromRGB(168, 85, 247)
			local n24 = 10
			local tbl16 = {}
			local tbl17 = {}
			local visible = false
			local lineThickness = 0.05
			local flag12 = false
			local transparency = 0
			local n25 = 0.88
			local color2 = Color3.fromRGB(168, 85, 247)
			local v24 = nil

			local function fn22()
				for k, v25 in pairs(tbl16) do
					local color3 = visible and flag11 and v24 and k.Character == v24 and color or color2

					for _, v26 in pairs(v25) do
						if v26 then
							v26.Color3 = color3
						end
					end

					if tbl17[k] then
						for _, v26 in pairs(tbl17[k]) do
							if v26 then
								v26.Color3 = color3
							end
						end
					end
				end
			end

			local v25 = v17:Section({ Title = "Aiming ESP" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
					fn22()
				end,
			})

			v25:Slider({
				Title = "Radius",
				Value = { Min = 0, Max = 100, Default = 10 },
				Callback = function(arg)
					n24 = arg
				end,
			})

			v25:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg
					fn22()
				end,
			})

			local highlight = nil
			local v26 = nil

			RunService.RenderStepped:Connect(function()
				if not flag11 then
					v24 = nil

					if highlight then
						highlight:Destroy()
						highlight = nil
					end

					v26 = nil
					fn22()
					return
				end

				v24 = nil
				local target = mouse.Target

				if target then
					local model = target:FindFirstAncestorOfClass("Model")
					local playerFromCharacter = model and Players:GetPlayerFromCharacter(model)

					if playerFromCharacter and playerFromCharacter ~= localPlayer then
						local humanoidRootPart = model:FindFirstChild("HumanoidRootPart")

						if humanoidRootPart and (humanoidRootPart.Position - currentCamera.CFrame.Position).Magnitude <= n24 then
							v24 = model

							if v26 ~= model then
								if highlight then
									highlight:Destroy()
								end

								highlight = Instance.new("Highlight")
								highlight.Name = "WraithGrabHighlight"
								highlight.FillTransparency = 0.55
								highlight.OutlineTransparency = 0
								highlight.Parent = model
								v26 = model
							end

							if highlight then
								highlight.FillColor = color
								highlight.OutlineColor = color
							end

							fn22()
							return
						end
					end
				end

				if highlight then
					highlight:Destroy()
					highlight = nil
				end

				v26 = nil
				fn22()
			end)

			local flag13 = false

			local tbl18 = {
				Distance = 120,
				LookRadius = 300,
				Size = 118,
				Color = Color3.fromRGB(255, 255, 255),
				Transparency = 0,
				RotationSpeed = 75,
				Mode = "Center",
				Image = "rbxassetid://121005954420182",
				Offset = 0,
				UseGrabColor = false,
			}

			local billboardGui = nil
			local imageLabel2 = nil
			local v27 = nil
			local n26 = 1
			local rotation = 0

			local function fn23()
				if billboardGui then
					billboardGui:Destroy()
				end

				billboardGui = nil
				imageLabel2 = nil
				v27 = nil
				n26 = 1
			end

			local function fn24(adornee)
				if not adornee then
					fn23()
					return
				end

				if not billboardGui then
					billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "WraithTargetESP_Attached"
					billboardGui.AlwaysOnTop = true
					billboardGui.LightInfluence = 0
					billboardGui.ResetOnSpawn = false
					billboardGui.Size = UDim2.fromOffset(tbl18.Size, tbl18.Size)
					billboardGui.StudsOffsetWorldSpace = Vector3.new(0, tbl18.Offset, 0)
					billboardGui.Enabled = false
					billboardGui.Parent = playerGui
					imageLabel2 = Instance.new("ImageLabel", billboardGui)
					imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
					imageLabel2.Position = UDim2.fromScale(0.5, 0.5)
					imageLabel2.Size = UDim2.fromScale(1, 1)
					imageLabel2.BackgroundTransparency = 1
					imageLabel2.Image = tbl18.Image
					imageLabel2.ImageColor3 = tbl18.Color
					imageLabel2.ImageTransparency = 1
					imageLabel2.ScaleType = Enum.ScaleType.Fit
					imageLabel2.ZIndex = 10
					Instance.new("UIGradient", imageLabel2).Name = "ShimmerGradient"
				end

				billboardGui.Adornee = adornee
				billboardGui.Size = UDim2.fromOffset(tbl18.Size, tbl18.Size)
				billboardGui.StudsOffsetWorldSpace = Vector3.new(0, tbl18.Offset, 0)
			end

			local function fn25(arg)
				arg = arg and arg.Character
				local humanoidRootPart = arg and arg:FindFirstChild("HumanoidRootPart")
				arg = arg and arg:FindFirstChildOfClass("Humanoid")
				if humanoidRootPart and arg and arg.Health > 0 then
					return humanoidRootPart, arg
				end
			end

			local function fn26()
				local currentCamera2 = Workspace.CurrentCamera
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if not currentCamera2 or not character then
					return nil
				end

				if tbl18.Mode == "Cursor" and mouse and mouse.Target then
					local model = mouse.Target:FindFirstAncestorOfClass("Model")
					model = model and Players:GetPlayerFromCharacter(model)
					local v28 = fn25(model)
					if model and model ~= localPlayer and v28 and (v28.Position - character.Position).Magnitude <= tbl18.Distance then
						return model
					end
				end

				local huge = math.huge
				local v28 = nil

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer and player.Character then
						local v29 = fn25(player)

						if v29 and (v29.Position - character.Position).Magnitude <= tbl18.Distance then
							local v30, v31 = currentCamera2:WorldToViewportPoint(v29.Position)

							if v31 and v30.Z > 0 then
								local n27 = currentCamera2.ViewportSize / 2
								local magnitude = (Vector2.new(v30.X, v30.Y) - n27).Magnitude

								if magnitude < tbl18.LookRadius and magnitude < huge then
									huge = magnitude
									v28 = player
								end
							end
						end
					end
				end

				return v28
			end

			RunService.RenderStepped:Connect(function(deltaTime)
				if not flag13 then
					fn23()
					return
				end
				local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
				local v28 = fn26()

				if v28 and v28 ~= v27 then
					v27 = v28
					n26 = 1
					rotation += 25
				elseif not v27 and v28 then
					v27 = v28
					n26 = 1
				end

				local v29 = fn25(v27)
				local flag14

				if v29 and humanoidRootPart and (v29.Position - humanoidRootPart.Position).Magnitude <= tbl18.Distance then
					fn24(v29)
					billboardGui.Enabled = true
					flag14 = true
				else
					local flag15 = v27 and (not v29 or not humanoidRootPart or (v29.Position - humanoidRootPart.Position).Magnitude > tbl18.Distance)
					flag14 = false

					if flag15 then
						v27 = nil
					end
				end

				n26 += ((flag14 and tbl18.Transparency or 1) - n26) * math.clamp(deltaTime * 10, 0, 1)
				rotation = (rotation + deltaTime * tbl18.RotationSpeed + math.sin(tick() * 1.8) * deltaTime * 8) % 360

				if imageLabel2 then
					imageLabel2.Image = tbl18.Image
					local color3 = tbl18.UseGrabColor and flag11 and v27 and v27.Character and v24 == v27.Character and color or tbl18.Color
					imageLabel2.ImageColor3 = color3
					imageLabel2.ImageTransparency = math.clamp(n26, 0, 1)
					imageLabel2.Size = UDim2.fromScale(1, 1)
					imageLabel2.Rotation = rotation
					local shimmerGradient = imageLabel2:FindFirstChild("ShimmerGradient")

					if not shimmerGradient then
						shimmerGradient = Instance.new("UIGradient", imageLabel2)
						shimmerGradient.Name = "ShimmerGradient"
					end

					if tbl15.ShimmerEnabled ~= false then
						local n27 = tick() * (tbl15.ShimmerSpeed or 1)
						local shimmerIntensity = tbl15.ShimmerIntensity or 0.55
						local v30 = color3:Lerp(Color3.fromRGB(255, 255, 255), shimmerIntensity)
						local colorSequence = ColorSequence.new
						local tbl19 = {}
						local v31 = ColorSequenceKeypoint.new(0, color3)
						local v32 = ColorSequenceKeypoint.new(0.5, v30)
						local new = ColorSequenceKeypoint.new
						tbl19[1] = v31
						tbl19[2] = v32

						do
							local values = table.pack(new(1, color3))
							table.move(values, 1, values.n, 3, tbl19)
						end

						shimmerGradient.Color = colorSequence(tbl19)
						shimmerGradient.Offset = Vector2.new(math.sin(n27 * 2.2) * 0.35, math.cos(n27 * 1.5) * 0.35)
						shimmerGradient.Rotation = (rotation + 30) % 360
						shimmerGradient.Enabled = true
					else
						shimmerGradient.Enabled = false
					end
				end

				if billboardGui and not flag14 and n26 > 0.985 then
					billboardGui.Enabled = false
				end
			end)

			Players.PlayerRemoving:Connect(function(player)
				if player == v27 then
					v27 = nil

					if billboardGui then
						billboardGui.Enabled = false
					end
				end
			end)

			local v28 = v17:Section({ Title = "Target ESP" })

			v28:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag13 = arg

					if not arg then
						fn23()
					end
				end,
			})

			v28:Dropdown({
				Title = "Targeting",
				Values = { "Center", "Cursor" },
				Value = "Center",
				Callback = function(mode)
					tbl18.Mode = mode
				end,
			})

			v28:Colorpicker({
				Title = "Color",
				Default = tbl18.Color,
				Callback = function(color3)
					tbl18.Color = color3
				end,
			})

			v28:Toggle({
				Title = "Use Aiming ESP Color",
				Value = false,
				Callback = function(useGrabColor)
					tbl18.UseGrabColor = useGrabColor
				end,
			})

			v28:Slider({
				Title = "Distance",
				Value = { Min = 10, Max = 350, Default = 120 },
				Callback = function(distance)
					tbl18.Distance = distance
				end,
			})

			v28:Slider({
				Title = "Look Radius",
				Value = { Min = 40, Max = 650, Default = 300 },
				Callback = function(lookRadius)
					tbl18.LookRadius = lookRadius
				end,
			})

			v28:Slider({
				Title = "Size",
				Value = { Min = 45, Max = 260, Default = 118 },
				Callback = function(size)
					tbl18.Size = size
				end,
			})

			v28:Slider({
				Title = "Vertical Offset",
				Value = { Min = -20, Max = 40, Default = 0 },
				Callback = function(arg)
					tbl18.Offset = arg / 10
				end,
			})

			v28:Slider({
				Title = "Rotation Speed",
				Value = { Min = 0, Max = 300, Default = 75 },
				Callback = function(rotationSpeed)
					tbl18.RotationSpeed = rotationSpeed
				end,
			})

			v28:Slider({
				Title = "Transparency",
				Value = { Min = 0, Max = 90, Default = 0 },
				Callback = function(arg)
					tbl18.Transparency = arg / 100
				end,
			})

			local v29 = v17:Section({ Title = "Hitbox" })

			v29:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					visible = arg
					fn22()
				end,
			})

			v29:Colorpicker({
				Title = "Color",
				Default = color2,
				Callback = function(arg)
					color2 = arg
					fn22()
				end,
			})

			v29:Slider({
				Title = "Transparency",
				Value = { Min = 0, Max = 95, Default = 0 },
				Callback = function(arg)
					transparency = arg / 100
				end,
			})

			v29:Slider({
				Title = "Thickness",
				Value = { Min = 1, Max = 20, Default = 5 },
				Callback = function(arg)
					lineThickness = arg / 100
				end,
			})

			v29:Toggle({
				Title = "Smooth Glow",
				Value = false,
				Callback = function(arg)
					flag12 = arg
					fn22()
				end,
			})

			v29:Slider({
				Title = "Glow Transparency",
				Value = { Min = 55, Max = 98, Default = 88 },
				Callback = function(arg)
					n25 = arg / 100
				end,
			})

			RunService.Heartbeat:Connect(function()
				if not visible then
					for _, v30 in pairs(tbl16) do
						for _, v31 in pairs(v30) do
							if v31 then
								v31.Visible = false
							end
						end
					end

					for _, v30 in pairs(tbl17) do
						for _, v31 in pairs(v30) do
							if v31 then
								v31.Visible = false
							end
						end
					end

					return
				end

				local n27 = 0.5 + 0.5 * math.sin(tick() * 3)

				for _, player in pairs(Players:GetPlayers()) do
					if not (player == localPlayer and not tbl15.IncludeLocal) then
						local character = player.Character

						if not character then
							tbl16[player] = nil
							tbl17[player] = nil
						else
							tbl16[player] = tbl16[player] or {}
							tbl17[player] = tbl17[player] or {}
							local color3 = visible and flag11 and v24 and character == v24 and color or color2

							for _, child in ipairs(character:GetChildren()) do
								if child:IsA("BasePart") and not child.Parent:IsA("Accessory") then
									local selectionBox = tbl16[player][child]

									if not selectionBox then
										selectionBox = Instance.new("SelectionBox")
										selectionBox.Name = "WraithHitbox"
										selectionBox.Adornee = child
										selectionBox.Parent = child
										tbl16[player][child] = selectionBox
									end

									selectionBox.Color3 = color3
									selectionBox.Visible = visible
									selectionBox.Transparency = transparency
									selectionBox.LineThickness = lineThickness
									local selectionBox2 = tbl17[player][child]

									if visible and flag12 then
										if not selectionBox2 then
											selectionBox2 = Instance.new("SelectionBox")
											selectionBox2.Name = "WraithHitboxSoftGlow"
											selectionBox2.Adornee = child
											selectionBox2.Parent = child
											tbl17[player][child] = selectionBox2
										end

										selectionBox2.Color3 = color3
										selectionBox2.Visible = true
										selectionBox2.Transparency = math.clamp(n25 + n27 * 0.04, 0, 1)
										selectionBox2.LineThickness = lineThickness * (1.8 + n27 * 0.35)
									elseif selectionBox2 then
										selectionBox2:Destroy()
										tbl17[player][child] = nil
									end
								end
							end
						end
					end
				end
			end)

			Players.PlayerRemoving:Connect(function(player)
				if tbl17[player] then
					for _, v30 in pairs(tbl17[player]) do
						if v30 then
							v30:Destroy()
						end
					end
				end

				tbl17[player] = nil
				tbl16[player] = nil
			end)
		end

		do
			local flag11 = false
			local flag12 = false
			local color = Color3.fromRGB(255, 255, 255)
			local n24 = 5.5
			local n25 = 2.2
			local n26 = 0.75
			local tbl16 = {}
			local folder = Instance.new("Folder")
			folder.Name = "WraithWalkDirection"
			folder.Parent = Workspace
			local image = "rbxassetid://107466177907852"

			local function fn22(player)
				local v24 = tbl16[player]

				if v24 then
					for _, v25 in pairs(v24) do
						if typeof(v25) == "Instance" then
							pcall(function()
								v25:Destroy()
							end)
						end
					end

					tbl16[player] = nil
				end
			end

			local function fn23(arg)
				local v24 = tbl16[arg]
				if v24 and v24.part and v24.part.Parent then
					return v24
				end
				fn22(arg)
				local part2 = Instance.new("Part")
				part2.Name = "WalkGroundArrow"
				part2.Anchored = true
				part2.CanCollide = false
				part2.CanTouch = false
				part2.CanQuery = false
				part2.Transparency = 1
				part2.Size = Vector3.new(n25, 0.05, n25)
				part2.Parent = folder
				local surfaceGui = Instance.new("SurfaceGui", part2)
				surfaceGui.Face = Enum.NormalId.Top
				surfaceGui.AlwaysOnTop = true
				surfaceGui.LightInfluence = 0
				surfaceGui.SizingMode = Enum.SurfaceGuiSizingMode.PixelsPerStud
				surfaceGui.PixelsPerStud = 64
				local imageLabel2 = Instance.new("ImageLabel", surfaceGui)
				imageLabel2.BackgroundTransparency = 1
				imageLabel2.Size = UDim2.fromScale(1, 1)
				imageLabel2.Image = image
				imageLabel2.ImageColor3 = color
				imageLabel2.ImageTransparency = 1
				imageLabel2.Rotation = 180
				local tbl17 = { part = part2, gui = surfaceGui, img = imageLabel2, lastPos = nil, dir = nil, alpha = 1 }
				tbl16[arg] = tbl17
				return tbl17
			end

			RunService.RenderStepped:Connect(function(deltaTime)
				if not flag11 then
					for k in pairs(tbl16) do
						fn22(k)
					end

					return
				end

				for _, player in ipairs(Players:GetPlayers()) do
					if player == localPlayer and not flag12 then
						fn22(player)
					else
						local character = player.Character
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
						character = character and character:FindFirstChildOfClass("Humanoid")

						if not humanoidRootPart or not character or character.Health <= 0 then
							fn22(player)
						else
							local v24 = fn23(player)
							local assemblyLinearVelocity = humanoidRootPart.AssemblyLinearVelocity or humanoidRootPart.Velocity or Vector3.zero
							local vector = Vector3.new(assemblyLinearVelocity.X, 0, assemblyLinearVelocity.Z)

							if v24.lastPos then
								local n27 = humanoidRootPart.Position - v24.lastPos
								local n28 = Vector3.new(n27.X, 0, n27.Z) / math.max(deltaTime, 0.0041666666666666666)

								if vector.Magnitude < n28.Magnitude then
									vector = n28
								end
							end

							v24.lastPos = humanoidRootPart.Position
							local flag13 = vector.Magnitude > n26

							if flag13 then
								local unit = vector.Unit
								v24.dir = v24.dir and v24.dir:Lerp(unit, math.clamp(deltaTime * 7, 0, 1)) or unit

								if v24.dir.Magnitude > 0.001 then
									unit = v24.dir.Unit
								end

								local n27 = humanoidRootPart.Position - Vector3.new(0, 2.75, 0) + unit * n24
								v24.part.Size = Vector3.new(n25, 0.05, n25)
								v24.part.CFrame = CFrame.lookAt(n27, n27 + unit) * CFrame.Angles(0, 1.5707963267948966, 0)
								v24.img.ImageColor3 = color
							end

							v24.alpha = v24.alpha + ((flag13 and 0.08 or 1) - v24.alpha) * math.clamp(deltaTime * 8, 0, 1)
							v24.img.ImageTransparency = v24.alpha
						end
					end
				end
			end)

			Players.PlayerRemoving:Connect(fn22)
			local v24 = v17:Section({ Title = "Walk Direction" })

			v24:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if not arg then
						for k in pairs(tbl16) do
							fn22(k)
						end
					end
				end,
			})

			v24:Toggle({
				Title = "Apply to Local Player",
				Value = false,
				Callback = function(arg)
					flag12 = arg

					if not arg then
						fn22(localPlayer)
					end
				end,
			})

			v24:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg
				end,
			})

			v24:Slider({
				Title = "Distance",
				Value = { Min = 2, Max = 12, Default = 6 },
				Callback = function(arg)
					n24 = arg
				end,
			})

			v24:Slider({
				Title = "Arrow Size",
				Value = { Min = 10, Max = 45, Default = 22 },
				Callback = function(arg)
					n25 = arg / 10
				end,
			})

			v24:Slider({
				Title = "Min Speed",
				Value = { Min = 0, Max = 50, Default = 8 },
				Callback = function(arg)
					n26 = arg / 10
				end,
			})
		end

		do
			local flag11 = false
			local n24 = 1
			local n25 = 80
			local n26 = 24
			local n27 = 2000
			local color = Color3.fromRGB(255, 255, 255)
			local flag12 = true
			local tbl16 = {}
			local connection = nil
			local screenGui2 = nil
			local connection2 = nil
			local tbl17 = { "rbxassetid://107466177907852", "rbxassetid://73377822137093" }

			local function fn22(arg)
				local character = arg.Character
				return character and character:FindFirstChild("HumanoidRootPart")
			end

			local function fn23(arg)
				local character = arg.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				return humanoid and humanoid.Health > 0
			end

			local function fn24()
				if not screenGui2 or not screenGui2.Parent then
					screenGui2 = Instance.new("ScreenGui")
					screenGui2.Name = "WraithScreenArrows"
					screenGui2.ResetOnSpawn = false
					screenGui2.IgnoreGuiInset = true
					screenGui2.DisplayOrder = 999998
					screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
					screenGui2.Parent = playerGui
				end

				return screenGui2
			end

			local function fn25(player)
				if tbl16[player] then
					pcall(function()
						tbl16[player]:Destroy()
					end)

					tbl16[player] = nil
				end
			end

			local function fn26()
				if connection then
					connection:Disconnect()
					connection = nil
				end

				if connection2 then
					connection2:Disconnect()
					connection2 = nil
				end

				for k in pairs(tbl16) do
					fn25(k)
				end

				if screenGui2 then
					screenGui2:Destroy()
					screenGui2 = nil
				end
			end

			local function fn27(arg)
				local v24 = fn24()
				local imageLabel2 = tbl16[arg]

				if not imageLabel2 or not imageLabel2.Parent then
					imageLabel2 = Instance.new("ImageLabel")
					imageLabel2.Name = "Arrow_" .. arg.Name
					imageLabel2.AnchorPoint = Vector2.new(0.5, 0.5)
					imageLabel2.BackgroundTransparency = 1
					imageLabel2.BorderSizePixel = 0
					imageLabel2.Image = tbl17[n24] or tbl17[1]
					imageLabel2.ImageColor3 = color
					imageLabel2.ImageTransparency = 0
					imageLabel2.ZIndex = 80
					local uiGradient = Instance.new("UIGradient")
					uiGradient.Name = "ShimmerGradient"
					uiGradient.Parent = imageLabel2
					imageLabel2.Parent = v24
					tbl16[arg] = imageLabel2
				end

				return imageLabel2
			end

			local function fn28()
				for _, v24 in pairs(tbl16) do
					if v24 and v24.Parent then
						v24.Image = tbl17[n24] or tbl17[1]
						v24.ImageColor3 = color
						v24.Size = UDim2.fromOffset(n26, n26)
					end
				end
			end

			local function fn29()
				if connection then
					return
				end
				fn24()
				connection2 = Players.PlayerRemoving:Connect(fn25)

				connection = RunService.RenderStepped:Connect(function()
					if not flag11 then
						fn26()
						return
					end
					local currentCamera2 = Workspace.CurrentCamera
					if not currentCamera2 then
						return
					end
					local viewportSize = currentCamera2.ViewportSize
					local n28 = viewportSize.X * 0.5
					local n29 = viewportSize.Y * 0.5
					local v24 = fn22(localPlayer)

					if not v24 then
						for _, v25 in pairs(tbl16) do
							if v25 and v25.Parent then
								v25.Visible = false
							end
						end

						return
					end

					for _, player in ipairs(Players:GetPlayers()) do
						if player == localPlayer or not fn23(player) then
							if tbl16[player] then
								tbl16[player].Visible = false
							end
						else
							local v25 = fn22(player)

							if not v25 then
								if tbl16[player] then
									tbl16[player].Visible = false
								end
							elseif n27 < (v25.Position - v24.Position).Magnitude then
								if tbl16[player] then
									tbl16[player].Visible = false
								end
							else
								local v26 = currentCamera2.CFrame:PointToObjectSpace(v25.Position)
								local v27 = math.deg(math.atan2(v26.X, -v26.Z))
								local v28 = math.rad(v27)
								local v29 = fn27(player)
								v29.Size = UDim2.fromOffset(n26, n26)
								v29.Position = UDim2.fromOffset(n28 + math.sin(v28) * n25, n29 - math.cos(v28) * n25)
								v29.Rotation = v27
								v29.ImageColor3 = color
								v29.Visible = true
								local shimmerGradient = v29:FindFirstChild("ShimmerGradient")

								if shimmerGradient then
									local enabled = flag12 and tbl15.ShimmerEnabled ~= false
									shimmerGradient.Enabled = enabled

									if enabled then
										local n30 = tick() * (tbl15.ShimmerSpeed or 1)
										local v30 = color
										local shimmerIntensity = tbl15.ShimmerIntensity or 0.4
										local colorSequence = ColorSequence.new
										local tbl18 = {}
										local v31 = ColorSequenceKeypoint.new(0, v30:Lerp(Color3.new(0, 0, 0), 0.25))
										local v32 = ColorSequenceKeypoint.new(0.5, v30:Lerp(Color3.new(1, 1, 1), shimmerIntensity))
										local new = ColorSequenceKeypoint.new
										local v33 = v30
										local lerp = v33.Lerp
										local color2 = Color3.new(1, 1, 1)
										tbl18[1] = v31
										tbl18[2] = v32

										do
											local values = table.pack(new(1, lerp(v33, color2, 0.1)))
											table.move(values, 1, values.n, 3, tbl18)
										end

										shimmerGradient.Color = colorSequence(tbl18)
										shimmerGradient.Offset = Vector2.new(math.sin(n30 * 2.5) * 0.2, math.cos(n30 * 1.8) * 0.2)
										shimmerGradient.Rotation = n30 * 55 % 360
									end
								end
							end
						end
					end
				end)
			end

			local v24 = v17:Section({ Title = "Screen Arrows" })

			v24:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if arg then
						fn29()
					else
						fn26()
					end
				end,
			})

			v24:Dropdown({
				Title = "Arrow Mode",
				Values = { "Mode 1", "Mode 2" },
				Value = "Mode 1",
				Callback = function(arg)
					n24 = arg == "Mode 2" and 2 or 1
					fn28()
				end,
			})

			v24:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg
					fn28()
				end,
			})

			v24:Slider({
				Title = "Radius",
				Value = { Min = 30, Max = 240, Default = 80 },
				Callback = function(arg)
					n25 = arg
				end,
			})

			v24:Slider({
				Title = "Size",
				Value = { Min = 12, Max = 64, Default = 24 },
				Callback = function(arg)
					n26 = arg
					fn28()
				end,
			})

			v24:Slider({
				Title = "Max Distance",
				Value = { Min = 100, Max = 5000, Default = 2000 },
				Callback = function(arg)
					n27 = arg
				end,
			})

			v24:Toggle({
				Title = "Shimmer",
				Value = true,
				Callback = function(arg)
					flag12 = arg
				end,
			})
		end

		do
			local flag11 = false
			local tbl16 = {}
			local color = Color3.fromRGB(168, 85, 247)
			local visible = false
			local transparency = 0.65
			local n24 = 0.22
			local n25 = 500

			local function fn22(arg)
				if not arg or not arg.Parent then
					return false
				end
				local v24 = string.lower(arg.Name)
				if v24 == "wraithpcldproxy" or v24 == "wraithparticlebox" or v24 == "wraithparticleglow" then
					return false
				end

				if v24 == "partesp" or v24 == "playercharacterlocationdetector" or v24:find("locationdetector") or v24:find("partesp") then
					return true
				end

				if arg:IsA("ParticleEmitter") then
					return v24:find("pcld", 1, true) ~= nil or v24:find("location", 1, true) ~= nil or v24:find("partesp", 1, true) ~= nil
				end

				if arg:IsA("BasePart") and (v24:find("pcld", 1, true) or v24 == "partesp" or v24 == "playercharacterlocationdetector") then
					return true
				end
				return false
			end

			local function fn23(arg)
				if arg:IsA("BasePart") then
					return arg
				end

				if arg:IsA("ParticleEmitter") and arg.Parent and arg.Parent:IsA("BasePart") then
					return arg.Parent
				end
				return nil
			end

			local function fn24(arg)
				local v24 = tbl16[arg]

				if v24 then
					pcall(function()
						if v24.Box then
							v24.Box:Destroy()
						end
					end)

					pcall(function()
						if v24.Glow then
							v24.Glow:Destroy()
						end
					end)

					pcall(function()
						if v24.Proxy then
							v24.Proxy:Destroy()
						end
					end)

					tbl16[arg] = nil
				end
			end

			local function createPart(arg)
				local part2 = Instance.new("Part")
				part2.Name = "WraithPCLDProxy"
				part2.Anchored = true
				part2.CanCollide = false
				part2.CanTouch = false
				part2.CanQuery = false
				part2.Transparency = 1
				part2.Size = arg.Size
				part2.CFrame = arg.CFrame
				part2.Parent = Workspace
				return part2
			end

			local function fn25(arg)
				if tbl16[arg] then
					return
				end
				local v24 = fn23(arg)
				if not v24 then
					return
				end
				local v25 = createPart(v24)
				local selectionBox = Instance.new("SelectionBox")
				selectionBox.Name = "WraithParticleBox"
				selectionBox.Adornee = v25
				selectionBox.Color3 = color
				selectionBox.Transparency = transparency
				selectionBox.LineThickness = 0.04
				selectionBox.Parent = playerGui
				local selectionBox2 = Instance.new("SelectionBox")
				selectionBox2.Name = "WraithParticleGlow"
				selectionBox2.Adornee = v25
				selectionBox2.Color3 = color
				selectionBox2.Transparency = 0.92
				selectionBox2.LineThickness = 0.085
				selectionBox2.Visible = visible
				selectionBox2.Parent = playerGui
				tbl16[arg] = { Box = selectionBox, Glow = selectionBox2, Part = v24, Proxy = v25 }

				v24.AncestryChanged:Connect(function(child, parent)
					if not parent and tbl16[arg] then
						fn24(arg)
					end
				end)
			end

			local function fn26(deltaTime)
				if not flag11 then
					for k in pairs(tbl16) do
						fn24(k)
					end

					return
				end

				local currentCamera2 = Workspace.CurrentCamera
				if not currentCamera2 then
					return
				end
				local position = currentCamera2.CFrame.Position

				for k, v24 in pairs(tbl16) do
					local part2 = v24.Part

					if part2 and part2.Parent and v24.Proxy then
						local magnitude = (part2.Position - position).Magnitude
						local visible2 = magnitude > 0.5 and magnitude <= n25
						v24.Box.Visible = visible2

						if v24.Glow then
							v24.Glow.Visible = visible2 and visible
						end

						if visible2 then
							v24.Proxy.Size = v24.Proxy.Size:Lerp(part2.Size, math.clamp(deltaTime / (n24 + 0.001), 0, 1))
							v24.Proxy.CFrame = v24.Proxy.CFrame:Lerp(part2.CFrame, math.clamp(deltaTime / (n24 + 0.001), 0, 1))
							v24.Box.Visible = true

							if v24.Box:IsA("Highlight") then
								v24.Box.FillColor = color
								v24.Box.OutlineColor = color
								v24.Box.FillTransparency = math.clamp(transparency, 0, 0.95)
							else
								v24.Box.Color3 = color
								v24.Box.Transparency = transparency
							end

							if v24.Glow then
								v24.Glow.Visible = visible
								v24.Glow.Color3 = color
								v24.Glow.Transparency = 0.92
							end
						end
					else
						fn24(k)
					end
				end
			end

			local function fn27()
				if not flag11 then
					return
				end

				for _, descendant in ipairs(Workspace:GetDescendants()) do
					if fn22(descendant) then
						local currentCamera2 = Workspace.CurrentCamera
						local v24 = fn23(descendant)

						if currentCamera2 and v24 and (v24.Position - currentCamera2.CFrame.Position).Magnitude <= n25 then
							fn25(descendant)
						end
					end
				end
			end

			Workspace.DescendantAdded:Connect(function(descendant)
				if flag11 and fn22(descendant) then
					task.defer(fn25, descendant)
				end
			end)

			Workspace.DescendantRemoving:Connect(function(descendant)
				if tbl16[descendant] then
					fn24(descendant)
				end
			end)

			RunService.PreRender:Connect(fn26)
			local v24 = v17:Section({ Title = "PCLD ESP" })

			v24:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if arg then
						fn27()
					else
						for k in pairs(tbl16) do
							fn24(k)
						end
					end
				end,
			})

			v24:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg
				end,
			})

			v24:Slider({
				Title = "Transparency",
				Value = { Min = 0, Max = 95, Default = 65 },
				Callback = function(arg)
					transparency = arg / 100
				end,
			})

			v24:Toggle({
				Title = "Smooth Glow",
				Value = false,
				Callback = function(arg)
					visible = arg
				end,
			})

			v24:Slider({
				Title = "Move Smooth",
				Value = { Min = 1, Max = 80, Default = 22 },
				Callback = function(arg)
					n24 = arg / 100
				end,
			})

			v24:Slider({
				Title = "Max Distance",
				Value = { Min = 50, Max = 1500, Default = 500 },
				Callback = function(arg)
					n25 = arg
				end,
			})
		end

		do
			local enabled = false
			local flag11 = true
			local color = Color3.fromRGB(255, 255, 255)
			local backgroundTransparency = 0.12
			local n24 = 100
			local str5 = "Compact"
			local tbl16 = {}
			local tbl17 = {}

			local function fn22(arg)
				if tbl16[arg] then
					pcall(function()
						tbl16[arg]:Destroy()
					end)

					tbl16[arg] = nil
				end
			end

			local function fn23()
				for k in pairs(tbl16) do
					fn22(k)
				end
			end

			local function fn24()
				return (str5 == "Wide" and 170 or str5 == "Minimal" and 112 or 132) * n24 / 100, (str5 == "Minimal" and 24 or 34) * n24 / 100
			end

			local function fn25(arg)
				if arg == localPlayer and not tbl15.IncludeLocal then
					fn22(arg)
					return
				end
				local character = arg.Character
				local head = character and character:FindFirstChild("Head")
				character = character and character:FindFirstChildOfClass("Humanoid")
				if not head or not character or character.Health <= 0 then
					fn22(arg)
					return
				end
				local v24, v25 = fn24()
				local billboardGui = tbl16[arg]

				if not billboardGui or billboardGui.Adornee ~= head or not billboardGui.Parent then
					fn22(arg)
					billboardGui = Instance.new("BillboardGui")
					billboardGui.Name = "WraithNameTag"
					billboardGui.Adornee = head
					billboardGui.AlwaysOnTop = true
					billboardGui.LightInfluence = 0
					billboardGui.ResetOnSpawn = false
					billboardGui.Size = UDim2.fromOffset(v24, v25)
					billboardGui.StudsOffsetWorldSpace = Vector3.new(0, 1.9, 0)
					billboardGui.Parent = playerGui
					tbl16[arg] = billboardGui
					local frame4 = Instance.new("Frame", billboardGui)
					frame4.Name = "Bg"
					frame4.Size = UDim2.fromScale(1, 1)
					frame4.BackgroundColor3 = Color3.fromRGB(5, 5, 7)
					frame4.BorderSizePixel = 0
					Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, str5 == "Minimal" and 8 or 10)
					local uiStroke = Instance.new("UIStroke", frame4)
					uiStroke.Name = "Stroke"
					uiStroke.Color = Color3.fromRGB(60, 60, 68)
					uiStroke.Transparency = 0.2
					local textLabel = Instance.new("TextLabel", frame4)
					textLabel.Name = "Name"
					textLabel.BackgroundTransparency = 1
					textLabel.Font = Enum.Font.GothamBold
					textLabel.TextColor3 = color
					textLabel.TextTruncate = Enum.TextTruncate.AtEnd
					local frame5 = Instance.new("Frame", frame4)
					frame5.Name = "BarBg"
					frame5.BackgroundColor3 = Color3.fromRGB(30, 30, 35)
					frame5.BorderSizePixel = 0
					Instance.new("UICorner", frame5).CornerRadius = UDim.new(1, 0)
					local frame6 = Instance.new("Frame", frame5)
					frame6.Name = "Bar"
					frame6.Size = UDim2.fromScale(1, 1)
					frame6.BackgroundColor3 = Color3.fromRGB(80, 255, 140)
					frame6.BorderSizePixel = 0
					Instance.new("UICorner", frame6).CornerRadius = UDim.new(1, 0)
				end

				billboardGui.Size = UDim2.fromOffset(v24, v25)
				billboardGui.Enabled = enabled
				local bg = billboardGui:FindFirstChild("Bg")
				if not bg then
					return
				end
				bg.BackgroundTransparency = backgroundTransparency
				local name = bg:FindFirstChild("Name")
				local barBg = bg:FindFirstChild("BarBg")
				local bar = barBg and barBg:FindFirstChild("Bar")

				if str5 == "Minimal" then
					if name then
						name.Position = UDim2.fromOffset(7, 0)
						name.Size = UDim2.new(1, -14, 1, 0)
						name.TextSize = 10 * n24 / 100
						name.Text = flag11 and arg.DisplayName or arg.Name
						name.TextColor3 = color
					end

					if barBg then
						barBg.Visible = false
					end
				else
					if name then
						name.Position = UDim2.fromOffset(8, 2)
						name.Size = UDim2.new(1, -16, 0, 18 * n24 / 100)
						name.TextSize = (str5 == "Wide" and 12 or 11) * n24 / 100
						name.Text = flag11 and arg.DisplayName or arg.Name
						name.TextColor3 = color
					end

					if barBg then
						barBg.Visible = true
						barBg.Position = UDim2.fromOffset(8, v25 - 10)
						barBg.Size = UDim2.new(1, -16, 0, 4)
					end
				end

				local n25 = math.clamp(character.Health / math.max(character.MaxHealth, 1), 0, 1)

				if bar then
					bar.Size = UDim2.fromScale(n25, 1)
					bar.BackgroundColor3 = n25 < 0.35 and Color3.fromRGB(255, 75, 85) or Color3.fromRGB(80, 255, 140)
				end
			end

			local function fn26(player)
				if tbl17[player] then
					for _, v24 in ipairs(tbl17[player]) do
						if v24 and v24.Connected then
							v24:Disconnect()
						end
					end
				end

				tbl17[player] = {}

				table.insert(tbl17[player], player.CharacterAdded:Connect(function()
					fn22(player)

					task.delay(0.3, function()
						if enabled then
							fn25(player)
						end
					end)
				end))

				table.insert(tbl17[player], player.CharacterRemoving:Connect(function()
					fn22(player)
				end))
			end

			for _, player in ipairs(Players:GetPlayers()) do
				fn26(player)
			end

			Players.PlayerAdded:Connect(fn26)

			Players.PlayerRemoving:Connect(function(player)
				fn22(player)

				if tbl17[player] then
					for _, v24 in ipairs(tbl17[player]) do
						if v24 and v24.Connected then
							v24:Disconnect()
						end
					end
				end

				tbl17[player] = nil
			end)

			RunService.RenderStepped:Connect(function()
				if not enabled then
					for _, v24 in pairs(tbl16) do
						v24.Enabled = false
					end

					return
				end

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer or tbl15.IncludeLocal then
						fn25(player)
					end
				end
			end)

			local v24 = v17:Section({ Title = "NameTags" })

			v24:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					enabled = arg

					if arg then
						fn23()
					else
						for _, v25 in pairs(tbl16) do
							v25.Enabled = false
						end
					end
				end,
			})

			v24:Toggle({
				Title = "DisplayName",
				Value = true,
				Callback = function(arg)
					flag11 = arg
				end,
			})

			v24:Colorpicker({
				Title = "Text Color",
				Default = color,
				Callback = function(arg)
					color = arg
				end,
			})

			v24:Slider({
				Title = "Background Transparency",
				Value = { Min = 0, Max = 95, Default = 12 },
				Callback = function(arg)
					backgroundTransparency = arg / 100
				end,
			})

			v24:Slider({
				Title = "Size",
				Value = { Min = 70, Max = 160, Default = 100 },
				Callback = function(arg)
					n24 = arg
					fn23()
				end,
			})

			v24:Dropdown({
				Title = "Style",
				Values = { "Compact", "Wide", "Minimal" },
				Value = "Compact",
				Callback = function(arg)
					str5 = arg
					fn23()
				end,
			})
		end

		do
			local flag11 = false
			local flag12 = false
			local color = Color3.fromRGB(255, 255, 255)
			local n24 = 1
			local screenGui2 = Instance.new("ScreenGui")
			screenGui2.Name = "WraithBoxSkeletonESP"
			screenGui2.IgnoreGuiInset = true
			screenGui2.ResetOnSpawn = false
			screenGui2.DisplayOrder = 999994
			screenGui2.Parent = playerGui
			local tbl16 = {}

			local tbl17 = {
				{ "Head", "UpperTorso" },
				{ "UpperTorso", "LowerTorso" },
				{ "UpperTorso", "LeftUpperArm" },
				{ "LeftUpperArm", "LeftLowerArm" },
				{ "LeftLowerArm", "LeftHand" },
				{ "UpperTorso", "RightUpperArm" },
				{ "RightUpperArm", "RightLowerArm" },
				{ "RightLowerArm", "RightHand" },
				{ "LowerTorso", "LeftUpperLeg" },
				{ "LeftUpperLeg", "LeftLowerLeg" },
				{ "LeftLowerLeg", "LeftFoot" },
				{ "LowerTorso", "RightUpperLeg" },
				{ "RightUpperLeg", "RightLowerLeg" },
				{ "RightLowerLeg", "RightFoot" },
			}

			local tbl18 = {
				{ "Head", "Torso" },
				{ "Torso", "Left Arm" },
				{ "Torso", "Right Arm" },
				{ "Torso", "Left Leg" },
				{ "Torso", "Right Leg" },
			}

			local function createFrame(arg)
				local frame4 = Instance.new("Frame", arg)
				frame4.AnchorPoint = Vector2.new(0.5, 0.5)
				frame4.BackgroundColor3 = color
				frame4.BorderSizePixel = 0
				frame4.Visible = false
				return frame4
			end

			local function fn22(arg)
				local v24 = tbl16[arg]
				if v24 then
					return v24
				end
				local folder = Instance.new("Folder", screenGui2)
				folder.Name = arg.Name
				local tbl19 = {}

				for i = 1, 24 do
					tbl19[i] = createFrame(folder)
				end

				local tbl20 = { folder = folder, lines = tbl19 }
				tbl16[arg] = tbl20
				return tbl20
			end

			local function fn23(arg)
				if arg then
					for _, line in ipairs(arg.lines) do
						line.Visible = false
					end
				end
			end

			local function fn24()
				for _, v24 in pairs(tbl16) do
					fn23(v24)
				end
			end

			local function fn25(arg, arg2, arg3, arg4)
				local n25 = arg3.X - arg2.X
				local n26 = arg3.Y - arg2.Y
				arg.Size = UDim2.fromOffset(math.sqrt(n25 * n25 + n26 * n26), math.max(1, arg4 or n24))
				arg.Position = UDim2.fromOffset((arg2.X + arg3.X) / 2, (arg2.Y + arg3.Y) / 2)
				arg.Rotation = math.deg(math.atan2(n26, n25))
				arg.BackgroundColor3 = color
				arg.Visible = true
			end

			local function fn26(arg, arg2)
				local v24, v25 = arg:WorldToViewportPoint(arg2)
				if v25 and v24.Z > 0 then
					local z = v24.Z
					return Vector2.new(v24.X, v24.Y), z
				end
			end

			RunService.RenderStepped:Connect(function()
				if not flag11 and not flag12 then
					fn24()
					return
				end
				local currentCamera2 = Workspace.CurrentCamera
				if not currentCamera2 then
					return
				end

				for _, player in ipairs(Players:GetPlayers()) do
					if not (player == localPlayer and not tbl15.IncludeLocal) then
						local v24 = fn22(player)
						local character = player.Character
						local humanoid = character and character:FindFirstChildOfClass("Humanoid")
						local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

						if not character or not humanoid or humanoid.Health <= 0 or not humanoidRootPart then
							fn23(v24)
						else
							local n25 = 1

							if flag11 then
								local head = character:FindFirstChild("Head")
								head = head and head.Position or humanoidRootPart.Position
								local n26 = humanoidRootPart.Position - Vector3.new(0, 3.15, 0)
								local v25 = fn26(currentCamera2, head + Vector3.new(0, 0.85, 0))
								local v26 = fn26(currentCamera2, n26)

								if v25 and v26 then
									local n27 = math.clamp(math.abs(v26.Y - v25.Y) * 0.48, 18, 260)
									local n28 = (v25.X + v26.X) / 2
									local y = v25.Y
									local y2 = v26.Y
									local vector2 = Vector2.new(n28 - n27 / 2, y)
									local vector22 = Vector2.new(n28 + n27 / 2, y)
									local vector23 = Vector2.new(n28 + n27 / 2, y2)
									local vector24 = Vector2.new(n28 - n27 / 2, y2)
									fn25(v24.lines[1], vector2, vector22, n24)
									fn25(v24.lines[2], vector22, vector23, n24)
									fn25(v24.lines[3], vector23, vector24, n24)
									fn25(v24.lines[4], vector24, vector2, n24)
									n25 = 5
								end
							end

							if flag12 then
								local tbl19 = {}

								for _, child in ipairs(character:GetChildren()) do
									if child:IsA("BasePart") then
										local v25 = fn26(currentCamera2, child.Position)

										if v25 then
											tbl19[child.Name] = v25
										end
									end
								end

								local upperTorso = tbl19.UpperTorso and tbl17 or tbl18

								for _, v25 in ipairs(upperTorso) do
									local v26 = tbl19[v25[1]]
									local v27 = tbl19[v25[2]]

									if v26 and v27 then
										fn25(v24.lines[n25], v26, v27, n24)
										n25 += 1
									end
								end
							end

							for i = n25, #v24.lines do
								v24.lines[i].Visible = false
							end
						end
					end
				end
			end)

			Players.PlayerRemoving:Connect(function(player)
				if tbl16[player] then
					tbl16[player].folder:Destroy()
					tbl16[player] = nil
				end
			end)

			local v24 = v17:Section({ Title = "Box / Skeleton ESP" })

			v24:Toggle({
				Title = "Box ESP",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if not arg then
						fn24()
					end
				end,
			})

			v24:Toggle({
				Title = "Skeleton ESP",
				Value = false,
				Callback = function(arg)
					flag12 = arg

					if not arg then
						fn24()
					end
				end,
			})

			v24:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg
				end,
			})

			v24:Slider({
				Title = "Thickness",
				Value = { Min = 1, Max = 4, Default = 1 },
				Callback = function(arg)
					n24 = arg
				end,
			})
		end

		do
			local flag11 = false
			local color = Color3.fromRGB(168, 85, 247)
			local highlight = nil

			local function fn22()
				local character = localPlayer.Character

				if flag11 and character then
					if not highlight or highlight.Parent ~= character then
						if highlight then
							highlight:Destroy()
						end

						highlight = Instance.new("Highlight")
						highlight.Name = "WraithLocalSelfChams"
						highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
						highlight.Parent = character
					end

					highlight.FillColor = color
					highlight.OutlineColor = color
					highlight.FillTransparency = 0.82
					highlight.OutlineTransparency = 0.08
					highlight.Enabled = true
				elseif highlight then
					highlight:Destroy()
					highlight = nil
				end
			end

			RunService.RenderStepped:Connect(fn22)

			localPlayer.CharacterAdded:Connect(function()
				task.wait(0.25)
				fn22()
			end)

			local v24 = v21:Section({ Title = "Self Visuals" })

			v24:Toggle({
				Title = "Apply ESP to Local Player",
				Value = fn18("includeLocal", false),
				Callback = function(includeLocal)
					tbl15.IncludeLocal = includeLocal
					fn17("includeLocal", includeLocal)

					if not includeLocal and localPlayer.Character then
						local wraithHighlight = localPlayer.Character:FindFirstChild("WraithHighlight")

						if wraithHighlight then
							wraithHighlight:Destroy()
						end
					end
				end,
			})

			v24:Toggle({
				Title = "Local Chams",
				Value = false,
				Callback = function(arg)
					flag11 = arg
					fn22()
				end,
			})

			v24:Colorpicker({
				Title = "Local Chams Color",
				Default = color,
				Callback = function(arg)
					color = arg
					fn22()
				end,
			})
		end

		do
			local enabled = false

			local tbl16 = {
				MaxDistance = 55,
				LookRadius = 125,
				UpdateRate = 0.035,
				Accent = Color3.fromRGB(0, 190, 95),
				Bg = Color3.fromRGB(12, 10, 18),
				StickyTime = 1.4,
			}

			local screenGui2 = nil
			local frame4 = nil
			local imageLabel2 = nil
			local textLabel = nil
			local textLabel2 = nil
			local frame5 = nil
			local frame6 = nil
			local v24 = nil
			local tbl17 = {}
			local n24 = 0
			local n25 = 0
			local flag11 = false
			local position = nil
			local position2 = nil
			local udim2 = UDim2.new(0.5, 0, 1, -88)

			local function fn22()
				if screenGui2 then
					screenGui2:Destroy()
				end

				screenGui2 = Instance.new("ScreenGui")
				screenGui2.Name = "WraithTargetHUD"
				screenGui2.IgnoreGuiInset = true
				screenGui2.ResetOnSpawn = false
				screenGui2.DisplayOrder = 999997
				screenGui2.Parent = playerGui
				screenGui2.Enabled = enabled
				frame4 = Instance.new("Frame", screenGui2)
				frame4.AnchorPoint = Vector2.new(0.5, 1)
				frame4.Position = udim2
				frame4.Size = UDim2.fromOffset(260, 78)
				frame4.BackgroundColor3 = tbl16.Bg
				frame4.BackgroundTransparency = 0.05
				frame4.BorderSizePixel = 0
				frame4.ClipsDescendants = true
				frame4.Visible = false
				Instance.new("UICorner", frame4).CornerRadius = UDim.new(0, 14)
				imageLabel2 = Instance.new("ImageLabel", frame4)
				imageLabel2.Position = UDim2.fromOffset(10, 10)
				imageLabel2.Size = UDim2.fromOffset(58, 58)
				imageLabel2.BackgroundColor3 = Color3.fromRGB(24, 20, 32)
				imageLabel2.BorderSizePixel = 0
				imageLabel2.ScaleType = Enum.ScaleType.Crop
				imageLabel2.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"
				Instance.new("UICorner", imageLabel2).CornerRadius = UDim.new(0, 10)
				textLabel = Instance.new("TextLabel", frame4)
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.fromOffset(76, 9)
				textLabel.Size = UDim2.new(1, -84, 0, 22)
				textLabel.Font = Enum.Font.GothamBold
				textLabel.TextSize = 15
				textLabel.TextColor3 = Color3.fromRGB(245, 242, 255)
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel2 = Instance.new("TextLabel", frame4)
				textLabel2.BackgroundTransparency = 1
				textLabel2.Position = UDim2.fromOffset(76, 30)
				textLabel2.Size = UDim2.new(1, -84, 0, 16)
				textLabel2.Font = Enum.Font.GothamMedium
				textLabel2.TextSize = 12
				textLabel2.TextColor3 = Color3.fromRGB(180, 172, 205)
				textLabel2.TextXAlignment = Enum.TextXAlignment.Left
				textLabel2.Text = "HP: --"
				frame5 = Instance.new("Frame", frame4)
				frame5.Position = UDim2.fromOffset(76, 50)
				frame5.Size = UDim2.new(1, -84, 0, 16)
				frame5.BackgroundColor3 = Color3.fromRGB(22, 18, 32)
				frame5.BorderSizePixel = 0
				Instance.new("UICorner", frame5).CornerRadius = UDim.new(0, 6)
				frame6 = Instance.new("Frame", frame5)
				frame6.Size = UDim2.fromScale(1, 1)
				frame6.BackgroundColor3 = tbl16.Accent
				frame6.BorderSizePixel = 0
				Instance.new("UICorner", frame6).CornerRadius = UDim.new(0, 6)
				Instance.new("UIGradient", frame6).Name = "ShimmerGradient"

				frame4.InputBegan:Connect(function(input)
					if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
						flag11 = true
						position = input.Position
						position2 = frame4.Position

						input.Changed:Connect(function()
							if input.UserInputState == Enum.UserInputState.End then
								flag11 = false
							end
						end)
					end
				end)

				UserInputService.InputChanged:Connect(function(input)
					local flag12 = flag11

					if flag11 then
						flag12 = input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch
					end

					if flag12 then
						local n26 = input.Position - position
						udim2 = UDim2.new(position2.X.Scale, position2.X.Offset + n26.X, position2.Y.Scale, position2.Y.Offset + n26.Y)
						frame4.Position = udim2
					end
				end)
			end

			fn22()

			local function fn23(arg)
				return arg < 0.3 and Color3.fromRGB(240, 65, 75) or arg < 0.6 and Color3.fromRGB(235, 170, 55) or tbl16.Accent
			end

			local function fn24()
				if not frame4.Visible then
					frame4.Visible = true
					frame4.Position = udim2 + UDim2.fromOffset(0, 20)
					frame4.BackgroundTransparency = 1
				end

				local tbl18 = { Position = udim2, BackgroundTransparency = 0.05 }
				TweenService:Create(frame4, TweenInfo.new(0.32, Enum.EasingStyle.Back, Enum.EasingDirection.Out), tbl18):Play()
			end

			local function fn25()
				TweenService:Create(frame4, TweenInfo.new(0.24, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Position = udim2 + UDim2.fromOffset(0, 20), BackgroundTransparency = 1 }):Play()

				task.delay(0.25, function()
					if frame4 and not v24 then
						frame4.Visible = false
					end
				end)
			end

			local function fn26(arg)
				if v24 == arg then
					return
				end
				v24 = arg
				n24 = 0
				textLabel.Text = arg.DisplayName
				imageLabel2.Image = tbl17[arg.UserId] or "rbxthumb://type=AvatarHeadShot&id=" .. tostring(arg.UserId) .. "&w=150&h=150"
				fn24()

				task.spawn(function()
					local ok, image = pcall(function()
						return Players:GetUserThumbnailAsync(arg.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size150x150)
					end)

					if ok and image then
						tbl17[arg.UserId] = image

						if v24 == arg then
							imageLabel2.Image = image
						end
					end
				end)
			end

			RunService.RenderStepped:Connect(function(deltaTime)
				if not enabled then
					if frame4.Visible then
						fn25()
					end

					return
				end

				n25 += deltaTime
				if n25 < tbl16.UpdateRate then
					return
				end
				n25 = 0
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if not character then
					return
				end
				local huge = math.huge
				local v25 = nil

				for _, player in ipairs(Players:GetPlayers()) do
					if player ~= localPlayer and player.Character then
						local humanoidRootPart = player.Character:FindFirstChild("HumanoidRootPart")
						local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

						if humanoidRootPart and humanoid and humanoid.Health > 0 then
							if (humanoidRootPart.Position - character.Position).Magnitude <= tbl16.MaxDistance then
								local v26, v27 = currentCamera:WorldToViewportPoint(humanoidRootPart.Position)

								if v27 then
									local n26 = currentCamera.ViewportSize / 2
									local magnitude = (Vector2.new(v26.X, v26.Y) - n26).Magnitude

									if magnitude < tbl16.LookRadius and magnitude < huge then
										huge = magnitude
										v25 = player
									end
								end
							end
						end
					end
				end

				if v25 then
					fn26(v25)
					n24 = 0
				else
					n24 += tbl16.UpdateRate

					if v24 and n24 > tbl16.StickyTime then
						v24 = nil
						fn25()
						return
					end
				end

				v25 = v25 or v24

				if v25 and v25.Character then
					local humanoid = v25.Character:FindFirstChildOfClass("Humanoid")

					if humanoid then
						local n26 = math.clamp(humanoid.Health / math.max(humanoid.MaxHealth, 1), 0, 1)
						local n27 = math.floor(humanoid.Health)
						textLabel2.Text = "HP: " .. tostring(n27)
						local v26 = fn23(n26)
						frame6.BackgroundColor3 = v26
						TweenService:Create(frame6, TweenInfo.new(0.18, Enum.EasingStyle.Quad), { Size = UDim2.fromScale(n26, 1) }):Play()
						local shimmerGradient = frame6:FindFirstChild("ShimmerGradient")

						if shimmerGradient then
							if tbl15.ShimmerEnabled ~= false then
								local n28 = tick() * (tbl15.ShimmerSpeed or 1)
								local shimmerIntensity = tbl15.ShimmerIntensity or 0.4
								local v27 = v26:Lerp(Color3.fromRGB(255, 255, 255), shimmerIntensity)
								local colorSequence = ColorSequence.new
								local tbl18 = {}
								local v28 = ColorSequenceKeypoint.new(0, v26)
								local v29 = ColorSequenceKeypoint.new(0.5, v27)
								local new = ColorSequenceKeypoint.new
								tbl18[1] = v28
								tbl18[2] = v29

								do
									local values = table.pack(new(1, v26))
									table.move(values, 1, values.n, 3, tbl18)
								end

								shimmerGradient.Color = colorSequence(tbl18)
								shimmerGradient.Offset = Vector2.new(n28 * 0.85 % 2 - 1, 0)
								shimmerGradient.Rotation = 0
								shimmerGradient.Enabled = true
							else
								shimmerGradient.Enabled = false
							end
						end
					end
				end
			end)

			local v25 = v18:Section({ Title = "Target HUD" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(enabled2)
					enabled = enabled2

					if screenGui2 then
						screenGui2.Enabled = enabled2
					end

					if not enabled2 then
						v24 = nil
						fn25()
					end
				end,
			})

			v25:Slider({
				Title = "Max Distance",
				Value = { Min = 5, Max = 120, Default = 55 },
				Callback = function(maxDistance)
					tbl16.MaxDistance = maxDistance
				end,
			})

			v25:Slider({
				Title = "Look Radius",
				Value = { Min = 20, Max = 260, Default = 125 },
				Callback = function(lookRadius)
					tbl16.LookRadius = lookRadius
				end,
			})

			v25:Colorpicker({
				Title = "Accent",
				Default = tbl16.Accent,
				Callback = function(accent)
					tbl16.Accent = accent
				end,
			})
		end

		local v24 = v18:Section({ Title = "Shimmer Settings" })

		v24:Toggle({
			Title = "Shimmer Enabled",
			Value = true,
			Callback = function(shimmerEnabled)
				tbl15.ShimmerEnabled = shimmerEnabled
			end,
		})

		v24:Slider({
			Title = "Shimmer Speed",
			Value = { Min = 1, Max = 30, Default = 10 },
			Callback = function(arg)
				tbl15.ShimmerSpeed = arg / 10
			end,
		})

		v24:Slider({
			Title = "Shimmer Intensity",
			Value = { Min = 1, Max = 10, Default = 4 },
			Callback = function(arg)
				tbl15.ShimmerIntensity = arg / 10
			end,
		})

		do
			local enabled = false

			local tbl16 = {
				Duration = 3.2,
				AdaptiveColor = true,
				MinWidth = 180,
				MaxWidth = 520,
				Height = 44,
				LowHealthThreshold = 25,
				DefaultIndicatorColor = Color3.fromRGB(168, 85, 247),
				Colors = {
					Info = Color3.fromRGB(168, 85, 247),
					Warning = Color3.fromRGB(255, 170, 0),
					Error = Color3.fromRGB(255, 70, 70),
					Success = Color3.fromRGB(70, 255, 120),
				},
			}

			local tbl17 = {}
			local flag11 = false
			local screenGui2 = nil
			local frame4 = nil
			local frame5 = nil
			local uiStroke = nil
			local textLabel = nil
			local tbl18 = {}

			local function fn22()
				for _, v25 in ipairs(tbl18) do
					if v25.Connected then
						v25:Disconnect()
					end
				end

				table.clear(tbl18)
			end

			local function fn23()
				if screenGui2 then
					screenGui2:Destroy()
				end

				screenGui2 = Instance.new("ScreenGui")
				screenGui2.Name = "DynamicIsland"
				screenGui2.ResetOnSpawn = false
				screenGui2.IgnoreGuiInset = true
				screenGui2.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
				screenGui2.Parent = playerGui
				screenGui2.Enabled = enabled
				frame4 = Instance.new("Frame", screenGui2)
				frame4.Name = "Island"
				frame4.AnchorPoint = Vector2.new(0.5, 0)
				frame4.Position = UDim2.new(0.5, 0, 0, 4)
				frame4.Size = UDim2.new(0, 0, 0, tbl16.Height)
				frame4.BackgroundColor3 = Color3.fromRGB(10, 8, 16)
				frame4.BackgroundTransparency = 0.18
				frame4.BorderSizePixel = 0
				frame4.ClipsDescendants = true
				frame4.Visible = false
				Instance.new("UICorner", frame4).CornerRadius = UDim.new(1, 0)
				frame5 = Instance.new("Frame", frame4)
				frame5.Name = "Indicator"
				frame5.AnchorPoint = Vector2.new(0, 0.5)
				frame5.Position = UDim2.new(0, 14, 0.5, 0)
				frame5.Size = UDim2.new(0, 8, 0, 8)
				frame5.BackgroundColor3 = tbl16.DefaultIndicatorColor
				frame5.BorderSizePixel = 0
				frame5.ZIndex = 2
				Instance.new("UICorner", frame5).CornerRadius = UDim.new(1, 0)
				uiStroke = Instance.new("UIStroke", frame5)
				uiStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
				uiStroke.Thickness = 3
				uiStroke.Transparency = 0.6
				uiStroke.Color = tbl16.DefaultIndicatorColor
				textLabel = Instance.new("TextLabel", frame4)
				textLabel.Name = "Text"
				textLabel.BackgroundTransparency = 1
				textLabel.Position = UDim2.new(0, 32, 0, 0)
				textLabel.Size = UDim2.new(1, -42, 1, 0)
				textLabel.Font = Enum.Font.GothamMedium
				textLabel.TextSize = 13
				textLabel.TextColor3 = Color3.fromRGB(245, 242, 255)
				textLabel.TextXAlignment = Enum.TextXAlignment.Left
				textLabel.TextYAlignment = Enum.TextYAlignment.Center
				textLabel.TextTruncate = Enum.TextTruncate.AtEnd
				textLabel.Text = ""
				textLabel.ZIndex = 2
			end

			fn23()

			local function fn24(arg, arg2)
				table.insert(tbl17, { Text = arg, Type = arg2 or "Info" })
				if flag11 then
					return
				end
				flag11 = true

				while #tbl17 > 0 do
					local v25 = table.remove(tbl17, 1)
					local defaultIndicatorColor = tbl16.Colors[v25.Type] or tbl16.DefaultIndicatorColor
					textLabel.TextTransparency = 1
					textLabel.Text = v25.Text
					frame5.BackgroundColor3 = tbl16.AdaptiveColor and defaultIndicatorColor or tbl16.DefaultIndicatorColor
					uiStroke.Color = tbl16.AdaptiveColor and defaultIndicatorColor or tbl16.DefaultIndicatorColor
					local minWidth = tbl16.MinWidth
					local maxWidth = tbl16.MaxWidth
					local n24 = math.clamp(TextService:GetTextSize(v25.Text, 13, Enum.Font.GothamMedium, Vector2.new(1000, tbl16.Height)).X + 68, minWidth, maxWidth)
					frame4.Visible = true
					frame4.Position = UDim2.new(0.5, 0, 0, 4)
					frame4.BackgroundTransparency = 0.18
					frame5.Size = UDim2.fromOffset(4, 4)
					textLabel.Position = UDim2.new(0, 38, 0, 0)

					local tween = TweenService:Create(frame4, TweenInfo.new(0.62, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), {
						Size = UDim2.new(0, n24, 0, tbl16.Height),
						Position = UDim2.new(0.5, 0, 0, 14),
						BackgroundTransparency = 0.08,
					})

					local tween2 = TweenService:Create(frame5, TweenInfo.new(0.5, Enum.EasingStyle.Elastic, Enum.EasingDirection.Out), { Size = UDim2.fromOffset(10, 10) })
					local tween3 = TweenService:Create(textLabel, TweenInfo.new(0.38, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), { TextTransparency = 0, Position = UDim2.new(0, 32, 0, 0) })
					tween:Play()
					tween2:Play()
					tween3:Play()
					tween.Completed:Wait()
					task.wait(tbl16.Duration)
					local tween4 = TweenService:Create(textLabel, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { TextTransparency = 1, Position = UDim2.new(0, 42, 0, 0) })
					local tween5 = TweenService:Create(frame5, TweenInfo.new(0.22, Enum.EasingStyle.Quad, Enum.EasingDirection.In), { Size = UDim2.fromOffset(4, 4) })

					local tween6 = TweenService:Create(frame4, TweenInfo.new(0.48, Enum.EasingStyle.Quint, Enum.EasingDirection.In), {
						Size = UDim2.new(0, 0, 0, tbl16.Height),
						Position = UDim2.new(0.5, 0, 0, 4),
						BackgroundTransparency = 0.3,
					})

					tween4:Play()
					tween5:Play()
					tween6:Play()
					tween6.Completed:Wait()
					frame4.Visible = false
					task.wait(0.06)
				end

				flag11 = false
			end

			fn21 = function(arg, arg2)
				fn24(arg, arg2 or "Info")
			end

			local flag12 = false

			local function fn25(character)
				fn22()
				local humanoid = character:FindFirstChildOfClass("Humanoid")
				if not humanoid then
					return
				end
				flag12 = false

				table.insert(tbl18, humanoid.HealthChanged:Connect(function(health)
					if health <= tbl16.LowHealthThreshold then
						if not flag12 then
							flag12 = true
							fn24("Low health", "Warning")
						end
					else
						flag12 = false
					end
				end))

				table.insert(tbl18, humanoid.Died:Connect(function()
					fn24("You died", "Error")
				end))
			end

			if localPlayer.Character then
				fn25(localPlayer.Character)
			end

			localPlayer.CharacterAdded:Connect(fn25)

			local function fn26(player)
				if player == localPlayer then
					return
				end

				task.spawn(function()
					local ok, result = pcall(function()
						return localPlayer:IsFriendsWith(player.UserId)
					end)

					if ok and result then
						fn24("Friend joined: " .. player.Name, "Success")
					end
				end)
			end

			Players.PlayerAdded:Connect(fn26)

			for _, player in ipairs(Players:GetPlayers()) do
				fn26(player)
			end

			Players.PlayerRemoving:Connect(function(player)
				if player ~= localPlayer then
					fn24(player.Name .. " left the game", "Info")
				end
			end)

			local v25 = v18:Section({ Title = "Dynamic Island" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(enabled2)
					enabled = enabled2

					if screenGui2 then
						screenGui2.Enabled = enabled2
					end
				end,
			})

			v25:Colorpicker({
				Title = "Indicator Color",
				Default = tbl16.DefaultIndicatorColor,
				Callback = function(defaultIndicatorColor)
					tbl16.DefaultIndicatorColor = defaultIndicatorColor
				end,
			})
		end

		pcall(function()
			local response = game:HttpGet("https://raw.githubusercontent.com/Birmap2314/HUJFIUHSUIFDH/refs/heads/main/watermark%2Clua", true)
			local chunk = loadstring(response)

			if chunk then
				chunk()
			end
		end)

		do
			local flag11 = false
			local color = Color3.fromRGB(255, 255, 255)
			local colorCorrectionEffect = nil

			local function fn22()
				if flag11 then
					if not colorCorrectionEffect then
						colorCorrectionEffect = Instance.new("ColorCorrectionEffect", Lighting)
						colorCorrectionEffect.Name = "WraithColorCorrection"
					end

					colorCorrectionEffect.TintColor = color
				elseif colorCorrectionEffect then
					colorCorrectionEffect:Destroy()
					colorCorrectionEffect = nil
				end
			end

			local v25 = v19:Section({ Title = "World Modulate" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
					fn22()
				end,
			})

			v25:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg

					if flag11 then
						fn22()
					end
				end,
			})
		end

		do
			local flag11 = false
			local n24 = 0.5
			local color = Color3.fromRGB(168, 85, 247)
			local flag12 = false
			local n25 = 0
			local n26 = 100

			local function fn22()
				local fogStart = flag11 and n25 or 10000
				local fogEnd = flag11 and n26 * 10 / (n24 + 0.1) or 100000
				Lighting.FogStart = fogStart
				Lighting.FogEnd = fogEnd
				Lighting.FogColor = color
				local wraithBlur = Lighting:FindFirstChild("WraithBlur")

				if flag12 and flag11 then
					if not wraithBlur then
						wraithBlur = Instance.new("BlurEffect", Lighting)
						wraithBlur.Name = "WraithBlur"
					end

					wraithBlur.Size = 10
				elseif wraithBlur then
					wraithBlur:Destroy()
				end
			end

			local v25 = v19:Section({ Title = "Fog" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
					fn22()
				end,
			})

			v25:Slider({
				Title = "Density",
				Value = { Min = 0, Max = 100, Default = 5 },
				Callback = function(arg)
					n24 = arg / 10

					if flag11 then
						fn22()
					end
				end,
			})

			v25:Slider({
				Title = "Fog Start",
				Value = { Min = 0, Max = 1000, Default = 0 },
				Callback = function(arg)
					n25 = arg

					if flag11 then
						fn22()
					end
				end,
			})

			v25:Slider({
				Title = "Fog End",
				Value = { Min = 0, Max = 5000, Default = 100 },
				Callback = function(arg)
					n26 = arg

					if flag11 then
						fn22()
					end
				end,
			})

			v25:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg

					if flag11 then
						fn22()
					end
				end,
			})

			v25:Toggle({
				Title = "Fog Blur",
				Value = false,
				Callback = function(arg)
					flag12 = arg

					if flag11 then
						fn22()
					end
				end,
			})
		end

		do
			local flag11 = false
			local clockTime = 14

			local function fn22()
				if flag11 then
					Lighting.ClockTime = clockTime
				end
			end

			RunService.RenderStepped:Connect(fn22)
			local v25 = v19:Section({ Title = "Time Changer" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
					fn22()
				end,
			})

			v25:Dropdown({
				Title = "Preset",
				Values = { "Day", "Sunset", "Night", "Midnight" },
				Value = "Day",
				Callback = function(arg)
					clockTime = ({ Day = 14, Sunset = 18, Night = 22, Midnight = 0 })[arg] or clockTime
					fn22()
				end,
			})

			v25:Slider({
				Title = "Clock Time",
				Value = { Min = 0, Max = 240, Default = 140 },
				Callback = function(arg)
					clockTime = arg / 10
					fn22()
				end,
			})
		end

		do
			local flag11 = false
			local tbl16 = {}
			local tbl17 = {}

			local function fn22()
				local v25 = Lighting
				tbl17.Brightness = v25.Brightness
				tbl17.ClockTime = v25.ClockTime
				tbl17.Ambient = v25.Ambient
				tbl17.OutdoorAmbient = v25.OutdoorAmbient
				tbl17.FogColor = v25.FogColor
				tbl17.FogEnd = v25.FogEnd
				tbl17.FogStart = v25.FogStart
				tbl17.ColorShift_Top = v25.ColorShift_Top
				tbl17.ColorShift_Bottom = v25.ColorShift_Bottom
				tbl17.ExposureCompensation = v25.ExposureCompensation
				local bloomEffect = Instance.new("BloomEffect")
				bloomEffect.Intensity = 0.35
				bloomEffect.Threshold = 0.2
				bloomEffect.Size = 56
				bloomEffect.Parent = v25
				table.insert(tbl16, bloomEffect)
				local blurEffect2 = Instance.new("BlurEffect")
				blurEffect2.Size = 2
				blurEffect2.Parent = v25
				table.insert(tbl16, blurEffect2)
				local colorCorrectionEffect = Instance.new("ColorCorrectionEffect")
				colorCorrectionEffect.Saturation = 0.05
				colorCorrectionEffect.TintColor = Color3.fromRGB(255, 224, 219)
				colorCorrectionEffect.Parent = v25
				table.insert(tbl16, colorCorrectionEffect)
				local sunRaysEffect = Instance.new("SunRaysEffect")
				sunRaysEffect.Intensity = 0.05
				sunRaysEffect.Parent = v25
				table.insert(tbl16, sunRaysEffect)
				v25.Brightness = 2.14
				v25.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				v25.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				v25.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				v25.ClockTime = 6.7
				v25.FogColor = Color3.fromRGB(94, 76, 106)
				v25.FogEnd = 1000
				v25.FogStart = 0
				v25.ExposureCompensation = 0.24
				v25.Ambient = Color3.fromRGB(59, 33, 27)
			end

			local function fn23()
				for _, v25 in ipairs(tbl16) do
					if v25 then
						v25:Destroy()
					end
				end

				table.clear(tbl16)
				local v25 = Lighting
				v25.Brightness = tbl17.Brightness or 2
				v25.ClockTime = tbl17.ClockTime or 14
				v25.Ambient = tbl17.Ambient or Color3.fromRGB(0, 0, 0)
				v25.OutdoorAmbient = tbl17.OutdoorAmbient or Color3.fromRGB(128, 128, 128)
				v25.FogColor = tbl17.FogColor or Color3.fromRGB(192, 192, 192)
				v25.FogEnd = tbl17.FogEnd or 100000
				v25.FogStart = tbl17.FogStart or 0
				v25.ColorShift_Top = tbl17.ColorShift_Top or Color3.fromRGB(0, 0, 0)
				v25.ColorShift_Bottom = tbl17.ColorShift_Bottom or Color3.fromRGB(0, 0, 0)
				v25.ExposureCompensation = tbl17.ExposureCompensation or 0
			end

			v19:Section({ Title = "Shaders" }):Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if arg then
						fn22()
					else
						fn23()
					end
				end,
			})
		end

		do
			local flag11 = false
			local color = Color3.fromRGB(250, 252, 255)
			local n24 = 180
			local n25 = 0.34
			local n26 = 7
			local n27 = 0
			local n28 = 320
			local n29 = 70
			local str5 = "Classic"
			local folder = nil
			local tbl16 = {}

			local tbl17 = {
				Classic = { "rbxasset://textures/particles/sparkles_main.dds" },
				["Snowflake 1"] = { "rbxasset://textures/particles/smoke_main.dds" },
			}

			local function fn22()
				if folder then
					folder:Destroy()
				end

				folder = nil
				table.clear(tbl16)
			end

			local function fn23()
				if folder and folder.Parent and #tbl16 == 3 then
					return
				end
				fn22()
				folder = Instance.new("Folder")
				folder.Name = "WraithHugeSnowZone"
				folder.Parent = Workspace
				local classic = tbl17[str5] or tbl17.Classic

				for i = 1, 3 do
					local part2 = Instance.new("Part")
					part2.Name = "SnowZoneLayer" .. i
					part2.Anchored = true
					part2.Transparency = 1
					part2.CanCollide = false
					part2.CanTouch = false
					part2.CanQuery = false
					part2.Size = Vector3.new(n28, 2, n28)
					part2.Parent = folder
					local particleEmitter = Instance.new("ParticleEmitter")
					particleEmitter.Name = "WraithSnowLayer" .. i
					particleEmitter.Texture = classic[(i - 1) % #classic + 1]
					particleEmitter.EmissionDirection = Enum.NormalId.Bottom
					particleEmitter.SpreadAngle = Vector2.new(180, 180)
					particleEmitter.Lifetime = NumberRange.new(7 + i, 12 + i)
					particleEmitter.Drag = 2.1
					particleEmitter.Rotation = NumberRange.new(-180, 180)
					particleEmitter.RotSpeed = NumberRange.new(-55, 55)
					particleEmitter.LightEmission = 0.55
					particleEmitter.LightInfluence = 0.06
					particleEmitter.LockedToPart = false
					particleEmitter.Parent = part2

					tbl16[i] = {
						part = part2,
						emitter = particleEmitter,
						offset = Vector3.new((i - 2) * n28 * 0.18, (i - 1) * 6, (i % 2 == 0 and 1 or -1) * n28 * 0.12),
						phase = math.random() * 10,
					}
				end
			end

			local function fn24()
				if not flag11 then
					fn22()
					return
				end
				fn23()
				local classic = tbl17[str5] or tbl17.Classic

				for i, v25 in ipairs(tbl16) do
					local emitter = v25.emitter
					v25.part.Size = Vector3.new(n28, 2, n28)
					emitter.Enabled = true
					emitter.Texture = classic[(i - 1) % #classic + 1]
					emitter.Rate = math.max(2, n24 / #tbl16) * ({ 1, 0.65, 0.38 })[i]
					emitter.Color = ColorSequence.new(color)
					emitter.Speed = NumberRange.new(n26 * 0.45, n26 * (1.05 + i * 0.08))
					emitter.Acceleration = Vector3.new(n27 * (0.7 + i * 0.15), -n26 * 0.92, 0)
					local n30 = n25 * ({ 1, 0.72, 0.48 })[i]
					local numberSequence = NumberSequence.new
					local tbl18 = {}
					local v26 = NumberSequenceKeypoint.new(0, 0)
					local v27 = NumberSequenceKeypoint.new(0.13, n30)
					local v28 = NumberSequenceKeypoint.new(0.86, n30 * 0.86)
					local new = NumberSequenceKeypoint.new
					tbl18[1] = v26
					tbl18[2] = v27
					tbl18[3] = v28

					do
						local values = table.pack(new(1, 0))
						table.move(values, 1, values.n, 4, tbl18)
					end

					emitter.Size = numberSequence(tbl18)
					local numberSequence2 = NumberSequence.new
					local tbl19 = {}
					local v29 = NumberSequenceKeypoint.new(0, 1)
					local v30 = NumberSequenceKeypoint.new(0.16, 0.08)
					local v31 = NumberSequenceKeypoint.new(0.86, 0.22)
					local new2 = NumberSequenceKeypoint.new
					tbl19[1] = v29
					tbl19[2] = v30
					tbl19[3] = v31

					do
						local values = table.pack(new2(1, 1))
						table.move(values, 1, values.n, 4, tbl19)
					end

					emitter.Transparency = numberSequence2(tbl19)
				end
			end

			RunService.RenderStepped:Connect(function()
				if flag11 then
					fn23()
					local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")
					local currentCamera2 = Workspace.CurrentCamera
					humanoidRootPart = humanoidRootPart and humanoidRootPart.Position or currentCamera2 and currentCamera2.CFrame.Position

					if humanoidRootPart then
						local now2 = tick()

						for _, v25 in ipairs(tbl16) do
							v25.part.Size = Vector3.new(n28, 2, n28)
							local vector = Vector3.new(math.sin(now2 * 0.22 + v25.phase) * n28 * 0.08, 0, math.cos(now2 * 0.2 + v25.phase) * n28 * 0.08)
							local offset = v25.offset
							v25.part.Position = humanoidRootPart + Vector3.new(0, n29, 0) + offset + vector
						end
					end
				end
			end)

			local v25 = v19:Section({ Title = "Snow Particles" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
					fn24()
				end,
			})

			v25:Dropdown({
				Title = "Particle",
				Values = { "Classic", "Snowflake 1" },
				Value = "Classic",
				Callback = function(arg)
					str5 = arg
					fn22()
					fn24()
				end,
			})

			v25:Colorpicker({
				Title = "Color",
				Default = color,
				Callback = function(arg)
					color = arg
					fn24()
				end,
			})

			v25:Slider({
				Title = "Density",
				Value = { Min = 20, Max = 1200, Default = 180 },
				Callback = function(arg)
					n24 = arg
					fn24()
				end,
			})

			v25:Slider({
				Title = "Size",
				Value = { Min = 5, Max = 220, Default = 70 },
				Callback = function(arg)
					n25 = arg / 100
					fn24()
				end,
			})

			v25:Slider({
				Title = "Fall Speed",
				Value = { Min = 1, Max = 30, Default = 7 },
				Callback = function(arg)
					n26 = arg
					fn24()
				end,
			})

			v25:Slider({
				Title = "Wind",
				Value = { Min = -25, Max = 25, Default = 0 },
				Callback = function(arg)
					n27 = arg
					fn24()
				end,
			})

			v25:Slider({
				Title = "Area",
				Value = { Min = 120, Max = 650, Default = 320 },
				Callback = function(arg)
					n28 = arg
					fn24()
				end,
			})

			v25:Slider({
				Title = "Height",
				Value = { Min = 25, Max = 140, Default = 70 },
				Callback = function(arg)
					n29 = arg
				end,
			})
		end

		do
			local flag11 = false
			local n24 = 70
			local v25 = v20:Section({ Title = "FOV" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
				end,
			})

			v25:Slider({
				Title = "Value",
				Value = { Min = 30, Max = 120, Default = 70 },
				Callback = function(arg)
					n24 = arg
				end,
			})

			RunService.RenderStepped:Connect(function()
				currentCamera.FieldOfView = flag11 and n24 or 70
			end)
		end

		do
			local flag11 = false
			local n24 = 0
			local connection = nil
			local v25 = v20:Section({ Title = "Stretch Effect" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if connection then
						connection:Disconnect()
						connection = nil
					end

					if flag11 then
						connection = RunService.RenderStepped:Connect(function()
							local currentCamera2 = Workspace.CurrentCamera

							if currentCamera2 then
								currentCamera2.CFrame = currentCamera2.CFrame * CFrame.new(0, 0, 0, 1, 0, 0, 0, 0.65 + n24, 0, 0, 0, 1)
							end
						end)
					end
				end,
			})

			v25:Slider({
				Title = "Stretch",
				Value = { Min = 0, Max = 20, Default = 0 },
				Callback = function(arg)
					n24 = arg / 100
				end,
			})
		end

		do
			local flag11 = false
			local n24 = 0.5
			local cFrame = currentCamera.CFrame

			RunService.RenderStepped:Connect(function(deltaTime)
				local cFrame2 = currentCamera.CFrame
				if not flag11 then
					cFrame = cFrame2
					return
				end
				cFrame = cFrame:Lerp(cFrame2, 1 - math.exp(-math.clamp(n24, 0.01, 0.99) * 12 * deltaTime))
				currentCamera.CFrame = cFrame
			end)

			local v25 = v20:Section({ Title = "Smooth Camera" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg
				end,
			})

			v25:Slider({
				Title = "Smoothness",
				Value = { Min = 1, Max = 99, Default = 50 },
				Callback = function(arg)
					n24 = arg / 100
				end,
			})
		end

		do
			local flag11 = false
			local cameraMinZoomDistance = 10
			local cameraMinZoomDistance2 = 0.5
			local cameraMaxZoomDistance = 128
			local v25 = v20:Section({ Title = "Third Person" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if arg then
						cameraMinZoomDistance2 = localPlayer.CameraMinZoomDistance
						cameraMaxZoomDistance = localPlayer.CameraMaxZoomDistance
						localPlayer.CameraMode = Enum.CameraMode.Classic
						localPlayer.CameraMinZoomDistance = cameraMinZoomDistance
						localPlayer.CameraMaxZoomDistance = cameraMinZoomDistance + 20
					else
						localPlayer.CameraMode = Enum.CameraMode.Classic
						localPlayer.CameraMinZoomDistance = cameraMinZoomDistance2
						localPlayer.CameraMaxZoomDistance = cameraMaxZoomDistance
					end
				end,
			})

			v25:Slider({
				Title = "Distance",
				Value = { Min = 1, Max = 30, Default = 10 },
				Callback = function(arg)
					cameraMinZoomDistance = arg

					if flag11 then
						localPlayer.CameraMinZoomDistance = cameraMinZoomDistance
						localPlayer.CameraMaxZoomDistance = cameraMinZoomDistance + 20
					end
				end,
			})
		end

		do
			local flag11 = false
			local flag12 = false
			local str5 = "Angel Halo"
			local color = Color3.fromRGB(255, 255, 255)
			local vector = Vector3.new(0, 0, 0.35)
			local color2 = Color3.fromRGB(255, 224, 100)
			local color3 = Color3.fromRGB(150, 20, 18)
			local tbl16 = { ["Angel Halo"] = 106709859407217, ["China Hat"] = 74045420650728 }
			local tbl17 = {}

			local function fn22()
				local character = localPlayer.Character

				if character then
					for _, child in ipairs(character:GetChildren()) do
						if child.Name == "WraithGlowWings" or child.Name == "WraithAngelHalo" or child.Name == "WraithChinaHat" then
							pcall(function()
								child:Destroy()
							end)
						end
					end
				end

				for _, v25 in ipairs(tbl17) do
					if v25 and v25.Parent then
						pcall(function()
							v25:Destroy()
						end)
					end
				end

				table.clear(tbl17)
			end

			local function fn23(arg)
				local v25 = nil

				if not pcall(function()
					v25 = game:GetService("InsertService"):LoadAsset(arg)
				end) or not v25 then
					pcall(function()
						local objects = game:GetObjects("rbxassetid://" .. tostring(arg))
						v25 = objects and objects[1]
					end)
				end

				if not v25 then
					return nil
				end
				local isAccessory = v25:IsA("Accessory") and v25 or v25:FindFirstChildWhichIsA("Accessory", true)

				if not isAccessory then
					pcall(function()
						v25:Destroy()
					end)

					return nil
				end

				local clone = isAccessory:Clone()

				pcall(function()
					v25:Destroy()
				end)

				return clone
			end

			local function fn24(arg, parent, part1, name, arg2)
				arg.Name = name
				local handle = arg:FindFirstChild("Handle")
				if not handle or not part1 then
					return nil
				end

				for _, child in ipairs(handle:GetChildren()) do
					if child:IsA("Weld") or child:IsA("WeldConstraint") or child:IsA("Motor6D") then
						child:Destroy()
					end
				end

				handle.Anchored = false
				handle.CanCollide = false
				handle.CanTouch = false
				handle.Massless = true
				handle.CFrame = part1.CFrame * arg2
				handle.Color = name == "WraithGlowWings" and color or handle.Color
				arg.Parent = parent
				local weldConstraint = Instance.new("WeldConstraint")
				weldConstraint.Part0 = handle
				weldConstraint.Part1 = part1
				weldConstraint.Parent = handle

				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("BasePart") then
						descendant.Anchored = false
						descendant.CanCollide = false
						descendant.CanTouch = false
						descendant.Massless = true

						if name == "WraithGlowWings" then
							descendant.Color = color
						end
					end
				end

				return arg
			end

			local function fn25()
				fn22()
				if not flag11 and not flag12 then
					return
				end
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local upperTorso = character and (character:FindFirstChild("UpperTorso") or character:FindFirstChild("Torso"))
				local head = character and character:FindFirstChild("Head")
				if not character or not humanoid or not upperTorso or not head then
					return
				end

				if flag11 then
					local v25 = fn23(104752780081809)

					if v25 then
						local wraithGlowWings = fn24(v25, character, upperTorso, "WraithGlowWings", CFrame.new(vector))

						if wraithGlowWings then
							table.insert(tbl17, wraithGlowWings)
						end
					end
				end

				if flag12 then
					if str5 == "China Hat" then
						local part2 = Instance.new("Part")
						part2.Name = "WraithChinaHat"
						part2.Transparency = 0.28
						part2.Color = color3
						part2.Material = Enum.Material.SmoothPlastic
						part2.CanCollide = false
						part2.CanTouch = false
						part2.CanQuery = false
						part2.Massless = true
						local specialMesh = Instance.new("SpecialMesh")
						specialMesh.MeshId = "rbxassetid://1033714"
						specialMesh.Scale = Vector3.new(2.05, 1.35, 2.05)
						specialMesh.Parent = part2
						part2.CFrame = head.CFrame * CFrame.new(0, 1.1, 0)
						part2.Parent = character
						local weldConstraint = Instance.new("WeldConstraint")
						weldConstraint.Part0 = head
						weldConstraint.Part1 = part2
						weldConstraint.Parent = part2
						table.insert(tbl17, part2)
					else
						local v25 = fn23(tbl16["Angel Halo"])

						if v25 then
							local wraithAngelHalo = fn24(v25, character, head, "WraithAngelHalo", CFrame.new(0, 1.25, 0))

							if wraithAngelHalo then
								for _, descendant in ipairs(wraithAngelHalo:GetDescendants()) do
									if descendant:IsA("BasePart") then
										descendant.Color = color2
										descendant.Size = descendant.Size * 1.5
									end
								end

								table.insert(tbl17, wraithAngelHalo)
							end
						end
					end
				end
			end

			localPlayer.CharacterAdded:Connect(function()
				task.wait(0.5)
				fn25()
			end)

			local v25 = v21:Section({ Title = "Wings / Hat" })

			v25:Toggle({
				Title = "Glow Wings",
				Value = false,
				Callback = function(arg)
					flag11 = arg
					fn25()
				end,
			})

			v25:Toggle({
				Title = "Hat",
				Value = false,
				Callback = function(arg)
					flag12 = arg
					fn25()
				end,
			})

			v25:Colorpicker({
				Title = "Wings Color",
				Default = color,
				Callback = function(arg)
					color = arg
					fn25()
				end,
			})

			v25:Slider({
				Title = "Wings X",
				Value = { Min = -100, Max = 100, Default = 0 },
				Callback = function(arg)
					vector = Vector3.new(arg / 100, vector.Y, vector.Z)
					fn25()
				end,
			})

			v25:Slider({
				Title = "Wings Height",
				Value = { Min = -100, Max = 100, Default = 0 },
				Callback = function(arg)
					vector = Vector3.new(vector.X, arg / 100, vector.Z)
					fn25()
				end,
			})

			v25:Slider({
				Title = "Wings Depth",
				Value = { Min = -100, Max = 150, Default = 35 },
				Callback = function(arg)
					vector = Vector3.new(vector.X, vector.Y, arg / 100)
					fn25()
				end,
			})

			v25:Colorpicker({
				Title = "Halo Color",
				Default = color2,
				Callback = function(arg)
					color2 = arg
					fn25()
				end,
			})

			v25:Colorpicker({
				Title = "China Hat Color",
				Default = color3,
				Callback = function(arg)
					color3 = arg
					fn25()
				end,
			})

			v25:Dropdown({
				Title = "Hat Type",
				Values = { "Angel Halo", "China Hat" },
				Value = "Angel Halo",
				Callback = function(arg)
					str5 = arg

					if flag12 then
						fn25()
					end
				end,
			})
		end

		do
			local flag11 = false
			local color = Color3.fromRGB(168, 85, 247)
			local flag12 = true
			local n24 = 2.5
			local n25 = 0
			local flag13 = false
			local tbl16 = {}
			local flag14 = false
			local color2 = Color3.fromRGB(168, 85, 247)
			local trail = nil
			local trail2 = nil
			local attachment = nil
			local attachment2 = nil
			local attachment3 = nil
			local attachment4 = nil
			local flag15 = false
			local n26 = 28
			local n27 = 12
			local n28 = 0.42
			local n29 = 3
			local tbl17 = {}

			local function fn22(arg)
				if arg and arg.Parent then
					arg:Destroy()
				end
			end

			local function fn23(arg)
				local part2 = Instance.new("Part")
				part2.Name = "WraithFootstep"
				part2.Anchored = true
				part2.CanCollide = false
				part2.CanTouch = false
				part2.CanQuery = false
				part2.Material = flag12 and Enum.Material.Neon or Enum.Material.SmoothPlastic
				part2.Color = color
				part2.Transparency = 0.25
				part2.Size = Vector3.new(0.55, 0.035, 0.95)
				local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					humanoidRootPart = humanoidRootPart.CFrame * CFrame.new(flag13 and -0.35 or 0.35, -2.75, 0.25)
				end

				part2.CFrame = humanoidRootPart or CFrame.new(arg + Vector3.new(0, 0.035, 0))
				part2.Parent = Workspace
				table.insert(tbl16, part2)

				task.delay(n24, function()
					fn22(part2)
				end)
			end

			local function fn24()
				if trail or not flag14 then
					return
				end
				local character = localPlayer.Character
				local leftArm = character and (character:FindFirstChild("Left Arm") or character:FindFirstChild("LeftHand"))

				if character then
					character = character:FindFirstChild("Right Arm") or character:FindFirstChild("RightHand")
				end

				if not leftArm or not character then
					return
				end
				attachment = Instance.new("Attachment", leftArm)
				attachment2 = Instance.new("Attachment", leftArm)
				attachment3 = Instance.new("Attachment", character)
				attachment4 = Instance.new("Attachment", character)
				attachment.Position = Vector3.new(0, -leftArm.Size.Y / 2, 0)
				attachment2.Position = Vector3.new(0, leftArm.Size.Y / 2, 0)
				attachment3.Position = Vector3.new(0, -character.Size.Y / 2, 0)
				attachment4.Position = Vector3.new(0, character.Size.Y / 2, 0)
				trail = Instance.new("Trail", leftArm)
				trail.Attachment0 = attachment
				trail.Attachment1 = attachment2
				trail2 = Instance.new("Trail", character)
				trail2.Attachment0 = attachment3
				trail2.Attachment1 = attachment4

				for _, v25 in ipairs({ trail, trail2 }) do
					v25.Name = "HandTrail"
					v25.Lifetime = 0.45
					v25.MinLength = 0.05
					v25.LightEmission = 0.8
					v25.Transparency = NumberSequence.new(0.1, 1)
					v25.Color = ColorSequence.new(color2)
				end
			end

			local function fn25()
				if trail then
					trail:Destroy()
					trail = nil
				end

				if trail2 then
					trail2:Destroy()
					trail2 = nil
				end

				if attachment then
					attachment:Destroy()
					attachment = nil
				end

				if attachment2 then
					attachment2:Destroy()
					attachment2 = nil
				end
			end

			local function fn26(arg)
				if arg and arg.Parent then
					arg:Destroy()
				end

				tbl17[arg] = nil
			end

			local function fn27(position)
				if flag15 then
					local part2 = Instance.new("Part")
					part2.Name = "GrabParticleFX"
					part2.Anchored = true
					part2.CanCollide = false
					part2.Transparency = 1
					part2.Position = position
					part2.Parent = Workspace
					local particleEmitter = Instance.new("ParticleEmitter", part2)
					particleEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"
					particleEmitter.Color = ColorSequence.new(Color3.fromRGB(168, 85, 247))
					particleEmitter.Lifetime = NumberRange.new(n29 * 0.65, n29)
					particleEmitter.Speed = NumberRange.new(n27 * 0.7, n27 * 1.3)
					particleEmitter.Rate = 0
					particleEmitter.EmissionDirection = Enum.NormalId.Top
					particleEmitter.SpreadAngle = Vector2.new(180, 180)
					particleEmitter.Speed = NumberRange.new(9, 15)
					particleEmitter.Acceleration = Vector3.new(0, -18, 0)
					particleEmitter.Drag = 2
					particleEmitter.Size = NumberSequence.new(n28)
					particleEmitter:Emit(n26)

					task.delay(n29, function()
						fn26(part2)
					end)
				end
			end

			RunService.RenderStepped:Connect(function()
				local character = localPlayer.Character
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")

				if flag11 and humanoid and humanoidRootPart and humanoid.RigType == Enum.HumanoidRigType.R6 and humanoid.MoveDirection.Magnitude > 0.1 and tick() - n25 > 0.28 then
					n25 = tick()
					local v25 = character:FindFirstChild(flag13 and "Left Leg" or "Right Leg")

					if v25 then
						fn23(v25.Position - Vector3.new(0, v25.Size.Y / 2, 0))
					end

					flag13 = not flag13
				end

				if flag14 then
					fn24()
				elseif trail then
					fn25()
				end

				if trail then
					trail.Color = ColorSequence.new(color2)
				end

				if trail2 then
					trail2.Color = ColorSequence.new(color2)
				end
			end)

			Workspace.DescendantAdded:Connect(function(descendant)
				local v25 = string.lower(descendant.Name)

				if v25 == "grabparts" or v25 == "grabpart" or v25:find("grabparts", 1, true) then
					local position

					if descendant:IsA("BasePart") then
						position = descendant.Position
					else
						position = nil

						if descendant:IsA("Model") then
							position = descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart", true)
							position = position and position.Position
						end
					end

					if position and flag15 then
						local huge = math.huge
						local v26 = nil

						for _, player in ipairs(Players:GetPlayers()) do
							local humanoidRootPart = player.Character and player.Character:FindFirstChild("HumanoidRootPart")

							if humanoidRootPart and (humanoidRootPart.Position - position).Magnitude < huge then
								huge = (humanoidRootPart.Position - position).Magnitude
								v26 = player
							end
						end

						fn27(position, v26)
					end
				end
			end)

			local v25 = v21:Section({ Title = "Footsteps" })

			v25:Toggle({
				Title = "Footsteps (R6)",
				Value = false,
				Callback = function(arg)
					flag11 = arg
				end,
			})

			v25:Colorpicker({
				Title = "Footstep Color",
				Default = color,
				Callback = function(arg)
					color = arg
				end,
			})

			v25:Toggle({
				Title = "Footstep Glow",
				Value = true,
				Callback = function(arg)
					flag12 = arg
				end,
			})

			v25:Slider({
				Title = "Footstep Lifetime",
				Value = { Min = 5, Max = 60, Default = 25 },
				Callback = function(arg)
					n24 = arg / 10
				end,
			})

			local v26 = v21:Section({ Title = "Hand Trail" })

			v26:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag14 = arg

					if not arg then
						fn25()
					end
				end,
			})

			v26:Colorpicker({
				Title = "Hand Trail Color",
				Default = color2,
				Callback = function(arg)
					color2 = arg
				end,
			})

			local v27 = v21:Section({ Title = "Grab Effects" })

			v27:Toggle({
				Title = "Grab Particle",
				Value = false,
				Callback = function(arg)
					flag15 = arg
				end,
			})

			v27:Slider({
				Title = "Particle Count",
				Value = { Min = 1, Max = 100, Default = 28 },
				Callback = function(arg)
					n26 = arg
				end,
			})

			v27:Slider({
				Title = "Particle Speed",
				Value = { Min = 1, Max = 40, Default = 12 },
				Callback = function(arg)
					n27 = arg
				end,
			})

			v27:Slider({
				Title = "Particle Size",
				Value = { Min = 5, Max = 150, Default = 42 },
				Callback = function(arg)
					n28 = arg / 100
				end,
			})

			v27:Slider({
				Title = "Particle Lifetime",
				Value = { Min = 5, Max = 60, Default = 30 },
				Callback = function(arg)
					n29 = arg / 10
				end,
			})
		end

		do
			local flag11 = false
			local color = Color3.fromRGB(168, 85, 247)
			local lifetime = 0.48
			local n24 = 0.9
			local flag12 = true
			local str5 = "Shader"
			local trail = nil
			local attachment = nil
			local attachment2 = nil
			local pointLight = nil
			local attachment3 = nil
			local particleEmitter = nil

			local function fn22()
				if trail then
					trail:Destroy()
					trail = nil
				end

				if attachment then
					attachment:Destroy()
					attachment = nil
				end

				if attachment2 then
					attachment2:Destroy()
					attachment2 = nil
				end

				if pointLight then
					pointLight:Destroy()
					pointLight = nil
				end

				if attachment3 then
					attachment3:Destroy()
					attachment3 = nil
					particleEmitter = nil
				end
			end

			local function fn23()
				local character = localPlayer.Character
				character = character and character:FindFirstChild("HumanoidRootPart")
				if not character then
					fn22()
					return
				end

				if not trail or trail.Parent ~= character then
					fn22()
					attachment = Instance.new("Attachment", character)
					attachment.Name = "TrailLeft"
					attachment.Position = Vector3.new(-0.38, -0.65, 0.52)
					attachment2 = Instance.new("Attachment", character)
					attachment2.Name = "TrailRight"
					attachment2.Position = Vector3.new(0.38, -0.65, 0.52)
					trail = Instance.new("Trail", character)
					trail.Name = "ShaderTrail"
					trail.Attachment0 = attachment
					trail.Attachment1 = attachment2
					trail.FaceCamera = true
					trail.MinLength = 0.04
					trail.LightEmission = 0.95
					trail.LightInfluence = 0
					trail.Enabled = true
					pointLight = Instance.new("PointLight", character)
					pointLight.Name = "TrailGlow"
					pointLight.Range = 8
					pointLight.Brightness = 0.35
					attachment3 = Instance.new("Attachment", character)
					attachment3.Name = "TrailParticleAttachment"
					attachment3.Position = Vector3.new(0, -0.45, 0.35)
					particleEmitter = Instance.new("ParticleEmitter", attachment3)
					particleEmitter.Name = "TrailParticles"
					particleEmitter.Texture = "rbxasset://textures/particles/sparkles_main.dds"
					particleEmitter.Lifetime = NumberRange.new(0.35, 0.7)
					particleEmitter.Speed = NumberRange.new(2, 5)
					particleEmitter.SpreadAngle = Vector2.new(180, 180)
					particleEmitter.Drag = 3
					particleEmitter.LightEmission = 1
					particleEmitter.Rate = 0
				end

				trail.Lifetime = lifetime
				local v25 = trail
				local numberSequence = NumberSequence.new
				local tbl16 = {}
				local v26 = NumberSequenceKeypoint.new(0, n24)
				local v27 = NumberSequenceKeypoint.new(0.2, n24 * 0.82)
				local v28 = NumberSequenceKeypoint.new(0.6, n24 * 0.45)
				local new = NumberSequenceKeypoint.new
				tbl16[1] = v26
				tbl16[2] = v27
				tbl16[3] = v28

				do
					local values = table.pack(new(1, 0))
					table.move(values, 1, values.n, 4, tbl16)
				end

				v25.WidthScale = numberSequence(tbl16)

				if str5 == "Shader" then
					local v29 = trail
					local colorSequence = ColorSequence.new
					local tbl17 = {}
					local v30 = ColorSequenceKeypoint.new(0, Color3.fromRGB(255, 255, 255))
					local v31 = ColorSequenceKeypoint.new(0.3, color:Lerp(Color3.fromRGB(220, 180, 255), 0.5))
					local new2 = ColorSequenceKeypoint.new
					local v32 = color
					local lerp = v32.Lerp
					local color2 = Color3.fromRGB(80, 10, 180)
					tbl17[1] = v30
					tbl17[2] = v31

					do
						local values = table.pack(new2(1, lerp(v32, color2, 0.7)))
						table.move(values, 1, values.n, 3, tbl17)
					end

					v29.Color = colorSequence(tbl17)
					local v33 = trail
					local numberSequence2 = NumberSequence.new
					local tbl18 = {}
					local v34 = NumberSequenceKeypoint.new(0, 0.05)
					local v35 = NumberSequenceKeypoint.new(0.4, 0.25)
					local new3 = NumberSequenceKeypoint.new
					tbl18[1] = v34
					tbl18[2] = v35

					do
						local values = table.pack(new3(1, 1))
						table.move(values, 1, values.n, 3, tbl18)
					end

					v33.Transparency = numberSequence2(tbl18)
					trail.Texture = "rbxasset://textures/particles/sparkles_main.dds"
				elseif str5 == "Particle" then
					local v29 = trail
					local colorSequence = ColorSequence.new
					local tbl17 = {}
					local v30 = ColorSequenceKeypoint.new(0, Color3.fromRGB(192, 132, 252))
					local v31 = ColorSequenceKeypoint.new(0.5, Color3.fromRGB(147, 51, 234))
					local new2 = ColorSequenceKeypoint.new
					local color2 = Color3.fromRGB
					tbl17[1] = v30
					tbl17[2] = v31

					do
						local values = table.pack(new2(1, color2(70, 10, 120)))
						table.move(values, 1, values.n, 3, tbl17)
					end

					v29.Color = colorSequence(tbl17)
					local v32 = trail
					local numberSequence2 = NumberSequence.new
					local tbl18 = {}
					local v33 = NumberSequenceKeypoint.new(0, 0.12)
					local v34 = NumberSequenceKeypoint.new(0.6, 0.42)
					local new3 = NumberSequenceKeypoint.new
					tbl18[1] = v33
					tbl18[2] = v34

					do
						local values = table.pack(new3(1, 1))
						table.move(values, 1, values.n, 3, tbl18)
					end

					v32.Transparency = numberSequence2(tbl18)
					trail.Texture = ""
				else
					trail.Color = ColorSequence.new(color)
					local new2 = NumberSequenceKeypoint.new
					trail.Transparency = NumberSequence.new({ NumberSequenceKeypoint.new(0, 0.15), new2(1, 1) })
					trail.Texture = ""
				end

				pointLight.Color = color
			end

			RunService.RenderStepped:Connect(function()
				if not flag11 then
					fn22()
					return
				end
				fn23()
				local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

				if humanoidRootPart then
					humanoidRootPart = humanoidRootPart.AssemblyLinearVelocity or humanoidRootPart.Velocity
				end

				humanoidRootPart = humanoidRootPart or Vector3.zero
				local flag13 = Vector3.new(humanoidRootPart.X, 0, humanoidRootPart.Z).Magnitude > 1.5
				local flag14 = not flag12 or flag13

				if trail then
					trail.Enabled = flag14 and str5 ~= "Particle"
				end

				if particleEmitter then
					particleEmitter.Enabled = flag14 and str5 == "Particle"
					particleEmitter.Rate = flag14 and str5 == "Particle" and 34 or 0
					particleEmitter.Color = ColorSequence.new(color)
				end
			end)

			localPlayer.CharacterAdded:Connect(function()
				task.wait(0.35)

				if flag11 then
					fn23()
				end
			end)

			local v25 = v21:Section({ Title = "Trail" })

			v25:Toggle({
				Title = "Enabled",
				Value = false,
				Callback = function(arg)
					flag11 = arg

					if not arg then
						fn22()
					else
						fn23()
					end
				end,
			})

			v25:Colorpicker({
				Title = "Trail Color",
				Default = color,
				Callback = function(arg)
					color = arg
					fn23()
				end,
			})

			v25:Slider({
				Title = "Length",
				Value = { Min = 2, Max = 20, Default = 5 },
				Callback = function(arg)
					lifetime = arg / 10
					fn23()
				end,
			})

			v25:Slider({
				Title = "Width",
				Value = { Min = 3, Max = 22, Default = 9 },
				Callback = function(arg)
					n24 = arg / 10
					fn23()
				end,
			})

			v25:Toggle({
				Title = "Only When Moving",
				Value = true,
				Callback = function(arg)
					flag12 = arg
				end,
			})

			v25:Dropdown({
				Title = "Trail Shader Style",
				Values = { "Shader", "Particle", "Clean" },
				Value = "Shader",
				Callback = function(arg)
					str5 = arg
					fn23()
				end,
			})
		end

		local TweenService2
		TweenService2 = game:GetService("TweenService")
		local UserInputService2
		UserInputService2 = game:GetService("UserInputService")
		local MarketplaceService
		MarketplaceService = game:GetService("MarketplaceService")
		local RunService2, tbl16, tbl17, n24, flag11, now2, flag12, flag13, flag14, position
		local position2, v25, sound2, screenGui2

		do
			local SoundService2 = game:GetService("SoundService")
			RunService2 = game:GetService("RunService")
			local playerGui2 = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

			tbl16 = {
				AutoDockEnabled = false,
				AutoDockTime = 5,
				EdgeDistance = 90,
				NormalSize = UDim2.new(0, 290, 0, 135),
				DockedSize = UDim2.new(0, 220, 0, 32),
				BgColor = Color3.fromRGB(30, 30, 34),
				BgTransparency = 0.15,
				TextWhite = Color3.fromRGB(255, 255, 255),
				TextSub = Color3.fromRGB(150, 150, 160),
				BarBG = Color3.fromRGB(65, 65, 70),
				BarFill = Color3.fromRGB(200, 200, 205),
				IconArtwork = "♫",
				IconPlay = "▶",
				IconPause = "❚❚",
				IconPrev = "◄◄",
				IconNext = "►►",
				IconPlaylist = "≡",
			}

			tbl17 = {}
			n24 = 1
			flag11 = false
			now2 = tick()
			flag12 = false
			flag13 = false
			flag14 = false
			position = nil
			position2 = nil
			v25 = nil
			sound2 = Instance.new("Sound")
			sound2.Name = "SoundPlayerAudio"
			sound2.Volume = 0.5
			sound2.Parent = SoundService2
			screenGui2 = Instance.new("ScreenGui")
			screenGui2.Name = "SoundPlayerGui"
			screenGui2.ResetOnSpawn = false
			screenGui2.IgnoreGuiInset = true
			screenGui2.DisplayOrder = 999998
			screenGui2.Parent = playerGui2
		end

		local frame4
		frame4 = Instance.new("Frame")
		frame4.Name = "MainFrame"
		frame4.Size = tbl16.NormalSize
		frame4.AnchorPoint = Vector2.new(1, 1)
		frame4.Position = UDim2.new(1, -20, 1, -20)
		frame4.BackgroundColor3 = tbl16.BgColor
		frame4.BackgroundTransparency = tbl16.BgTransparency
		frame4.BorderSizePixel = 0
		frame4.ClipsDescendants = false
		frame4.Parent = screenGui2
		local uiScale
		uiScale = Instance.new("UIScale")
		uiScale.Scale = 1
		uiScale.Parent = frame4
		local uiCorner = Instance.new("UICorner")
		uiCorner.CornerRadius = UDim.new(0, 28)
		uiCorner.Parent = frame4
		local uiStroke = Instance.new("UIStroke")
		uiStroke.Color = Color3.fromRGB(0, 0, 0)
		uiStroke.Transparency = 0.65
		uiStroke.Thickness = 1.5
		uiStroke.Parent = frame4
		local canvasGroup
		canvasGroup = Instance.new("CanvasGroup")
		canvasGroup.Name = "InputDrawer"
		canvasGroup.Size = UDim2.new(1, -24, 0, 36)
		canvasGroup.Position = UDim2.new(0, 12, 0, -10)
		canvasGroup.BackgroundColor3 = tbl16.BgColor
		canvasGroup.BackgroundTransparency = tbl16.BgTransparency
		canvasGroup.GroupTransparency = 1
		canvasGroup.Visible = false
		canvasGroup.BorderSizePixel = 0
		canvasGroup.ZIndex = 0
		canvasGroup.Parent = frame4
		local uiCorner2 = Instance.new("UICorner")
		uiCorner2.CornerRadius = UDim.new(0, 16)
		uiCorner2.Parent = canvasGroup
		local uiStroke2 = Instance.new("UIStroke")
		uiStroke2.Color = Color3.fromRGB(0, 0, 0)
		uiStroke2.Transparency = 0.65
		uiStroke2.Thickness = 1.5
		uiStroke2.Parent = canvasGroup
		local textBox
		textBox = Instance.new("TextBox")
		textBox.Size = UDim2.new(1, -20, 1, 0)
		textBox.Position = UDim2.new(0, 10, 0, 0)
		textBox.BackgroundTransparency = 1
		textBox.PlaceholderText = "Введите ID и нажмите Enter..."
		textBox.PlaceholderColor3 = tbl16.TextSub
		textBox.Text = ""
		textBox.TextColor3 = tbl16.TextWhite
		textBox.TextSize = 12
		textBox.Font = Enum.Font.GothamMedium
		textBox.TextXAlignment = Enum.TextXAlignment.Center
		textBox.ClearTextOnFocus = false
		textBox.Parent = canvasGroup
		local frame5
		frame5 = Instance.new("Frame")
		frame5.Name = "FullView"
		frame5.Size = UDim2.new(1, 0, 1, 0)
		frame5.BackgroundTransparency = 1
		frame5.ZIndex = 1
		frame5.Parent = frame4

		do
			local frame6 = Instance.new("Frame")
			frame6.Name = "Artwork"
			frame6.Size = UDim2.new(0, 48, 0, 48)
			frame6.Position = UDim2.new(0, 12, 0, 12)
			frame6.BackgroundColor3 = Color3.fromRGB(75, 75, 80)
			frame6.BorderSizePixel = 0
			frame6.Parent = frame5
			local uiCorner3 = Instance.new("UICorner")
			uiCorner3.CornerRadius = UDim.new(0, 14)
			uiCorner3.Parent = frame6
			local textLabel = Instance.new("TextLabel")
			textLabel.Size = UDim2.new(1, 0, 1, 0)
			textLabel.BackgroundTransparency = 1
			textLabel.Text = tbl16.IconArtwork
			textLabel.TextColor3 = Color3.fromRGB(220, 220, 225)
			textLabel.TextSize = 22
			textLabel.Font = Enum.Font.GothamBold
			textLabel.Parent = frame6
		end

		local textLabel
		textLabel = Instance.new("TextLabel")
		textLabel.Name = "SongTitle"
		textLabel.Size = UDim2.new(0, 160, 0, 20)
		textLabel.Position = UDim2.new(0, 68, 0, 14)
		textLabel.BackgroundTransparency = 1
		textLabel.Text = "song name"
		textLabel.TextColor3 = tbl16.TextWhite
		textLabel.TextSize = 15
		textLabel.Font = Enum.Font.GothamBold
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.Parent = frame5
		local textLabel2
		textLabel2 = Instance.new("TextLabel")
		textLabel2.Name = "MusicIDLabel"
		textLabel2.Size = UDim2.new(0, 160, 0, 16)
		textLabel2.Position = UDim2.new(0, 68, 0, 34)
		textLabel2.BackgroundTransparency = 1
		textLabel2.Text = "music id"
		textLabel2.TextColor3 = tbl16.TextSub
		textLabel2.TextSize = 12
		textLabel2.Font = Enum.Font.GothamMedium
		textLabel2.TextXAlignment = Enum.TextXAlignment.Left
		textLabel2.Parent = frame5
		local textButton
		textButton = Instance.new("TextButton")
		textButton.Name = "DotsBtn"
		textButton.Size = UDim2.new(0, 30, 0, 20)
		textButton.Position = UDim2.new(1, -36, 0, 16)
		textButton.BackgroundTransparency = 1
		textButton.Text = "••••"
		textButton.TextColor3 = tbl16.TextWhite
		textButton.TextSize = 18
		textButton.Font = Enum.Font.GothamBold
		textButton.Parent = frame5
		local textLabel3
		textLabel3 = Instance.new("TextLabel")
		textLabel3.Size = UDim2.new(0, 30, 0, 14)
		textLabel3.Position = UDim2.new(0, 12, 0, 68)
		textLabel3.BackgroundTransparency = 1
		textLabel3.Text = "0:00"
		textLabel3.TextColor3 = tbl16.TextWhite
		textLabel3.TextSize = 11
		textLabel3.Font = Enum.Font.GothamMedium
		textLabel3.Parent = frame5
		local textLabel4
		textLabel4 = Instance.new("TextLabel")
		textLabel4.Size = UDim2.new(0, 30, 0, 14)
		textLabel4.Position = UDim2.new(1, -42, 0, 68)
		textLabel4.BackgroundTransparency = 1
		textLabel4.Text = "0:00"
		textLabel4.TextColor3 = tbl16.TextWhite
		textLabel4.TextSize = 11
		textLabel4.Font = Enum.Font.GothamMedium
		textLabel4.Parent = frame5
		local frame6

		do
			local frame7 = Instance.new("Frame")
			frame7.Name = "BarBG"
			frame7.Size = UDim2.new(1, -84, 0, 4)
			frame7.Position = UDim2.new(0, 46, 0, 73)
			frame7.BackgroundColor3 = tbl16.BarBG
			frame7.BorderSizePixel = 0
			frame7.Parent = frame5
			local uiCorner3 = Instance.new("UICorner")
			uiCorner3.CornerRadius = UDim.new(1, 0)
			uiCorner3.Parent = frame7
			frame6 = Instance.new("Frame")
			frame6.Name = "BarFill"
			frame6.Size = UDim2.new(0, 0, 1, 0)
			frame6.BackgroundColor3 = tbl16.BarFill
			frame6.BorderSizePixel = 0
			frame6.Parent = frame7
		end

		local uiCorner3 = Instance.new("UICorner")
		uiCorner3.CornerRadius = UDim.new(1, 0)
		uiCorner3.Parent = frame6
		local textButton2, textButton3, textButton4

		do
			local frame7 = Instance.new("Frame")
			frame7.Size = UDim2.new(1, -24, 0, 56)
			frame7.Position = UDim2.new(0, 12, 1, -56)
			frame7.BackgroundTransparency = 1
			frame7.Parent = frame5
			local textButton5 = Instance.new("TextButton")
			textButton5.Size = UDim2.new(0, 25, 0, 25)
			textButton5.Position = UDim2.new(0, 0, 0.5, -12)
			textButton5.BackgroundTransparency = 1
			textButton5.Text = tbl16.IconPlaylist
			textButton5.TextColor3 = tbl16.TextWhite
			textButton5.TextSize = 18
			textButton5.Font = Enum.Font.GothamBold
			textButton5.Parent = frame7
			textButton2 = Instance.new("TextButton")
			textButton2.Size = UDim2.new(0, 25, 0, 25)
			textButton2.Position = UDim2.new(0.25, -12, 0.5, -12)
			textButton2.BackgroundTransparency = 1
			textButton2.Text = tbl16.IconPrev
			textButton2.TextColor3 = tbl16.TextWhite
			textButton2.TextSize = 14
			textButton2.Font = Enum.Font.GothamBold
			textButton2.Parent = frame7
			textButton3 = Instance.new("TextButton")
			textButton3.Name = "PlayBtn"
			textButton3.Size = UDim2.new(0, 56, 0, 56)
			textButton3.Position = UDim2.new(0.5, -28, 0.5, -28)
			textButton3.BackgroundTransparency = 1
			textButton3.Text = tbl16.IconPlay
			textButton3.TextColor3 = tbl16.TextWhite
			textButton3.TextSize = 34
			textButton3.Font = Enum.Font.GothamBold
			textButton3.Parent = frame7
			textButton4 = Instance.new("TextButton")
			textButton4.Size = UDim2.new(0, 25, 0, 25)
			textButton4.Position = UDim2.new(0.75, -12, 0.5, -12)
			textButton4.BackgroundTransparency = 1
			textButton4.Text = tbl16.IconNext
			textButton4.TextColor3 = tbl16.TextWhite
			textButton4.TextSize = 14
			textButton4.Font = Enum.Font.GothamBold
			textButton4.Parent = frame7
		end

		local frame7
		frame7 = Instance.new("Frame")
		frame7.Name = "DockedView"
		frame7.Size = UDim2.new(1, 0, 1, 0)
		frame7.BackgroundTransparency = 1
		frame7.Visible = false
		frame7.ZIndex = 1
		frame7.Parent = frame4

		do
			local frame8 = Instance.new("Frame")
			frame8.Size = UDim2.new(0, 22, 0, 22)
			frame8.Position = UDim2.new(0, 6, 0.5, -11)
			frame8.BackgroundColor3 = Color3.fromRGB(75, 75, 80)
			frame8.BorderSizePixel = 0
			frame8.Parent = frame7
			local uiCorner4 = Instance.new("UICorner")
			uiCorner4.CornerRadius = UDim.new(0, 6)
			uiCorner4.Parent = frame8
			local textLabel5 = Instance.new("TextLabel")
			textLabel5.Size = UDim2.new(1, 0, 1, 0)
			textLabel5.BackgroundTransparency = 1
			textLabel5.Text = tbl16.IconArtwork
			textLabel5.TextColor3 = tbl16.TextWhite
			textLabel5.TextSize = 12
			textLabel5.Font = Enum.Font.GothamBold
			textLabel5.Parent = frame8
		end

		do
			local frame8 = Instance.new("Frame")
			frame8.Size = UDim2.new(1, -85, 0, 4)
			frame8.Position = UDim2.new(0, 34, 0.5, -2)
			frame8.BackgroundColor3 = tbl16.BarBG
			frame8.BorderSizePixel = 0
			frame8.Parent = frame7
			local uiCorner4 = Instance.new("UICorner")
			uiCorner4.CornerRadius = UDim.new(1, 0)
			uiCorner4.Parent = frame8
			local frame9 = Instance.new("Frame")
			frame9.Size = UDim2.new(0, 0, 1, 0)
			frame9.BackgroundColor3 = tbl16.BarFill
			frame9.BorderSizePixel = 0
			frame9.Parent = frame8
			local uiCorner5 = Instance.new("UICorner")
			uiCorner5.CornerRadius = UDim.new(1, 0)
			uiCorner5.Parent = frame8
			local textLabel5 = Instance.new("TextLabel")
			textLabel5.Size = UDim2.new(0, 40, 1, 0)
			textLabel5.Position = UDim2.new(1, -46, 0, 0)
			textLabel5.BackgroundTransparency = 1
			textLabel5.Text = "0:00"
			textLabel5.TextColor3 = tbl16.TextWhite
			textLabel5.TextSize = 11
			textLabel5.Font = Enum.Font.GothamMedium
			textLabel5.Parent = frame7

			local function fn22(arg)
				if not arg or arg <= 0 or arg ~= arg then
					return "0:00"
				end
				local n25 = math.floor(arg / 60)
				local n26 = math.floor(arg % 60)
				return string.format("%d:%02d", n25, n26)
			end

			local function fn23()
				now2 = tick()

				if flag12 then
					if v25 then
						v25:Cancel()
					end

					flag12 = false
					frame7.Visible = false
					frame5.Visible = true
					local tbl18 = { Size = tbl16.NormalSize, BackgroundTransparency = tbl16.BgTransparency }
					local tween = TweenService2:Create(frame4, TweenInfo.new(0.4, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), tbl18)
					v25 = tween
					tween:Play()
				end
			end

			local function fn24(arg)
				local match = tostring(arg):match("%d+")
				if not match then
					textLabel.Text = "Ошибка ID"
					return
				end
				sound2.SoundId = "rbxassetid://" .. match
				textLabel2.Text = "ID: " .. match
				textLabel.Text = "Загрузка..."

				task.spawn(function()
					local productInfo = nil

					if pcall(function()
						local asset = Enum.InfoType.Asset
						productInfo = MarketplaceService:GetProductInfo(tonumber(match), asset)
					end) and productInfo and productInfo.Name then
						textLabel.Text = productInfo.Name
					else
						textLabel.Text = "Track #" .. match
					end
				end)

				sound2:Play()
				flag11 = true
				textButton3.Text = tbl16.IconPause
			end

			local function fn25(arg)
				if #tbl17 == 0 then
					return
				end

				if arg < 1 then
					arg = #tbl17
				end

				if #tbl17 < arg then
					arg = 1
				end

				n24 = arg
				fn24(tbl17[n24])
			end

			local function fn26(arg)
				if not arg or arg == "" then
					return
				end
				table.insert(tbl17, arg)

				if #tbl17 == 1 or not flag11 then
					fn25(#tbl17)
				end
			end

			local function fn27(arg)
				flag14 = arg
				fn23()

				if flag14 then
					canvasGroup.Visible = true
					TweenService2:Create(canvasGroup, TweenInfo.new(0.35, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), { Position = UDim2.new(0, 12, 0, -42), GroupTransparency = 0 }):Play()

					task.delay(0.1, function()
						if flag14 then
							textBox:CaptureFocus()
						end
					end)
				else
					textBox:ReleaseFocus()
					local tween = TweenService2:Create(canvasGroup, TweenInfo.new(0.25, Enum.EasingStyle.Cubic, Enum.EasingDirection.In), { Position = UDim2.new(0, 12, 0, -10), GroupTransparency = 1 })
					tween:Play()

					tween.Completed:Connect(function()
						if not flag14 then
							canvasGroup.Visible = false
						end
					end)
				end
			end

			textButton.MouseButton1Click:Connect(function()
				fn27(not flag14)
			end)

			textBox.FocusLost:Connect(function(enterPressed)
				if enterPressed then
					if textBox.Text ~= "" then
						fn26(textBox.Text)
						textBox.Text = ""
					end

					fn27(false)
				end
			end)

			frame4.InputBegan:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					fn23()
					flag13 = true

					if flag12 then
						flag12 = false
						frame4.AnchorPoint = Vector2.new(0, 0)
						frame5.Visible = true
						frame7.Visible = false

						if v25 then
							v25:Cancel()
						end

						local tbl18 = { Size = tbl16.NormalSize, BackgroundTransparency = tbl16.BgTransparency }
						TweenService2:Create(frame4, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl18):Play()
					end

					position = input.Position
					position2 = frame4.Position
					TweenService2:Create(uiScale, TweenInfo.new(0.16, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = 1.035 }):Play()
				end
			end)

			UserInputService2.InputChanged:Connect(function(input)
				if flag13 and (input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch) then
					local n25 = input.Position - position
					local viewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
					local absoluteSize = frame4.AbsoluteSize
					local n26 = math.clamp(position2.X.Offset + n25.X, 0, math.max(0, viewportSize.X - absoluteSize.X))
					local n27 = math.clamp(position2.Y.Offset + n25.Y, 0, math.max(0, viewportSize.Y - absoluteSize.Y))
					frame4.Position = UDim2.fromOffset(n26, n27)
					fn23()
				end
			end)

			UserInputService2.InputEnded:Connect(function(input)
				if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
					flag13 = false
					TweenService2:Create(uiScale, TweenInfo.new(0.22, Enum.EasingStyle.Back, Enum.EasingDirection.Out), { Scale = 1 }):Play()
				end
			end)

			textButton3.MouseButton1Click:Connect(function()
				fn23()

				if flag11 then
					sound2:Pause()
					flag11 = false
					textButton3.Text = tbl16.IconPlay
				elseif sound2.SoundId ~= "" then
					sound2:Resume()
					flag11 = true
					textButton3.Text = tbl16.IconPause
				elseif #tbl17 > 0 then
					fn25(n24)
				end
			end)

			textButton2.MouseButton1Click:Connect(function()
				fn23()
				fn25(n24 - 1)
			end)

			textButton4.MouseButton1Click:Connect(function()
				fn23()
				fn25(n24 + 1)
			end)

			RunService2.RenderStepped:Connect(function()
				if screenGui2.Enabled then
					local viewportSize = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize

					if viewportSize and frame4.AnchorPoint == Vector2.new(0, 0) then
						local absolutePosition = frame4.AbsolutePosition
						local absoluteSize = frame4.AbsoluteSize
						local n25 = math.clamp(absolutePosition.X, 0, math.max(0, viewportSize.X - absoluteSize.X))
						local n26 = math.clamp(absolutePosition.Y, 0, math.max(0, viewportSize.Y - absoluteSize.Y))

						if n25 ~= absolutePosition.X or n26 ~= absolutePosition.Y then
							frame4.Position = UDim2.fromOffset(n25, n26)
						end
					end
				end

				local timePosition = sound2.TimePosition
				local timeLength = sound2.TimeLength

				if timeLength > 0 then
					local n25 = math.clamp(timePosition / timeLength, 0, 1)
					frame6.Size = UDim2.new(n25, 0, 1, 0)
					frame9.Size = UDim2.new(n25, 0, 1, 0)
					textLabel3.Text = fn22(timePosition)
					textLabel4.Text = fn22(timeLength)
					textLabel5.Text = fn22(timeLength)
				else
					frame6.Size = UDim2.new(0, 0, 1, 0)
					frame9.Size = UDim2.new(0, 0, 1, 0)
					textLabel3.Text = "0:00"
					textLabel4.Text = "0:00"
					textLabel5.Text = "0:00"
				end

				if tbl16.AutoDockEnabled and not flag12 and not flag13 and not flag14 then
					if tbl16.AutoDockTime < tick() - now2 then
						local absolutePosition = frame4.AbsolutePosition
						local flag15 = absolutePosition.Y < tbl16.EdgeDistance

						if flag15 or workspace.CurrentCamera.ViewportSize.Y - absolutePosition.Y + frame4.AbsoluteSize.Y < tbl16.EdgeDistance then
							if v25 then
								v25:Cancel()
							end

							flag12 = true
							frame5.Visible = false
							frame7.Visible = true
							local absolutePosition2 = frame4.AbsolutePosition
							local absoluteSize = frame4.AbsoluteSize
							frame4.AnchorPoint = Vector2.new(0, 0)
							frame4.Position = UDim2.fromOffset(absolutePosition2.X, flag15 and absolutePosition2.Y or absolutePosition2.Y + absoluteSize.Y - tbl16.DockedSize.Y.Offset)
							local tbl18 = { Size = tbl16.DockedSize, BackgroundTransparency = 0.5 }
							local tween = TweenService2:Create(frame4, TweenInfo.new(0.45, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), tbl18)
							v25 = tween
							tween:Play()
						end
					end
				end
			end)

			sound2.Ended:Connect(function()
				if #tbl17 > 0 then
					fn25(n24 + 1)
				else
					flag11 = false
					textButton3.Text = tbl16.IconPlay
				end
			end)
		end

		local v26 = v22:Section({ Title = "Sound Player" })
		screenGui2.Enabled = false

		v26:Toggle({
			Title = "Enabled",
			Value = false,
			Callback = function(enabled)
				screenGui2.Enabled = enabled

				if not enabled then
					sound2:Stop()
				end
			end,
		})

		v26:Toggle({
			Title = "Auto Dock",
			Value = tbl16.AutoDockEnabled,
			Callback = function(autoDockEnabled)
				tbl16.AutoDockEnabled = autoDockEnabled

				if not autoDockEnabled and flag12 then
					flag12 = false
					frame4.AnchorPoint = Vector2.new(0, 0)
					frame5.Visible = true
					frame7.Visible = false

					if v25 then
						v25:Cancel()
					end

					local tbl18 = { Size = tbl16.NormalSize, BackgroundTransparency = tbl16.BgTransparency }
					TweenService2:Create(frame4, TweenInfo.new(0.25, Enum.EasingStyle.Quint, Enum.EasingDirection.Out), tbl18):Play()
				end
			end,
		})

		do
			local flag15 = false
			local flag16 = false
			local flag17 = false
			local flag18 = false
			local volume = 1.8

			local tbl18 = {
				Skeet = 83717596220569,
				Fatality = 115982072912004,
				Bell = 139452805868562,
				Click = 87437544236708,
				UwU = 124356179581089,
				Neverlose = 8679627751,
				Hitmarker = 4817809188,
			}

			local str5 = "Skeet"
			local str6 = "Fatality"
			local str7 = "Hitmarker"
			local str8 = "Skeet"

			local function fn22()
				return tbl18[str8] or tbl18.Skeet
			end

			local function fn23(position3)
				local flag19 = position3 ~= nil and position3 ~= Vector3.zero
				local part2 = nil
				local v27 = SoundService

				if flag19 then
					part2 = Instance.new("Part")
					part2.Name = "WraithCleanSoundEmitter"
					part2.Anchored = true
					part2.CanCollide = false
					part2.Transparency = 1
					part2.Size = Vector3.one
					part2.Position = position3
					part2.Parent = Workspace
					v27 = part2
				end

				local sound3 = Instance.new("Sound")
				sound3.Name = "WraithCleanBypassSound"
				sound3.SoundId = "rbxassetid://" .. fn22()
				sound3.Volume = volume

				if flag19 then
					sound3.RollOffMaxDistance = 350
				end

				sound3.Parent = v27
				sound3:Play()

				task.spawn(function()
					sound3.Ended:Wait()

					pcall(function()
						sound3:Destroy()
					end)

					if part2 and part2.Parent then
						pcall(function()
							part2:Destroy()
						end)
					end
				end)
			end

			local function fn24(arg)
				if not arg:IsA("Sound") then
					return
				end

				if string.lower(arg.Name) == "ragdollhit" then
					arg.Played:Connect(function()
						if not flag15 then
							return
						end

						pcall(function()
							arg.Volume = 0
						end)

						pcall(function()
							arg:Stop()
						end)

						local parent = arg.Parent
						local isBasePart = parent and parent:IsA("BasePart")
						local vector = Vector3.zero

						if isBasePart then
							vector = parent.Position
						end

						str8 = str5
						fn23(vector)
					end)
				end
			end

			local function fn25(arg)
				for _, descendant in ipairs(arg:GetDescendants()) do
					if descendant:IsA("Sound") and string.lower(descendant.Name) == "ragdollhit" then
						fn24(descendant)
					end
				end
			end

			pcall(function()
				fn25(Workspace)
				fn25(SoundService)
			end)

			Workspace.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("Sound") then
					fn24(descendant)
				end

				if flag16 then
					local v27 = string.lower(descendant.Name)

					if v27 == "blackholekick" or v27 == "blackholebuildup" or v27 == "blackholekickeffect" or v27:find("blackholekick") or v27:find("blackhole") then
						task.wait(0.01)
						local position3

						if descendant:IsA("BasePart") then
							position3 = descendant.Position
						elseif descendant:IsA("Model") and descendant.PrimaryPart then
							position3 = descendant.PrimaryPart.Position
						else
							position3 = nil

							if descendant:IsA("Model") then
								local basePart = descendant:FindFirstChildWhichIsA("BasePart", true)
								position3 = nil

								if basePart then
									position3 = basePart.Position
								end
							end
						end

						if position3 then
							fn23(position3)

							if flag18 then
								local model = descendant:FindFirstAncestorOfClass("Model")

								wraithNotify({
									Title = "Kick Detected",
									Description = (model and model.Name or "Player") .. " kick",
									Duration = 2.5,
								})
							end
						end
					end
				end
			end)

			SoundService.DescendantAdded:Connect(function(descendant)
				if descendant:IsA("Sound") then
					fn24(descendant)
				end
			end)

			local n25 = 0

			Workspace.DescendantAdded:Connect(function(descendant)
				local v27 = string.lower(descendant.Name)

				if flag17 and (v27 == "grabparts" or v27 == "grabpart" or v27:find("grabparts", 1, true)) then
					local position3

					if descendant:IsA("BasePart") then
						position3 = descendant.Position
					else
						position3 = nil

						if descendant:IsA("Model") then
							position3 = descendant.PrimaryPart or descendant:FindFirstChildWhichIsA("BasePart", true)
							position3 = position3 and position3.Position
						end
					end

					local humanoidRootPart = localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart")

					if position3 and humanoidRootPart and (position3 - humanoidRootPart.Position).Magnitude <= 30 and tick() - n25 > 0.25 then
						n25 = tick()
						str8 = str7
						fn23(nil)
					end
				end
			end)

			local v27 = v22:Section({ Title = "Sounds" })

			v27:Toggle({
				Title = "Ragdoll Sound (Override RagdollHit)",
				Value = false,
				Callback = function(arg)
					flag15 = arg
				end,
			})

			v27:Toggle({
				Title = "Kick Sound (3D BlackHoleKick)",
				Value = false,
				Callback = function(arg)
					flag16 = arg
				end,
			})

			v27:Toggle({
				Title = "Grab Sound (30 studs)",
				Value = false,
				Callback = function(arg)
					flag17 = arg
				end,
			})

			v27:Dropdown({
				Title = "Ragdoll Sound",
				Values = { "Skeet", "Fatality", "Bell", "Click", "UwU", "Neverlose", "Hitmarker" },
				Value = "Skeet",
				Callback = function(arg)
					str5 = arg
				end,
			})

			v27:Dropdown({
				Title = "Kick Sound",
				Values = { "Skeet", "Fatality", "Bell", "Click", "UwU", "Neverlose", "Hitmarker" },
				Value = "Fatality",
				Callback = function(arg)
					str6 = arg
				end,
			})

			v27:Dropdown({
				Title = "Grab Sound",
				Values = { "Skeet", "Fatality", "Bell", "Click", "UwU", "Neverlose", "Hitmarker" },
				Value = "Hitmarker",
				Callback = function(arg)
					str7 = arg
				end,
			})

			v27:Slider({
				Title = "Volume",
				Value = { Min = 1, Max = 50, Default = 18 },
				Callback = function(arg)
					volume = arg / 10
				end,
			})

			v27:Toggle({
				Title = "Notify on Kick",
				Value = false,
				Callback = function(arg)
					flag18 = arg
				end,
			})
		end

		v23:Section({ Title = "Reconnect" }):Button({
			Title = "Reconnect",
			Callback = function()
				TeleportService:Teleport(game.PlaceId, localPlayer)
			end,
		})

		v23:Section({ Title = "Server Hop" }):Button({
			Title = "Server Hop",
			Callback = function()
				local request_ = syn and syn.request or http_request or request or http and http.request
				local data

				if type(request_) == "function" then
					local v27 = request_({
						Url = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100",
						Method = "GET",
					})

					local body

					if v27 then
						body = v27.Body or v27.body
					else
						body = v27
					end

					data = nil

					if body then
						data = HttpService:JSONDecode(v27.Body or v27.body)
					end
				else
					local ok, result = pcall(function()
						return game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?limit=100")
					end)

					ok = ok and result
					data = nil

					if ok then
						data = HttpService:JSONDecode(result)
					end
				end

				if data and data.data and #data.data > 0 then
					TeleportService:TeleportToPlaceInstance(game.PlaceId, data.data[math.random(#data.data)].id, localPlayer)
				end
			end,
		})

		local connection = nil

		v23:Section({ Title = "Anti-AFK" }):Toggle({
			Title = "Enabled",
			Value = false,
			Callback = function(arg)
				if arg then
					connection = RunService.Heartbeat:Connect(function()
						VirtualInputManager:SendKeyEvent(true, Enum.KeyCode.LeftControl, false, game)
						task.wait(0.1)
						VirtualInputManager:SendKeyEvent(false, Enum.KeyCode.LeftControl, false, game)
					end)
				elseif connection then
					connection:Disconnect()
				end
			end,
		})

		local v27 = v23:Section({ Title = "Notify" })

		v27:Button({
			Title = "Test Notify",
			Callback = function()
				wraithNotify({ Title = "Wraith", Description = "Notify is working", Duration = 2.5 })
			end,
		})

		v27:Button({
			Title = "Test Notify + Island",
			Callback = function()
				wraithNotify({ Title = "Wraith", Description = "Synced with Dynamic Island", Duration = 2.5 })
			end,
		})

		local v28 = v23:Section({ Title = "Configs" })

		v28:Input({
			Title = "Config Name",
			Value = tbl15.ConfigName,
			Placeholder = "config",
			Callback = function(arg)
				setConfigName(arg)
			end,
		})

		v28:Button({
			Title = "Save Config",
			Callback = function()
				fn19()
				wraithNotify({ Title = "Wraith", Description = "Config saved", Duration = 2.4 })
			end,
		})

		v28:Button({
			Title = "Load Config",
			Callback = function()
				fn20()
				tbl15.IncludeLocal = fn18("includeLocal", false)
				wraithNotify({ Title = "Wraith", Description = "Config loaded", Duration = 2.8 })
			end,
		})

		v28:Button({
			Title = "Reset Config",
			Callback = function()
				tbl15.Config = {}

				if fn16(delfile) and fn16(isfile) and isfile(tbl15.ConfigFile) then
					pcall(function()
						delfile(tbl15.ConfigFile)
					end)
				end

				wraithNotify({ Title = "Wraith", Description = "Config reset", Duration = 2.4 })
			end,
		})

		v23:Section({ Title = "Menu Keybinds" })
		v23:Label({ Title = "RightAlt - Minimize/Restore (built-in)" })
		v23:Label({ Title = "RightShift - Toggle menu visibility" })
		wraithNotify({ Title = "Wraith beta", Description = "Loaded from " .. tostring(v16 or "unknown"), Duration = 3 })
	end)

	if not (not UserSettings():HasTag("ោ౫ನ౨") and not fn3(UserSettings():HasTag("ោ౫ನ౨"), true, 613993)) then
		local now2 = os.clock()

		heartbeat:Connect(function()
			n23 += 1

			if n23 % 3142 ~= 0 == false then
				if n2 < 5751 or not flag7 and v13._7a229333e1626642d38af047 ~= "_34baa8de05ae8cd174a7f75e" and os.clock() - now2 >= 45 then
					fn("J2_031")

					while true do
					end
				end
			end
		end)

		return 1
	end

	while task.wait(1) do
	end
end
