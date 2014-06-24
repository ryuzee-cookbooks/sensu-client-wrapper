#
# Cookbook Name:: sensu-client-wrapper 
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

include_recipe "sensu::default"

if node["sensu-client-wrapper"]["ipaddress"] then
  ipaddress = node["sensu-client-wrapper"]["ipaddress"]
else
  ipaddress = node["ipaddress"]
end

node_name = node_name() # from helper

sensu_client node_name do
  address ipaddress
  if node["sensu-client-wrapper"]["roles"] then  
    subscriptions node["sensu-client-wrapper"]["roles"] + ["all"]
  else
    subscriptions ["all"]
  end
  kp = { :thresholds => { :warning => 30, :critical => 120 }, :refresh => 1800, :handlers => ["debug"] }
  keepalive kp
end

execute "chmod 644 /etc/sensu/conf.d/client.json" do
  action :run
end

include_recipe "sensu::client_service"

# Installing check-procs
remote_file "/etc/sensu/plugins/check-procs.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/processes/check-procs.rb"
  mode 0755
  notifies :restart, "service[sensu-client]"
end

# Installing check-disk
remote_file "/etc/sensu/plugins/check-disk.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-disk.rb"
  mode 0755
  notifies :restart, "service[sensu-client]"
end

# Installing check-cpu
remote_file "/etc/sensu/plugins/check-cpu.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-cpu.rb"
  mode 0755
  notifies :restart, "service[sensu-client]"
end

# Installing check-ram
remote_file "/etc/sensu/plugins/check-ram.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/check-ram.rb"
  mode 0755
  notifies :restart, "service[sensu-client]"
end

# Installing load-metric
remote_file "/etc/sensu/plugins/load-metrics.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/load-metrics.rb"
  mode 0755
  notifies :restart, "service[sensu-client]"
end

# Installing vmstat-metrics.rb
remote_file "/etc/sensu/plugins/vmstat-metrics.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/vmstat-metrics.rb"
  mode 0755
  notifies :restart, "service[sensu-client]"
end

# Installing disk-usage-metrics.rb
remote_file "/etc/sensu/plugins/disk-usage-metrics.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/disk-usage-metrics.rb"
  mode 0755
  notifies :restart, "service[sensu-client]"
end

service "sensu-client" do
  action :nothing
end

# vim: filetype=ruby.chef
