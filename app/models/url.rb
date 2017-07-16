require 'uri'

class Url < ApplicationRecord
  validate :url_is_correctly_formatted
  before_save :generate_short_url

  def url_is_correctly_formatted
    uri = URI.parse(long_url)
    if uri.host.nil?
      errors.add(:long_url, "has to be a valid url")
    end
  end

  def generate_short_url
    hex = SecureRandom.hex(4)
    until Url.find_by_short_url(hex).nil?
      hex = SecureRandom.hex(4)
    end
    self.short_url = hex
  end
end
