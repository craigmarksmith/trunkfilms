class Admin::BlogPostsController < AdminController
  layout 'admin'

  def index
    @blog_posts = BlogPost.all
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    BlogPost.create!(params[:blog_post])
    redirect_to :action => 'index'
  end

  def edit
    @blog_post = BlogPost.find(params[:id])
  end

  def update
    BlogPost.find(params[:id]).update_attributes(params[:blog_post])
    redirect_to :action => 'index'
  end
end
