class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :topic_type
      t.datetime :start_date
      t.string :place
      t.datetime :deadline_date
      t.references :user

      t.timestamps null: false
    end
    add_index :topics, [:user_id, :created_at]
  end
end
