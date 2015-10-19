class Answer < ActiveRecord::Base
  extend Enumerize

  belongs_to :topic
  belongs_to :user

  validates_presence_of :topic_id, :user_id, :answer_type

  enumerize :answer_type, in: { '未回答': 0, '出席': 1, '欠席': -1 }
end
