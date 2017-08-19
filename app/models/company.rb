class Company < SecondBase::Base
  acts_as_mappable
  before_validation :geocode_address, :on => :create

  private
  def geocode_address
    geo=Geokit::Geocoders::MultiGeocoder.geocode (address)
    errors.add(:address, "Could not Geocode address") if !geo.success
    self.lat, self.lng, self.full_address = geo.lat,geo.lng,geo.full_address if geo.success
  end
end
