#!/bin/bash
cd openwrt
rm -rf package/lean/luci-theme-argon
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# 说明：
# 除了第一行的#!/bin/bash不要动，其他的设置，前面带#表示不起作用，不带的表示起作用了（根据你自己需要打开或者关闭）
#

# 修改openwrt登陆地址,把下面的192.168.2.2修改成你想要的就可以了，其他的不要动
#sed -i 's/192.168.1.1/192.168.1.2/g' package/base-files/files/bin/config_generate


#修改内核版本（下面两行代码前面有#为源码默认最新5.4内核,没#为4.19内核,默认修改X86的，其他机型L大那里target/linux查看，对应修改下面的路径就好）
#sed -i 's/KERNEL_PATCHVER:=5.4/KERNEL_PATCHVER:=4.14/g' ./target/linux/ramips/Makefile  #修改内核版本
#sed -i 's/KERNEL_TESTING_PATCHVER:=5.4/KERNEL_TESTING_PATCHVER:=4.14/g' ./target/linux/ramips/Makefile  #修改内核版本


#取消掉feeds.conf.default文件里面的helloworld的#注释
sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default  #使用源码自带ShadowSocksR Plus+出国软件


sed -i 's@.*CYXluq4wUazHjmCDBCqXF*@#&@g' package/lean/default-settings/files/zzz-default-settings  #设置密码为空


#添加自定义插件链接（自己想要什么就github里面搜索然后添加）
git clone -b 18.06 https://github.com/garypang13/luci-theme-edge package/luci-theme-edge  #主题-edge-动态登陆界面
#git clone -b master https://github.com/vernesong/OpenClash.git package/luci-app-openclash  #openclash出国软件
#git clone https://github.com/frainzy1477/luci-app-clash package/luci-app-clash  #clash出国软件
#git clone https://github.com/tty228/luci-app-serverchan package/luci-app-serverchan  #微信推送
#git clone -b lede https://github.com/pymumu/luci-app-smartdns.git package/luci-app-smartdns  #smartdns DNS加速


#passwall出国软件
#svn co https://github.com/xiaorouji/openwrt-package/trunk/lienol/luci-app-passwall package/luci-app-passwall
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/brook package/brook
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/chinadns-ng package/chinadns-ng
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/tcping package/tcping
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-go package/trojan-go
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/trojan-plus package/trojan-plus
#svn co https://github.com/xiaorouji/openwrt-package/trunk/package/syncthing package/syncthing


git clone https://github.com/jerrykuku/node-request.git package/node-request  #京东签到依赖
git clone https://github.com/jerrykuku/luci-app-jd-dailybonus.git package/luci-app-jd-dailybonus  #luci-app-jd-dailybonus[京东签到]

rm -rf ./package/lean/luci-theme-argon && git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git package/lean/luci-theme-argon  #新的argon主题
#全新的[argon-主题]此主题玩法很多,这里看说明【https://github.com/jerrykuku/luci-theme-argon/blob/18.06/README_ZH.md】
#增加可自定义登录背景功能，请自行将文件上传到/www/luci-static/argon/background 目录下，支持jpg png gif格式图片，主题将会优先显示自定义背景，多个背景为随机显示，系统默认依然为从bing获取
#增加了可以强制锁定暗色模式的功能，如果需要，请登录ssh 输入：touch /etc/dark 即可开启，关闭请输入：rm -rf /etc/dark，关闭后颜色模式为跟随系统
