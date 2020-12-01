class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :link, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.datetime :date, null: true
      t.belongs_to :feed, null: false, foreign_key: true

      t.timestamps
    end
  end
end
