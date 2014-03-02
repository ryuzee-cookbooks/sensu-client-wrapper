if node["sensu-client-wrapper"]["name"] then
  node_name = node["sensu-client-wrapper"]["name"]
else
  node_name = node["hostname"]
end
node_name.gsub!(/[^A-z0-9]+/,".")

template "/etc/rc.d/init.d/sensu-client-remove" do
  source "sensu-client-remove.erb"
  mode 0755
  owner "root"
  group "root"
  variables({
    :node_name => node_name
  })
end

execute "/sbin/chkconfig --level 0 sensu-client-remove off" do
  action :run
end

execute "/sbin/chkconfig --level 2345 sensu-client-remove on" do
  action :run
end

execute "/etc/rc.d/init.d/sensu-client-remove start" do
  action :run
end
