class MoviesController < ApplicationController

  def index
    @movies = Movie.all(:order => 'sequence_number ASC')
  end

end