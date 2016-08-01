class Bike < ActiveRecord::Base
  has_many :rentals
  has_many :users, -> { uniq }, through: :rentals

  enum model: {
    city: 0,
    mountain: 1,
    eletric: 2
  }
end
