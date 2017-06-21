class V1::ApiController < ApplicationController
  protect_from_forgery with: :null_session
  respond_to :json

  JsonResponse::STATUS_CODE.keys.each do |status|
    define_method "response_#{status}" do |message = "", content = {}|
      render json: JsonResponse.send(status, message, content)
    end
  end
end
