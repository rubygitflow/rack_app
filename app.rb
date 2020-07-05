require_relative 'time_stamp.rb'

class App
  def call(env)
    @env = env

    if valid_path?
      timestamp = TimeStamp.new(request.params["format"])
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
    Rack::Response.new(
      status,
      {"Content-Type" => "text/html"},
      [body]
    ).finish
  end

  def request
    @request ||= Rack::Request.new(@env)
  end

  def valid_path?
    request.path == '/time'
  end
end
