class DataEncryptingKeysController < ApplicationController

  def rotate
    @old_encrypting_key = DataEncryptingKey.is_primary?
    @data_encrypting_key = DataEncryptingKey.new(key: params[:data_encrypting_key], primary: true)

    if @data_encrypting_key.save
      @old_encrypting_key.remove_primary
      @encrypted_strings = EncryptedString.all.map { |string| string.encrypted_value }
      # check to see if a background job is already running
      ReencryptStringsWorker.perform_async(@encrypted_strings, @old_encrypting_key, @data_encrypting_key)
      render json: { message: "keys rotated" }
    else
      render json: { message: @data_encrypting_key.errors.full_messages.to_sentence}
    end

  end

  def status
    # need three messages:
      # render json: { message: 'Key rotation has been queued' }
      # render json: { message: 'Key rotation is in progress' }
      # render json: { message: 'No key rotation queued or in progress' }
    render json: { message: 'this is a status' }
  end

end
