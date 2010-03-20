module RailsHelper
  def render_rails_partial(path)
    erb_file = File.expand_path(File.join('..','app','views',path))
    erb = ERB.new(File.read(erb_file))
    erb.result(binding)
  end
end
Webby::Helpers.register(RailsHelper)

module HeaderHelper
  def root_path
    "/"
  end
  
  def about_us_path
    '/about-us'
  end
  
end

Webby::Helpers.register(HeaderHelper)
