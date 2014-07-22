class NavigationHeading < ActiveRecord::Base
	has_many :pages
	has_many :people

	def items
		pages + people
	end
end
