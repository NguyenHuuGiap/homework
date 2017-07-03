class ServicesController < ApplicationController
  add_breadcrumb I18n.t("breadcrumbs.services"), :services_path, class: "active"

  def index
  end

  def edit
    add_breadcrumb t "breadcrumbs.edit_service"
  end
end
