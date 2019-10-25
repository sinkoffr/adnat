class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :shifts, :organisation_enrollment_id, :organisation_id
  end
end
