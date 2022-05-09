class ErrorsController < ApplicationController
  layout "staff"

  # 同名のテンプレートを呼び出しているからテンプレートの指定は不要
  def not_found
    render status: 404
  end

  def unprocessable_entity
    render status: 422
  end

  def internal_server_error
    render status: 500
  end

end
