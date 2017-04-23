class AddCountToActivities < ActiveRecord::Migration[5.0]
  def change
    add_column :activities, :count, :integer, default: 0
  end
end
