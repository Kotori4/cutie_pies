FactoryBot.define do
  factory :user do
    nickname              {"ことり"}
    email                 {Faker::Internet.free_email}
    password              {"test1234"}
    password_confirmation {"test1234"}
    favorite_id           {1}
    have_pet_id           {1}
    pet_name              {"はっさくちゃん"}
  end
end
