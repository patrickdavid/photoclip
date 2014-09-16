class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :followed_by
      t.integer :following

      t.timestamps
    end
  end
end
