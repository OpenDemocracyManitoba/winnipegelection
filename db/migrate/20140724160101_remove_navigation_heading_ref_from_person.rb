class RemoveNavigationHeadingRefFromPerson < ActiveRecord::Migration
  def change
    remove_reference :people, :navigation_heading, index: true
  end
end
