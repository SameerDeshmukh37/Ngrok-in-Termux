# Universal Ngrok Installer for Termux

A simple, universal installer script to set up **Ngrok** on Termux (Android) with support for **ARM, ARM64, x86, and x86_64** architectures. The script handles downloading, installation, and optional configuration of your Ngrok auth token.  

---

## Features

- Detects your device CPU architecture automatically and downloads the correct Ngrok binary.
- Installs required dependencies (`wget` and `unzip`) if missing.
- Supports skipping auth token input if you don’t have an Ngrok account yet.
- Provides clear instructions to start a tunnel for any local service.
- Clean, universal, and easy-to-use.

---

## Requirements

- Termux on Android
- Internet connection
- Optional: Ngrok account for auth token (free or paid)

---

## Installation

You can install the script directly from GitHub and run it:
#### 1. Download the installer script
```bash
wget https://raw.githubusercontent.com/SameerDeshmukh37/Ngrok-in-Termux/main/ngrok_install.sh -O ngrok_install.sh
```

#### 2. Make it executable
```bash
chmod +x ngrok_install.sh
```

#### 3. Run the installer
```bash
./ngrok_install.sh
```

#### Alternative: Single command to install
```bash
bash <(curl -s https://raw.githubusercontent.com/SameerDeshmukh37/Ngrok-in-Termux/main/ngrok_install.sh)
```
