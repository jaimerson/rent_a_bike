class BikesReport::ViewApproach
  def to_a
    BikesReport
      .all
      .as_json
      .map { |r| r.symbolize_keys!.merge!(model: MODELS.fetch(r[:model])) }
  end

  private

  MODELS = Bike.models.invert.freeze
end
