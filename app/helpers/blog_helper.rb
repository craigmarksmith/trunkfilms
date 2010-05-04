module BlogHelper
  def vimeo_movie(vimeo_id)
    height = 395
    width = 702
    url = "http://vimeo.com/moogaloop.swf?clip_id=#{vimeo_id}&amp;server=vimeo.com&amp;show_title=1&amp;show_byline=1&amp;show_portrait=1&amp;color=00ADEF&amp;fullscreen=1"

    "<object id='movie_10499407' width='#{width}' height='#{height}'>
      <param name='allowfullscreen' value='true' />
      <param name='allowscriptaccess' value='always' />
      <param name='movie' value='#{url}' />
      <param name='wmode' value='transparent'/>
      <embed src='#{url}' type='application/x-shockwave-flash' allowfullscreen='true' allowscriptaccess='always' width='#{width}' height='#{height}' wmode='transparent'></embed>
    </object>"

  end
end