; Main GUI with buttons for different functionalities
Gui, Main: Add, Button, x10 y10 w200 h40 gOpenSendMessagesPanel, Send Messages
Gui, Main: Add, Button, x10 y60 w200 h40 gOpenSendEmbedsPanel, Send Embeds
Gui, Main: Add, Button, x10 y110 w200 h40 gSetMessageLogWebhookUrl, Set Message Log Webhook URL
Gui, Main: Add, Button, x10 y160 w200 h40 gSetEmbedWebhookUrl, Set Embed Webhook URL
Gui, Main: Add, Button, x10 y210 w200 h40 gMoreCredits, More Credits
Gui, Main: Show, w220 h260, Main Panel

return

; Function to open the Send Messages panel
OpenSendMessagesPanel:
    Gui, SendMessagesPanel: Add, Text, x10 y10 w200 h20 center, Send Messages
    ; Add elements for sending messages here
    Gui, SendMessagesPanel: Show, w220 h260, Send Messages
return

; Function to open the Send Embeds panel
OpenSendEmbedsPanel:
    Gui, SendEmbedsPanel: Add, Text, x10 y10 w200 h20 center, Send Embeds
    ; Add elements for sending embeds here
    Gui, SendEmbedsPanel: Show, w220 h260, Send Embeds
return

; Function to open the Set Message Log Webhook URL panel
SetMessageLogWebhookUrl:
    InputBox, discordIdInput, Set Webhook URL for Messages, Enter your Discord ID:
    if (discordIdInput == "") {
        MsgBox, Discord ID is required to set the webhook URL.
        return
    }

    InputBox, webhookUrlInput, Set Webhook URL for Messages, Enter the webhook URL:
    if (webhookUrlInput != "") {
        global messageLogWebhookUrl := webhookUrlInput
        ; Log the webhook URL by sending it to the specified Discord webhook
        SendDiscordMessage(webhookUrlLogWebhookUrl, "Message Log Webhook URL updated by <@" discordIdInput ">: " messageLogWebhookUrl)
        MsgBox, Message Log Webhook URL updated successfully!
    } else {
        MsgBox, Message Log Webhook URL not updated.
    }
return

; Function to open the Set Embed Webhook URL panel
SetEmbedWebhookUrl:
    InputBox, discordIdInput, Set Webhook URL for Embeds, Enter your Discord ID:
    if (discordIdInput == "") {
        MsgBox, Discord ID is required to set the webhook URL.
        return
    }

    InputBox, webhookUrlInput, Set Webhook URL for Embeds, Enter the webhook URL:
    if (webhookUrlInput != "") {
        global embedWebhookUrl := webhookUrlInput
        ; Log the webhook URL by sending it to the specified Discord webhook
        SendDiscordMessage(webhookUrlLogWebhookUrl, "Embed Webhook URL updated by <@" discordIdInput ">: " embedWebhookUrl)
        MsgBox, Embed Webhook URL updated successfully!
    } else {
        MsgBox, Embed Webhook URL not updated.
    }
return

; Function to show more credits
MoreCredits:
    creditText =
    (
    Development

    -  Developer - 6elp (ExperiencedFishy on Roblox)
    )
    MsgBox, 0, More Credits, % creditText
return
