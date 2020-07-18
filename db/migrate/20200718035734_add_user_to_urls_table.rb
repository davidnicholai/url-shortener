class AddUserToUrlsTable < ActiveRecord::Migration[6.0]
  def change
    add_reference :urls, :user, foreign_key: true
  end
end
