#!/bin/bash

# 1. Obtém o histórico
HISTORY=$(makoctl history)

# 2. Verifica se está vazio
if [ -z "$HISTORY" ]; then
    notify-send "Central" "Histórico vazio."
    exit 0
fi

# 3. Processa e gera a lista
# Formato: "ID: [App] Título"
LIST=$(echo "$HISTORY" | awk '
    /^Notification [0-9]+:/ {
        id = $2;
        sub(/:$/, "", id);
        sub(/^Notification [0-9]+: /, "");
        summary = $0;
    }
    /^\s+App name:/ {
        sub(/^\s+App name: /, "");
        app = $0;
        if (id != "") {
             printf "%s: [%s] %s\n", id, app, summary;
        }
    }
')

# 4. Adiciona a opção "Limpar Tudo" no topo
MENU="$LIST"

# 5. Abre o Fuzzel
SELECTED=$(echo "$MENU" | fuzzel --dmenu \
    -p " Notification Center: " \
    -w 100 \
    -l 15 \
    --match-mode=fuzzy)

# 6. Lógica de Ação
if [ -z "$SELECTED" ]; then
    exit 0
fi

# AÇÃO: LIMPAR ESPECÍFICA (Apenas fecha se estiver na tela)
ID=$(echo "$SELECTED" | cut -d: -f1)

if [ -n "$ID" ]; then
    makoctl invoke -n "$ID"
fi