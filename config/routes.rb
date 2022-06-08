Rails.application.routes.draw do
  config = Rails.application.config.baukis2

  #シンボル -> ディレクトリURL（モジュール）
  # top -> コントローラー
  # index 関数名
  # root -> ルートディレクトリのURL名にアクセスした時にどのコントローラーのどのメソッドが処理を受け持つか割り当てるメソッド
  constraints host: config[:staff][:host] do
    namespace :staff, path: config[:staff][:path] do
      root   "top#index"
      get    "login"   => "sessions#new",    as: :login
      #post   "session" => "sessions#create", as: :session
      #delete "session" => "sessions#destroy"

      resource  :session,   only: [:create, :destroy]
      resource  :account, except: [:new, :create, :destroy]
      resource  :password, only: [:show, :edit, :update]
      resources :customers

      # asはシンボルを用いてERBの中でルーティングを定義するためのもの
    end
  end

  constraints host: config[:admin][:host] do
    namespace :admin, path: config[:admin][:path] do
      root   "top#index"
      get    "login"   => "sessions#new",    as: :login
      #post   "session" => "sessions#create", as: :session
      #delete "session" => "sessions#destroy"

      resource :session, only: [:create, :destroy]

      resources :staff_members do
        resources :staff_events, only: [ :index ]
      end
      resources :staff_events, only: [ :index ]
=begin
      get    "staff_members"          => "staff_members#index", as: :admin_staff_members
      get    "staff_members/new"      => "staff_members#new",   as: :new_admin_staff_member
      get    "staff_members/:id"      => "staff_members#show",  as: :admin_staff_member
      get    "staff_members/:id/edit" => "staff_members#edit",  as: :edit_admin_staff_member
      post   "staff_members"          => "staff_members#create"
      patch  "staff_members/:id"      => "staff_members#update"
      delete "staff_members/:id"      => "staff_members#destroy"
=end
      resources :staff_members
    end
  end

  constraints host: config[:customer][:host] do
    namespace :customer, path: config[:customer][:path] do
      root "top#index"
    end
  end
end
# するってえとrailsはアクセスするURLのディレクトリごとにrailsにおジュールを作るってこと？？
# でそのモジュール（URL）のトップレベルにアクセスした時に呼ばれるのがroot
# rootメソッドが呼ばれた時に対応させるクラスとメソッドをここで定義しているってこと！？
