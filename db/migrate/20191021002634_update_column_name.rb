class UpdateColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :shifts, :organisation_enrollments_id, :organisation_enrollment_id
  end
end
