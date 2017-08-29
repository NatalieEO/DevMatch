class UsersController < ApplicationController
   
   # GET to /users/:id     Show action when you want to show an individual resource
   def show
      @user = User.find( params[:id] )
   end   
   
end    