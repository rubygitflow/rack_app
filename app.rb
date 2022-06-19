require_relative 'time_stamp.rb'

class App
  def call(env)
    p self.class
    @env = env
    @request = Rack::Request.new(@env)

    if valid_path?
      timestamp = TimeStamp.new(@request.params["format"])
      if timestamp.has_invalid?
        rack_response(400, "Unknown time format [#{timestamp.invalid}]")
      else
        rack_response(200, timestamp.format)
      end
    else
      rack_response(404, "Page not found")
    end
  end

  private

  def rack_response(status, body)
    # https://www.rubydoc.info/github/rack/rack/Rack/Response
    # Deprecated, use headers instead.
    # initialize(body = nil, status = 200, headers = {})
    Rack::Response.new(
      [body],
      status,
      {"Content-Type" => "text/html"}
    ).finish
  end

  def valid_path?
    @request.path == '/time'
  end
end
