load '~/workspace/config/environment.rb'
Rails.application.eager_load!

# class String
# 	def is_number?
# 	  true if Float(self) rescue false
# 	end
# end

# class Fixnum
# 	def is_number?
# 	  true if Float(self) rescue false
# 	end
# end

# def find_office(loc)
# 	office = nil
# 	unless loc.nil?
# 		office = Office.where(name: loc).first
# 		if office.nil?
# 			clean_loc = loc
# 			clean_loc = clean_loc.gsub(/[^0-9A-Za-z]/, '').downcase
# 			office = Office.where(clean_name: clean_loc).first
# 		end
# 		# if office.nil?
# 		# 	office = Office.new
# 		# 	office.name = loc
# 		# 	office.clean_name = clean_loc
# 		# 	office.country = con
# 		# 	office.city = cit
# 		# 	office.save
# 		# end
# 	end
# 	return office
# end

# def find_company(co_name)
# 	unless co_name.nil?
# 		unless co_name.is_number?
# 			char_arr = co_name.split("")
# 			if char_arr[-1] == ")" && char_arr[-2].is_number?
# 				until char_arr[-2] == " " do
# 					char_arr.delete_at(-1)
# 				end
# 				char_arr.delete_at(-1)
# 			end
# 			co_name = char_arr.join("")
# 		else
# 			co_name = co_name
# 		end
# 		unless co_name.is_a?(DateTime)
# 			clean_co_name = co_name
# 			clean_co_name = clean_co_name.gsub(/[^0-9A-Za-z]/, '').downcase unless co_name.is_number?
# 			company = Company.where(name: co_name).first
# 			company = Company.where(clean_name: clean_co_name).first if company.nil?
# 			if company.nil?
# 				company = Company.new
# 				company.name = co_name
# 				company.clean_name = clean_co_name
# 				company.save
# 			end
# 		end
# 	end
# 	return company
# end

# def find_profit_center(profit_center_name, company)
# 	profit_center = ProfitCenter.where(name: profit_center_name)
# 	profit_center = profit_center.where(company_id: company.id) unless company.nil?
# 	profit_center = profit_center.first
# 	if profit_center.nil?
# 		profit_center = ProfitCenter.new
# 		profit_center.name = profit_center_name
# 		profit_center.company = company unless company.nil?
# 		profit_center.save
# 	end
# 	return profit_center
# end

# def find_country(country_code)
# 	country = Country.where(country_code: country_code).first unless country_code.nil?
# 	return country
# end

# def find_segment(name)
# 	segment = Segment.where(name: name).first unless name.nil?
# 	return segment
# end

# def find_business_unit(name)
# 	segment = BusinessUnit.where(business_unit: name).first unless name.nil?
# 	return segment
# end

# def find_division(name)
# 	division = Division.where(name: name).first unless name.nil?
# 	return division
# end

# def find_department(name)
# 	department = Department.where(name: name).first unless name.nil?
# 	return department
# end

# def find_function(name)
# 	function = Function.where(name: name).first unless name.nil?
# 	return function
# end

# def find_manager(id)
# 	manager = User.where(employee_id: id).first unless id.nil?
# 	manager = manager.id unless manager.nil?
# 	return manager
# end

# def find_status(status)
# 	unless status.nil?
# 		if status.is_number?
# 			if status.to_i > 0
# 				user_status = "ACTIVE"
# 			else
# 				user_status = "INACTIVE"
# 			end
# 		end
# 	end
# 	return user_status
# end

# i = 0
# s = SimpleSpreadsheet::Workbook.read("Users.xlsx")
# s.selected_sheet = s.sheets.first
# s.first_row.upto(s.last_row) do |line|
# 	if s.cell(line, 1).is_number?
# 		i+=1
# 		user = nil
# 		email = nil

# 		unless s.cell(line, 7).nil?
# 			email = s.cell(line, 7).strip
# 			if email.dup == "noemail@bunge.com"
# 				email = s.cell(line, 8) + "." + s.cell(line, 12) + "@bunge.com"
# 				email = email.gsub(/\s+/, "")
# 			end
# 		end

# 		unless s.cell(line, 1).nil?
# 			user = User.where(employee_id: s.cell(line, 1)).first if user.nil?
# 		end

