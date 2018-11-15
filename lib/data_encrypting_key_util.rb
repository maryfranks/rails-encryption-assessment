module DataEncryptingKeyUtil

  def remove_primary(data_encrypting_key)
    data_encrypting_key.update_attribute(:primary, false)
  end

end
