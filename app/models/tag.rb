class Tag < ApplicationRecord
  has_many :question_tag_relations, dependent: :destroy
  has_many :questions, through: :question_tag_relations

  validates :name, presence: true, length: { maximum: 50 }
end
