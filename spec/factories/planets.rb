FactoryBot.define do
  factory :planet do
    name { Faker::Movies::StarWars.planet }

    factory :invalid_planet do
      name { nil }
    end
  end
end
