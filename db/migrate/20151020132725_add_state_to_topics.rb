class AddStateToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :end_date, :datetime
    add_column :topics, :state, :string, default: 'WIP'
  end
end
