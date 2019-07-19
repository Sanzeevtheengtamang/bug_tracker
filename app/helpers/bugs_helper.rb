module BugsHelper
    def assign_me(bug)
        lin = ""
        if current_user.id == bug.user_id
            lin += link_to "Edit",edit_project_bug_path(bug.project_id,bug)
        else  
            lin += link_to "Edit", disabled: true
        end 
        lin.html_safe
    end

end
