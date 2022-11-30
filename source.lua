-- Variables
local plr = game:GetService("Players").LocalPlayer
local chr = plr.Character
local hum = chr.Humanoid
local runservice = game:GetService("RunService")

-- Module

local Material = loadstring(game:HttpGet("https://raw.githubusercontent.com/Kinlei/MaterialLua/master/Module.lua"))()

-- Code

local X = Material.Load({
	Title = "LobsScriptHub",
	Style = 3,
	SizeX = 350,
	SizeY = 350,
	Theme = "Dark",
	ColorOverrides = {
		MainFrame = Color3.fromRGB(34,34,34)
	}
})

-- Tabs

local Main = X.New({
	Title = "Main Tab"
})

local Misc = X.New({
	Title = "Misc Tab"
})

local Scripts = X.New({
	Title = "Scripts"
})

-- Misc

local jobid = Misc.Button({
	Text = "Copy JobID",
	Callback = function()
		setclipboard('Roblox.GameLauncher.joinGameInstance('..game.PlaceId..', "'..game.JobId..'")')
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "This puts a jobID in your clipboard so you can paste it in the Console in your browser."
			})
		end
	}
})

local SelfKick = Misc.Button({
	Text = "Kick yourself",
	Callback = function()
		plr:Kick("You kicked yourself.")
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "The title is pretty self explanatory, it kicks you out of the game."
			})
		end
	}
})

-- Scripts

local InfYield = Scripts.Button({
	Text = "Infinite Yield",
	Callback = function()
		loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Script made by EdgeIY, not me."
			})
		end
	}
})

local Homebrew = Scripts.Button({
	Text = "Homebrew",
	Callback = function()
		loadstring(game:HttpGetAsync("https://raw.githubusercontent.com/Syntaxx64/HomebrewAdmin/master/Main"))()
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Script made by Syntax 64, not me."
			})
		end
	}
})

local Dex = Scripts.Button({
	Text = "Dex",
	Callback = function()
		loadstring(game:GetObjects('rbxassetid://11651442577')[1].Source)()
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Script made by Moon, not me."
			})
		end
	}
})

local BackdoorExe = Scripts.Button({
	Text = "Backdoor.exe",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/iK4oS/backdoor.exe/v8/src/main.lua"))();
	end,
	Menu = {
		Information = function(self)
			X.Banner({
				Text = "Disclaimer: script only works in games with infected models. Use if you're in a supported game. Script made by iK4oS"
			})
		end
	}
})
-- Main

local Walkspeed = Main.Slider({
	Text = "Walkspeed Modifier",
	Callback = function(ValueWS)
		hum.WalkSpeed = ValueWS
	end,
	Min = 16,
	Max = 450,
	Def = 16
})
local Jumppower = Main.Slider({
	Text = "Jumppower modifier",
	Callback = function(ValueJP)
		hum.JumpPower = ValueJP
	end,
	Min = 50,
	Max = 1500,
	Def = 50
})

local Noclip = Main.Toggle({
    Text = 'Toggle Noclip',
    Enabled = false,
    Callback = function(t)
        if t then
            getgenv().Noclip = true
            if getgenv().Noclip == true then
                
                runservice.Stepped:Connect(function()
                    if chr then
                        for i,v in pairs(chr:GetDescendants()) do
                            if v:IsA("BasePart") then
                                if getgenv().Noclip == true then    
                                    v.CanCollide = false
                                elseif getgenv().Noclip == false then -- else also works i think
                                    v.CanCollide = true
                                end
                            end
                        end
                    end
                end)
            end
        else
            getgenv().Noclip = false
        end
    end
})
