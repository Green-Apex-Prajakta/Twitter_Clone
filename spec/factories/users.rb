FactoryBot.define do
    factory :user do
      email { 'john@gmail.com' }
      password { 1234567 }
    end
  end 