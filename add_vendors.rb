load 'config/environment.rb'
Rails.application.eager_load!
@names = [  "Cognizant Technology Solutions",
            "Consensys Limited",
            "CoppClark Professional",
            "Cunningham Trading Systems",
            "Descartes Systems (USA) LLC (fmly MK Technology Data LLC)",
            "Fidessa Corporation",
            "FinancialCad Corporation",
            "Gartner, Inc.",
            "HP (Hewlett Packard)",
            "IBI (Information Builders, Inc)",
            "IDS Scheer",
            "IRR (Industrial Info Resoruces, Inc.)",
            "L&T (Larsen & Toubro Infotech Limited)",
            "LIM (Logical Information Machine)",
            "MathWorks",
            "Mercury Interactive",
            "MK Technology Data LLC",
            "New Aspects of Software",
            "Oracle America, Inc.",
            "Parasoft",
            "Perficient, Inc.",
            "Reuters America LLC",
            "RTS (Realtime Systems Inc.)",
            "SS&C Technologies",
            "SunGard Futures Systems",
            "Sungard Kiodex, Inc.",
            "Tableau Software, Inc.",
            "Tibco"]



# @client = GooglePlaces::Client.new('AIzaSyBRY9xz4uez74AomduySEPtnLfgxhe0alo')
@client = GooglePlaces::Client.new('AIzaSyCbwWx2hATlPtAHnKOAJXZ0vmhcA-t30Z0')
@names.each do |v|
    vend = Vendor.where(legal_name: v).first
    if vend.nil?
        vendor = Vendor.new
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
end


