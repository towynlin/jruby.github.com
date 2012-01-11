#
# Cookbook Name:: nginx_config
# Recipe:: install
#

# package 'UNKNOWN/nginx_config' do
#   version node[:nginx_config_version]
#   action :install
# end

service "nginx" do
  action :nothing
  supports :restart => true, :status => true
end

remote_file "/data/nginx/servers/jruby.conf" do
  action :create_if_missing
  source 'jruby.conf'
  owner node[:owner_name]
  group node[:owner_name]
  mode 0644
  notifies :restart, resources(:service => "nginx"), :delayed
end
