class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.integer :event_id
      t.text :email
      t.integer :phone_number
      t.string :job_title
      t.string :company
      t.string :name

      t.timestamps

    end
  end
end
