class NavigationHeading < ActiveRecord::Base
	has_many :pages
	has_many :electoral_races

	def items
		pages + electoral_races
	end
end
