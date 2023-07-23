# == Schema Information
#
# Table name: spaces
#
#  id          :bigint           not null, primary key
#  description :text
#  name        :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
FactoryBot.define do
  factory :space do
    name { "MyString" }
    description { "MyText" }
  end
end
