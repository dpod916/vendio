# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 24.hours do
# 	user_ids = []
# 	parent_ids = []
# 	users = Hash.new
# 	i = 0 
# 	s = SimpleSpreadsheet::Workbook.read("managers.csv")
# 	s.selected_sheet = s.sheets.first
# 	s.first_row.upto(s.last_row) do |line|
# 		i+=1
# 			user_ids << s.cell(line, 1)
# 			parent_ids << s.cell(line, 2)
# 			users[s.cell(line, 1).to_sym] = s.cell(line, 2)
# 		puts i
# 	end
# 	i = 0 
# 	@users = User.where(:id => user_ids).each do |user|
# 		i+=1
# 		parent_id = users[user.id.to_s.to_sym]
# 		user.update_attributes(parent_id: parent_id)
# 		puts i 
# 	end
# end

every 24.hours do
  # command "/usr/bin/some_great_command"
  # runner "MyModel.some_method"
  rake "sync:rss_feeds"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

