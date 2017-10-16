class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:login]

  def login_form
  end

  def login
    auth_hash = request.env['omniauth.auth']

    if auth_hash['uid']
      user = User.find_by(provider: params[:provider], uid: auth_hash[:uid])

      if user.nil?
        #user has not logged in before
        #create a new record in the DB
        user = User.from_auth_hash(params[:provider], auth_hash)
        # save_and_flash(user)

        if user.save
        flash[:status] = :success
        flash[:message] = "successfully created a new user #{user.name}"
        else
        flash[:status] = :failure
        end

      else
        flash[:status] = :success
        flash[:message] = "successfully logged in as returning user #{user.name}"
      end
      session[:user_id] = user.id
      redirect_to root_path
    end
  end

  def logout
    session[:user_id] = nil
    flash[:status] = :success
    flash[:message] = "You have successfully logged out"
    redirect_to root_path
  end
end
