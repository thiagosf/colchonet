class UsersController < ApplicationController
  PER_PAGE = 10

  before_action :set_user, only: [:show, :edit, :update]
  before_action :can_change, only: [:edit, :update]
  before_action :require_no_authentication, only: [:new, :create]

  def show
    rooms = @user.rooms.page(params[:page]).per(PER_PAGE)
    @rooms = RoomCollectionPresenter.new(rooms.most_recent, self)
  end

  def edit
  end

  def update
    if @user.update(users_params)
      redirect_to @user, notice: "Cadastro atualizado com sucesso!"
    else
      render action: :edit
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(users_params)
    if @user.save
      Signup.confirm_email(@user).deliver
      redirect_to root_path, notice: t('flash.notice.user_created')
    else
      render action: :new
    end
  end

  private

    def set_user
      @user = User.find(params[:id])
    end

    def users_params
      params.
        require(:user).
        permit(:full_name, :location, :email, :password, :password_confirmation, :bio)
    end

    def can_change
      unless user_signed_in? && current_user == user
        redirect_to user_path(params[:id])
      end
    end

    def user
      @user ||= User.find(params[:id])
    end
end
