Arch-Dragon Dotfiles

Welcome to my personal dotfiles repository! This collection encompasses configurations for various tools and applications that I use to maintain a consistent and efficient development environment across my systems.

🛠️ Included Configurations

Kitty Terminal: Custom kitty.conf settings for a personalized terminal experience.

Waybar: Configurations for Waybar, including config.jsonc and style.css, tailored for my Hyprland setup.

Wofi: My wofi launcher configuration for a streamlined application launcher.

🚀 Setup Instructions

Step 1:) To set up these configurations on your system:
```git clone https://github.com/JoshuaH032/Arch-Dragon-dot-files.git ~/dotfiles```
Step 2:) Navigate into the cloned directory:
```cd ~/dotfiles```
Step 3:) Create symbolic links to the appropriate configuration directories:
```
ln -sf ~/dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf
ln -sf ~/dotfiles/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -sf ~/dotfiles/waybar/style.css ~/.config/waybar/style.css
ln -sf ~/dotfiles/wofi/config ~/.config/wofi/config
```
🧰 Tools & Utilities

Hyprland: A dynamic tiling Wayland compositor.

Kitty: A fast, feature-rich GPU-based terminal emulator.

Waybar: A highly customizable Wayland bar for status information.

Wofi: A Wayland-native application launcher.

🔄 Synchronization Across Systems

To synchronize these configurations across multiple systems:

1:) Clone the repository on each system:\
```git clone https://github.com/JoshuaH032/Arch-Dragon-dot-files.git ~/dotfiles```
Step 2:) Navigate into the cloned directory:
```cd ~/dotfiles```
Step 3:) Create symbolic links as described in the Setup Instructions.

Optional step: Periodically pull the latest changes:
```git pull origin main``` # Caution: If you've made local modifications, ensure to commit or stash them before pulling to avoid conflicts.

📝 License

This repository is licensed under the MIT License. See the LICENSE
 file for more details.

