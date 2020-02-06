class Api::V1::UsersController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    pseudo = params[:pseudo]

    user = User.new
    message_to_send = user.check_the_pseudo(pseudo)

    user.save

    json_to_send = message_to_send.to_json
    render json: json_to_send
  end
end
