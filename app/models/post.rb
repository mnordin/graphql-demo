class Post < ApplicationRecord
  belongs_to :user

  validates :title, :content, :user, presence: true
end
