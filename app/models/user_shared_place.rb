class UserSharedPlace < ActiveRecord::Base
  belongs_to :user
  belongs_to :shared_place
  belongs_to :friend, class_name: "User", foreign_key: :friend_id

  scope :for_friends, -> { where("friend_id is not null") }
  scope :for_public, -> { where(public: true) }

  delegate :address, :latitude, :longitude, to: :shared_place

  validates :user, :shared_place, presence: true

  def friend_name
    friend.name
  end
end
