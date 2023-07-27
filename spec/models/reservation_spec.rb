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
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
