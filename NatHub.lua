local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local supportedGames = {
    [4777817887] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/bladeball.lua" -- Bladeball
    [5750914919] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/fisch.lua", -- Fisch
    [7018190066] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/deadrails.lua", -- Dead Rails
    [6325068386] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/blr.lua", -- BLR
    [7095682825] = "https://raw.githubusercontent.com/ArdyBotzz/NatHub/refs/heads/master/beaks.lua" -- Beaks
}
local gameNames = {
    [5750914919] = "Fisch", -- Fisch
    [7018190066] = "Dead Rails", -- Dead Rails
    [6325068386] = "Blue Lock Rivals", -- BLR
    [4777817887] = "Blade Ball"
    [7095682825] = "Beaks" -- Beaks
}
local function sendExecute(ExecGame)
    local data = {
        executedGame = ExecGame
    }
    local success, response = pcall(function()
        return (syn and syn.request or http_request or request) {
            Url = "https://get.nathub.xyz/add-execute",
            Method = "POST",
            Headers = {["Content-Type"]="application/json"},
            Body = HttpService:JSONEncode(data)
        }
    end)
end
local gameId = game.GameId
if supportedGames[gameId] then
    game.StarterGui:SetCore("SendNotification", {
        Title = "NatHub Loaded!";
        Text = gameNames[gameId] .. " Script Loaded!";
        Icon =  "rbxassetid://99764942615873";
        Duration = 5;
    })
    loadstring(game:HttpGet(supportedGames[gameId]))()
    sendExecute(gameNames[gameId])
else
    game.StarterGui:SetCore("SendNotification", {
        Title = "NatHub Error!";
        Text = "You Execute Non Supported Game";
        Icon =  "rbxassetid://99764942615873";
        Duration = 5;
    })
end
