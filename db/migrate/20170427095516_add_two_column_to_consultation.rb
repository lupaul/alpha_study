class AddTwoColumnToConsultation < ActiveRecord::Migration[5.0]
  def change
    add_column :consultations, :start_date, :date
    add_column :consultations, :end_date, :date
  end
end
