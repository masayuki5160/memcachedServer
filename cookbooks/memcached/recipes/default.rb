#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# yumでssl関連インストール
package "libevent libevent-devel" do
    action :install
end

# ソースからコンパイルしてインストール
# ただし/usr/local/srcにファイルをダウンロードしておく
# もしそれが面倒なときはEOH以降のlinuxコマンドのとこにwget http://nginx.org/download/nginx-1.3.11.tar.gzと追記でok
script “install_memcached” do
    interpreter “bash”
    user “root”
    cwd “/usr/local/src/”
    code <<-EOH
        tar xzvf memcached-1.4.15.tar.gz
        cd memcached-1.4.15
        ./configure
        make
        make install
    EOH
end


# memcachedの起動スクリプトを設定
#template "/etc/init.d/memcached" do
#    mode 0755
#    source "memcached.erb"
#end

# chkconfigの設定


# snmpd.confの設定
#template "/etc/snmp/snmpd.conf" do
#    mode 0755
#    source "snmpd.conf.erb"
#end
