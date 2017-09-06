class UsersController < ApplicationController
   # Checks if the person browsing site is logged in. If they aren't, they can
   # not view any profiles or do any profile related actions
   before_action :authenticate_user!
   
   def index
      # Combines user and profile table into one query for faster load times
      # @users = User.includes(:profile)
      @users = User.paginate(:page => params[:page], :per_page => 5)
   end 
   
   # GET to /users/:id     Show action when you want to show an individual resource
   def show
      # Find in the database the user with the id number that matches the URL
      @user = User.find( params[:id] )
   end
   
     
   
end    