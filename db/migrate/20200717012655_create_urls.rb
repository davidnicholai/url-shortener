class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :slug
      t.string :original_url
      t.boolean :active, default: true

      t.timestamps
    end

    add_index :urls, :slug
  end
end
