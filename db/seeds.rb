# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }].sample)
#   Character.create(name: 'Luke', movie: movies.first)
app_users = [1, 2, 3, 4, 5]
[Matter, Task, Assignment, Contact, ResponsibleEmployee, Comment, Issue, CommentHierarchy].each(&:delete_all)
current_user = User.find(1)
matter_types = [Negotiation,
                    Extension,
                    AgreementAssignment,
                    WorkOrder,
                    OtherAmendment,
                    AdvicePayment,
                    Case,
                    CourtAction,
                    OtherDispute,
                    Mediation,
                    Audit,
                    Review,
                    ComplianceBusiness,
                    ComplianceProject,
                    LegalProject,
                    LegalBusiness,
                    RegulatoryInvestigation,
                    RegulatoryAnalysis,
                    RegulatoryInquiry,
                    Investigation,
                    RegulatoryAction,
                    Agreement]

    Matter.populate 100 do |matter|
      matter.title = Populator.words(1..5).titleize
      matter.description = Populator.sentences(5..20)
      matter.created_at = 2.years.ago..Time.now
      matter.status_id = rand(1..5)
      matter.priority_id = rand(1..3)
      matter.user_id = app_users.sample
      matter.start_date = 2.years.ago..Time.now
      matter.type = matter_types.sample.to_s
      rint = rand(10..10000)
      enddate = matter.start_date + rint.days
      matter.due_date = enddate
      Assignment.populate 1..3 do |assignment|
            assignment.user_id = app_users.sample
            assignment.assignable_id = matter.id
            assignment.assignable_type = 'Matter'
            assignment.created_at = matter.start_date..matter.start_date + 100.days
      end
      Contact.populate 1..3 do |contact|
        contact.contactable_id = 1..23000
        contact.created_at = matter.start_date
        contact.owner_id = matter.id 
        contact.owner_type = 'Matter'
      end
      Comment.populate 1..3 do |comment|
          comment.user_id = app_users.sample
          comment.body = Populator.sentences(1..5)
          comment.created_at = matter.start_date..matter.start_date + 100.days
          comment.commentable_id = matter.id
          comment.commentable_type = 'Matter'
      end
      Task.populate 1..4 do |task|
        task.title = Populator.words(1..5).titleize
        task.description = Populator.sentences(5..20)
        task.status_id = rand(1..5)
        task.priority_id = rand(1..3)
        task.created_at = matter.start_date
        task.due_date = matter.due_date
        task.start_date = matter.start_date
        task.user_id = app_users.sample
        task.taskable_id = matter.id
        task.taskable_type = matter.type
        Assignment.populate 1..3 do |assignment|
          assignment.user_id = app_users.sample
          assignment.assignable_id = task.id
          assignment.assignable_type = 'Task'
          assignment.created_at = matter.start_date..matter.start_date + 100.days
        end
        Contact.populate 1..3 do |contact|
	        contact.contactable_id = rand(1..23000)
	        contact.created_at = matter.start_date
	        contact.owner_id = task.id 
	        contact.owner_type = 'Task'
        end
        Comment.populate 1..3 do |comment|
          comment.user_id = app_users.sample
          comment.body = Populator.sentences(1..5)
          comment.created_at = matter.start_date..matter.start_date + 100.days
          comment.commentable_id = task.id
          comment.commentable_type = 'Task'
        end
      end
        Issue.populate 1..3 do |issue|
          issue.title = Populator.words(1..5).titleize
          issue.description = Populator.sentences(5..20)
          issue.created_at = matter.start_date
          issue.due_date = matter.due_date
          issue.start_date = matter.start_date
          issue.user_id = app_users.sample
          issue.issuable_type = matter.type
          issue.issuable_id = matter.id
          issue.status_id = rand(1..5)
          issue.priority_id = rand(1..3)
          Assignment.populate 1..3 do |assignment|
            assignment.user_id = app_users.sample
            assignment.assignable_id = issue.id
            assignment.assignable_type = 'Issue'
            assignment.created_at = matter.start_date..matter.start_date + 100.days
          end
          Comment.populate 1..3 do |comment|
            comment.user_id = app_users.sample
            comment.body = Populator.sentences(1..5)
            comment.created_at = matter.start_date..matter.start_date + 100.days
            comment.commentable_id = issue.id
            comment.commentable_type = 'Issue'
          end
          Contact.populate 1..3 do |contact|
            contact.contactable_id = rand(1..23000)
            contact.created_at = matter.start_date
            contact.owner_id = issue.id 
            contact.owner_type = 'Issue'
          end
          ResponsibleEmployee.populate 1..3 do |respondible|
            respondible.responsible_id = rand(1..23000)
            respondible.created_at = matter.start_date
            respondible.owner_id = issue.id 
            respondible.owner_type = 'Issue'
          end
          Task.populate 1..3 do |task|
            task.title = Populator.words(1..5).titleize
            task.description = Populator.sentences(5..20)
            task.status_id = rand(1..5)
            task.priority_id = rand(1..3)
            task.created_at = issue.start_date
            task.due_date = issue.due_date
            task.start_date = issue.start_date
            task.user_id = app_users.sample
            task.taskable_id = matter.id
            task.taskable_type = 'Issue'
          end
        end
    end

    Matter.all do |matter|
    	matter.create_activity :create, owner: current_user
    end

    Comment.all do |comment|
    	comment.create_activity :create, owner: current_user
    end

    Task.all do |task|
    	task.create_activity :create, owner: current_user
    end

# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }].sample)
# #   Character.create(name: 'Luke', movie: movies.first)

# i = 0
# path = Rails.root.join('Scripts').to_s 
# path = path + '/'
# file = path + "rss_feeds.csv"
# s = SimpleSpreadsheet::Workbook.read(file)
# s.selected_sheet = s.sheets.first
# s.first_row.upto(s.last_row) do |line|
#   i+=1
#   if i > 1 
#     feed = RssFeed.where(url: s.cell(line, 3)).first_or_initialize
#     feed.update_attributes(url: s.cell(line, 3), subscribable_id: s.cell(line, 8), subscribable_type: s.cell(line, 7))
#   end
# end








