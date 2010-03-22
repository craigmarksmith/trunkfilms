module Rack
  class DirectoryIndex
    def initialize(app)
      @app = app
    end
    def call(env)
      index_path = ::File.join(Rails.root, 'public', Rack::Request.new(env).path.split('/'), 'index.html')
      
      if ::File.exists?(index_path)
        return [200, {"Content-Type" => "text/html"}, ::File.read(index_path)]
      else
        @app.call(env)
      end
    end
  end
end