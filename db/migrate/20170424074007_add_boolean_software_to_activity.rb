class AddBooleanSoftwareToActivity < ActiveRecord::Migration[5.0]
  def change
    rename_column :activities, :datatime, :datetime
    add_column :activities,  :is_online, :boolean
    add_column :activities, :software, :string
  end
end
