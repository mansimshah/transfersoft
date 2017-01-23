class Api::V1::TransfersController < ApplicationController

  def upload_file
    @transfer = Transfer.new(transfer_params)

    if @transfer.save
      render json: 'File was successfully uploaded.'.to_json
    else
      render json: 'File was not successfully uploaded.'.to_json
    end
  end

  private

  def transfer_params
    params.require(:transfer).permit(:email_to, :email_from, :message, :attachment)
  end

end