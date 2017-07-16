class CreateUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :urls do |t|
      t.string :short_url, null: false
      t.text :long_url, null: false

      t.timestamps
    end
  end
end
