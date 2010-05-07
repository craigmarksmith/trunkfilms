xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "TrunkFilms.com"
    xml.description "All of our blog posts"
    xml.link formatted_blog_index_url(:rss)
    
    @posts.each do |post|
      xml.item do
        xml.title post.title
        xml.description post.to_html
        xml.pubDate post.created_at.to_s(:rfc822)
        xml.link formatted_blog_post_show_url(post, :rss)
        xml.guid formatted_blog_post_show_url(post, :rss)
      end
    end
  end
end