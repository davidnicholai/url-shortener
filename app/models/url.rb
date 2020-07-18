class Url < ApplicationRecord
  validates :original_url, presence: true, url: true
  has_many :statistics, dependent: :delete_all

  def self.generate_url
    generated_slug = Digest::MD5.hexdigest "#{SecureRandom.uuid}#{DateTime.now}"

    generated_slug = generated_slug[0, 5]

    # If slug exists, generate a new slug.
    if Url.find_by slug: generated_slug
      generate_url
    else
      generated_slug
    end
  end
end
