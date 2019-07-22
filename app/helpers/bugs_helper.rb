module BugsHelper
    def assign_me(bug,f)
        lin = ""
        if current_user.id == bug.user_id
            lin += link_to "Edit",edit_project_bug_path(bug.project_id,bug)
            lin += "<td>"
            lin += check_box_tag "#{f.object_name}[ids][]", bug.id 
            lin += "</td>"
        else  
            lin += link_to "Edit", disabled: true
            lin += "<td>"
            lin += "</td>"
        end 
        lin.html_safe
    end

    def already_assign(bug)
        lin = ""
        if bug.user_id.present?
            # flash.now[:alert] = 'Error while assigning bug is Already assigned!'
            lin += link_to "#{bug.user.email}", disabled: true
        else
           lin += link_to "Assign ME!", project_assign_bug_path(bug.project_id,bug), :method => :put
        end
        lin.html_safe
    end



end
