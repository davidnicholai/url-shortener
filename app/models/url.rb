class Url < ApplicationRecord
  validates :text, presence: true, url: true
end
