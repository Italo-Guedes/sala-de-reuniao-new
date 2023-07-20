# frozen_string_literal: true

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
class Espaco < ApplicationRecord
  has_many :reservas, dependent: :destroy
  include PgSearch::Model
  has_paper_trail

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
    against: %i[nome descricao],
    associated_against: {}, # relation: %i[f1, f2], another: %i[f1, f2]
    using: { tsearch: { prefix: true } },
    ignoring: :accents
  )
end