require 'yaml'

class BlogController < ApplicationController

  def index
    @posts = []
    Dir.glob(File.join(Rails.root,'public','blog-posts', '*.erb.textile')).each do |file|
      post = Post.new(file)
      @posts << post
    end
  end

  def show
    @posts = []
    Dir.glob(File.join(Rails.root,'public','blog-posts', '*.erb.textile')).each do |file|
      post = Post.new(file)
      @post = post if params[:id] == post.name
      @posts << post
    end
  end

  class Post
    include BlogHelper

    attr_reader :title, :created_at

    def initialize(path)
      @path = path
      raw = File.read(path).split('----')
      @textile = raw[1]

      setting = YAML.parse(raw[0])
      @title = setting['-title'].value
      @created_at = Date.parse(setting['-created_at'].value)
    end

    def to_html
      erb = ERB.new(@textile)
      RedCloth.new(erb.result(binding)).to_html
    end

    def url
      "/blog/#{name}"
    end
    
    def name
      @path.split('/').last.gsub(".erb.textile",'')
    end
  end

end