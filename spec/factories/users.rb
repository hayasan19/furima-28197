FactoryBot.define do
    factory :user do
      nickname              {Faker::Name.initials(number: 2)}
      email                 {"kkk@email.com"}
      password              {Faker::Internet.password(min_length: 6)}
      password_confirmation {password}
      first_name            {"ぜんかく"}
      last_name             {"ぜんかく"}
      first_name_kana       {"カタカナ"}
      last_name_kana        {"カタカナ"}
      birthday              {"1985-11-02"}
    end
  end