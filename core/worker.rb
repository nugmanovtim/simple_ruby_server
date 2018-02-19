require 'http/parser'
require './core/dispatcher.rb'
require './core/request_parser.rb'

class Worker
  def initialize(connection)
    @connection = connection
  end

  def perform
    @thread = Thread.new do
      parse_request
      prepare_response
      send_response
      if keep_alive?
        @next_worker = Worker.new(@connection).perform
      else
        close_connection
      end
    end
  end

  private

  def parse_request
    @request = RequestParser.new(@connection).perform
  end

  def prepare_response
    @response = Dispatcher.new(@request).perform
  end

  def send_response
    @connection.puts @response
  end

  def close_connection
    @connection.close
  end

  def keep_alive?
    @request.headers['Connection'] == 'keep-alive'
  end
end
