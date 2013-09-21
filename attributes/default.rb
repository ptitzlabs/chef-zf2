#
# Cookbook Name:: zf2
# Attributes:: default
#
# Copyright (C) 2013 Triple-networks
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#



default['zf2']['deploy_to']             = '/srv/zf2'

default['zf2']['doc_root']              = "#{node['zf2']['deploy_to']}/public"

default['zf2']['apache']['template']    = 'zf2-apache2.conf.erb'

default['composer']['install_globally'] = false                               # - Installation method, ':source' or ':package' - default true
#default['composer']['prefix']                                                # - Location prefix of where the installation files will go if installing globally
#default['composer']['url']                                                   # - Location of the source
default['composer']['install_dir']      = node['zf2']['deploy_to']            # - Installation target directory (absolute or relative path) if installing locally


default['zf2']['database']['host']     = "localhost"
default['zf2']['database']['name']     = "zf2"
default['zf2']['database']['password'] = "changeit"
default['zf2']['database']['port']     = 3306
default['zf2']['database']['type']     = "mysql"
default['zf2']['database']['user']     = "zf2"
