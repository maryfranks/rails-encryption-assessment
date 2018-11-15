class ReencryptStringsWorker
  include Sidekiq::Worker

  def perform(encrypted_strings, key)
    encrypted_strings.each do | string |
      puts string
      puts key
      # 1. decrypt the string - will need old key
      # 2. reencrypt the string
      # 3. give the strings back to the controller
    end
  end
end
