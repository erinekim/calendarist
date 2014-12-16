class CreatePlaces < ActiveRecord::Migration
  def change
    create_table :places do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :perfect_for

      t.timestamps
    end
  end
end
