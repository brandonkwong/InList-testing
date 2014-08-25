class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.string :url
      t.string :image
      t.string :rank
      t.string :tags
      t.references :user, index: true
      t.references :category, index: true

      t.timestamps
    end
  end
end
