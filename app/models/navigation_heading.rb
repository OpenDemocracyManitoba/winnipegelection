class NavigationHeading < ActiveRecord::Base
  has_many :pages, -> { order 'title' }
  has_many :electoral_races, -> { includes(:region).order('regions.name') }

  def items
    pages + electoral_races
  end
end
