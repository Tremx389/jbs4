class Columnd < ActiveRecord::Migration
def self.up
   add_column :movies, :uploader_id, :integer
 end

 def self.down
 end


end
