# frozen_string_literal: true

class Clients::SessionsController < Devise::SessionsController
  def new
    session[:client_return_to] = params[:return_to] if params[:return_to]

    super
  end

  def after_sign_in_path_for(resource)
    return session[:client_return_to] if session[:client_return_to].present?

    super(resource)
  end
end
