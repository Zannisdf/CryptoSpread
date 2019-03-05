class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :coin
  validates :content, presence: true
end
