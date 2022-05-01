require 'net/http'
require 'uri'

class Url < ApplicationRecord
  belongs_to :folder
  validates :url,
    length: { minimum: 11 },
    format: /\A#{URI::regexp(%w(http https))}\z/

  def acquire_title
    html = Net::HTTP.get(URI.parse(self.url))    
    html = html.force_encoding('UTF-8')
    html = html.gsub(/\R/, '')
    m = html.match(/<title>(.*)<\/title>/)
    if m
      title = m[1]
      title = title.strip
      self.title = title
      self.got_at = Time.now
      self.save!
    end
  end
end
