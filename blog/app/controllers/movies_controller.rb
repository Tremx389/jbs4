class MoviesController < ApplicationController
  def index
    
    
    @movies = Movie.all
    @title = "Home"
    @i = 0;
    
    
    @relat = Array.new
    @uploader = Array.new
    
    @movies.each do |m|
    	@first = Relationships.where(:film_id => m.id).collect(&:actor_id);
    	@relat[m.id] = ""
    	@uploader[m.id] = m.uploader;
    	
    	@first.each do |f|
    		@actor = Actor.find(f)[:name].to_s
  		  	@relat[m.id] = @actor + "," + @relat[m.id];
    	end
    end
  end
  1
  
  
  def new
  	 @i = 0
    @movie = Movie.new
    @rel = Relationships.new
    
    @actors = Actor.all
    
    @title = "Upload"
  end
  
  def create
    @par = params[:movie]
    @movie = Movie.new(:title => @par[:title], :about => @par[:about], :url => @par[:url], :uploader => current_user.id)
    @relations = @par[:rel].split
    
    if @movie.save
    	@relations.each do |relation|
    		@addRel = Relationships.new(:actor_id => relation ,:film_id => @movie.id)
    		@addRel.save
    	end
     	redirect_to movies_path, :notice => "Saved!"
     	
    else
      render "new"
    end
  end

  def show
  	 permisison_detection
  	@i = 0;
  	 @title = "Edit("+params[:id]+")"
    
    @movie = Movie.find(params[:id])
    @actors = Actor.all
    
    @relats = Relationships.where(:film_id => params[:id]).collect(&:actor_id);
    
  end

	def permisison_detection
     if Movie.find(params[:id]).uploader != current_user.id
      	redirect_to movies_path, :notice => "You don't have Permission."
     end
  	end
  	
  def update
  	permisison_detection
    @mov = Movie.find(params[:id])
    @par = params[:movie]
    
    
    @relations = @par[:rel].split
    
    @destroy = Relationships.where(:film_id => params[:id]).destroy_all
    
    @relations.each do |relation|
    		@addRel = Relationships.new(:actor_id => relation ,:film_id => params[:id])
    		@addRel.save
    	end
    
    
    if @mov.update_attributes(:about => @par[:about], :title => @par[:title], :url => @par[:url])
      redirect_to movies_path, :notice => "Updated!"
    else
      render "show"
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    @destroy = Relationships.where(:film_id => params[:id]).destroy_all
    
    redirect_to movies_path, :notice => "Deleted"
  end

end
