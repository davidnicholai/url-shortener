class Statistic < ApplicationRecord
  validates :ip_address, presence: false, format: { with: /\A(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\z/, message: 'Invalid IP Address format' }
  validates :referer, presence: false, url: true
  belongs_to :url
end
