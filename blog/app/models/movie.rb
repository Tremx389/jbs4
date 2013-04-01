class Movie < ActiveRecord::Base
  attr_accessible :about, :title, :url, :actors, :uploader
  has_many :relationship
end
