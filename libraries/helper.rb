class Chef
  class Recipe
    def node_name
      begin
        node_name = @node["sensu-client-wrapper"]["name"]
      rescue
        node_name = Chef::Config[:node_name] || @node[:hostname]
      end
      node_name.gsub!(/[^\w\.\-]+/,".")
      return node_name
    end
  end
end
