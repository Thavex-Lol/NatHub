local function SendFischFinderWebhook(eventName, WEBHOOK_URL)
    local HttpService = game:GetService("HttpService")
    local jobId = game.JobId
    local placeId = game.PlaceId
    local players = #game.Players:GetPlayers()  -- Jumlah pemain saat ini
    local maxPlayers = game.Players.MaxPlayers  -- Kapasitas maksimal server

    local teleportScript = string.format(
        'game:GetService("TeleportService"):TeleportToPlaceInstance(%d, "%s", game.Players.LocalPlayer)',
        placeId, jobId
    )

    -- Embed data untuk webhook Discord
    local embed = {
        title = "NatHub Fish Finder",  -- Title baru
        description = "Execute the script below to join.",  -- Deskripsi baru
        color = 0x0080FF,  -- Warna biru (seperti logo kamu)
        fields = {
            {name = "🎯 Event", value = "```" .. eventName .. "```"},
            {name = "🆔 Server JobId", value = "```" .. jobId .. "```"},
            {name = "👥 Players in Server", value = "```" .. players .. " / " .. maxPlayers .. "```", inline = true},
            {name = "🚀 Join Script", value = "```lua\n" .. teleportScript .. "\n```"}
        },
        timestamp = os.date("!%Y-%m-%dT%H:%M:%SZ")
    }

    -- Data webhook
    local webhookData = {
        username = "NatHub Fisch-Finder",
        avatar_url = "https://media.discordapp.net/attachments/1348594194020831266/1350710374625705994/undefined_-_Imgur.jpg?ex=67d7ba90&is=67d66910&hm=1dfea8f4dff7582682e4803f13775faf71398c94a14f3d671bea8bdbcad286da&=&format=webp&width=561&height=561",
        embeds = {embed}
    }

    -- Kirim webhook
    local success, response = pcall(function()
        return (syn and syn.request or http_request) {
            Url = WEBHOOK_URL,
            Method = "POST",
            Headers = {["Content-Type"] = "application/json"},
            Body = HttpService:JSONEncode(webhookData)
        }
    end)

    if success then
        print("NatHub Fisch-Finder: Webhook sent for event - " .. eventName)
    else
        warn("NatHub Fisch-Finder: Failed to send webhook!")
    end
	task.wait(2)
end

return SendFischFinderWebhook
