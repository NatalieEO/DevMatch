class ContactsController < ApplicationController
   #Every time someone pulls up the form, rails will create a new, blank object
   #and store it in front of instance(@) variable
   def new
      @contact = Contact.new
   end
   
   def create
      @contact = Contact.new(contact_params)
      if @contact.save
         redirect_to new_contact_path, notice: "Message sent."
      else
         redirect_to new_contact_path, notice: "Error occured"
      end
   end
   
   #whitelists
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
end