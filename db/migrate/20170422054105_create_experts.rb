class CreateExperts < ActiveRecord::Migration[5.0]
  def change
    create_table :experts do |t|
      t.string :name
      t.string :subject
      t.string :video_url
      t.text :article
      t.integer :liked, default: 0
      t.references :user, index: true
      t.timestamps
    end
  end
end
