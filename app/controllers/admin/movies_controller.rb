class Admin::MoviesController < AdminController
  layout 'admin'

  def index
    @movies = Movie.all(:order => 'sequence_number ASC')
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(params[:movie])
    unless @movie.valid?
      render :action => 'new'
      return
    end

    @movie.save!
    redirect_to :action => 'index'
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    begin
      @movie = Movie.find_by_permalink(params[:id])
      @movie.update_attributes!(params[:movie])
    rescue ActiveRecord::RecordInvalid
      render :action => 'edit'
      return
    end

    redirect_to :action => 'index'
  end

  def prioritize_movies
    params[:movie].each_with_index do |id, i|
      Movie.find(id).update_attribute(:sequence_number, i)
    end
    render :nothing => true
  end

end
