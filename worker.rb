require 'http/parser'
require './dispatcher.rb'

class Worker
  READ_CHUNK = 1024 * 4
  def initialize(connection)
    @connection = connection
    @request = Http::Parser.new
  end

  def perform
    parse_request
    prepare_response
    send_response
    close_connection
  end

  private

  def parse_request
    loop do
      @request << @connection.readpartial(READ_CHUNK)
      break if @request.headers
    end
    puts @request.headers
  end

  def prepare_response
    @response = Dispatcher.dispatch(@request)
    puts @response
  end

  def send_response
    @connection.puts @response
  end

  def close_connection
    @connection.close
  end
end
