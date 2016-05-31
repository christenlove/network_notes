class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.integer :user_id
      t.text :notes
      t.string :location
      t.string :description
      t.date :held_on
      t.string :title

      t.timestamps

    end
  end
end
