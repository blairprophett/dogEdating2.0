class RegistrationsController < Devise::RegistrationsController
  protected
  
  #controller to override devise default sign-up methods

  def after_sign_up_path_for(resource)
    '/dogs/new'
  end
end