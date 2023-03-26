class Power < ApplicationRecord

    validates :description, presence: true, length: { minimum: 20 }
end
