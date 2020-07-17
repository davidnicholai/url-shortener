class CreateUrls < ActiveRecord::Migration[6.0]
  def change
    create_table :urls do |t|
      t.string :text
      t.string :shortened_text
      t.datetime :expires_on

      t.timestamps
    end
  end
end
