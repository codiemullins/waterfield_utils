class CreateMeters < ActiveRecord::Migration
  def change
    create_table :assets do |t|
      t.string :number
      t.string :name

      t.timestamps
    end

    create_table :meters do |t|
      t.integer :asset_id
      t.string :number
      t.string :name

      t.timestamps
    end
  end
end
