class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, source: :friend

  has_many :user_shared_places, dependent: :destroy
  has_many :shared_places, through: :user_shared_places
  has_many :public_shared_places, -> { where(user_shared_places: {public: true}) }, through: :user_shared_places, source: :shared_place

  has_many :places_shared_with_friends, -> { where("user_shared_places.friend_id is not null") }, through: :user_shared_places, source: :shared_place

  validates :first_name, :email, :username, presence: true
  validates :password, presence: true, on: :create
  validates :password, confirmation: true, on: :create
  validates :email, :username, uniqueness: true

  def name
    [first_name, last_name].compact.join(" ")
  end

  def grouped_shared_places_for_friends
    user_shared_places.for_friends.group_by(&:address)
  end

  def places_shared_with_user
    UserSharedPlace.where(friend_id: id, public: false)
  end

  def grouped_places_shared_with_user
    places_shared_with_user.group_by(&:address)
  end
end
