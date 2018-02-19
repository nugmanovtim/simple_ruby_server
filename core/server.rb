require 'socket'
require './core/worker.rb'

class Server
  def initialize(port)
    @server = TCPServer.new port
    puts "Connection established on port #{port}"
  end

  def listen
    loop do
      Worker.new(@server.accept).perform
    end
  end
end
