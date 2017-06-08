class RolesDemoController < ApplicationController
  # this is an example how to use the roles in a controller.

  # role admin is still required for the admin_only action
  skip_before_action :authorize_admin, only: [:index, :team_only, :po_only, :team_and_po]
  # restrict specific actions to roles
  before_action(only: [:team_only]) { authorize_roles(:team) }
  before_action(only: [:po_only]) { authorize_roles(:product_owner) }
  before_action(only: [:team_and_po]) { authorize_roles(:product_owner, :team) }

  def index
  end
  def admin_only
  end
  def team_only
  end
  def po_only
  end
  def team_and_po
  end

end
