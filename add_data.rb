load 'config/environment.rb'
Rails.application.eager_load!

def bad_column(col, model)
  col.nil? || model.classify.constantize.column_names.exclude?(col) ? true : false
end

models = ["consultant"]
models.each do |model|
  s = SimpleSpreadsheet::Workbook.read("data/#{model.pluralize}.xlsx")
  s.selected_sheet = s.sheets.first
  attribute_params = Hash.new
  s.first_row.upto(s.last_row) do |line|
    if line > 1
      s.first_column.upto(s.last_column) do |column|
        unless bad_column(s.cell(1, column), model)
          attribute_params[s.cell(1, column).downcase.to_sym] = s.cell(line, column)
        end
      end
      new_model = model.classify.constantize.where(id: attribute_params[:id]).first_or_initialize
      new_model.update_attributes(attribute_params)
    end
    puts "#{model} #{line} of #{s.last_row}"
  end
end

