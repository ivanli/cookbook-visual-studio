#
# Cookbook Name:: visual-studio
# Recipe:: default
#
# Copyright 2015, Ivan Li
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'chocolatey'

package_name = "visualstudio"
package_name += "express" if node['visual-studio']['variant'] == :express
package_name += node['visual-studio']['year']
if node['visual-studio']['variant'] == :express
  package_name += "windowsdesktop"
else
  package_name += node['visual-studio']['variant'].to_s
end

chocolatey package_name do
  version node['visual-studio']['version']
end