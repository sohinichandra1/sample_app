class Place < ActiveRecord::Base
  has_many :user_places
  has_many :users, through: :user_places

  geocoded_by :address
  after_validation :geocode

  def address
    [street_address, state, country, zip_code].compact.join(", ")
  end
end
