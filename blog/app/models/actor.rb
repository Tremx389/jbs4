class Actor < ActiveRecord::Base
  attr_accessible :birth, :name
  
  has_many :categorizations
  has_many :movies, :through => :categorizations
end
