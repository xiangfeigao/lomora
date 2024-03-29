#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source

#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
make package/symlinks
cp -v configs/mipsel-3.4.config .config
#Rebuild the repository
make -j$(nproc)
make -j `nproc` tools/install V=s
make -j `nproc` toolchain/install V=s
rm -f feeds.conf.default
touch feeds.conf.default
echo 'src-git lomorage https://github.com/lomorage/openwrt-packages' >>feeds.conf.default
echo 'src-git packages https://git.openwrt.org/feed/packages.git' >>feeds.conf.default
echo 'src-git luci https://git.openwrt.org/project/luci.git' >>feeds.conf.default
echo 'src-git routing https://git.openwrt.org/feed/routing.git' >>feeds.conf.default
echo 'src-git telephony https://git.openwrt.org/feed/telephony.git' >>feeds.conf.default
