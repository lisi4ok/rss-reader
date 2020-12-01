class CreateFeeds < ActiveRecord::Migration[6.0]

  def change
    create_table :feeds do |t|
      t.string :url, null: false
      t.string :link, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.timestamps
    end
  end

end
