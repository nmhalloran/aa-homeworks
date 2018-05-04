class HousesTable < ApplicationRecord
  has_many :residents,
    primary_key: :id,
    foreign_key: :house_id,
    class_name: "Peep"

    def self.car
      p "string"

    end


end
