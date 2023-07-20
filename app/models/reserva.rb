# frozen_string_literal: true

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
# Reserva model
class Reserva < ApplicationRecord
  belongs_to :espaco, required: true
  include PgSearch::Model
  has_paper_trail

  validate :horario_disponivel

  def horario_disponivel
    if self.espaco.reservas.where("data_hora_inicio = ?", self.data_hora_inicio).where.not(id :self.id).exists?
      errors.add(:data_hora_inicio, "já está ocupada.")
    end
  end



  def to_s
    super
  end

  def self.search(search, page)
    if search.present?
      paginate(per_page: 20, page:).full_search(search)
    else
      paginate(per_page: 20, page:)
    end
  end

  pg_search_scope(
    :full_search,
    against: %i[descricao],
    associated_against: {}, # relation: %i[f1, f2], another: %i[f1, f2]
    using: { tsearch: { prefix: true } },
    ignoring: :accents
  )
end
