class AddVisitedAttributeToUrls < ActiveRecord::Migration[6.0]
  def change
    add_column :urls, :visited, :boolean, default: false
  end
end
