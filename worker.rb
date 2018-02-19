require 'http/parser'
require './dispatcher.rb'
require './core/request_parser.rb'

class Worker
  def initialize(connection)
    @connection = connection
  end

  def perform
    parse_request
    prepare_response
    send_response
    close_connection
  end

  private

  def parse_request
    @request = RequestParser.new(@connection).perform
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
