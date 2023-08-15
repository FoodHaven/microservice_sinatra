class Market < ActiveRecord::Base
  def self.accepts_benefits
    where('fnap IS NOT NULL OR snap_option IS NOT NULL')
  end

  def self.snap_available
    where('snap_option IS NOT NULL')
  end

  def self.fnap_available
    where('fnap IS NOT NULL')
  end

  def self.nearby_markets(location_params)    
    require 'pry'; binding.pry
    where(haversine(location_params, {latitude:, longitude:}) <= location_params[:radius])
  end

  def market_coordinates
    {latitude: latitude, longitude: longitude}
  end

  def self.haversine(start_coords, end_coords)
    #The haversine formula is as follows: 
    #a = sin²(φB — φA/2) + cos φA * cos φB * sin²(λB — λA/2)
    # c = 2 * atan2( √a, √(1−a) )
    # d = R ⋅ c

    #radius of the earth in miles
    earths_radius_mi = 3958.8

    # latitude degrees become radians
    start_latitude = radians(start_coords[:latitude])
    end_latitude = radians(end_coords[:latitude])
  

    latitude_difference = radians(end_coords[:latitude] - start_coords[:latitude])
    longitude_difference = radians(end_coords[:longitude] - start_coords[:longitude])
  
    # sin²(φB - φA/2) + cos φA * cos φB * sin²(λB - λA/2)
    a = Math.sin(latitude_difference/2.0)**2 + Math.cos(start_latitude) * Math.cos(end_latitude) * Math.sin(longitude_difference/2.0)**2
  
    # c = 2 * atan2( √a, √(1−a) )
    c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a))
  
    #distance between degrees
    earths_radius_mi * c
  end

  def self.radians(degrees)
    degrees * (Math::PI / 180)
  end  
end