class DataEncryptingKeysController < ApplicationController

  def rotate
    # create background worker to rotate keys and re-encrypt strings
    # 1. check if it's already working
    @old_encrypting_key = DataEncryptingKey.primary
    @data_encrypting_key = DataEncryptingKey.new(key: params[:data_encrypting_key], primary: true)
    if @data_encrypting_key.save
      @old_encrypting_key.primary = false
      render json: { key: @data_encrypting_key.key, primary: @data_encrypting_key.primary, old: @old_encrypting_key }
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
