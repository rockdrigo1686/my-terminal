# 🖥️ My Terminal Setup (Dotfiles)

Configuración personal, modular y multi-distro para terminal en Linux (GNOME Terminal / Zorin OS / Ubuntu / Fedora / Arch). Sincroniza paletas de colores en tiempo real para **Starship, tmux, Lazydocker, btop, bat, eza, fzf y Midnight Commander (`mc`)**.

---

## 🎨 Temas Incluidos

Usa el selector interactivo **`temas`** (o ejecuta cada comando directamente) para cambiar toda la estética de la terminal y sus herramientas al instante:

| Comando | Tema | Estilo de Prompt | Paleta Principal |
| :--- | :--- | :--- | :--- |
| **`tema-rose`** | 🌸 **Rosé Pine** | Editorial minimalista (`┃ user • ~ ❯`) | Rosa coral (`#eb6f92`), Cyan suave (`#9ccfd8`), Fondo (`#191724`) |
| **`tema-cyber`** | ⚡ **Cyber** | Minimalista espacial (`user ✦ ~ ➜`) | Rosa neón (`#ff79c6`), Cyan eléctrico (`#00f5d4`), Fondo (`#13111c`) |
| **`tema-neon`** | ☣️ **Neon** | Caja curva de 2 líneas (`╭─ user ◈ ~`) | Morado eléctrico (`#b829ea`), Verde neón (`#00ff87`), Fondo (`#100b1c`) |
| **`tema-magma`** | 🔥 **Magma** | Doble chevron (`» user ⚡ ~ ❯❯❯`) | Rojo carmesí (`#ff1e56`), Naranja (`#ff7b00`), Ámbar (`#ffb703`), Fondo (`#170b0e`) |
| **`tema-cobalt`** | 🧊 **Cobalt** | Geométrico diagonal (`❖ user ╱ ~ ❯❯`) | Azul marino (`#0b132b`), Azul cobalto (`#3a86ff`), Blanco (`#f8f9fa`), Rojo (`#ef233c`) |
| **`tema-phantom`** | 👻 **Phantom** | Espectral (`◆ user ▸ ~ ❯❯`) | Sombra morada (`#9d4edd`), Ojos carmesí (`#ff2a6d`), Lavanda (`#e0aaff`), Fondo (`#140d1f`) |

---

## 🛠️ Herramientas y Aplicaciones Soportadas

* **Starship:** Prompt ultrarrápido y personalizable.
* **tmux:** Multiplexor con inicio automático, soporte de ratón, copiado/pegado con clic central (`xclip`) y persistencia de sesiones tras reiniciar (`tpm`, `tmux-resurrect`, `tmux-continuum`).
* **eza:** Reemplazo moderno de `ls` con iconos y colores dinámicos por tema.
* **bat:** Reemplazo de `cat` con resaltado de sintaxis y temas `.tmTheme` nativos compilados.
* **btop:** Monitor de recursos del sistema en tiempo real con temas `.theme` personalizados.
* **fzf:** Buscador interactivo para historial (`Ctrl + R`), archivos y selector visual de temas.
* **Midnight Commander (`mc`):** Explorador de archivos de doble panel con skins TrueColor (24-bit).
* **Lazydocker:** Interfaz visual en terminal para gestionar contenedores, imágenes y logs de Docker.
* **Tipografía:** Descarga e instala automáticamente **JetBrainsMono Nerd Font**.

---

## 🚀 Instalación en una Nueva Computadora

1. **Clona este repositorio y ejecuta el instalador:**
   ```bash
   git clone https://github.com/rockdrigo1686/my-terminal.git ~/dotfiles
   cd ~/dotfiles
   ./install.sh
   ```
2. **Selecciona la fuente:** Elige **`JetBrainsMono Nerd Font`** en las preferencias de tu terminal.
3. **Instala los plugins de `tmux` (solo la primera vez):** Presiona **`Ctrl + b`** seguido de **`Shift + I`**.
4. **Recarga tu sesión:** `source ~/.bashrc`

---

## ⌨️ Comandos y Atajos Personalizados

* **Temas y Sync:** `temas`, `sync-dotfiles`, `pull-dotfiles`, `backup-terminal`, `restaurar-terminal`
* **Utilidades:** `cls`, `ls`, `ll`, `la`, `lt`, `cat`
* **Docker:** `lzd`, `dps`, `dpsa`, `dimg`, `dlogs <cont>`, `dsh <cont>`, `dstop`, `dclean`, `dcup`, `dcdown`, `dcrestart`, `dclogs`
* **SSH:** `sshm` (menú interactivo fzf), `sm` (conexión directa a media-server)
