class DirectorsController < ApplicationController

  def index
    @list_of_directors = Director.all

    render({ :template => "director_templates/index.html.erb"})
  end

  def wisest
    @oldest = Director.order({ :dob => :asc}).where.not({ :dob => nil }).at(0)

    render({ :template => "director_templates/eldest.html.erb"})
  end

end