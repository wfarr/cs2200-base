%w(base git valgrind lc2200).each do |recipe|
  require_recipe recipe
end

file "/etc/motd" do
  action :delete
end

file "/etc/motd" do
  content "Welcome to zombocom!"
  action :create
end