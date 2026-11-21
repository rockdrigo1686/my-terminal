export PATH="$HOME/.local/bin:$PATH"
export COLORTERM=truecolor

# Alias generales, eza y bat
alias cls="clear"
alias ls="eza --icons --group-directories-first"
alias ll="eza -lh --icons --git --group-directories-first"
alias la="eza -lah --icons --git --group-directories-first"
alias lt="eza --tree --level=2 --icons --group-directories-first"
alias cat="bat --paging=never"

# Alias rápidos para Docker y Lazydocker
alias lzd="lazydocker"
alias dps='docker ps --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"'
alias dpsa='docker ps -a --format "table {{.Names}}\t{{.Status}}\t{{.Image}}"'
alias dstop='docker stop $(docker ps -q)'
alias drm='docker rm -f'
alias dimg='docker images --format "table {{.Repository}}\t{{.Tag}}\t{{.Size}}"'
alias dclean='docker system prune -af --volumes'
alias dlogs='docker logs -f --tail=100'
dsh() { docker exec -it "$1" /bin/bash 2>/dev/null || docker exec -it "$1" /bin/sh; }
alias dcup='docker compose up -d'
alias dcdown='docker compose down'
alias dcrestart='docker compose restart'
alias dclogs='docker compose logs -f --tail=100'

# Paleta en GNOME Terminal
_aplicar_gnome_paleta() {
  if command -v gsettings &> /dev/null && gsettings list-schemas | grep -q "org.gnome.Terminal.ProfilesList"; then
    local P=$(gsettings get org.gnome.Terminal.ProfilesList default | tr -d "'")
    local G="org.gnome.Terminal.Legacy.Profile:/org/gnome/terminal/legacy/profiles:/:$P/"
    gsettings set $G use-theme-colors false
    gsettings set $G background-color "$1"
    gsettings set $G foreground-color "$2"
    gsettings set $G cursor-colors-set true
    gsettings set $G cursor-background-color "$3"
    gsettings set $G highlight-colors-set true
    gsettings set $G highlight-background-color "$4"
    gsettings set $G highlight-foreground-color "$2"
    gsettings set $G palette "$5"
  fi
}

# Temas completos
tema-rose() {
  cp ~/.config/starship-themes/rose-pine.toml ~/.config/starship.toml
  cp ~/.config/tmux-themes/rose-pine.conf ~/.tmux.conf
  cp ~/.config/lazydocker/rose-pine.yml ~/.config/lazydocker/config.yml
  sed -i 's/^color_theme = .*/color_theme = "rose-pine"/' ~/.config/btop/btop.conf
  sed -i 's/^--theme=.*/--theme="rose-pine"/' ~/.config/bat/config
  sed -i 's/^skin=.*/skin=rose-pine/' ~/.config/mc/ini 2>/dev/null
  export EZA_COLORS="di=1;36:ex=1;35:ln=1;34:fi=0;37:sn=34:sb=34:da=90:ur=36:uw=35:ux=33:gr=36:gw=35:gx=33:tr=36:tw=35:tx=33"
  export FZF_DEFAULT_OPTS="--color=bg+:#52293b,fg+:#e0def4,hl:#eb6f92,hl+:#9ccfd8,border:#ebbcba,prompt:#eb6f92,pointer:#9ccfd8,info:#c4a7e7"
  tmux source-file ~/.tmux.conf 2>/dev/null
  _aplicar_gnome_paleta '#191724' '#e0def4' '#eb6f92' '#52293b' "['#26233a', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4', '#6e6a86', '#eb6f92', '#31748f', '#f6c177', '#9ccfd8', '#c4a7e7', '#ebbcba', '#e0def4']"
  echo "🌸 Tema completo Rosé Pine activado"
}

tema-cyber() {
  cp ~/.config/starship-themes/rosa-cyan.toml ~/.config/starship.toml
  cp ~/.config/tmux-themes/rosa-cyan.conf ~/.tmux.conf
  cp ~/.config/lazydocker/rosa-cyan.yml ~/.config/lazydocker/config.yml
  sed -i 's/^color_theme = .*/color_theme = "rosa-cyan"/' ~/.config/btop/btop.conf
  sed -i 's/^--theme=.*/--theme="rosa-cyan"/' ~/.config/bat/config
  sed -i 's/^skin=.*/skin=rosa-cyan/' ~/.config/mc/ini 2>/dev/null
  export EZA_COLORS="di=1;35:ex=1;36:ln=1;34:fi=0;37:sn=1;36:sb=36:da=34:ur=35:uw=36:ux=31:gr=35:gw=36:gx=31:tr=35:tw=36:tx=31"
  export FZF_DEFAULT_OPTS="--color=bg+:#16425b,fg+:#ffffff,hl:#ff2a85,hl+:#00f5d4,border:#8be9fd,prompt:#ff79c6,pointer:#00f5d4,info:#bd93f9"
  tmux source-file ~/.tmux.conf 2>/dev/null
  _aplicar_gnome_paleta '#13111c' '#f8f8f2' '#ff79c6' '#16425b' "['#211d30', '#ff5555', '#00f5d4', '#bd93f9', '#8be9fd', '#ff79c6', '#bd93f9', '#f8f8f2', '#6272a4', '#ff6e6e', '#00bbf9', '#d6acff', '#a4ffff', '#ff92df', '#d6acff', '#ffffff']"
  echo "⚡ Tema completo Rosa + Cyan activado"
}

