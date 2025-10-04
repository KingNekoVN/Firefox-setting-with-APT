#!/bin/bash
echo "Code By MinhNeko"
echo "Lưu ý phải bật root bằng lệnh sudo -s"

# Update hệ thống
sudo apt update

# Tạo APT Repo Key
sudo install -d -m 0755 /etc/apt/keyrings

# Tạo fingerprint
gpg -n -q --import --import-options import-show /etc/apt/keyrings/packages.mozilla.org.asc | awk '/pub/{getline; gsub(/^ +| +$/,""); if($0 == "35BAA0B33E9EB396F59CA838C0BA5CE6DC6315A3") print "\nThe key fingerprint matches ("$0").\n"; else print "\nVerification failed: the fingerprint ("$0") does not match the expected one.\n"}'

# Tạo Firefox APT Repo
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

# Configure cho firefox
echo '
Package: *
Pin: origin packages.mozilla.org
Pin-Priority: 1000
' | sudo tee /etc/apt/preferences.d/mozilla

# Cài đặt firefox
sudo apt install firefox
