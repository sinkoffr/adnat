class RemoveUserIdFromShifts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shifts, :users_id, :bigint
    add_column :shifts, :organisation_enrollments_id, :integer
  end
end
