class ChangeColumnsToActivities < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :datatime, :datetime
    add_column :activities, :card_image, :string
    add_column :activities, :banner_image, :string
  end
end
