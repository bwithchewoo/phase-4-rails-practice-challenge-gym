class Client < ApplicationRecord
  has_many :memberships
  has_many :gyms, through: :memberships

  validates_presence_of :name
  validates :age, presence: true, numericality: { greater_than_or_equal_to: 18 }
end
