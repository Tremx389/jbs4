class ActorController < ApplicationController
  def index
  end
  
  def new
    @actor = Actors.create
  end
  

  def update

    @actor = Movie.create(params[:actor])
    if @actor.save
      redirect_to actor_path, :notice => "Your movie was saved."
    else
      render "new"
    end
  end
end
