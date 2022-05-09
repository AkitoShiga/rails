module ErrorHandlers
  extend ActiveSupport::Concern

  included do
    # rescueの定義は親が上らしい
    rescue_from StandardError, with: :rescue500
    rescue_from ApplicationController::Forbidden, with: :rescue403
    rescue_from ApplicationController::IpAddressRejected , with: :rescue403
    rescue_from ActiveRecord::RecordNotFound , with: :rescue404
  end

  private def rescue403(e)
    @exception = e #ここで宣言した変数をERBの中で使用することが出来る
    render "errors/forbidden", status: 403
  end

  private def rescue404(e)
    render "errors/not_found", status: 404
  end

  private def rescue500(e)
    render "errors/internal_server_error", status: 500
  end


end
