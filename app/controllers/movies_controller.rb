class MoviesController < ApplicationController

  def index
    @list_of_movies = Movies.all

    render({ :template => "movie_templates/index.html.erb"})
  end
  
  
  def movie_details
     #params looks like this {"an_id"=>"42"}

     the_id = params.fetch("an_id")

     @the_movie = Movies.where({ :id => the_id }).at(0)
 
     render({ :template => "movie_templates/show.html.erb"})   
  end