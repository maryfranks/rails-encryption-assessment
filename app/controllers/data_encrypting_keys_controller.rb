class DataEncryptingKeysController < ApplicationController

  def rotate
    # create background worker to rotate keys and re-encrypt strings
    # 1. check if it's already working
    @old_encrypting_key = DataEncryptingKey.is_primary?
    @data_encrypting_key = DataEncryptingKey.new(key: params[:data_encrypting_key], primary: true)
    if @data_encrypting_key.save
      @old_encrypting_key.remove_primary
      @encrypted_strings = EncryptedString.all.map { |string| string.encrypted_value }
      ReencryptStringsWorker.perform_async(@encrypted_strings, @old_encrypting_key.encrypted_key)
      render json: { key: @data_encrypting_key.key, primary: @data_encrypting_key.primary, old_key: @old_encrypting_key.primary, count: DataEncryptingKey.all.count }
    else
      render json: { message: @data_encrypting_key.errors.full_messages.to_sentence}
    end
    # once the job is done and successful, delete the old key
  end

  def status
    # need three messages:
      # render json: { message: 'Key rotation has been queued' }
      # render json: { message: 'Key rotation is in progress' }
      # render json: { message: 'No key rotation queued or in progress' }
    render json: { message: 'this is a status' }
  end

end