# 		# if user.nil?
# 		# 	user = User.where(email_address: email).first unless email.nil? || email == "noemail@bunge.com"
# 		# end
# 		unless s.cell(line, 56).nil?
# 			ad_user = s.cell(line, 56).downcase
# 			user = User.where(ad_user_id: ad_user).first if user.nil?
# 		end

# 		user.status = "INACTIVE" unless user.nil?
# 		unless s.cell(line, 29).nil?
# 			if s.cell(line, 29).to_i == 1
# 				user = User.new if user.nil?
# 				office = find_office(s.cell(line, 13))
# 				user.office = office unless office.nil?
# 				user.company = find_company(s.cell(line, 3))
# 				user.employee_id = s.cell(line, 1)
# 				user.email = email unless email.nil?
# 				user.first_name = s.cell(line, 8)
# 				user.gender = s.cell(line, 9)
# 				user.employee_guid = s.cell(line, 10)
# 				user.hire_date = s.cell(line, 11)
# 				user.last_name = s.cell(line, 12)
# 				full_name = s.cell(line, 8)
# 				full_name = full_name + " " + s.cell(line, 12) unless s.cell(line, 12).nil?
# 				user.name = full_name
# 				user.middle_name = s.cell(line, 14)
# 				user.preferred_name = s.cell(line, 15)
# 				user.business_partner_id = s.cell(line, 22)
# 				user.manager_id = find_manager(s.cell(line, 23))
# 				user.created_on = s.cell(line, 27)
# 				user.primary_user_account_id = s.cell(line, 28)
# 				user.status = "ACTIVE"
# 				user.grade = s.cell(line, 30)
# 				user.functional_manager_id = s.cell(line, 32)
# 				user.employee_external_id = s.cell(line, 38)
# 				user.is_manager = s.cell(line, 39)
# 				user.user_account_id = s.cell(line, 41)
# 				user.distinguished_name = s.cell(line, 43)
# 				user.manager_user_account_id = s.cell(line, 55)
# 				user.ad_user_id = s.cell(line, 56).downcase unless s.cell(line, 56).nil?
# 				user.preferred_name_normalized = s.cell(line, 57)
# 				user.global_employee_id = s.cell(line, 60)
# 				user.title = s.cell(line, 62)
# 				company = find_company(s.cell(line, 3))
# 				profit_center = find_profit_center(s.cell(line, 4), company)
# 				country = find_country(s.cell(line, 63))
# 				division = find_division(s.cell(line, 6))
# 				function = find_function(s.cell(line, 35))
# 				office = find_office(s.cell(line, 13))
# 				segment = find_segment(s.cell(line, 16))
# 				department = find_department(s.cell(line, 5))
# 				user.company = company unless company.nil?
# 				user.profit_center = profit_center unless profit_center.nil?
# 				user.country = country unless country.nil?
# 				user.division = division unless division.nil?
# 				user.function = function unless function.nil?
# 				user.office = office unless office.nil?
# 				user.segment = segment unless segment.nil?
# 				user.department = department unless department.nil?
# 			end
# 		end
# 		user.save unless user.nil?
# 		puts i
# 	end
# end

# i = 0
# s = SimpleSpreadsheet::Workbook.read("Users.xlsx")
# s.selected_sheet = s.sheets.first
# s.first_row.upto(s.last_row) do |line|
# 	if s.cell(line, 1).is_number?
# 		i+=1

# 		unless s.cell(line, 1).nil?
# 			user = User.where(employee_id: s.cell(line, 1)).first if user.nil?
# 		end

# 		# if user.nil?
# 		# 	user = User.where(email_address: email).first unless email.nil? || email == "noemail@bunge.com"
# 		# end
# 		unless s.cell(line, 56).nil?
# 			ad_user = s.cell(line, 56).downcase
# 			user = User.where(ad_user_id: ad_user).first if user.nil?
# 		end

# 		unless user.nil?
# 			user.employee_id = s.cell(line, 1)
# 			user.manager_id = find_manager(s.cell(line, 23))
# 			user.save
# 			puts i
# 		end
# 	end
# end

# i = 0
# User.all.each do |user|
# 	i+=1
# 	@manager = find_manager(user.manager_id)
# # 	unless @manager.nil?
# # 		user.manager_id = @manager.id
# # 		user.save
# # 	end
# # 	puts i
# # end

