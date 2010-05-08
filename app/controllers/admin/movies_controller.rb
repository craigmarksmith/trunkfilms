class Admin::MoviesController < AdminController
  layout 'admin'

  def index
    @movies = Movie.all(:order => 'sequence_number ASC')
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
    Movie.find_by_permalink(params[:id]).update_attributes(params[:movie])
    redirect_to :action => 'index'
  end

  def prioritize_movies
    params[:movie].each_with_index do |id, i|
      Movie.find(id).update_attribute(:sequence_number, i)
    end
    render :nothing => true
  end

end
