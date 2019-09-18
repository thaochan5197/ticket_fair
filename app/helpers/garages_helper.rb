module GaragesHelper
  def check_seat seat, trip
    ticket = seat.tickets.find_by trip_id: trip.id
    if ticket.nil? || ticket.status_cancel?
      "available"
    else 
      "unavailable"
    end
  end

  def list_start_point trip
    trip.stop_points.collect { |p| [ p.bus_station.name ] }
  end

  def get_trip_of_garage garage_id, all_trips
    trips = all_trips.where("garage_id = ?", garage_id)
  end
end