# i = 0
# s = SimpleSpreadsheet::Workbook.read("users.csv")
# s.selected_sheet = s.sheets.first
# # user_ids = User.all.pluck(:id)
# s.first_row.upto(s.last_row) do |line|
# 	if s.cell(line, 1).is_number?
# 		i+=1
# 		user = User.new
# 		user.id = s.cell(line, 1)
# 		user.email = s.cell(line, 2)
# 		user.user_seq_id = s.cell(line, 3)
# 		user.first_name = s.cell(line, 4)
# 		user.middle_name = s.cell(line, 5)
# 		user.last_name = s.cell(line, 6)
# 		user.name = s.cell(line, 7)
# 		user.training_requirement = s.cell(line, 8)
# 		user.status = s.cell(line, 9)
# 		user.phone = s.cell(line, 10)
# 		user.phonebook_name = s.cell(line, 11)
# 		user.pab_user = s.cell(line, 12)
# 		user.title = s.cell(line, 13)
# 		# user.operating_company_id = s.cell(line, 14)
# 		user.segment_id = s.cell(line, 15)
# 		user.business_unit_id = s.cell(line, 16)
# 		user.trading_access = s.cell(line, 17)
# 		user.windows_username = s.cell(line, 18)
# 		# user.created_at = s.cell(line, 19)
# 		# user.updated_at = s.cell(line, 20)
# 		user.ad_user_id = s.cell(line, 21)
# 		user.office_id = s.cell(line, 22)
# 		user.function_id = s.cell(line, 23)
# 		user.employee_id = s.cell(line, 24)
# 		user.business_partner_id = s.cell(line, 25)
# 		user.company_id = s.cell(line, 26)
# 		user.profit_center_id = s.cell(line, 27)
# 		# user.country_id = s.cell(line, 28)
# 		# user.created_on = s.cell(line, 29)
# 		user.department_id = s.cell(line, 30)
# 		user.distinguished_name = s.cell(line, 31)
# 		user.division_id = s.cell(line, 32)
# 		user.manager_id = s.cell(line, 33)
# 		user.employee_external_id = s.cell(line, 34)
# 		user.employee_guid = s.cell(line, 35)
# 		user.employee_source_id = s.cell(line, 36)
# 		user.functional_manager_id = s.cell(line, 37)
# 		user.gender = s.cell(line, 38)
# 		user.global_employee_id = s.cell(line, 39)
# 		user.grade = s.cell(line, 40)
# 		user.hire_date = s.cell(line, 41)
# 		user.is_manager = s.cell(line, 42)
# 		user.manager_user_account_id = s.cell(line, 43)
# 		user.preferred_name = s.cell(line, 44)
# 		user.preferred_name_normalized = s.cell(line, 45)
# 		user.primary_user_account_id = s.cell(line, 46)
# 		user.updated_on = s.cell(line, 47)
# 		user.user_account_id = s.cell(line, 48)
# 		# user.last_training_id = s.cell(line, 49)
# 		# user.last_training_type = s.cell(line, 50)
# 		# user.last_training_location = s.cell(line, 51)
# 		user.office_name = s.cell(line, 52)
# 		# user.last_training_date = s.cell(line, 53)
# 		user.manager_name = s.cell(line, 54)

# 		user.save
# 		puts i
# 	end
# end
# # i = 0
# User.where('manager_name IS NULL').where('manager_id IS NOT NULL').each do |user|
# 	i+=1
# 	user.manager_name = User.where(id: user.manager_id).first.name unless User.where(id: user.manager_id).first.nil?
# 	user.save
# 	puts i
# end

# i = 0
# User.where('office_name IS NULL').where('office_id IS NOT NULL').each do |user|
# 	i+=1
# 	user.office_name = Office.where(id: user.office_id).first.name unless Office.where(id: user.office_id).first.nil?
# 	user.save
# 	puts i
# end

# User.all.each do |app_user|
# 	puts app_user.email
# 	puts app_user.user_id
# end

# i = 0
# s = SimpleSpreadsheet::Workbook.read("parent_companies.csv")
# s.selected_sheet = s.sheets.first
# s.first_row.upto(s.last_row) do |line|
# 	i+=1
# 	if i > 1
# 	user = Company.find(s.cell(line, 2))
# 		unless s.cell(line, 1).nil?
# 			parent = Company.find(s.cell(line, 1))
# 			parent.add_child(user)
# 		end
# 	end
# 	puts i
# end



