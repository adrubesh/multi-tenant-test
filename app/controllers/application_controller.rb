class ApplicationController < ActionController::Base
  set_current_tenant_through_filter
  before_action :tenant_method

  def tenant_method
    set_current_tenant(User.all.sample)
  end
end
