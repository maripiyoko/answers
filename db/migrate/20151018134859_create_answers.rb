class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :answer_type, default: 0
      t.references :topic, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :message

      t.timestamps null: false
    end

    add_index :answers, [ :user_id, :id ], unique: true
  end
end
