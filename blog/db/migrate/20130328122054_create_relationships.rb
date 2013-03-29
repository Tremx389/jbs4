class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :actor_id
      t.integer :film_id

      t.timestamps
    end
  end
end
