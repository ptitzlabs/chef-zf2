#
# Cookbook Name:: zf2
# Library:: zf2
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

class Chef::Recipe::Zf2
  def self.settings(node)
    begin
      if Chef::Config[:solo]
        begin
          settings = Chef::DataBagItem.load('zf2','zf2')['local']
          Chef::Log.info('zf2 solo data bag found')
        rescue
          Chef::Log.info('No zf2 solo data bag found')
        end
      else
        begin
          settings = Chef::EncryptedDataBagItem.load('zf2','zf2')[node.chef_environment]
          Chef::Log.info('zf2 encrypted data bag found')
        rescue
          Chef::Log.info('No zf2 encrypted data bag found')
        end
      end
    ensure
      settings ||= node['zf2']

      case settings['database']['type']
      when 'mysql'
        settings['database']['port'] ||= 3306
      when ''
        Chef::Log.info('No database.')
      else
        Chef::Log.warn('Unsupported database type.')
      end
    end

    settings
  end
end
