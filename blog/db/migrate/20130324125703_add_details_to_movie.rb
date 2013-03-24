class AddDetailsToMovie < ActiveRecord::Migration
  def change
    add_column :movies, :actors, :text
  end
end
