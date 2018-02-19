require './core/request.rb'

class RequestParser
  READ_CHUNK = 1024 * 4
  def initialize(connection)
    @connection = connection
    @parser = Http::Parser.new
    @finished = false
    @body = ''
    setup_parser
  end

  def perform
    read_loop
    parsed_request
  end

  private

  def read_loop
    loop do
      @parser << @connection.readpartial(READ_CHUNK)
      break if @finished
    end
  end

  def setup_parser
    @parser.on_headers_complete = proc { |headers| puts @headers = headers }
    @parser.on_body = proc { |chunk| puts @body << chunk }
    @parser.on_message_complete = proc { @finished = true }
  end

  def parsed_request
    Request.new(headers: @headers, body: @body,
                http_method: @parser.http_method,
                request_url: @parser.request_url)
  end
end
