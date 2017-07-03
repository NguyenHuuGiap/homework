module ApplicationHelper
  def active_class path
    "active" if request.original_fullpath.include? path
  end
end
