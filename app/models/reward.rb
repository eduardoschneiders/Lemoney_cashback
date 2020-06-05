class Reward < ApplicationRecord
  belongs_to :client
  belongs_to :offer

  enum state: [:created, :confirmed]

  validates :client, :offer, presence: true
end
