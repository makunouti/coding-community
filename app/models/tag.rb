class Tag < ApplicationRecord
  has_many :question_tag_relation, dependent: :destroy
  has_many :question, through: :question_tag_relation
end
