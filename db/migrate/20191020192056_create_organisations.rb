class CreateOrganisations < ActiveRecord::Migration[5.1]
  def change
    create_table :organisations do |t|
      t.string :name
      t.float :hourly_rate
      t.string :user_id, array: true, default: []
    end
  end
end
