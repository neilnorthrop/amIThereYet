class CreateHours < ActiveRecord::Migration
  def change
    create_table :hours do |t|
      t.references :goal, index: true
      t.time :duration
      t.string :category
      t.string :description

      t.timestamps
    end
  end
end