tema-neon() {
  cp ~/.config/starship-themes/morado-verde.toml ~/.config/starship.toml
  cp ~/.config/tmux-themes/morado-verde.conf ~/.tmux.conf
  cp ~/.config/lazydocker/morado-verde.yml ~/.config/lazydocker/config.yml
  sed -i 's/^color_theme = .*/color_theme = "morado-verde"/' ~/.config/btop/btop.conf
  sed -i 's/^--theme=.*/--theme="morado-verde"/' ~/.config/bat/config
  sed -i 's/^skin=.*/skin=morado-verde/' ~/.config/mc/ini 2>/dev/null
  export EZA_COLORS="di=1;32:ex=1;35:ln=1;34:fi=0;37:sn=1;35:sb=35:da=34:ur=32:uw=35:ux=31:gr=32:gw=35:gx=31:tr=32:tw=35:tx=31"
  export FZF_DEFAULT_OPTS="--color=bg+:#3b1c54,fg+:#f0e6ff,hl:#00ff87,hl+:#b829ea,border:#9d4edd,prompt:#00ff87,pointer:#b829ea,info:#c77dff"
  tmux source-file ~/.tmux.conf 2>/dev/null
  _aplicar_gnome_paleta '#100b1c' '#f0e6ff' '#00ff87' '#3b1c54' "['#24163b', '#ff2a6d', '#00ff87', '#c77dff', '#9d4edd', '#b829ea', '#39ff14', '#f0e6ff', '#6c568c', '#ff5c8a', '#69ff94', '#e0aaff', '#b5179e', '#d946ef', '#80ffdb', '#ffffff']"
  echo "☣️ Tema completo Morado + Verde Neón activado"
}



tema-magma() {
  cp ~/.config/starship-themes/magma.toml ~/.config/starship.toml
  cp ~/.config/tmux-themes/magma.conf ~/.tmux.conf
  cp ~/.config/lazydocker/magma.yml ~/.config/lazydocker/config.yml
  sed -i 's/^color_theme = .*/color_theme = "magma"/' ~/.config/btop/btop.conf
  sed -i 's/^--theme=.*/--theme="magma"/' ~/.config/bat/config
  sed -i 's/^skin=.*/skin=magma/' ~/.config/mc/ini 2>/dev/null
  export EZA_COLORS="di=1;33:ex=1;31:ln=1;35:fi=0;37:sn=1;31:sb=31:da=33:ur=33:uw=31:ux=35:gr=33:gw=31:gx=35:tr=33:tw=31:tx=35"
  export FZF_DEFAULT_OPTS="--color=bg+:#4a141c,fg+:#fff1eb,hl:#ffb703,hl+:#ff1e56,border:#ff7b00,prompt:#ff1e56,pointer:#ffb703,info:#ff7b00"
  tmux source-file ~/.tmux.conf 2>/dev/null
  _aplicar_gnome_paleta '#170b0e' '#fff1eb' '#ffb703' '#4a141c' "['#2e141a', '#ff1e56', '#ff7b00', '#ffb703', '#ff5400', '#e63946', '#ffd166', '#fff1eb', '#7d4e57', '#ff4d6d', '#ff9100', '#ffe066', '#ff6b00', '#ff758f', '#fff3b0', '#ffffff']"
  echo "🔥 Tema completo Magma (Rojo + Naranja + Ámbar) activado"
}


