class Users::RegistrationsController < Devise::RegistrationsController
  skip_before_action :authorize_admin, only: [:new, :create]
  # this controller was generated by:
  # rails generate devise:controllers user
end
