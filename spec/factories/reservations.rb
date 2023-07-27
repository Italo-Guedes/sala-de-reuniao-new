# == Schema Information
#
# Table name: reservations
#
#  id          :bigint           not null, primary key
#  date_start  :datetime
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  space_id    :bigint           not null
#  user_id     :bigint           not null
#
FactoryBot.define do
  factory :reservation do
    space { nil }
    date_start { "2023-07-23 15:32:12" }
    description { "MyText" }
  end
end
