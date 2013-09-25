class Story < ActiveRecord::Base
  attr_accessible :content

  validates :content, presence: true

  belongs_to :user
  validates :user_id, presence: true
end
