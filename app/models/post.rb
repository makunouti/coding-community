class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 100}
  validates :body, presence: true, length: { maximum: 1000}

  belongs_to :user, optional: true
end
