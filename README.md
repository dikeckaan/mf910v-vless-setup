# MF910V VLESS Setup

This repository provides a setup guide for configuring the ZTE MF910V device with VLESS, a lightweight and secure proxy protocol supported by Xray. It includes scripts for installation, uninstallation, and configuration updates, tailored for Windows systems.

---

## Features

- **VLESS Support**: Secure and lightweight proxy protocol.
- **Automated Setup**: Installation and configuration scripts included.
- **GeoIP and Geosite**: Built-in data files for optimized routing and filtering.
- **Proxy Auto-Configuration**: PAC file included for seamless proxy management.

---

## Requirements

- A Windows-based system or Unix-based environment with bash support.
- ZTE MF910V device.
- Internet connectivity for downloading dependencies.

---

## Installation

1. Download or clone the repository to your system:
   ```bash
   git clone https://github.com/your-repo/mf910v-vless-setup.git
   ```
2. Navigate to the directory containing the scripts.
3. Execute the installation script for Windows:
   - Double-click `installer.bat` or run it in a command prompt.

---

## Uninstallation

To remove the setup completely:
1. Navigate to the installation directory.
2. Execute the uninstallation script:
   - Double-click `uninstaller.bat` or run it in a command prompt.

---

## Updating Configuration

1. Navigate to the installation directory.
2. Run the update script:
   - Double-click `update-config.bat` or execute it in a command prompt.

---

## File Descriptions

- **`geoip.dat`** and **`geosite.dat`**: Files containing GeoIP and geosite data for routing and filtering.
- **`proxy.pac`**: Proxy Auto-Configuration file for setting up browser/system-level proxy rules.
- **`installer.bat`**: Installs and sets up the VLESS configuration on Windows.
- **`uninstaller.bat`**: Removes the installed configuration.
- **`update-config.bat`**: Updates the configuration files to the latest version.
- **`xray`**: The Xray executable for proxy handling.
- **`xray.sh`**: init.d script for starting Xray on every system boots up.

---

## Notes

- Ensure your ZTE MF910V device is connected to the system during setup.
- Backup your configurations before

updating or uninstalling to avoid data loss.

---

## Support

For issues or contributions, feel free to open an issue or submit a pull request.
