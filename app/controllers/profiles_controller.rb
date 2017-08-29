class ProfilesController < ApplicationController
   
   # GET to /users/:user_id/profile/new
   def new
      # Render blank profile details form. Create a new profile object to be used in form.html.erb
      @profile = Profile.new
   end
   
   # POST to /users/:user_id/profile
   def create
      # Grab user_id from URL. Ensure that we have the user that is filling out the form
      @user = User.find( params[:user_id] )
      # Build a profile in the machines memory using the whitelisted profile fields
      # Create profile linked to this specific user
      @profile = @user.build_profile( profile_params )
      
      if @profile.save
         flash[:success] = "Profile updated!"
         redirect_to root_path
      else
         render action: :new
      end
   end   
   
   private
      def profile_params
         params.require(:profile).permit(:first_name, :last_name, :job_title, :phone_number, :contact_email, :description)
      end   
end