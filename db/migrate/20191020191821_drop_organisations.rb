class DropOrganisations < ActiveRecord::Migration[5.1]
  def change
    drop_table :organisations
  end
end
