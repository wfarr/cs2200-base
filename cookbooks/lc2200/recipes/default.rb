# copy file into /tmp

cookbook_file "/tmp/simpgt16.tar.gz" do
  source "simpgt16.tar.gz"
  mode "0644"
  owner "vagrant"
  action :create
end

# untar it

execute "untar lcc2200" do
  command "tar -zxf simpgt16.tar.gz"
  cwd "/tmp"
  not_if 'test -f /usr/local/bin/gt16as'
  action :run
end

# set options for makefile

cookbook_file "/tmp/simpl-src-gt16/.options" do
  source "dot-options"
  mode "0644"
  owner "vagrant"
  not_if 'test -f /usr/local/bin/gt16as'
  action :create
end

# generate makefile

execute "configure lc2200" do
  command "./config.sh"
  cwd "/tmp/simpl-src-gt16"
  not_if 'test -f /usr/local/bin/gt16as'
  action :run
end

# set options for makefile

cookbook_file "/tmp/simpl-src-gt16/.options" do
  source "dot-options"
  mode "0644"
  owner "vagrant"
  not_if 'test -f /usr/local/bin/gt16as'
  action :create
end

# fix broken Makefile

cookbook_file "/tmp/simpl-src-gt16/Makefile" do
  source "Makefile"
  mode "0644"
  owner "vagrant"
  not_if 'test -f /usr/local/bin/gt16as'
  action :create
end

# fix broken common.h

cookbook_file "/tmp/simpl-src-gt16/common.h.diff" do
  source "common.h.diff"
  mode "0644"
  owner "vagrant"
  not_if 'test -f /usr/local/bin/gt16as'
  action :create
end

execute "patch common.h" do
  command "patch -u -p0 common.h common.h.diff"
  cwd "/tmp/simpl-src-gt16"
  not_if 'test -f /usr/local/bin/gt16as'
  action :run
end


# compile

execute "compile lc2200" do
  command "make"
  cwd "/tmp/simpl-src-gt16"
  not_if 'test -f /usr/local/bin/gt16as'
  action :run
end

# install

execute "install lc2200" do
  command "make install"
  cwd "/tmp/simpl-src-gt16"
  not_if 'test -f /usr/local/bin/gt16as'
  action :run
end