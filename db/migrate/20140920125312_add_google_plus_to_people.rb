class AddGooglePlusToPeople < ActiveRecord::Migration
  def change
    add_column :people, :google_plus, :string
  end
end
