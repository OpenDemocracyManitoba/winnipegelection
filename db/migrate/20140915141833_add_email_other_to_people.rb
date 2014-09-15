class AddEmailOtherToPeople < ActiveRecord::Migration
  def change
    add_column :people, :email_other, :string
  end
end