tema-cobalt() {
  cp ~/.config/starship-themes/cobalt.toml ~/.config/starship.toml
  cp ~/.config/tmux-themes/cobalt.conf ~/.tmux.conf
  cp ~/.config/lazydocker/cobalt.yml ~/.config/lazydocker/config.yml
  sed -i 's/^color_theme = .*/color_theme = "cobalt"/' ~/.config/btop/btop.conf
  sed -i 's/^--theme=.*/--theme="cobalt"/' ~/.config/bat/config
  sed -i 's/^skin=.*/skin=cobalt/' ~/.config/mc/ini 2>/dev/null
  export EZA_COLORS="di=1;34:ex=1;31:ln=1;36:fi=0;37:sn=1;36:sb=36:da=34:ur=34:uw=31:ux=37:gr=34:gw=31:gx=37:tr=34:tw=31:tx=37"
  export FZF_DEFAULT_OPTS="--color=bg+:#253c6e,fg+:#f8f9fa,hl:#ef233c,hl+:#4cc9f0,border:#3a86ff,prompt:#ef233c,pointer:#4cc9f0,info:#a9d6e5"
  tmux source-file ~/.tmux.conf 2>/dev/null
  _aplicar_gnome_paleta '#0b132b' '#f8f9fa' '#ef233c' '#253c6e' "['#1c2541', '#ef233c', '#4cc9f0', '#a9d6e5', '#3a86ff', '#d90429', '#90e0ef', '#f8f9fa', '#5c6b9c', '#ff4d6d', '#72efdd', '#caf0f8', '#4895ef', '#ff758f', '#ade8f4', '#ffffff']"
  echo "🧊 Tema completo Cobalt (Azul Marino + Blanco + Rojo) activado"
}


tema-phantom() {
  cp ~/.config/starship-themes/phantom.toml ~/.config/starship.toml
  cp ~/.config/tmux-themes/phantom.conf ~/.tmux.conf
  cp ~/.config/lazydocker/phantom.yml ~/.config/lazydocker/config.yml
  sed -i 's/^color_theme = .*/color_theme = "phantom"/' ~/.config/btop/btop.conf
  sed -i 's/^--theme=.*/--theme="phantom"/' ~/.config/bat/config
  sed -i 's/^skin=.*/skin=phantom/' ~/.config/mc/ini 2>/dev/null
  export EZA_COLORS="di=1;35:ex=1;31:ln=1;37:fi=0;37:sn=1;35:sb=35:da=35:ur=35:uw=31:ux=37:gr=35:gw=31:gx=37:tr=35:tw=31:tx=37"
  export FZF_DEFAULT_OPTS="--color=bg+:#3c1b59,fg+:#f3e8ff,hl:#ff2a6d,hl+:#e0aaff,border:#9d4edd,prompt:#ff2a6d,pointer:#e0aaff,info:#ff70a6"
  tmux source-file ~/.tmux.conf 2>/dev/null
  _aplicar_gnome_paleta '#140d1f' '#f3e8ff' '#ff2a6d' '#3c1b59' "['#27183b', '#ff2a6d', '#c77dff', '#ff70a6', '#9d4edd', '#7b2cbf', '#e0aaff', '#f3e8ff', '#6b5280', '#ff4d88', '#d896ff', '#ff99c2', '#b565f2', '#9d4edd', '#edd2ff', '#ffffff']"
  echo "👻 Tema completo Phantom (Gengar) activado"
}

temas() {
  local opcion
  opcion=$(printf "🌸 Rosé Pine (Suave y elegante)\n⚡ Cyber (Rosa neón + Cyan eléctrico)\n☣️  Neon (Morado + Verde neón)\n🔥 Magma (Rojo + Naranja + Ámbar)\n🧊 Cobalt (Azul Marino + Blanco + Rojo)\n👻 Phantom (Sombra Morada + Ojos Carmesí)" | \
    fzf --height=45% --layout=reverse --border=rounded --prompt="🎨 Elige tu tema > ")
  case "$opcion" in
    *"Rosé Pine"*) tema-rose ;;
    *"Cyber"*)     tema-cyber ;;
    *"Neon"*)      tema-neon ;;
    *"Magma"*)     tema-magma ;;
    *"Cobalt"*)    tema-cobalt ;;
    *"Phantom"*)   tema-phantom ;;
  esac
}

sync-dotfiles() {
  cp -r ~/.config/starship-themes ~/dotfiles/.config/
  cp -r ~/.config/tmux-themes ~/dotfiles/.config/
  cp -r ~/.config/lazydocker ~/dotfiles/.config/
  cp -r ~/.config/btop ~/dotfiles/.config/
  cp -r ~/.config/bat ~/dotfiles/.config/
  cp -r ~/.config/mc ~/dotfiles/.config/
  cp -r ~/.local/share/mc/skins ~/dotfiles/.local/share/mc/
  cp ~/.config/starship.toml ~/dotfiles/.config/
  cp ~/.tmux.conf ~/dotfiles/
  (cd ~/dotfiles && git add . && git commit -m "Actualiza temas y config $(date +%Y-%m-%d_%H:%M)" && git push)
  echo "☁️ Dotfiles sincronizados con GitHub"
}