# i = 0
# s = SimpleSpreadsheet::Workbook.read("managers.csv")
# s.selected_sheet = s.sheets.first
# s.first_row.upto(s.last_row) do |line|
# 	i+=1
# 		users <<
# 		users[s.cell(line, 1).to_sym] = s.cell(line, 2)
# 		# if user.parent_id.nil?
# 			unless s.cell(line, 2).nil?
# 				parents = User.find(s.cell(line, 2))
# 				parent.add_child(user)
# 			end
# 		# end
# 	puts i
# end

# user_ids = []
# parent_ids = []
# users = Hash.new
# i = 0
# s = SimpleSpreadsheet::Workbook.read("managers.csv")
# s.selected_sheet = s.sheets.first
# s.first_row.upto(s.last_row) do |line|
# 	i+=1
# 		user_ids << s.cell(line, 1)
# 		parent_ids << s.cell(line, 2)
# 		users[s.cell(line, 1).to_sym] = s.cell(line, 2)
# 	puts i
# end
# i = 0
# @users = User.where(:id => user_ids).where("parent_id IS NOT NULL").each do |user|
# 	i+=1
# 	parent_id = users[user.id.to_s.to_sym]
# 	user.update_attributes(parent_id: parent_id)
# 	puts i
# end

# Company.all.each do |root_company|
# 	if root_company.root?
# 		File.open("companies.dot", "a") do |f|
# 		  f.write(root_company.to_dot_digraph)
# 		end
# 	end
# end

# User.all.each do |root_user|
# 	if root_user.root?
# 		File.open("users.dot", "a") do |f|
# 		  f.write(root_user.to_dot_digraph)
# 		end
# 	end
# end
# Company.roots.each do |root_company|
# 	File.open("companies.dot", "a") { |f| f.write(root_company.to_dot_digraph) }
# end
# File.open("legal.dot", "w") { |f| f.write(User.find(3362).to_dot_digraph) }

# i = 0
# s = SimpleSpreadsheet::Workbook.read("bltd.csv")
# s.selected_sheet = s.sheets.first
# s.first_row.upto(s.last_row) do |line|
# 	i+=1
# 	if i == 2
# 		company = Company.new
# 		company.id = 1
# 		company.name = s.cell(line, 1)
# 		company.company_number = s.cell(line, 2)
# 		company.method_of_combination = s.cell(line, 3)
# 		company.reported_as = s.cell(line, 4)
# 		company.functional_currency = s.cell(line, 4)
# 		company.hfm_entity_code = s.cell(line, 5)
# 		company.hfm_tax_entity = s.cell(line, 6)
# 		company.hfm_hv_code = s.cell(line, 7)
# 		company.save!
# 	end
# end


# ids = [ 2,
# 		3,
# 		4,
# 		5,
# 		6,
# 		7,
# 		8,
# 		74,
# 		87,
# 		92,
# 		93,
# 		141,
# 		175,
# 		176,
# 		218,
# 		242,
# 		306,
# 		478,
# 		479,
# 		480,
# 		481,
# 		482,
# 		483,
# 		484,
# 		485,
# 		486,
# 		487,
# 		488,
# 		489,
# 		490,
# 		491,
# 		492,
# 		493,
# 		494]

# subs = Company.find(ids)
# subs.each do |subsid|
#   puts subsid.name
#   subsid.update_attributes(parent_id: 1)
#   Company.find(1).add_child(subsid)
# end
# Company.all.each do |company|
# 	company_name = company.name.gsub("/", "")
# 	File.open("companies/#{company_name}.dot", "w") { |f| f.write(company.to_dot_digraph) }
# 	shellcommand = "dot -Tsvg #{company_name}.dot > #{company_name}.svg\n"
# 	File.open("companies/shell.txt", "a") { |f| f.write(shellcommand) }
# end

# Dir.glob('companies/*.dot') do |file|
#   shellcommand = "dot -Tsvg #{file} > #{file.gsub("dot", "")}.svg\n"
#   exec( shellcommand )
# end

