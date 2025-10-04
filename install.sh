#!/bin/bash
echo "Code By MinhNeko"
echo "Lưu ý phải bật root bằng lệnh sudo -s"

# Update hệ thống
sudo apt update

# Tạo dir cho snap để nó hoạt động
mkdir -p ~/.mozilla/firefox/ && cp -a ~/snap/firefox/common/.mozilla/firefox/* ~/.mozilla/firefox/

# Cài firefox
sudo snap install firefox
