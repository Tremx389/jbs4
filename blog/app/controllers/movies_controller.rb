class MoviesController < ApplicationController
  def index
    
    
    @movies = Movie.all
    @title = "Home"
    @i = 0;
    
    
    @relat = Array.new
    @uploader = Array.new
    
    @movies.each do |m|
    	@first = Movie.find(m.id).actors.collect(&:id)
    	
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
    @rel = Categorization.new
    
    @actors = Actor.all
    
    @title = "Upload"
  end
  
  def create
    @par = params[:movie]
    @movie = Movie.new(:title => @par[:title], :about => @par[:about], :url => @par[:url], :uploader => current_user.id)
    @relations = @par[:rel].split
    
    if @movie.save
    	Movie.find(@movie.id).actors << @relations.map{|id| Actor.find(id)}
    	
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
    
    @relats = @movie.actors.collect(&:id);
  end

	def permisison_detection
     if Movie.find(params[:id]).uploader != current_user.id
      	redirect_to movies_path, :notice => "You don't have Permission."
     end
  	end
  	
  	
  def update
  	permisison_detection
  	
    @m = Movie.find(params[:id])
    @p = params[:movie]
    @cb = @p[:rel].split 			#all CheckBox
    
    @m.actors.destroy_all
    @m.actors << @cb.map{|id| Actor.find(id)}
    
    if @m.update_attributes(:about => @p[:about], :title => @p[:title], :url => @p[:url])
      redirect_to movies_path, :notice => "Updated!"
    else
      render "show"
    end
  end

  def destroy
    @m = Movie.find(params[:id])
    @m.destroy
    @m.actors.destroy_all
    
    redirect_to movies_path, :notice => "Deleted"
  end

end
