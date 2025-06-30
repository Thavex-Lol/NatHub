local supportedGames = {}

if premium then
    supportedGames = {
        [7436755782] = "https://api.luarmor.net/files/v3/loaders/4df8f816d04143ecfb2f7523fbeeaf39.lua", -- Grow a Garden  ✅ diganti
        [7018190066] = "https://api.luarmor.net/files/v4/loaders/d3a76114c1ea182127b88170b6043d11.lua", -- Dead Rails
        [5750914919] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/fisch.lua", -- Fisch
        [6325068386] = "https://api.luarmor.net/files/v4/loaders/a0ad31cf58a8bd98dd82fa1fb648290f.lua", -- BLR
        [4777817887] = "https://api.luarmor.net/files/v4/loaders/d53370331c9ca16ce3479c3ac6ae5a78.lua", -- Blade Ball
        [7095682825] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/beaks.lua", -- Beaks
        [994732206]  = "https://api.luarmor.net/files/v4/loaders/446a745866c1abf8459657502b7818fc.lua", -- Blox Fruit
        [4658598196] = "https://api.luarmor.net/files/v4/loaders/27394fa4dc9c7268a839f2c98b6a35f7.lua", -- AOTR
        [6331902150] = "https://api.luarmor.net/files/v3/loaders/0771107275ffabca9221c264306214f9.lua"  -- Forsaken
    }
else
    supportedGames = {
        [7436755782] = "https://api.luarmor.net/files/v3/loaders/4df8f816d04143ecfb2f7523fbeeaf39.lua", -- Grow a Garden  ✅ diganti
        [7018190066] = "https://api.luarmor.net/files/v4/loaders/a3e99a8c1a465fc973e7aa0dda0e220c.lua", -- Dead Rails
        [5750914919] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/fisch.lua", -- Fisch
        [6325068386] = "https://api.luarmor.net/files/v4/loaders/50ba70185011d66f3ed97e4e7f50bd11.lua", -- BLR
        [4777817887] = "https://api.luarmor.net/files/v4/loaders/6f48a7a95292a0885256d242900d81fb.lua", -- Blade Ball
        [7095682825] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/beaks.lua", -- Beaks
        [994732206]  = "https://api.luarmor.net/files/v4/loaders/1ba7f8bc6888d119d65cdafbe3d78527.lua", -- Blox Fruit
        [4658598196] = "https://api.luarmor.net/files/v4/loaders/5698b5c40f0217c268e673ef5e7b6581.lua", -- AOTR
        [6331902150] = "https://api.luarmor.net/files/v3/loaders/811768c852543782f63839177a263d53.lua"  -- Forsaken
    }
end

local gameNames = {
    [7436755782] = "GaG",                -- Grow a Garden
    [7018190066] = "Dead Rails",
    [5750914919] = "Fisch",
    [6325068386] = "Blue Lock Rivals",
    [4777817887] = "Blade Ball",
    [7095682825] = "Beaks",
    [994732206]  = "Blox Fruit",
    [4658598196] = "AOTR",
    [6331902150] = "Forsaken"
}

local gameId = game.GameId
if supportedGames[gameId] then
    game.StarterGui:SetCore("SendNotification", {
        Title    = "NatHub Loaded!",
        Text     = (gameNames[gameId] or tostring(gameId)) .. " Script Loaded!",
        Icon     = "rbxassetid://99764942615873",
        Duration = 5
    })

    loadstring(game:HttpGet(supportedGames[gameId]))()
else
    game.StarterGui:SetCore("SendNotification", {
        Title    = "NatHub Error!",
        Text     = "You executed a non-supported game",
        Icon     = "rbxassetid://99764942615873",
        Duration = 5
    })
end
