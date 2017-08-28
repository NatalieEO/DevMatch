class Plan < ActiveRecord::Base
   # association between plan and users
   has_many :users
end
