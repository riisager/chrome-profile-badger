# Chrome-profile-badger

**Chrome-profile-badger** is a lightweight GTK 3 & X11 desktop utility for Linux Mint (Cinnamon) and Ubuntu-based desktop environments. It allows you to create dedicated desktop launchers for your Google Chrome profiles with custom-colored, high-readability badged icons.

By assigning unique window classes to each profile window dynamically, it prevents different Chrome profile windows from grouping under a single icon on your taskbar panel.

## Features

- **Prevent Grouping**: Launches Chrome profiles under their own unique `StartupWMClass` so Cinnamon treats them as distinct taskbar launchers.
- **Large Badges**: Renders a 50% larger badge/circle at the bottom-right of the Chrome logo for maximum readability even on small panels.
- **Dynamic Text Scaling**: Automatically shrinks the font size and padding for longer profile names (e.g., `WORK` vs. `NOCOFFEE.DK`) to fit cleanly within the icon canvas.
- **Preset & Custom Colors**: Includes a pre-configured Tailwind-like color palette, a full system color-wheel chooser, and a direct HEX entry box (e.g. `#EF4444`).
- **Interactive GUI**: Manage, edit, and delete your profile shortcuts through a clean, native GTK 3 desktop application.

## Installation

You can install Chrome-profile-badger using the provided installation script:

```bash
# Clone the repository (or download the files)
git clone https://github.com/yourusername/chrome-profile-badger.git
cd chrome-profile-badger

# Make the installer executable
chmod +x install.sh

# Run the installer with sudo
sudo ./install.sh
```

### Dependencies
The installation script will automatically install the following system packages via `apt`:
- `python3-xlib` (X11 client operations)
- `python3-pil` (Pillow for icon badging)
- `python3-gi` and `gir1.2-gtk-3.0` (PyGObject GTK 3 bindings)

## How to Use

1. Open **Chrome-profile-badger** from your Linux Mint Start Menu (located under **Accessories** or **Preferences**).
2. Select the Chrome profile you want to badger from the drop-down list.
3. Enter a custom **Shortcut Name** (e.g. `Chrome - Work`).
4. Type a short label in **Badge Text** (e.g. `WORK` or `W`).
5. Click a preset color or select a custom color (using the color wheel or HEX box).
6. Click **Create / Update Shortcut**.
7. Go to your start menu, find your new shortcut, and **add/pin it to your panel (taskbar)**.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
