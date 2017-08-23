load 'config/environment.rb'
Rails.application.eager_load!
@names = [  "Aetea Information Technology Inc."]



# @client = GooglePlaces::Client.new('AIzaSyBRY9xz4uez74AomduySEPtnLfgxhe0alo')
@client = GooglePlaces::Client.new('AIzaSyCbwWx2hATlPtAHnKOAJXZ0vmhcA-t30Z0')
@names.each do |v|
    vendor = Vendor.where(legal_name: v).first_or_initialize
    vendor.legal_name = v
    @spots = @client.spots_by_query(v, detail: true)
    place = @spots.first
    unless place.nil?
        vendor.lat = place.lat
        vendor.lng = place.lng
        vendor.name = place.name
        vendor.phone = place.formatted_phone_number
        vendor.full_address = place.formatted_address
        vendor.website = place.website
    end
    vendor.name = v if vendor.name.nil?
    vendor.save
    puts vendor.name
    puts vendor.phone
    puts vendor.full_address
    puts vendor.website
end


