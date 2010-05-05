class BlogController < ApplicationController

  def index
    @posts = BlogPost.all
  end

  def show
    @posts = BlogPost.all
    @post = BlogPost.find(params[:id])
  end
end