class CreateTest2s < ActiveRecord::Migration
  def change
    create_table :test2s do |t|
      t.string :name
      t.integer :temperature

      t.timestamps
    end
  end
end
