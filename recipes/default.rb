#
# Cookbook Name:: veneur
# Recipe:: default
#
# Copyright 2017, Apptentive
#
# All rights reserved - Do Not Redistribute
#

include_recipe "golang::default"
include_recipe "golang::packages"

golang_package "github.com/stripe/veneur" do
  action [:install, :build]
end


template "/etc/veneur.yaml" do
  source "veneur.yaml.erb"
  variables config: YAML::dump(node["veneur"]["config"].to_hash)
end

template "/etc/init.d/veneur" do
  source "init.erb"
  variables user: node["veneur"]["user"]
  mode "0755"
end

service "veneur" do
  action :start
end
