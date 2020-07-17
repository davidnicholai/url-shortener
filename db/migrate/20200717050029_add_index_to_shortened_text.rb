class AddIndexToShortenedText < ActiveRecord::Migration[6.0]
  def change
    add_index :urls, :shortened_text
  end
end
