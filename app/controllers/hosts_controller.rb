class HostsController < ApplicationController

  def create
    @host_name = `bash host_name.sh`
    @host_name_array = @host_name.split(' ')
    @host_name_array.each_slice(2) { |host|
      @host = Host.new
      @host.hostIP = host[0]
      @host.hostname = host[1]
      @host.save
    }
  end

  def index
    @host = Host.all
  end

end
