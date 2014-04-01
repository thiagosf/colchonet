class Admin::DashboardsController < Admin::BaseAdminController
  def index
    @count_rooms = Room.count
    @count_users = User.count
  end

  def about
    render layout: false
  end
end