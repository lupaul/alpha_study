class AddSchoolIdToConsultation < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :school_id, :integer
    add_column :consultations, :license_id, :integer
  end
end
