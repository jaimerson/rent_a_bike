class BikesReport::ActiveRecordSqlApproach
  def to_a
    Rental.joins(:bike)
      .select(query)
      .group('bikes.id')
      .order('times_rented DESC')
      .as_json(except: :id)
      .map { |r| r.symbolize_keys!.merge!(model: MODELS.fetch(r[:model])) }
  end

  private

  MODELS = Bike.models.invert.freeze

  def query
    <<-QUERY
      bikes.name, bikes.model,
      count(rentals.id) as times_rented,
      round(SUM(extract(
        epoch from (rentals.returned_at - rentals.created_at)
      )/ 3600 * bikes.price)::numeric, 2) as revenue
    QUERY
  end
end
