default["sensu"]["use_ssl"] = false
default["sensu"]["use_embedded_ruby"] = true 
default["sensu"]["rabbitmq"]["host"] = "localhost"
default["sensu"]["rabbitmq"]["port"] = 5672
default["sensu"]["rabbitmq"]["user"] = "admin"
default["sensu"]["rabbitmq"]["password"] = "password"
default["sensu"]["api"]["host"] = "localhost"
default["sensu"]["api"]["port"] = 9000 

# initial dummy environment
default["sensu-client-wrapper"]["name"] = false 
default["sensu-client-wrapper"]["ipaddress"] = false 
default["sensu-client-wrapper"]["role"] = ["server"]

# vim: filetype=ruby.chef
