class Admin::UsersController < Admin::BaseAdminController
  before_action :set_admin_user, only: [:show, :edit, :update, :destroy]

  PER_PAGE = 10

  # GET /admin/users
  # GET /admin/users.json
  def index
    @admin_users = Admin::User.page(params[:page]).per(PER_PAGE)
  end

  # GET /admin/users/1
  # GET /admin/users/1.json
  def show
  end
  
  # GET /admin/users/1/edit
  def edit
  end

  # PATCH/PUT /admin/users/1
  # PATCH/PUT /admin/users/1.json
  def update
    respond_to do |format|
      if @admin_user.update(admin_user_params)
        format.html { redirect_to [:admin, @admin_user], notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @admin_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/users/1
  # DELETE /admin/users/1.json
  def destroy
    @admin_user.destroy
    respond_to do |format|
      format.html { redirect_to admin_users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_user
      @admin_user = Admin::User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_user_params
      params.require(:user).permit(:full_name, :email, :location, :bio)
    end
end
