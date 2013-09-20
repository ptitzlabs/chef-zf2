#
# Cookbook Name:: zf2
# Recipe:: composer
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

#node = Zf2.node(node)

Chef::Log.info 'Running composer install'


directory node['zf2']['deploy_to'] do
  recursive true
  action :create
end


include_recipe 'composer'


#directory "#{node['zf2']['deploy_to']}/vendor" do
#  mode 0755
#  action :create
#end

#execute "php composer.phar install -n" do
#  cwd node['zf2']['deploy_to']
#end

