class ApplicationController < ActionController::Base
  #通常であればコントローラーと同じ名前のレイアウトが設定されるが、独自定義する
  #
  layout :set_layout

  private def set_layout
    if params[:controller].match(%r{\A(staff|admin|customer)/})
      Regexp.last_match[1]
    else
      "customer"
    end
  end
end
