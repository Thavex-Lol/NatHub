local function WebhookStats(link)
	local Players = game:GetService("Players")
	local LocalPlayer = Players.LocalPlayer
	local Character = LocalPlayer.Character
	local HttpService = game:GetService("HttpService")
	local function getAvatarThumbnail(userId)
		local url = "https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=" .. userId .. "&size=420x420&format=Png"
		local success, response = pcall(function()
			return HttpService:JSONDecode(game:HttpGet(url))
		end)

		if success and response and response.data and response.data[1] then
			return response.data[1].imageUrl
		else
			warn("Failed to fetch avatar thumbnail!")
			return nil
		end
	end
	local stats = workspace.PlayerStats:FindFirstChild(LocalPlayer.Name).T:FindFirstChild(LocalPlayer.Name).Stats
	local avatar_url = getAvatarThumbnail(LocalPlayer.UserId)
	local level = stats.realLevel and stats.realLevel.Value or 0
	local streak = stats.tracker_streak and stats.tracker_streak.Value or 0
	local money = stats.coins and stats.coins.Value or 0
	
	local minutes = math.floor(uptime / 60)
    local seconds = math.floor(uptime % 60)
	local stats_uptime = minutes .. "m " .. seconds .. "s"

	local embed = {
		title = "<:bell:1365290070709506139> NatHub Webhook Stats",
		description = "Here's your current stats:",
		color = 0x0e4ff,
		fields = {
			{name = "<:stats:1365955343221264564> Level", value = "```" .. level .. "```", inline = true},
			{name = "<:fish:1365955309524353024> Catch Streak", value = "```" .. streak .. "```", inline = true},
			{name = "<:money:1365955380294844509> Money", value = "```" .. money .. "```", inline = true},
			{name = "<:time:1365991843011100713> Uptime", value = "```" .. stats_uptime .. "```", inline = true}
		},
		thumbnail = {
			url = avatar_url
		},
		timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
	}

	local webhookData = {
		username = (LocalPlayer.Name or "Unknowm") .. "'s Stats",
		avatar_url = "https://media.discordapp.net/attachments/1360941350224396411/1361879600442904707/98e3df0604bdabe7b37ad4ccaf02ad0d.webp?ex=68005cb7&is=67ff0b37&hm=b742141585401eb1e6554eb0916ea757a7bcf8e9759ae181eb92493dd009ce56&=&format=webp",
		embeds = {embed}
	}

	local success, response = pcall(function()
		return (syn and syn.request or http_request) {
			Url = link,
			Method = "POST",
			Headers = {["Content-Type"] = "application/json"},
			Body = HttpService:JSONEncode(webhookData)
		}
	end)
end

return WebhookStats
