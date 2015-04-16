class Chef
  class Recipe
    def node_name
      node_name = node["sensu-client-wrapper"]["name"] || Chef::Config[:node_name] || node[:hostname]
      node_name.gsub!(/[^\w\.\-]+/,".")
      return node_name
    end
  end
end
