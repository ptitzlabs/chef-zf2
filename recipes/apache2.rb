#
# Cookbook Name:: zf2
# Recipe:: apache2
#
# Copyright (C) 2013 Triple-networks
#
# Licensed under the Apache License, Version 2.0 (the 'License');
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an 'AS IS' BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

settings = Zf2.settings(node)

include_recipe 'apache2'
include_recipe 'apache2::mod_alias'
include_recipe 'apache2::mod_deflate'
include_recipe 'apache2::mod_env'
include_recipe 'apache2::mod_expires'
include_recipe 'apache2::mod_headers'
include_recipe 'apache2::mod_rewrite'

#include_recipe 'apache2::mod_dir'
include_recipe 'apache2::mod_php5'

web_app 'zf2.dev' do
  server_name settings['hostname']
  server_aliases [settings['fqdn'], 'zf2.dev']
  docroot settings['zf2']['doc_root']
end
