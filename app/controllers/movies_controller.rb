class MoviesController < ApplicationController

  def show
    @movies = Movie.all(:order => 'sequence_number ASC')
    @movie = params[:id] ? Movie.find_by_permalink(params[:id]) : @movies.first
  end

  def index
    @movies = Movie.all(:order => 'sequence_number ASC')
  end

end