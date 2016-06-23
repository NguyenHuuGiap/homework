module BaseModel
  extend ActiveSupport::Concern

  class_methods do
    def table_name_prefix
      "m_" if name.first(3) == "M::"
    end
  end
end
