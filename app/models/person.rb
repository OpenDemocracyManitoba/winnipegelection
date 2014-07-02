class Person < ActiveRecord::Base
  has_many :candidacies, inverse_of: :person
  has_many :electoral_races, through: :candidacies

  validates :name, presence: true
  validates :website, :council_site, :facebook, :twitter, :youtube, :linkedin,
            url: { allow_blank: true }

  mount_uploader :image, ProfileImageUploader

  include FriendlyURL
  def slug_for_friendly_url
    name.parameterize
  end

  # TODO: NEEDS TESTS. Must ensure that the order of candidacies
  # actually agrees with associated electoral_race/election.
  def most_recent_candidacy
    # candidacies.includes(electoral_race: :election)
    # .order(elections: :election).last
    @most_recent_candidacy ||= candidacies.last
  end
end
