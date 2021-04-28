# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit


  before_action :configure_permitted_parameters, if: :devise_controller?


  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:people_in_household])
  end

  private

  def authorize_user_pundit_rights(record)
    authorize record
  end

  def user_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore

    flash[:alert] = t("#{policy_name}.#{exception.query}",
                      scope: 'pundit',
                      default: :default)
    redirect_to root_path
  end

end
