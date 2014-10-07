class IssueWebsite < ActiveRecord::Base
  validates :title, :url, :election_id, presence: true
  validates :url, url: true

  belongs_to :election, inverse_of: :issue_websites

  def self.alphabetical
    order(:title)
  end
end
