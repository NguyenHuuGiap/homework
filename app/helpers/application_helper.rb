module ApplicationHelper
  def active_class path
    "active" if request.original_fullpath.include? path
  end

  def selected_plan plan
    return plan.product.id if plan.product.present?
    {}
  end

  def render_i18n_edit_create plan
    if plan.new_record?
      I18n.t("admin.btn.create")
    else
      I18n.t("admin.btn.edit")
    end
  end
end
