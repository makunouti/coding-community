class Question < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true, length: { maximum: 100}
  validates :body, presence: true, length: { maximum: 300}

  belongs_to :user
  has_many :answer, dependent: :destroy

  #ブックマーク
  has_many :bookmark, dependent: :destroy

  #ブックマーク機能
  def favorited_by?(user)
    bookmark.exists?(user_id: user.id)
  end
end
