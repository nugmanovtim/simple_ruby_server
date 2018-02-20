require 'socket'
require 'set'
require './core/worker.rb'

class Server
  def initialize(port)
    @server = TCPServer.new port
    puts "Connection established on port #{port}"
  end

  def listen
    threads = Set.new
    initial_workers = Set.new
    loop do
      connection = @server.accept
      worker = Worker.new(connection)
      thread = Thread.new { worker.perform }
      threads.add(thread)
      initial_workers.add(worker)
    end
  end
end
