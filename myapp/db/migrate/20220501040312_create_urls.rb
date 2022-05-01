class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.references :folder, foreign_key: true

      t.string :url
      t.string :title
      t.datetime :got_at

      t.timestamps
    end
  end
end
