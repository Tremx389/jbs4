class Actor < ActiveRecord::Base  # Class name should be Singular
  attr_accessible :birth, :name
end
