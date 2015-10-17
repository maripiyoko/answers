class Topic < ActiveRecord::Base
  extend Enumerize

  belongs_to :user

  validates_presence_of :title, :topic_type

  TOPIC_TYPES = %w(
    会議開催
    議題
  ).freeze
  enumerize :topic_type, in: TOPIC_TYPES
  validates :topic_type, presence: true, inclusion: { in: TOPIC_TYPES }

end
