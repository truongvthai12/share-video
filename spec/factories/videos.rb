FactoryBot.define do
    factory :video do
      url { Faker::Internet.url  }
    end
  end