class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all

    render({ :template => "director_templates/index.html.erb"})
  end

  def wisest
    @oldest = Director.order({ :dob => :asc}).where.not({ :dob => nil }).at(0)

    render({ :template => "director_templates/eldest.html.erb"})
  end

  def foolish
    @youngest = Director.order({ :dob => :desc}).where.not({ :dob => nil }).at(0)

    render({ :template => "director_templates/youngest.html.erb"})
  end

  def director_details
    #params looks like this {"an_id"=>"42"}

    the_id = params.fetch("an_id")

    @the_director = Director.where({ :id => the_id }).at(0)
    
    @filmography = Movie.where({ :director_id => @the_director.id })

    render({ :template => "director_templates/show.html.erb"})
  end

end