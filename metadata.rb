name             'sensu-client-wrapper'
maintainer       'Ryutaro YOSHIBA'
maintainer_email 'ryuzee@gmail.com'
license          'MIT'
description      'Installs/Configures sensu-client'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.5.0'
depends          'ca-certificates'
depends          'sensu', '~> 2.2'
