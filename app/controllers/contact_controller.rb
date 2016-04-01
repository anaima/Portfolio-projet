class ContactController < ApplicationController

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(post_params)
    @contact.request = request
    if @contact.deliver
      flash.now[:notice] = 'Merci pour votre message. Je reprendrai contact avec vous dès que possible.'
    else
      flash.now[:error] = 'Vous ne pouvez pas envoyer de message.'
      render :new
    end
    @contact.save
  end

  private

  def post_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
