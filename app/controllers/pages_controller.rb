class PagesController < ApplicationController
  # GET request for / home page
  def home
    # .find will find the column where the ID equals the number inputted
    # Plan.find(1).id will output 1   Plan.find(1).name will output basic
    @basic_plan = Plan.find(1)
    @pro_plan = Plan.find(2)
  end
  
  def about
  end
end