# s = SimpleSpreadsheet::Workbook.read("users.xlsx")
# s.selected_sheet = s.sheets.first
# employee_params = Hash.new
# s.first_row.upto(s.last_row) do |line|
# 	if line > 1
# 		s.first_column.upto(s.last_column) do |column|
# 			employee_params[s.cell(1, column).to_sym] = s.cell(line, column)
# 		end
# 		employee = EmployeeProfile.create(employee_params)
# 		unless employee_params[:email].nil? || employee_params[:email] == 'noemail@bunge.com'
# 			user = User.new
# 			user.email = employee_params[:email]
# 			user.old_id = employee_params[:old_user_id]
# 			user.save
# 			employee.user = user
# 			employee.save
# 		end

# 	end
# 	puts "#{line} of #{s.last_row}"
# end

# i = 0
# ac = EmployeeProfile.all.count
# EmployeeProfile.all.each do |employee|
# 	unless employee[:email].nil? || employee[:email] == 'noemail@bunge.com'
# 		user = User.create(password: employee[:email],
# 						   password_confirmation: employee[:email],
# 						   email: employee[:email])
# 		employee.update_attributes(user: user)
# 	end
# 	i += 1
# 	puts "#{i} of #{ac}"
# end

# s = SimpleSpreadsheet::Workbook.read("employee_sample.xlsx")
# s.selected_sheet = s.sheets.first
# employee_params = Hash.new
# s.first_row.upto(s.last_row) do |line|
# 	if line > 1

# 		s.first_column.upto(s.last_column) do |column|
# 			employee_params[s.cell(1, column).downcase.to_sym] = s.cell(line, column)
# 		end
# 		# employee_where = EmployeeProfile.where(first_name: employee_params[:first_name],
# 		# 									   middle_name: employee_params[:middle_name],
# 		# 									   last_name: employee_params[:last_name])

# 		# unless employee_params[:employee_id].nil?
# 		# 	employee_where = employee_where.or(EmployeeProfile.where(employee_id: employee_params[:employee_id]))
# 		# end

# 		# unless employee_params[:username].nil?
# 		# 	employee_where.or(EmployeeProfile.where(username: employee_params[:username]))
# 		# end

# 		# unless employee_params[:email].nil? || employee_params[:email] == 'noemail@bunge.com'
# 		# 	employee_where = employee_where.or(EmployeeProfile.where(email: employee_params[:email]))
# 		# end

# 		# unless employee_params[:old_user_id].nil?
# 		# 	employee_where = employee_where.or(EmployeeProfile.where(old_user_id: employee_params[:old_user_id]))
# 		# end

# 		# employee = employee_where.first_or_initialize
# 		employee = EmployeeProfile.create(employee_params)
# 		employee_id = employee.id
# 		# if employee.user_id.nil?
# 			user = User.create(password: employee[:email],
#  						       password_confirmation: employee[:email],
#  						       old_id: employee[:old_user_id],
#  						       email: employee[:email])
# 			employee_params[:user_id] = user.id
# 			employee.update_attributes(employee_params)
# 			profile = Profile.create(profilable: user, name: user.employee_name, title: employee[:title])
# 			puts "New user: #{employee_params[:email]}"
# 			CSV.open("user_changes.csv", "ab") do |csv|
# 				csv << ["New", user.id, employee.id, employee_params[:email]]
# 			end
# 		# else
# 		# 	user = User.find(employee.user_id)
# 		# 	if user.email != employee_params[:email] || user.old_id != employee_params[:old_user_id]
# 		# 		old_email = user.email
# 		# 		user = user.update_attributes(email: employee_params[:email],
# 		# 									  old_id: employee_params[:old_user_id])
# 		# 		puts "Updated user: #{employee_params[:email]}"
# 		# 		CSV.open("user_changes.csv", "ab") do |csv|
# 		# 			csv << ["Update", employee[:user_id], employee_id, employee_params[:email], old_email]
# 		# 		end
# 		# 	end
# 		# end
# 	end
# 	puts "#{line} of #{s.last_row}"
# end

