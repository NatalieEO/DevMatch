class ProfilesController < ApplicationController
   
   # GET to /users/:user_id/profile/new
   def new
      # Render blank profile details form. @profile needs to be instantiated to use in _form.html.erb
      @profile = Profile.new
   end   
end