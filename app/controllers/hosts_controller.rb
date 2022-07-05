# frozen_string_literal: true
require 'open3'

class HostsController < ApplicationController
  def create
    @host_name = `bash host_name.sh`
    @host_name_array = @host_name.split(' ')
    @host_name_array.each_slice(2) do |host|
      @host = Host.new
      @host.hostIP = host[0]
      @host.hostname = host[1]
      @host.save
    end
  end

  def show; end

  def index
    @host = Host.all
  end

end
