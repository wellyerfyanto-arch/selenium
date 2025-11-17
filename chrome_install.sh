#!/bin/bash
echo "🚀 Starting Chrome installation..."

# Install dependencies
apt-get update
apt-get install -y wget unzip

# Download Chrome
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Extract using ar (no root required)
ar x google-chrome-stable_current_amd64.deb
tar -xf data.tar.xz

# Setup Chrome directory
mkdir -p /tmp/chrome
cp -r opt/google/chrome/* /tmp/chrome/

# Download ChromeDriver
wget -q https://storage.googleapis.com/chrome-for-testing-public/120.0.6099.109/linux64/chromedriver-linux64.zip
unzip -q chromedriver-linux64.zip
mv chromedriver-linux64/chromedriver /usr/local/bin/
chmod +x /usr/local/bin/chromedriver

# Download VPN extension
wget -q -O touchvpn.crx "https://clients2.google.com/service/update2/crx?response=redirect&prodversion=109.0&x=id%3Dbihmplhobchoageeokmgbdihknkjbknd%26installsource%3Dwebstore%26uc"

echo "✅ Chrome installation completed!"
echo "Chrome location: /tmp/chrome/chrome"
echo "ChromeDriver location: /usr/local/bin/chromedriver"