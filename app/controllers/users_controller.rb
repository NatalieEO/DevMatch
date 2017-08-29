class UsersController < ApplicationController
   
   # GET to /users/:id     Show action when you want to show an individual resource
   def show
      # Find in the database the user with the id number that matches the URL
      @user = User.find( params[:id] )
   end   
   
end    