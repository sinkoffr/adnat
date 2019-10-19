class CreateShifts < ActiveRecord::Migration[5.1]
  def change
    create_table :shifts do |t|
      t.datetime :start
      t.datetime :finish
      t.integer :break_length
      t.references :users
      t.timestamps
    end
  end
end
