class Request
  attr_accessor :headers, :body, :http_method, :request_url, :params
  def initialize(headers:, body:, http_method:, request_url:)
    @headers = headers
    @body = body
    @http_method = http_method
    @request_url = request_url
    parse_params
  end

  private

  def parse_params
    @params = @body.split('&').map { |pair| pair.split('=', 2) }.to_h
  end
end
