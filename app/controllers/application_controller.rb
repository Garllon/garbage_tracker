# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

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
