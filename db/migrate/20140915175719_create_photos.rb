class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      add_column :photos, :caption, :string
      t.timestamps
    end
  end
end
