# frozen_string_literal: true

# Espaco model
class Espaco < ApplicationRecord
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
