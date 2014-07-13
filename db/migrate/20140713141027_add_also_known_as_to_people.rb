class AddAlsoKnownAsToPeople < ActiveRecord::Migration
  def change
    add_column :people, :also_known_as, :string
  end
end
