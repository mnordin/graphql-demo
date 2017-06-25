class HomeController < ApplicationController
  def show
    @user_select = User.pluck(
      :first_name,
      :last_name,
      :id,
    ).map do |first, last, id|
      ["#{first} #{last}", id]
    end
  end
end
