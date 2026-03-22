#!/bin/bash

# IP地址
sed -i 's/192.168.1.1/192.168.5.100/g' package/base-files/files/bin/config_generate

# 主机名
sed -i 's/OpenWrt/TR3000/g' package/base-files/files/bin/config_generate

# 默认主题
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# iStoreOS伪装
sed -i 's/OpenWrt/iStoreOS/g' package/base-files/files/etc/openwrt_release

# Rust修复
sed -i 's/ci-llvm=true/ci-llvm=false/g' feeds/packages/lang/rust/Makefile

# OpenClash Meta
mkdir -p files/etc/openclash/core
wget -qO clash.tar.gz https://raw.githubusercontent.com/vernesong/OpenClash/core/master/meta/clash-linux-arm64.tar.gz
tar -zxvf clash.tar.gz -C files/etc/openclash/core/
mv files/etc/openclash/core/clash files/etc/openclash/core/clash_meta
chmod +x files/etc/openclash/core/clash_meta
rm -f clash.tar.gz
