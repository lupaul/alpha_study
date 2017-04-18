class AddStateToEnrollment < ActiveRecord::Migration[5.0]
  def change
    add_column :enrollments, :state, :string
  end
end