backup-terminal() {
  local DESTINO="$HOME/Backups-Terminal"
  local ARCHIVO="$DESTINO/terminal-setup-$(date +%Y-%m-%d_%H-%M).tar.gz"
  mkdir -p "$DESTINO"
  tar -czf "$ARCHIVO" -C "$HOME" .bashrc .terminal-custom.sh .tmux.conf .config/starship.toml .config/starship-themes .config/tmux-themes .config/lazydocker .config/btop .config/bat .config/mc .local/share/mc/skins 2>/dev/null
  echo "✅ Respaldo guardado en: $ARCHIVO"
}

restaurar-terminal() {
  local DESTINO="$HOME/Backups-Terminal"
  local ARCHIVO=$(ls -1t "$DESTINO"/*.tar.gz 2>/dev/null | fzf --height=35% --layout=reverse --border=rounded --prompt="📦 Elige respaldo > ")
  if [ -n "$ARCHIVO" ]; then
    tar -xzf "$ARCHIVO" -C "$HOME" && bat cache --build 2>/dev/null && tmux source-file ~/.tmux.conf 2>/dev/null && source ~/.bashrc
    echo "♻️ Configuración restaurada"
  fi
}

pull-dotfiles() {
  (cd ~/dotfiles && git pull)
  cp -r ~/dotfiles/.config/* ~/.config/ && cp -r ~/dotfiles/.local/share/mc/* ~/.local/share/mc/ && cp ~/dotfiles/.tmux.conf ~/.tmux.conf
  bat cache --build 2>/dev/null && source ~/.bashrc
  echo "⬇️ Dotfiles actualizados desde GitHub"
}

command -v starship &> /dev/null && eval "$(starship init bash)"
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  tmux attach-session -t principal || tmux new-session -s principal
fi
alias ecode="flatpak run io.elementary.code"

# --- Selector interactivo de SSH con fzf ---
sshm() {
  local host
  host=$(awk '/^Host / && !/\*/ {print $2}' ~/.ssh/config 2>/dev/null | fzf \
    --height=40% \
    --layout=reverse \
    --border \
    --prompt="🔌 Conectar SSH > " \
    --preview="awk '/^Host '{}\$'/{flag=1; print; next} /^Host /{flag=0} flag' ~/.ssh/config" \
    --preview-window=right:45%:wrap)

  [ -n "$host" ] && ssh "$host"
}

alias sm='ssh media-server'

# --- Menú interactivo de Docker con fzf ---
dmenu() {
  local accion cont sub
  accion=$(printf "📦 Gestionar contenedor (logs/shell/restart)\n🚀 Docker Compose UP (-d)\n🛑 Docker Compose DOWN\n🔄 Docker Compose RESTART\n🐳 Abrir Lazydocker\n🧹 Limpiar sistema (prune)" | fzf \
    --height=45% --layout=reverse --border --prompt="🐳 Docker > ")

  [ -z "$accion" ] && return

  case "$accion" in
    *"Gestionar contenedor"*)
      cont=$(docker ps -a --format "{{.Names}}\t{{.Status}}\t{{.Image}}" | fzf \
        --height=60% --layout=reverse --border --prompt="📦 Contenedor > " \
        --preview="docker logs --tail 25 {1} 2>&1" \
        --preview-window=right:55%:wrap | awk '{print $1}')
      [ -z "$cont" ] && return

      sub=$(printf "📜 Ver logs en vivo\n💻 Entrar a shell (bash/sh)\n🔄 Reiniciar\n▶️  Iniciar\n⏹️  Detener\n🗑️  Eliminar" | fzf \
        --height=35% --layout=reverse --border --prompt="⚡ $cont > ")

      case "$sub" in
        *"logs"*)      docker logs -f --tail 50 "$cont" ;;
        *"shell"*)     docker exec -it "$cont" sh -c "command -v bash >/dev/null && exec bash || exec sh" ;;
        *"Reiniciar"*) docker restart "$cont" ;;
        *"Iniciar"*)   docker start "$cont" ;;
        *"Detener"*)   docker stop "$cont" ;;
        *"Eliminar"*)  docker rm -f "$cont" ;;
      esac
      ;;
    *"UP"*)         docker compose up -d ;;
    *"DOWN"*)       docker compose down ;;
    *"RESTART"*)    docker compose restart ;;
    *"Lazydocker"*) lazydocker ;;
    *"Limpiar"*)    docker system prune -f ;;
  esac
}
