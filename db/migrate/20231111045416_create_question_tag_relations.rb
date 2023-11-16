class CreateQuestionTagRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :question_tag_relations do |t|
      t.references :question, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
    #同じタグを２回
    add_index :question_tag_relations, [:question_id, :tag_id], unique: true
  end
end
