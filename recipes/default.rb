#
# Cookbook Name:: veneur
# Recipe:: default
#
# Copyright 2017, Apptentive
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'golang::default'
include_recipe 'golang::packages'

golang_package 'github.com/stripe/veneur' do
  action [:install, :build]
end

config = node['veneur']['config']

if config['forward_address'].nil? || config['forward_address'].empty?
  Chef::Log.info('Set as global Veneur (i.e. no forwarding address set)')
else
  Chef::Log.info("Local Veneur forwarding to #{config['forward_address']}")
end
Chef::Log.warn('Datadog API key is not set!') if config['key'].nil? || config['key'].empty?

template '/etc/veneur.yaml' do
  source 'veneur.yaml.erb'
  sensitive true
  variables config: YAML::dump(config.dup.delete_if{ |k, v| v.nil? || (v.class == String && v.empty?) })
  notifies :restart, 'service[veneur]', :delayed
end

template '/etc/init.d/veneur' do
  source 'init.erb'
  variables user: node['veneur']['user']
  mode '0755'
end

service 'veneur' do
  action [:start, :enable]
end
