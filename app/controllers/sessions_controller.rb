class SessionsController < ApplicationController
skip_before_action :verify_authenticity_token
  def new
    render :layout => false
  end


  def create
    user = User.find_by(email: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])

        log_in user
        redirect_to user
      else
        flash.now[:danger] = 'Invalid email/password combination'
      end
    end

def destroy
   log_out
   redirect_to root_path
 end
end
