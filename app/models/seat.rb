class Seat < ApplicationRecord
  belongs_to :coach
  has_many :tickets

  enum types: {one: 1, two: 2}, _prefix: :types
end
