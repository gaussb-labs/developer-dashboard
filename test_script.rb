#!/usr/bin/env ruby
require 'open3'
require 'rubygems'
require 'net/ssh'

@hostname = '3.109.184.146'
@username = 'ssh-user'
@cmd = 'ls -la'
@script = "ssh ssh-user@13.232.164.233 \"bash -s\" < ./add_user.sh \"#{@user.username}\" \"#{@user.public_key}\""

Net::SSH.start(@hostname, @username) do |ssh|
  output = ssh.exec!(@script)
  puts output
end

