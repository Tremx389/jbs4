class Updown < ActiveRecord::Migration
  def up
  remove_column :movies, :uploder_id
  end

  def down
  end
end
