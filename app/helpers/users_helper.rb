module UsersHelper
   def job_title_icon
      # Check for the user's job title and inject html safely into show.html.erb
      # that will appropriate font awesome icon
      if @user.profile.job_title == "Developer"
         "<i class='fa fa-code'></i>".html_safe
      elsif @user.profile.job_title == "Entrepreneur"
         "<i class='fa fa-lightbulb-o'></i>".html_safe
      elsif @user.profile.job_title == "Investor"
         "<i class='fa fa-dollar'></i>".html_safe
      end   
   end   
end