default["sensu"]["use_ssl"] = false
default["sensu"]["use_embedded_ruby"] = true 
default["sensu"]["rabbitmq"]["host"] = "localhost"
default["sensu"]["rabbitmq"]["port"] = 5672
default["sensu"]["rabbitmq"]["user"] = "admin"
default["sensu"]["rabbitmq"]["password"] = "password"

# initial dummy environment
default["sensu-client-wrapper"]["name"] = "server01"
default["sensu-client-wrapper"]["ipaddress"] = false 
default["sensu-client-wrapper"]["role"] = ["server"]

# vim: filetype=ruby.chef
