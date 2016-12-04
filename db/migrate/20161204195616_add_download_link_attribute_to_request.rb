class AddDownloadLinkAttributeToRequest < ActiveRecord::Migration[5.0]
  def change
    add_column :requests, :download_link, :string
  end
end
