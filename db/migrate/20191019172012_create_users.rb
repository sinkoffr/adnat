class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address
      t.string :password
      t.references :organisations
      t.timestamps
    end
  end
end
