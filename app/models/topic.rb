class Topic < ActiveRecord::Base
  extend Enumerize

  belongs_to :user
  has_many :answers

  validates_presence_of :title, :topic_type

  TOPIC_TYPES = %w(
    会議
    議題
  ).freeze
  enumerize :topic_type, in: TOPIC_TYPES
  validates :topic_type, presence: true, inclusion: { in: TOPIC_TYPES }


  scope :unanswered, ->(user) {
    now = Time.current
    where('start_date > ? AND user_id = ?', now, user)
  }

  def num_answer(answer_type)
    self.answers.where(answer_type: answer_type).count
  end

  def num_unknown
    User.count - self.answers.where('answer_type = 1 OR answer_type = -1').count
  end

end
