# frozen_string_literal: true

class ApplicationController < ActionController::Base
  add_flash_types :success, :info, :warning, :danger

  before_action :require_login

  private

  def not_authenticated
    redirect_to login_path, danger: t('defaults.flash_message.require_login')
  end
end
