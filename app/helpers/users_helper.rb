module UsersHelper
  def name(user)
    if user == current_user
      "Me"
    else
      user.first_name
    end
  end
end
