class CreateOrganisationEnrollments < ActiveRecord::Migration[5.1]
  def change
    create_table :organisation_enrollments do |t|
      t.integer :user_id
      t.integer :organisation_id
      t.timestamps
    end
    add_index :organisation_enrollments, [:user_id, :organisation_id]
    add_index :organisation_enrollments, :organisation_id
  end
end
