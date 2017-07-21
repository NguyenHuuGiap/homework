class NotificationsController < ApplicationController
  add_breadcrumb I18n.t("breadcrumbs.notifications"), :notifications_path

  def index
  end

  def edit
    add_breadcrumb t "breadcrumbs.edit_notification"
  end

  def new
    add_breadcrumb t("breadcrumbs.new_notification"), :new_notification_path
  end
end
