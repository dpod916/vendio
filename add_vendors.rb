load '~/workspace/config/environment.rb'
Rails.application.eager_load!
@names = [  "Akshay Software International, Inc.", 
            "Alden Associates & Consulting, Inc", 
            "Alden Personnel, Inc.", 
            "Arago Consulting", 
            "Avaisys Consulting PTE LTD", 
            "Axion Worldwide, LLC", 
            "Ayers Group, The", 
            "Best Writers / Sid Falthzik", 
            "Bist Consulting Co.", 
            "BSA", 
            "Burton Group", 
            "Calpion Inc.", 
            "Camo Technologies, Inc.", 
            "Career Techniques, Inc.", 
            "CEI", 
            "Celeris Solutions Group", 
            "ClearPath Workforce Management, Inc.", 
            "Clerysys Incorporated", 
            "Cobalt Wave Technology, LLC,", 
            "Confirmatics Inc", 
            "CSI ", 
            "Custom Satffing, Inc", 
            "Daugherty", 
            "DomaniTech, Inc.", 
            "Domingos E Goncalves Solucoes EM INFORMATICA LTDA", 
            "DTN Market Access", 
            "e-Core Desenvolvimento de Software", 
            "eCore IT Solutions, LLC", 
            "EcoSys Management LLC", 
            "Egar Technology, Inc.", 
            "Emassi Inc.", 
            "Eunomia M&M S.A", 
            "Eurospher Tecnologia da Informação Ltda.", 
            "FH Consulting GmbH", 
            "FI & CO Finance & Controlling AG", 
            "Forstar Resources LTD", 
            "Forum Personnel Inc.", 
            "GreenBee LTD", 
            "Helios & Matheson North America Inc.", 
            "Hyatt Leader LTD", 
            "IBI ", 
            "Idexcel - iTech Consuling Group, Inc. ", 
            "IDS Scheer", 
            "Infosys Technologies Limited", 
            "Ishi Systems Inc.", 
            "iSolve Services  Private Limited", 
            "IT Happens KFT ", 
            "iTech Solutions, Inc.", 
            "Joel H Friedman", 
            "K-2 Partners", 
            "Kennedy / De Almeida, LLC", 
            "L&T ", 
            "Lancaster Systems, Inc.", 
            "LCI ", 
            "Leading Edge Communications Corp.", 
            "Lekha, Inc.", 
            "Letse", 
            "Lloyd's Register - Fairplay", 
            "Masfin Consulting, Inc", 
            "Moakley Consulting Solutions, LLC", 
            "NEC Solutions , Inc.", 
            "Neoris", 
            "New Aspects of Software", 
            "Perficient, Inc.", 
            "Peter Mancuso", 
            "Portland Resourcing Limited", 
            "Project One, Inc.", 
            "PWC ", 
            "Recruit 121 Limited", 
            "Savitar Consulting, LLC", 
            "Semafor Technologies", 
            "Servicon", 
            "SGA ", 
            "Silversearch, Inc.", 
            "SMB Services LLC", 
            "Softworld, Inc.", 
            "Sogeti USA LLC", 
            "Sovereign Technologies", 
            "Spock Advisors  LLC", 
            "Spring Lake Consulting, LLC", 
            "SQS ", 
            "SQS North Amercia, LLC", 
            "Stefanini International Corp.", 
            "Stockell Information Systems, Inc.", 
            "Syncro Technologies", 
            "The Churchill Benefit Corporation ", 
            "Tibco", 
            "Titan Technology Partners, Limited", 
            "Treasury & Trade", 
            "TSR Consulting Services, Inc.", 
            "Vision Systems Group", 
            "Wan Zhang", 
            "William Swisher", 
            "WNAF Corporation", 
            "York Solutions" ]


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