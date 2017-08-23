load 'config/environment.rb'
Rails.application.eager_load!

def bad_column(col, model)
  col.nil? || model.classify.constantize.column_names.exclude?(col) ? true : false
end


models = ["consulting_agreement"]
models.each do |model|
  s = SimpleSpreadsheet::Workbook.read("#{model.pluralize}.xlsx")
  s.selected_sheet = s.sheets.first
  attribute_params = Hash.new
  s.first_row.upto(s.last_row) do |line|
    if line > 1
      s.first_column.upto(s.last_column) do |column|
        unless bad_column(s.cell(1, column), model)
          attribute_params[s.cell(1, column).downcase.to_sym] = s.cell(line, column)
          puts "#{s.cell(1, column)}: #{s.cell(line, column)}"
        end
      end
      new_model = model.classify.constantize.where(old_id: attribute_params[:old_id]).first_or_initialize
      new_model.update_attributes(attribute_params)

    puts "#{model} #{line} of #{s.last_row}"
    end
  end
end


  # apis = ['AIzaSyDq00IrmPcH7_MH6DDTdyJ07oFT-xH8Xwo', 'AIzaSyDaGQnUF6MAV7fMa7R4zRu-nlMQWsGCFtE',
  #         'AIzaSyBRY9xz4uez74AomduySEPtnLfgxhe0alo', 'AIzaSyB_Kp8AXEW6JLFfaaMi5dTrjjB6eJ0To9c',
  #         'AIzaSyCsprHSHVxYBN18Cyp1WNCUm1E_5WHEhog', 'AIzaSyBDkpd5jd4rGJPXjKzDgCe1uBRg2jsQpZc',
  #         'AIzaSyDzpaRkSx83cFOb_gYP2JEhTb3XLd6OB8Y', 'AIzaSyDTF9sWy1Dx41aAiKWUCZ91l6jvF0q5eAU']
  # i = 6
  # @client = GooglePlaces::Client.new(apis.at(i))
#   spots = @client.spots_by_query("#{new_model.name}", detail: true)
#   spot = spots.first
#   unless spot.nil?
#     new_model.lat = spot.lat
#     new_model.lng= spot.lng
#     new_model.full_address = spot.formatted_address
#     new_model.phone_number = spot.formatted_phone_number
#     new_model.save
#   end
#   puts "#{new_model.name} added"
# end