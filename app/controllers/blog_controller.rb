class BlogController < ApplicationController

  def index
    @posts = BlogPost.all(:order => 'created_at DESC')
  end

  def show
    @posts = BlogPost.all(:order => 'created_at DESC')
    @post = BlogPost.find_by_permalink(params[:id])
  end
end