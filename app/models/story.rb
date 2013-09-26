class Story < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: true

  acts_as_voteable
  belongs_to :user
  validates :user_id, presence: true
end
