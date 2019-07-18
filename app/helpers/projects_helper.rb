module ProjectsHelper
    def assigned_user_email
      a = ""
      @projects.users.map do |i|
        a += i.email + "<br>"
      end
      a.html_safe
    end

    def admin_user(project)
      a = ""
      if current_user.admin
        a += link_to "Edit", edit_project_path(project)
        a += " "
        a += link_to "Delete", delete_project_path(project)
      end
      a.html_safe
    end

    def admin_header
      a =""
      if current_user.admin
        a = link_to "Add New Section" ,new_project_path
      end
      a.html_safe
    end
end

