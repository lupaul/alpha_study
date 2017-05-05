class ChangeColumnNameToActivity < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :count, :participations_count
  end
end
