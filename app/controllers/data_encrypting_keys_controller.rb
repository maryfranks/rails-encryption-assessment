class DataEncryptingKeysController < ApplicationController

  def rotate
    # create background worker to rotate keys and re-encrypt strings
    # 1. check if it's already working
    render json: { message: params[:new_key] }
  end

  def status
    # need three messages:
      # render json: { message: 'Key rotation has been queued' }
      # render json: { message: 'Key rotation is in progress' }
      # render json: { message: 'No key rotation queued or in progress' }
    render json: { message: 'this is a status' }
  end

end
