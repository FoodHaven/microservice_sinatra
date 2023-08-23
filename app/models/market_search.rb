class MarketSearchService
  RADIUS_CONSTANT = 3958.8

  def initialize(location_params)
    @latitude = location_params[:latitude]
    @longitude = location_params[:longitude]
    @radius = location_params[:radius]
  end

  def nearby_markets
    Market.where(nearby_query)
  end

  private

  def nearby_query
    "acos(
      sin(radians(#{@latitude}))
        * sin(radians(latitude))
      + cos(radians(#{@latitude}))
        * cos(radians(latitude))
        * cos(radians(#{@longitude})
          - radians(longitude))
      ) * #{RADIUS_CONSTANT} <= #{@radius}"
  end
end