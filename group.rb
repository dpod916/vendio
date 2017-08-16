load '~/workspace/config/environment.rb'
Rails.application.eager_load!

@user = User.where(email: 'daniel.podvesker@bunge.com').first
activities = @user.get_activities
@activities = activities.group_by {|t| t.created_at.to_date }
@activities.each do |date, a|
    puts "#{date}"
    key_group = a.group_by {|t| t.key }
    key_group.each do |kg, ka|
        puts "#{ka.count} #{kg}"
    end
end