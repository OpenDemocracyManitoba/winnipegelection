class AddNavigationHeadingRefToElectoralRace < ActiveRecord::Migration
  def change
    add_reference :electoral_races, :navigation_heading, index: true
  end
end
