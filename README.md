# MF910V VLESS Setup

This repository provides all the necessary files and instructions to configure the ZTE MF910V device with the VLESS protocol. The setup is optimized for Windows, with scripts for installation, uninstallation, and configuration updates.

---

## Features

- **VLESS Support**: A lightweight and secure proxy protocol.
- **Automated Setup**: Includes easy-to-use scripts for installation and configuration.
- **GeoIP and Geosite**: Built-in data files for optimized routing and filtering.
- **Proxy Auto-Configuration**: PAC file included for browser/system-level proxy management.
- **Web-Based Configuration Generator**: Use `index.html` to easily create and customize configurations.

---

## Requirements

- A Windows-based system.
- ZTE MF910V device.
- Internet connectivity for downloading dependencies.
- A web browser to open `index.html` for generating configurations.

---

## Installation

1. Download or clone the repository to your system:
   ```bash
   git clone https://github.com/your-repo/mf910v-vless-setup.git
   ```
2. Navigate to the directory containing the scripts.
3. Run the installation script for Windows:
   - Double-click `installer.bat` or execute it in a command prompt.

---

## Using `index.html` for Configuration Generation

1. Open the `index.html` file in your preferred web browser.
2. Follow the on-screen instructions to generate a configuration tailored to your needs.
3. Save the generated configuration file in the appropriate directory (e.g., where `xray` is installed).
4. Run the `update-config.bat` script to apply the new configuration.

---

## Uninstallation

To completely remove the setup:
1. Navigate to the installation directory.
2. Run the uninstallation script:
   - Double-click `uninstaller.bat` or execute it in a command prompt.

---

## Updating Configuration

1. Open `index.html` to create or modify your configuration.
2. Save the updated configuration file.
3. Run the update script:
   - Double-click `update-config.bat` or execute it in a command prompt.

---

## File Descriptions

- **`geoip.dat`** and **`geosite.dat`**: Contain GeoIP and geosite data for routing and filtering.
- **`proxy.pac`**: Proxy Auto-Configuration file for browser/system-level proxy rules.
- **`installer.bat`**: Installs and sets up the VLESS configuration on Windows.
- **`uninstaller.bat`**: Removes the installed configuration.
- **`update-config.bat`**: Updates the configuration files to the latest version.
- **`xray`**: The core executable for managing VLESS.

---

## Notes

- Ensure your ZTE MF910V device is connected to the system during setup.
- Use the `index.html` file to easily create and customize configurations.
- Backup your configurations before updating or uninstalling to prevent data loss.

---

## Support

For any issues or contributions, feel free to open an issue or submit a pull request.

Here’s an example credit section you can include in the `README.md` file:


## Credits

- **GitHub**: [dikeckaan](https://github.com/dikeckaan)  
- **Telegram**: [Kaan Dikeç](https://t.me/kaandikec)  