module ReservationsHelper
  def past_reservation_class(reservation)
    'past-reservation' if reservation.date_start < Time.now
  end
end
