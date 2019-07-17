module ProjectsHelper
    def assigned_user_email
      a = ""
      @projects.users.map do |i|
        a += i.email + "<br>"
      end
      a.html_safe
    end
end
