module HomeHelper
    def dashboard_menu_options
        
        links = ""
        links += link_to "Sign Out", destroy_user_session_path, :method => :delete
        links += "<br>"
        if current_user.admin?
            links += link_to "Invite Users!", new_user_invitation_path 
            links += link_to "Users", user_index_path
            links += "<br>"
        end 
        links += link_to "Projects", projects_path	
        links.html_safe
    end

end
