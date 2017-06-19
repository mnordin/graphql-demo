class UserPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record == user
  end
end
