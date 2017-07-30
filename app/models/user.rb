class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :friendships
  has_many :friends, through: :friendships, source: :friend

  has_many :shared_places
  # has_many :public_places, through: :user_places, where: { public: true }
  # has_many :places_with_friend, through: :user_places

  def name
    [first_name, last_name].compact.join(" ")
  end
end
