puts "seding in progress"
class Hero < ApplicationRecord
    validates :name, presence: true
    validates :power, presence: true
    
    def self.generate_fake_data(num_records)
      num_records.times do
        Hero.create(
          name: Faker::Superhero.name,
          power: Faker::Superhero.power,
          description: Faker::Lorem.paragraph
        )
      end
    end
  end

puts "Done seeding!"