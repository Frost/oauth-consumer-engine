class Login::UserSessionsController < ApplicationController
  before_filter :login_required, :only => [ :destroy ]

  respond_to :html

  # omniauth callback method
  def create
    omniauth = request.env['omniauth.auth']
    user = User.find_by_uid(omniauth['uid'])
    if not user
      # New user registration
      user = User.create!(:uid => omniauth['uid'],
                          :first_name => omniauth['info']['first_name'],
                          :last_name => omniauth['info']['last_name'],
                          :email => omniauth['info']['email']
                         )
    end

    # Currently storing all the info
    session[:user_id] = omniauth

    flash[:notice] = "Successfully logged in"
    redirect_to request.env['omniauth.origin'] || root_path
  end

  # Omniauth failure callback
  def failure
    flash[:notice] = params[:message]
    redirect_to root_path
  end

  # logout - Clear our rack session BUT essentially redirect to the provider
  # to clean up the Devise session from there too !
  def destroy
    session[:user_id] = nil

    flash[:notice] = 'You have successfully signed out!'
    redirect_to "#{ENV['CUSTOM_PROVIDER_URL']}/users/sign_out"
  end
end
