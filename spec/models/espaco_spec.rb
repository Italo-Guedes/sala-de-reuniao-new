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
require 'rails_helper'

RSpec.describe Espaco, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
