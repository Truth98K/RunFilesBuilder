#!/bin/bash
set -e

# 清理旧文件
rm -rf store
mkdir -p store

# 这里示例用的是 ImmortalWrt 24.10 x86_64 目标包仓库URL（请按需改）
BASE_URL="https://downloads.immortalwrt.org/releases/24.10.2/x86/64/packages"

# 你要下载的包名列表
PACKAGES=(
  "luci-app-quickstart_0.9.7-1_x86_64.ipk"
  "luci-base_*.ipk"
  "luci-lib-ip_*.ipk"
)

# 下载包
for pkg in "${PACKAGES[@]}"; do
  echo "Downloading $pkg"
  # 用 curl -f -L -o 进行下载，* 用通配符时需用另外方案
  # 这里简单示范，实际你可能写个正则匹配或网页解析
  curl -f -L -o "store/${pkg}" "${BASE_URL}/${pkg}" || echo "Failed to download $pkg"
done
