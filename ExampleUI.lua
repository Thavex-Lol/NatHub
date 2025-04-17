local NatUI = loadstring(game:HttpGet("https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/Uisource.lua"))()

--- Create Window
NatUI:Window({
	Title = "NatUI Library",
	Description = "made by whidd",
	Icon = "rbxasset"
})

--- Open Toggle UI
NatUI:OpenUI({
	Title = "nathubui",
	Icon = "rbxasset",
	BackgroundColor = "fromrgb",
	BorderColor = "fromrgb"
})

--- Add Tab
NatUI:AddTab({
	Title = "tab1",
	Desc = "tab test",
	Icon = "only support rbxasset"
})

--- Section
NatUI:Section({
	Title = "Section",
	Icon = "rbxasset"
})

--- Button
NatUI:Button({
	Title = "button",
	Callback = function()
		print("button")
	end,
})

--- Toggle
NatUI:Toggle({
	Title = "Toggle",
	Callback = function()
		print("toggle")
	end,
})

--- Paragraph
NatUI:Paragraph({
	Title = "[paragraph]",
	Desc = "Description"
})

--- Slider[beta testing]
NatUI:Slider({
	Title = "Slider",
	MaxValue = "100",
	Callback = function(value)
		print(value)
	end,
})
