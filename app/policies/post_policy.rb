class PostPolicy < ApplicationPolicy
  def create?
    user.present?
  end

  def update?
    record.user_id == user.id
  end
end
