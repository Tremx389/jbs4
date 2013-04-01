class AddUploaderColumnToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :uploader, :integer
  end
end
