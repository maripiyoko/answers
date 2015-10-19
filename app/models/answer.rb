class Answer < ActiveRecord::Base
  extend Enumerize

  belongs_to :topic
  belongs_to :user

  validates_presence_of :topic_id, :user_id, :answer_type

  enumerize :answer_type, in: { 'unknown': 0, 'yes': 1, 'no': -1 }
end
