class AddOfficialDocumentionToRegions < ActiveRecord::Migration
  def change
    add_column :regions, :official_document, :string
  end
end
