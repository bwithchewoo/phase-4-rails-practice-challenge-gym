class Gym < ApplicationRecord
  has_many :memberships, dependent: :destroy
  has_many :clients, through: :memberships

  validates_presence_of :name
  validates_presence_of :address
end
