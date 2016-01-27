class ContactShares < ActiveRecord::Base



  def create
    contact_shares = ContactShares.new(contact_shares_params)
    if contact_shares.save
      render :json contact_shares
    else
      render( json: contact_shares.errors.full_messages, status: :unprocessable_entity )
    end
  end

  def destroy
    ContactShare.find(params[:id]).delete
    render :json "DESTROYED"
  end




  private
  def contact_shares_params
    params[:contact_shares].permit(:user_id, :contact_id)
  end
end
