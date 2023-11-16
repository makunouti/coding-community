class Question < ApplicationRecord
  has_one_attached :image
  validates :title, presence: true, length: { maximum: 100}
  validates :body, presence: true, length: { maximum: 300}

  belongs_to :user
  has_many :answer, dependent: :destroy

  #タグ機能
  has_many :question_tag_relations, dependent: :destroy
  has_many :tags, through: :question_tag_relations

  #ブックマーク
  has_many :bookmark, dependent: :destroy

  #ブックマーク機能
  def favorited_by?(user)
    bookmark.exists?(user_id: user.id)
  end

  def self.ransackable_attributes(auth_object = nil)
    # titleとbodyは検索OKとする（ただし管理者は自由に検索可）
    auth_object ? super : %w(title body)
  end

  def save_question_tags(tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = tags - current_tags

    # 古いタグを消す
    old_tags.each do |old_name|
      self.question_tags.delete Tag.find_by(name:old_name)
    end

    # 新しいタグを保存
    new_tags.each do |new_name|
      tag = Tag.find_or_create_by(name:new_name)
      self.tags << tag
    end
  end
end
