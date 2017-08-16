module UserHelper

    def relationship_icon(relationship)
        icon = "fa-map-marker" if relationship == 'office'
        icon = "fa-briefcase" if relationship == 'function'
        icon = "fa-registered" if relationship == 'company'
        icon = "fa-usd" if relationship == 'profit_center'
        icon = "fa-university" if relationship == 'division'
        icon = "fa-industry" if relationship == 'department'
        icon = "fa-gears" if relationship == 'business_unit'
        return icon
    end

    def pull_direction(i)
      i ? "pull-left" :  "text-center"
    end



end
