class CommentPolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.user == user
  end
end
