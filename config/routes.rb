Rails.application.routes.draw do

  #シンボル -> ディレクトリURL（モジュール）
  # top -> コントローラー
  # index 関数名
  # root -> ルートディレクトリのURL名にアクセスした時にどのコントローラーのどのメソッドが処理を受け持つか割り当てるメソッド
  namespace :staff do
    root "top#index"
    get "login"      => "sessions#new", as: :login
    post "session"   => "sessions#create", as: :session
    delete "session" => "sessions#destory"
    # asはシンボルを用いてERBの中でルーティングを定義するためのもの
  end

  namespace :admin do
    root "top#index"
    get "login"      => "sessions#new", as: :login
    delete "session" => "sessions#destroy"
  end

  namespace :customer do
    root "top#index"
  end
end
# するってえとrailsはアクセスするURLのディレクトリごとにrailsにおジュールを作るってこと？？
# でそのモジュール（URL）のトップレベルにアクセスした時に呼ばれるのがroot
# rootメソッドが呼ばれた時に対応させるクラスとメソッドをここで定義しているってこと！？