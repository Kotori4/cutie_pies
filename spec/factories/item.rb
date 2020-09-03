FactoryBot.define do
  factory :item do
    item_title              {"テスト"}
    item_text               {"アマゾンでカウゾン"}
    item_link               {"https://www.amazon.co.jp/"}
    user
  end
end

