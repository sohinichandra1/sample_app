class SharedPlace < ActiveRecord::Base
  has_many :user_shared_places, dependent: :destroy

  geocoded_by :address
  after_validation :geocode

  validates :street_address, :state, :country, presence: true

  def address
    [street_address, state, country, zip_code].reject(&:blank?).join(", ")
  end

  def build_share_locations(params, user)
    if params[:share_via] == "all"
      user_shared_places.build(public: true, user_id: user.id)
    elsif params[:share_via] == "friend"
      params[:friend_ids].each do |friend_id|
        user_shared_places.build(user_id: user.id, friend_id: friend_id)
      end
    end
  end
end
