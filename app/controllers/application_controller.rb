class ApplicationController < ActionController::Base
  #通常であればコントローラーと同じ名前のレイアウトが設定されるが、独自定義する
  layout :set_layout

  # 例外の独自定義
  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
end
