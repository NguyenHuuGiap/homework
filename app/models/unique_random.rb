module UniqueRandom
  private
  def unique_random attr
    str = ""
    str_len = Settings.public_send(self.class.name.underscore.pluralize)
              .public_send(attr)
              .public_send(:secure_length).to_i / 2
    loop do
      str = SecureRandom.hex str_len
      break unless self.class.exists?(attr => str)
    end
    assign_attribtes attr => str
    str
  end
end
