#!/data/data/com.termux/files/usr/bin/bash
# Universal Ngrok Auto Installer for Termux
# Supports ARM, ARM64, x86, x86_64
# Author: Sam's Script

# Update packages
pkg update -y && pkg upgrade -y

# Install dependencies
pkg install wget unzip -y

# Detect CPU architecture
ARCH=$(dpkg --print-architecture)
echo "🔍 Detected architecture: $ARCH"

# Set download URL based on architecture
case "$ARCH" in
    aarch64)
        NGROK_URL="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm64.zip"
        ;;
    arm|armhf)
        NGROK_URL="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-arm.zip"
        ;;
    i*86|i386|i686)
        NGROK_URL="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-386.zip"
        ;;
    x86_64|amd64)
        NGROK_URL="https://bin.equinox.io/c/bNyj1mQVY4c/ngrok-v3-stable-linux-amd64.zip"
        ;;
    *)
        echo "❌ Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

echo "⬇ Downloading Ngrok for $ARCH..."
wget -O ngrok.zip $NGROK_URL

# Unzip and move ngrok binary
unzip -o ngrok.zip
mv ngrok $PREFIX/bin/
chmod +x $PREFIX/bin/ngrok

# Clean up
rm ngrok.zip

# Ask user for auth token
echo "👉 Enter your Ngrok Auth Token (or press ENTER to skip if you don't have one yet):"
read TOKEN

if [ -n "$TOKEN" ]; then
    ngrok config add-authtoken $TOKEN
    echo "✅ Auth token saved successfully!"
else
    echo "⚠ You skipped entering the auth token. You can add it later using:"
    echo "   ngrok config add-authtoken YOUR_TOKEN"
fi

# Done
echo "✅ Ngrok installation complete!"
echo "💡 To start a tunnel for any local service, run:"
echo "   ngrok http <PORT_NUMBER>"
echo "   Replace <PORT_NUMBER> with the port your local server is running on."
echo " "
echo "Script by: Sameer Deshmukh"