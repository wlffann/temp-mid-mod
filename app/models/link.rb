require 'uri'
class Link < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true
  validate :url_valid?

  def url_valid?
    url = URI.parse(self.url)
    if !url.is_a?(URI::HTTP)
      errors.add(:url, 'must be valid')
    end
  end
end
