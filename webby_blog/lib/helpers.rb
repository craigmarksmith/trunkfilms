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


module VimeoHelper
  def vimeo_movie(vimeo_id)
    height = 395
    width = 702
    url = "http://vimeo.com/moogaloop.swf?clip_id=#{vimeo_id}&amp;server=vimeo.com&amp;show_title=0&amp;show_byline=0&amp;show_portrait=0&amp;color=00ADEF&amp;fullscreen=1"

    "<object id='movie_10499407' width='#{width}' height='#{height}'>
      <param name='allowfullscreen' value='true' />
      <param name='allowscriptaccess' value='always' />
      <param name='movie' value='#{url}' />
      <param name='wmode' value='transparent'/>
      <embed src='#{url}' type='application/x-shockwave-flash' allowfullscreen='true' allowscriptaccess='always' width='#{width}' height='#{height}' wmode='transparent'></embed>
    </object>"

  end
end

Webby::Helpers.register(VimeoHelper)