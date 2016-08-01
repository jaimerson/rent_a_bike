class BikesReport::NaiveApproach
  def to_a
    rentals.group_by { |r| r.bike_id }.reduce([]) do |result, (id, rentals)|
      rental = rentals.first
      result << {
        name: rental.bike.name,
        model: rental.bike.model,
        times_rented: rentals.count,
        revenue: rental.bike.price * total_interval(rentals)
      }
    end.sort_by { |r| - r[:times_rented] }
  end

  private

  def total_interval(rentals)
    rentals.reduce(0) do |result, r|
      result += ((r.returned_at - r.created_at) / 1.hour).round
    end
  end

  def rentals
    Rental.includes(:bike)
  end
end
