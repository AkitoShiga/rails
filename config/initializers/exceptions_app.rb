Rails.application.configure do
  config.exceptions_app = ->(env) do
    action =
      case
      request = ActionDispatch::Request.new(env).path_info
      when "/404"; :not_found
      when "/422"; :unprocessable_entity
      else; :internal_server_error
      end

    # ルーティング例外が発生した時の処理
    #メソッドがブロックを返すってこと？
    ErrorsController.action(action).call(env)
  end
end
