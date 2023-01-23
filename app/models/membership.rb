class Membership < ApplicationRecord
  belongs_to :gym
  belongs_to :client

  validates_presence_of :gym
  validates_presence_of :client
  validates_presence_of :charge
end