# models = ["location", "office", "function", "division", "company", "profit_center", "department", "business_unit"]
# models.each do |model|
# 	s = SimpleSpreadsheet::Workbook.read("data/#{model.pluralize}.csv")
# 	s.selected_sheet = s.sheets.first
# 	attribute_params = Hash.new
# 	s.first_row.upto(s.last_row) do |line|
# 		if line > 1
# 			s.first_column.upto(s.last_column) do |column|
# 				unless s.cell(1, column).nil?
# 				  attribute_params[s.cell(1, column).downcase.to_sym] = s.cell(line, column)
# 				end
# 			end
# 			new_model = model.classify.constantize.where(id: attribute_params[:id]).first_or_initialize
# 			new_model.update_attributes(attribute_params)
# 		end
# 		puts "#{model} #{line} of #{s.last_row}"
# 	end
# end

# x = User.all.count
# i = 0
# User.all.each do |user|
# 	i+=1
# 	models = ["office", "function", "division", "profit_center", "department", "business_unit"]
#     models.each do |relationship|
#     	relationship_name = relationship
#     	relationship_name = "location" if relationship == "office"
#     	relationship_name = "cost_center" if relationship == "profit_center"
#     	r = relationship.classify.constantize.where(name: user.employee_profile[relationship_name)).first_or_initialize
#     	user["#{relationship}_id".to_sym] = r.id
#     	user.save
#     	puts "updated #{relationship} for user #{i} of #{x}"
#     end
# end


# groups = ["office", "function", "division", "profit_center", "department", "business_unit", "operating_company"]
# groups.each do |model|
#     model_class = model.classify.constantize
#     x = model_class.all.count
#     i = 0
#     model_class.all.each do |m|
#         i+=1
#         profile = m.profile.nil? ? Profile.create(name: m.name, profilable: m) : m.profile.update_attributes(name: m.name)
# 	    puts "updated profile for #{model} #{i} of #{x}"
# 	end
# end


# User.all.each do |user|
#     user.update_attributes(name: user.profile.name, title: user.profile.title)
#     puts user.id
# end

# Training.all.each do |user|
#     user.update_attributes(name: user.profile.name, title: user.profile.title)
# end


# s = SimpleSpreadsheet::Workbook.read("data/segments_departments.xlsx")
# s.sheets.each do |sheet|
#     s.selected_sheet = sheet
#     s.first_row.upto(s.last_row) do |line|
#     	if line > 1
#     	    m1 = s.cell(1, 1).downcase.classify.constantize
#     	    m2 = s.cell(1, 2).downcase.classify.constantize
#     	    m3 = s.cell(1, 3).downcase.classify.constantize
#     	    c1 = m1.where(name: s.cell(line, 1)).first_or_initialize
#     	    c1.update_attributes(name: s.cell(line, 1))
#     	    p1 = c1.profile.nil? ? Profile.create(name: c1.name, profilable: c1) : c1.profile
#     	    c2 = m2.where(name: s.cell(line, 2)).first_or_initialize
#     	    c2.update_attributes(name: s.cell(line, 2))
#     	    p2 = c2.profile.nil? ? Profile.create(name: c2.name, profilable: c2) : c2.profile
#     	    c3 = m3.where(name: s.cell(line, 3)).first_or_initialize
#     	    c3.update_attributes(name: s.cell(line, 3))
#     	    c3["#{s.cell(1, 1).underscore.downcase}_id".to_sym] = c1.id
#     	    c3["#{s.cell(1, 2).underscore.downcase}_id".to_sym] = c2.id
#     	    c3.save
#     	    p3 = c3.profile.nil? ? Profile.create(name: c3.name, profilable: c3) : c3.profile
#     	end
#     	puts line
#     end
# end

def time_rand from = 0.0, to = Time.now
    Time.at(from + rand * (to.to_f - from.to_f))
end

Task.destroy_all
@matter = Matter.last
i = 0
until i > 30 do
  i+=1
  start = time_rand Time.local(2017, 7, 2)
  due = time_rand start, Time.local(2018, 12, 31)
  @title = BetterLorem.w                  # -> Generate and return 20 words
  @description = BetterLorem.p(10, true, true ) # -> Generate and return 10 paragraphs, in plain text (no HTML tags), excluding the trailing period.
  @name = BetterLorem.c(100)
  @task = Task.create(taskable: @matter, start_date: start,
                      due_date: due, status_id: 1 + rand(5),
                      priority_id: 1 + rand(3), name: @name,
                      title: @title, description: @description)
  @profile = Profile.create(profilable: @task, name: @name,
                      title: @title, description: @description )
end

