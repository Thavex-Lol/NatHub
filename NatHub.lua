local supportedGames = {}
if premium then
    supportedGames = {
        [7436755782] = "https://api.luarmor.net/files/v3/loaders/483d639ad74a7814ff1057d68cec56c2.lua", -- Grow a Garden
        [7018190066] = "https://api.luarmor.net/files/v3/loaders/d3a76114c1ea182127b88170b6043d11.lua", -- Dead Rails
        [5750914919] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/fisch.lua", -- Fisch
        [6325068386] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/blr.lua", -- BLR
        [4777817887] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/bladeball.lua", -- Bladeball
        [7095682825] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/beaks.lua", -- Beaks
        [994732206] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/bf.lua" -- Blox Fruit
    }
else
    supportedGames = {
        [7436755782] = "https://api.luarmor.net/files/v3/loaders/4370b97b96b7c9b80382809f3f1eb868.lua", -- Grow a Garden
        [7018190066] = "https://api.luarmor.net/files/v3/loaders/b6ed8153f04ff71caab20c2341784abc.lua", -- Dead Rails
        [5750914919] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/fisch.lua", -- Fisch
        [6325068386] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/blr.lua", -- BLR
        [4777817887] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/bladeball.lua", -- Bladeball
        [7095682825] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/beaks.lua", -- Beaks
        [994732206] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/bf.lua" -- Blox Fruit
    }
end
local gameNames = {
    [5750914919] = "Fisch", -- Fisch
    [7018190066] = "Dead Rails", -- Dead Rails
    [6325068386] = "Blue Lock Rivals", -- BLR
    [4777817887] = "Blade Ball", -- Blade Ball
    [7436755782] = "GaG", -- GaG
    [7095682825] = "Beaks", -- Beaks
    [994732206] = "Blox Fruit"
}
local gameId = game.GameId
if supportedGames[gameId] then
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "NatHub Loaded!",
            Text = gameNames[gameId] .. " Script Loaded!",
            Icon = "rbxassetid://99764942615873",
            Duration = 5
        }
    )
    loadstring(game:HttpGet(supportedGames[gameId]))()
else
    game.StarterGui:SetCore(
        "SendNotification",
        {
            Title = "NatHub Error!",
            Text = "You Execute Non Supported Game",
            Icon = "rbxassetid://99764942615873",
            Duration = 5
        }
    )
end
