class ConfirmationsController < ApplicationController
  def show
    user = User.find_by(confirmation_token: params[:token])

    if user.present?
      user.confirm!
      redirect_to new_user_sessions_path, notice: I18n.t('confirmations.success')
    else
      redirect_to new_user_sessions_path, notice: I18n.t('confirmations.already_confirmed')
    end
  end
end