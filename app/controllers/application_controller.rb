class ApplicationController < ActionController::Base
  include ApplicationHelper
  protect_from_forgery with: :exception
  # this is a whitelist approach: everything is closed here except for admins.
  # explicitely skip these actions if something should be open for others.
  before_action :authenticate_user!
  before_action :authorize_admin

protected

  def authorize_admin
    authorize_roles(:admin)
  end

  def authorize_roles(*roles)
    if cu = current_user_has_roles(*roles)
      return cu
    else
      flash[:error] = missing_role(roles)
      flash[:error] = flash[:error]+ " (#{I18n.t(:role,role: current_user.role)})" if current_user
      redirect_to root_url # halts request cycle
    end
  end

  def current_user_has_roles(*roles)
    if current_user
      # admin has all roles
      if current_user.admin?
        return current_user
      else
        if roles.any? { | role | User.valid_role?(role) && current_user.send("#{role}?") }
          return current_user
        end
      end
    end
    return nil
  end
end
