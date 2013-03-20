class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end
  
  def new
    @movie = Movie.new
  end
  
  def create
    @movie = Movie.new(params[:movie])
    if @movie.save
      redirect_to movies_path, :notice => "Your movie was saved."
    else
      render "new"
    end
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
    @mov = Movie.find(params[:id])
    
    if @mov.update_attributes(params[:movie])
      redirect_to movies_path, :notice => "Your movie has been updated."
    else
      render "show"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movie_path, :notice => "Your movie has been deleted"
  end
end
