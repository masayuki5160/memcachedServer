#
# Cookbook Name:: memcached
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# yumでもろもろインストール
package "libevent" do
    action :install
end

package "libevent-devel" do
    action :install
end

# ソースからmemcachedをコンパイルしてインストール
script "install_memcached" do
    interpreter "bash"
    user "root"
    cwd "/tmp"
    code <<-EOH
        wget http://memcached.googlecode.com/files/memcached-1.4.15.tar.gz
        tar xzvf memcached-1.4.15.tar.gz
        cd memcached-1.4.15
        ./configure
        make
        make install
    EOH
    # ここに同じスクリプトを実行しないような設定を追加(chef-solo入門を参照)
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
