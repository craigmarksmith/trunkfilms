class AdminController < ApplicationController
  before_filter :authenticate
  def authenticate
    redirect_to login_url unless UserSession.find
  end

  def selected_menu_item
    self.class.name.match(/Admin::(.+)Controller/)
    $1
  end
  helper_method(:selected_menu_item)

  def admin_title
    self.class.name.match(/Admin::(.+)Controller/)
    return "Admin" if $1 == 'Home'
    "#{$1} Admin"
  end
  helper_method(:admin_title)

end
