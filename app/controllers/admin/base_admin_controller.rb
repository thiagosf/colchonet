class Admin::BaseAdminController < ApplicationController
  before_filter :authenticate_admin!
  before_action :set_default_configurations

  layout "admin"

  def set_default_configurations
    
    # Admin
    @meta_title = "Colcho.net"
    @nav = ["rooms", "users"]
    @plus_nav = ["rooms"]
  end
end