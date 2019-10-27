class ChangeColumnNamesForShifts < ActiveRecord::Migration[5.1]
  def change
    add_column :shifts, :organisation_id, :integer
    remove_column :shifts, :organisation_enrollments_id
  end
end
