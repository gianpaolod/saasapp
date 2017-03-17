class ContactMailer < ActionMailer::Base
  default to: 'sidercom@sidercomve.com'
  
  def contact_email(name, email, body)
    @name = name
    @email = email
    @body = body
    
    mail(from: email, subject: 'Mensage del formulario de Contactos')
  end
end