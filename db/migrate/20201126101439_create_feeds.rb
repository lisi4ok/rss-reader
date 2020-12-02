class CreateFeeds < ActiveRecord::Migration[6.0]

  def change
    create_table :feeds do |t|
      t.string :link, null: false
      t.string :title, null: false
      t.longtext :description, null: false
      t.timestamps
    end
  end

end
