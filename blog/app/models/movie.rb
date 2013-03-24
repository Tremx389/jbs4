class Movie < ActiveRecord::Base
  attr_accessible :about, :title, :url, :actors
end
