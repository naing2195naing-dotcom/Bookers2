class Users::SessionsController < ApplicationController
  def create
  if (user = User.find_by(name: params[:name]))&.authenticate(params[:password])
    start_new_session_for user
    redirect_to after_authentication_url
  else
    redirect_to new_session_path,
      alert: "Try another name or password."
  end
end
end
