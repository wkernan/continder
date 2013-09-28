class Story < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: true

  belongs_to :user
  validates :user_id, presence: true
  has_reputation :votes, source: :user, aggregated_by: :sum
end
