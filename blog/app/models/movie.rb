class Movie < ActiveRecord::Base
  attr_accessible :about, :title, :url, :actors, :uploader
 
  has_many :categorizations
  has_many :actors, :through => :categorizations
end
