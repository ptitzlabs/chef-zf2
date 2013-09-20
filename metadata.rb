name             'zf2'
maintainer       'Triple-networks'
maintainer_email 'r.gravestein@triple-networks.com'
license          'Apache 2.0'
description      'Installs/Configures zf2'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '0.1.0'




# not tested: amazon centos redhat scientific
%w{ ubuntu }.each do |os|
  supports os
end

# debug/build/server
%w{ git ntp vim }.each do |cb|
  depends cb
end

# dependencies
%w{ apache2 composer database mysql php }.each do |cb|
  depends cb
end

