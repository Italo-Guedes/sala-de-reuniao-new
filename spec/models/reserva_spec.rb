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
require 'rails_helper'

RSpec.describe Reserva, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
