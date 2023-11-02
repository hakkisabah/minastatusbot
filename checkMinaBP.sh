#!/bin/bash

# Variables
TG_TOKEN="YOUR_TELEGRAM_BOT_TOKEN"
CHAT_ID="YOUR_TELEGRAM_CHAT_ID"

# Get the status and assign it to the r variable
r=$(mina client status)
# Check variable and if it's not synced send a message to the telegram bot
if !(grep Synced <<< "$r" > /dev/null)
then
	/usr/bin/curl -s -X POST https://api.telegram.org/bot$TG_TOKEN/sendMessage -d chat_id=$CHAT_ID -d text="$r"
fi