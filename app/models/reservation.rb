# frozen_string_literal: true

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
class Reservation < ApplicationRecord
  belongs_to :space, required: true
  belongs_to :user  
  include PgSearch::Model
  has_paper_trail

  validates :date_start, uniqueness: {scope: :space_id}
  validates :space, presence: true
  validates :date_start, presence: true
  validates :description, presence: true

  #validate :horario_disponivel

  def horario_disponivel
    if space.present? && self.space.reservations.where("date_start = ?", self.date_start).where.not(id: self.id).exists?
      errors.add(:date_start, "Já está ocupada.")
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
    against: %i[description],
    associated_against: {}, # relation: %i[f1, f2], another: %i[f1, f2]
    using: { tsearch: { prefix: true } },
    ignoring: :accents
  )
end
