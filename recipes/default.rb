#
# Cookbook Name:: sensu-client-wrapper 
# Recipe:: default
#
# Copyright 2013, Ryutaro YOSHIBA 
#
# This software is released under the MIT License.
# http://opensource.org/licenses/mit-license.php

include_recipe "sensu::default"

sensu_client node["sensu-client-wrapper"]["name"] do
  address node["sensu-client-wrapper"]["ipaddress"]
  subscriptions node["sensu-client-wrapper"]["roles"] + ["all"]
end

execute "chmod 644 /etc/sensu/conf.d/client.json" do
  action :run
end

include_recipe "sensu::client_service"

# Installing check-procs
remote_file "/etc/sensu/plugins/check-procs.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/processes/check-procs.rb"
  mode 0755
end

# Installing load-metric
remote_file "/etc/sensu/plugins/load-metrics.rb" do
  source "https://raw.github.com/sensu/sensu-community-plugins/master/plugins/system/load-metrics.rb"
  mode 0755
end

service "sensu-client" do
  action :restart
end

# vim: filetype=ruby.chef
