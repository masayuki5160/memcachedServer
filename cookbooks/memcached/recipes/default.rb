#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# yumでもろもろインストール
#package "libevent libevent-devel" do
#    action :install
#end

package "libevent" do
    action :install
end

# ソースからコンパイルしてインストール
# ただし/usr/local/srcにファイルをダウンロードしておく
# もしそれが面倒なときはEOH以降のlinuxコマンドのとこにwget http://memcached.googlecode.com/files/memcached-1.4.15.tar.gz と追記でok
#bash “install memcached” do
#    user “vagrant”
#    cwd “/usr/local/src/”
#    code <<-EOH
#        wget http://memcached.googlecode.com/files/memcached-1.4.15.tar.gz
#        tar xzvf memcached-1.4.15.tar.gz
#        cd memcached-1.4.15
#        ./configure
#        make
#        make install
#    EOH
#end

script "test" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
        mkdir tanaka
    EOH
end

# memcachedの起動スクリプトを設定
#template "/etc/init.d/memcached" do
#    mode 0755
#    source "memcached.erb"
#end

# chkconfigの設定(つなげて書いていいのかわからんからひとまず..)
#service "memcached" do
#  action   [ :enable ]
#end

#service "haldaemon" do
#  action   [ :disable ]
#end

#service "sendmail" do
#  action   [ :disable ]
#end

# snmpd.confの設定
#template "/etc/snmp/snmpd.conf" do
#    mode 0755
#    source "snmpd.conf.erb"
#end
