class ContactsController < ApplicationController
 def new
  @contact = Contact.new
 end
 
 def create
  @contact = Contact.new(contact_params)
  if @contact.save
    name = params[:contact][:nombre]
    email = params[:contact][:email]
    body = params[:contact][:comentarios]
    ContactMailer.contact_email(name, email, body).deliver
    flash[:success] = "Mensage enviado."
    redirect_to new_contact_path
  else
    flash[:danger] = @contact.errors.full_messages.join(", ")
    redirect_to new_contact_path
  end
 end
 
 private
  def contact_params
    params.required(:contact).permit(:nombre, :email, :comentarios)
  end
end
