class CreateStatistics < ActiveRecord::Migration[6.0]
  def change
    create_table :statistics do |t|
      t.string :ip_address
      t.string :referer

      t.timestamps

      t.belongs_to :url, index: true
    end
  end
end
