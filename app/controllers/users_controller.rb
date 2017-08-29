class UsersController < ApplicationController
   # Checks if the person browsing site is logged in. If they aren't, they can
   # not view any profiles or do any profile related actions
   before_action :authenticate_user!
   
   # GET to /users/:id     Show action when you want to show an individual resource
   def show
      # Find in the database the user with the id number that matches the URL
      @user = User.find( params[:id] )
   end   
   
end    