Her::API.setup url: "http://localhost:4567/api/v1" do |c|
  # Request
  # c.use Faraday::Request::UrlEncoded
  c.use FaradayMiddleware::EncodeJson

  # Response
  c.use Her::Middleware::DefaultParseJSON
  # c.use Her::Middleware::JsonApiParser

  # Adapter
  c.use Faraday::Adapter::NetHttp
end
