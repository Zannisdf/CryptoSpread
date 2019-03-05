class Market < ApplicationRecord
  has_many :coinhistories
  has_many :coins, through: :coinhistories
end
