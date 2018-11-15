class ReencryptStringsWorker
  include Sidekiq::Worker
  include DataEncryptingKeyUtil

  def perform(encrypted_strings, old_key, new_key)
    remove_primary(old_key)
    encrypted_strings.each do | string |
      puts string
      puts old_key
      # 1. decrypt the string - will need old key
      # 2. reencrypt the string - will need the new key
      # 3. give the strings back to the controller/save the new strings directly
      # 4. if successful, delete the old keys
    end
  end
end
