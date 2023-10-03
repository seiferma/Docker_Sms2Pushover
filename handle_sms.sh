#!/bin/sh

EVENT=$1
FILE=$2

if [[ "$EVENT" == "RECEIVED" ]]; then

    FROM=$(cat "$FILE" | grep 'From:' | cut -d ' ' -f2-)
    TIME=$(cat "$FILE" | grep 'Received:' | cut -d ' ' -f2-)
    awk -v TMP="$FILE" '{print > (TMP "_"  ++CNT)}' RS="" "$FILE"

    TEXT=$(cat "$FILE"_2 | tr -d '\n')
    TEXT_FILE="$FILE"_text
    echo "Received: $TIME" > "$TEXT_FILE"
    echo >> "$TEXT_FILE"
    echo -n "$TEXT" >> "$TEXT_FILE"

    curl -s \
        --form-string "token=$PUSHOVER_TOKEN_API" \
        --form-string "user=$PUSHOVER_TOKEN_USER" \
        --form-string "title=SMS from $FROM" \
        --form "message=<$TEXT_FILE" \
        https://api.pushover.net/1/messages.json
    
    rm "$FILE"_*

fi

rm "$FILE"
