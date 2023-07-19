# == Schema Information
#
# Table name: reservas
#
#  id               :bigint           not null, primary key
#  data_hora_inicio :datetime
#  descricao        :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  espaco_id        :bigint           not null
#
FactoryBot.define do
  factory :reserva do
    espaco { nil }
    data_hora_inicio { "2023-07-19 18:59:52" }
    descricao { "MyText" }
  end
end
