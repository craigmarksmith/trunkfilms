class Admin::MoviesController < AdminController
  layout 'admin'

  def index
    @movies = Movie.all
  end

  def new
    @movie = Movie.new
  end
  
  def create
    Movie.create!(params[:movie])
    redirect_to :action => 'index'
  end
  
  def edit
    @movie = Movie.find(params[:id])
  end
  
  def update
    Movie.find(params[:id]).update_attributes(params[:movie])
    redirect_to :action => 'index'
  end

end
