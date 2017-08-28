class ContactsController < ApplicationController
   # Every time someone pulls up the form, rails will create a new, blank object
   # and store it in front of instance(@) variable
   def new
      @contact = Contact.new
   end
   
   def create
      # instance variable contact is assigned information from the contact form from new.html.erb file
      @contact = Contact.new(contact_params)
      
      # flash is like a list of key value pairs {key: value, error: asdfkl}
      # :success, :danger chosen as names for bootstrap alerts
      if @contact.save
         # Lift info from form fields. Go into contact form and grab name, email, comments
         # params hash... params = {contact: {name: "John", email: "john@example.com"}}
         name = params[:contact][:name]
         email = params[:contact][:email]
         body = params[:contact][:comments]
         
         # fires off email. Runs contact_email function from contact_mailer.rb. ContactMailer obj
         # runs contact_email function
         ContactMailer.contact_email(name, email, body).deliver
         
         flash[:success] = "Message sent."
         redirect_to new_contact_path
      else
         flash[:danger] = @contact.errors.full_messages.join(", ")
         redirect_to new_contact_path
      end
   end
   
   #whitelists. 
   private
      def contact_params
         params.require(:contact).permit(:name, :email, :comments)
      end
end