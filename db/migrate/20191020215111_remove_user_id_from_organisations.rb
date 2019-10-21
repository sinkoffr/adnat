class RemoveUserIdFromOrganisations < ActiveRecord::Migration[5.1]
  def change
    remove_column :organisations, :user_id
    remove_column :users, :organisations_id
  end
end
