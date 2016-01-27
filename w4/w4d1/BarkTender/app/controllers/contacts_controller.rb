class ContactsController < ApplicationController
  def index
    render json: Contact.all
  end

  def show
    render json: Contact.find(params[:id])
  end

  def create
    contact = Contact.new(contact_params)
    if contact.save
      render json: contact
    else
      render( json: user.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def update
    contact = Contact.find(params[:id])
    if contact.update_attributes(contact_params)
      render json: contact
    else
      render( json: contact.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def destroy
    Contact.find(params[:id]).delete!
    index

  end




private
def contact_params
  params.require(:contact).permit(:name, :email, :user_id)
end


end
