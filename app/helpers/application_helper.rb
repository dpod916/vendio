module ApplicationHelper

	def is_active_controller(*controller)
    	controller.include?(params[:controller])
    end

    def convert_underscore(item)
        item.split('_').collect(&:capitalize).join(' ')
    end


    def activity_icon(activity)
        icon = "fa-cloud-upload" if activity.trackable_type == 'Attachment'
        icon = "fa-id-card" if activity.trackable_type == 'Profile'
        icon = "fa-image" if activity.avatar_updated?
        return icon
    end

    def status_button_color(accepted)
        button_color = "btn-primary" if accepted
        button_color = "btn-danger" unless accepted
        button_color = "btn-warning" if accepted.nil?
        button_color
    end

    def role_button_color(role)
        button_color = "success" if ['Owner', 'Admin'].include?(role)
        button_color = "primary" if ['Participant'].include?(role)
        button_color = "info" if ['Contact'].include?(role)
        button_color = "warning" if ['Reviewer'].include?(role)
        button_color
    end

    def button_style(direction)
        button_style = ""
        if is_active_controller('user')
            button_style = "btn-outline " if direction == 'user.to.item'
        else
            button_style = "btn-outline " if direction == 'item.to.user'
        end
        button_style
    end

    def drop_down(admin)
        admin ? "dropdown-toggle" : ""
    end

    def dropdown(admin)
        admin ? "dropdown" : ""
    end

    def user_assignment_button(assignment, admin)
        "#{button_style(assignment.direction)}#{role_button_color(assignment.role)} #{drop_down(admin)}"
    end

    def follow_button_color(user)
      color = "primary" unless current_user.following?(user)
      color = "danger" if current_user.following?(user)
    end

    def follow_button(user)
        "#{follow_button_color(user)}"
    end

    def user_assignment_icon(role)
       icon = "fa-user-secret" if role == 'Admin'
       icon = "fa-user-circle-o" if role == 'Owner'
       icon = "fa-users" if role == 'Participant'
       icon = "fa-address-card" if role == 'Contact'
       icon = "fa-check-square-o" if role == 'Reviewer'
       icon
    end

    def is_active_action(action_name)
        params[:action] == action_name ? "active" : nil
    end

    def display_class_name(item)
        return item.class.name.pluralize.underscore.split('_').collect{|c| c.capitalize}.join(' ')
    end

    def class_name(item)
       item.class.name.pluralize.underscore
    end

    def li_class(i)
      i == 1 ? "active" : ""
    end

    def uscore(tab)
      tab.downcase.gsub(' ', "_" )
    end

    def url_helper(item)
        "/#{class_name(item)}/#{item.id}"
    end

    def attachment_url(attachment)
        "/uploads/attachments/#{attachment.id}/#{attachment.file_file_name}"
    end

    def recipient_controller(recipient)
        recipient.nil? ? false : params[:controller].downcase.include?(recipient)
    end

    def avatar_url(profile)
        url = "http://jennstrends.com/wp-content/uploads/2013/10/bad-profile-pic-2.jpeg"
        unless profile.nil?
            url = "/uploads/profiles/#{profile.id}/#{profile.avatar_file_name}" unless profile.avatar_file_name.nil?
        end
        return url
    end


    def indefinite_articlerize(params_word)
        %w(a e i o u).include?(params_word[0].downcase) ? "an #{params_word}" : "a #{params_word}"
    end


    def status_label(status)
    	status_label = nil
    	status_label = "success" if status == 1
     	status_label = "primary" if status == 2
        status_label = "warning" if status == 3
        status_label = "danger" if status == 4
        status_label = "danger" if status == 5
        status_label
    end

    def user_status_label(status)
        status_label = nil
        status_label = "success" if status == "ACTIVE"
        status_label = "danger" if status == "INACTIVE"
        status_label
    end

    def priority_class(priority)
    	priority_class = nil
        priority_class = "danger" if priority == 1
    	priority_class = "warning" if priority == 2
	    priority_class = "primary" if priority == 3
	    priority_class
	end

	def attachment_icon(attachment)
		attachment_icon = nil
		attachment_icon = "fa-file-pdf-o" if attachment.file_content_type == 'application/pdf'
		attachment_icon = "fa-file-excel-o" if attachment.file_content_type == 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
		attachment_icon = "fa-file-word-o" if attachment.file_content_type == "application/msword"
 		attachment_icon = "fa-file-word-o" if attachment.file_content_type == "application/vnd.openxmlformats-officedocument.wordprocessingml.document"
		attachment_icon = "fa-file-powerpoint-o" if attachment.file_content_type == "application/vnd.openxmlformats-officedocument.presentationml.presentation"
		attachment_icon = "fa-image" if attachment.file_content_type == "image/png"
		attachment_icon = "fa-image" if attachment.file_content_type == "image/jpeg"
		attachment_icon
	end

	def formatted_time(time)
		time.in_time_zone("Eastern Time (US & Canada)").strftime("%D at %I:%M%p")
	end


end
