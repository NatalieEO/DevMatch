class ProfilesController < ApplicationController
   
   # GET to /users/:user_id/profile/new
   def new
      # Render blank profile details form. Create a new profile object to be used in form.html.erb
      @profile = Profile.new
   end
   
   # POST to /users/:user_id/profile
   def create
      # Grab user_id from params Ensure that we have the user that is filling out the form
      @user = User.find( params[:user_id] )
      # Build a profile in the machines memory using the whitelisted profile fields
      # Create profile linked to this specific user. Build function provided by rails
      # with this kind of association. Kind of like .new, but prefills foreign key.       images.build plural/has many relationship
      @profile = @user.build_profile( profile_params )
      
      if @profile.save
         flash[:success] = "Profile updated!"
         # Redirects to user profile once they submit their information.
         # Needs to inject the user id into the URL path.
         redirect_to user_path(id: params[:user_id])
      else
         render action: :new
      end
   end   
   
   # GET to /users/:user_id/profile/edit
   def edit
      # @profile sent to _form.html.erb will already be filled out. Form on that page will be for
      # a user that is already filled out
      @user = User.find( params[:user_id] )
      @profile = @user.profile 
   end
   
   # PUT to /users/:user_id/profile. Rails knows that the user came to form from the edit action
   # vs the new action. Injects hidden form into edit profile form with value of patch.
   def update
      # Retrieve the user from the database
      @user = User.find( params[:user_id] )
      # Retrieve user's profile
      @profile = @user.profile
      # Mass assign edited profile attributes and save (update)
      if @profile.update_attributes(profile_params)
         flash[:success] = "Profile updated!"
         # Redirect user to their profile page
         redirect_to user_path(id: params[:user_id] )
      # reload the edit action so user can try to edit page again
      else
         render action: :edit
      end
   end   
   
   private
      def profile_params
         params.require(:profile).permit(:first_name, :last_name, :job_title, :avatar, :phone_number, :contact_email, :description)
      end   
end