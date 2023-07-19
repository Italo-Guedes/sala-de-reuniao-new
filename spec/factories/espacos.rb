# == Schema Information
#
# Table name: espacos
#
#  id         :bigint           not null, primary key
#  descricao  :text
#  nome       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :espaco do
    nome { "MyString" }
    descricao { "MyText" }
  end
end
