class ContactMailer < ActionMailer::Base
   default to: 'NataliePerezEO@gmail.com'
   
   #instance variables defined here can be used in corresponding view file contact_email.html
   def contact_email(name, email, body)
      @name = name
      @email = email
      @body = body
      
      mail(from: email, subject: 'Contact Form Message')
   end   
end  