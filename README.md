# 🖥️ My Terminal Setup (Dotfiles)

Configuración personal, modular y multi-distro para terminal en Linux (GNOME Terminal / Zorin OS / Ubuntu / Fedora / Arch). Incluye sincronización automática de paletas de colores en tiempo real para **Starship, tmux, Lazydocker, btop, bat, eza, fzf y Midnight Commander (`mc`)**.

---

## 🎨 Temas Incluidos

Con el comando interactivo **`temas`** (o llamando directamente a cada función) se actualiza toda la estética de la terminal y sus herramientas al mismo tiempo:

| Comando | Tema | Estilo de Prompt | Paleta Principal |
| :--- | :--- | :--- | :--- |
| **`tema-rose`** | 🌸 **Rosé Pine** | Editorial minimalista (`┃ user • ~ ❯`) | Rosa coral (`#eb6f92`), Cyan suave (`#9ccfd8`), Fondo (`#191724`) |
| **`tema-cyber`** | ⚡ **Cyber** | Minimalista espacial (`user ✦ ~ ➜`) | Rosa neón (`#ff79c6`), Cyan eléctrico (`#00f5d4`), Fondo (`#13111c`) |
| **`tema-neon`** | ☣️ **Neon** | Caja curva de 2 líneas (`╭─ user ◈ ~`) | Morado eléctrico (`#b829ea`), Verde neón (`#00ff87`), Fondo (`#100b1c`) |

---

## 🛠️ Herramientas y Aplicaciones Soportadas

El script `install.sh` configura e instala (de forma opcional y automática según el gestor de paquetes de la distro: `apt`, `dnf` o `pacman`) las siguientes herramientas:

* **[Starship](https://starship.rs):** Prompt ultrarrápido y personalizable.
* **[tmux](https://github.com):** Multiplexor de terminal con inicio automático, soporte de ratón, copiado/pegado con clic central (`xclip`) y persistencia de sesiones tras reiniciar (`tpm`, `tmux-resurrect` y `tmux-continuum`).
* **[eza](https://github.com):** Reemplazo moderno de `ls` con iconos y colores dinámicos por tema.
* **[bat](https://github.com):** Reemplazo de `cat` con resaltado de sintaxis y temas `.tmTheme` nativos compilados.
* **[btop](https://github.com):** Monitor de recursos del sistema en tiempo real con temas `.theme` personalizados.
* **[fzf](https://github.com):** Buscador interactivo para historial (`Ctrl + R`), archivos y selector visual de temas.
* **[Midnight Commander (`mc`)](https://midnight-commander.org):** Explorador de archivos de doble panel con skins TrueColor (24-bit) a juego.
* **[Lazydocker](https://github.com):** Interfaz visual en terminal para gestionar contenedores, imágenes y logs de Docker.
* **Tipografía:** Descarga e instala automáticamente **JetBrainsMono Nerd Font** para renderizar todos los iconos.

---

## 🚀 Instalación en una Nueva Computadora

1. **Clona este repositorio y ejecuta el instalador:**
   ```bash
   git clone https://github.com ~/dotfiles
   cd ~/dotfiles
   ./install.sh
   ```
2. **Selecciona la fuente en tu terminal:**
   * Abre las *Preferencias* de tu terminal y elige **`JetBrainsMono Nerd Font`** como tipografía personalizada.
3. **Instala los plugins de `tmux` (solo la primera vez):**
   * Dentro de `tmux`, presiona **`Ctrl + b`** seguido de **`Shift + I`** para instalar `tmux-resurrect` y `tmux-continuum`.
4. **Recarga tu sesión:**
   ```bash
   source ~/.bashrc
   ```

---

## ⌨️ Comandos y Atajos Personalizados

### 🎨 Gestión de Temas y Sincronización
* **`temas`**: Abre el menú interactivo (`fzf`) para cambiar de estilo con las flechas del teclado.
* **`sync-dotfiles`**: Empaqueta cualquier cambio local en temas o configuraciones y hace `commit` + `push` automático a GitHub.
* **`pull-dotfiles`**: Descarga los últimos cambios desde GitHub en otra PC y recarga la configuración.
* **`backup-terminal`**: Crea un respaldo comprimido (`.tar.gz`) en `~/Backups-Terminal/`.
* **`restaurar-terminal`**: Abre un menú interactivo para restaurar un respaldo local previo.

### 📁 Navegación y Utilidades
* **`cls`**: Limpia la pantalla (`clear`).
* **`ls` / `ll` / `la` / `lt`**: Listado de archivos con iconos, permisos, Git y vista de árbol (`eza`).
* **`cat`**: Visualización de archivos con resaltado de sintaxis (`bat`).

### 🐳 Atajos de Docker y Lazydocker
* **`lzd`**: Abre Lazydocker.
* **`dps` / `dpsa`**: Lista contenedores activos / todos los contenedores en formato tabla limpia.
* **`dimg`**: Lista imágenes locales.
* **`dlogs <contenedor>`**: Muestra los últimos 100 logs en tiempo real.
* **`dsh <contenedor>`**: Abre una shell interactiva (`bash` o `sh`) dentro de un contenedor.
* **`dstop`**: Detiene todos los contenedores activos.
* **`dclean`**: Limpia contenedores detenidos, imágenes sin usar y volúmenes huérfanos.
* **`dcup` / `dcdown` / `dcrestart` / `dclogs`**: Gestión rápida de `docker compose`.

---

## 📂 Estructura del Repositorio

```text
~/dotfiles/
├── .config/
│   ├── bat/                 # Configuración y temas .tmTheme nativos
│   ├── btop/                # Configuración y temas .theme personalizados
│   ├── lazydocker/          # Paletas YAML para Lazydocker
│   ├── mc/                  # Configuración ini de Midnight Commander
│   ├── starship-themes/     # Presets de Starship (Rosé Pine, Cyber, Neon)
│   └── tmux-themes/         # Configuraciones y paletas de tmux
├── .local/share/mc/skins/   # Skins TrueColor (24-bit) para Midnight Commander
├── .terminal-custom.sh      # Archivo maestro de alias, funciones y temas (enlazado a ~/)
├── .tmux.conf               # Configuración activa de tmux
├── install.sh               # Script de instalación automática multi-distro
└── README.md                # Documentación del proyecto
```
