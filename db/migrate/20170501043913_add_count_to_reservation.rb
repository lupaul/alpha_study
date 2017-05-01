class AddCountToReservation < ActiveRecord::Migration[5.0]
  def change
    add_column :reservations, :count, :integer, default: 0
  end
end
