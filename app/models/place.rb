class Place < ActiveRecord::Base
  has_many :shared_places

  geocoded_by :address
  after_validation :geocode
  accepts_nested_attributes_for :shared_places

  def address
    [street_address, state, country, zip_code].compact.join(", ")
  end
end
