class BlogController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def show
    @posts = BlogPost.all
    @post = BlogPost.find_by_permalink(params[:id])
  end
end