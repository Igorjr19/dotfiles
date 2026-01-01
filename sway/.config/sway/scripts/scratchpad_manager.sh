#!/bin/bash

windows=$(swaymsg -t get_tree | jq -r '
    recurse(.nodes[]?, .floating_nodes[]?) | 
    select(.scratchpad_state != "none" and .scratchpad_state != null) |
    "\(.id)|\(.app_id // .window_properties.class // "Desconhecido") - \(.name // "Sem Título")"'
)

if [ -z "$windows" ]; then
    notify-send -u low "Scratchpad" "Nenhuma janela encontrada."
    exit 0
fi

selected=$(echo "$windows" | awk -F'|' '{printf "%-10s  %s\n", $2, $1}' | \
    fuzzel -d \
    --prompt="Scratchpad   " \
    --width=60 \
    --lines=10 \
    --no-icons \
)

# Foca na janela escolhida
if [ -n "$selected" ]; then
    id=$(echo "$selected" | awk '{print $NF}')
    swaymsg "[con_id=$id]" focus
fi