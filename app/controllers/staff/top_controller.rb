class Staff::TopController < Staff::Base
  skip_before_action :authorize
  #skip_before_action :check_timeout

  def index #indexアクション
    render action: "index" #action: の意味は？
  end
end
# よばれたインデックス
# render関数に処理を移譲する
# リクエストが入ったシンボル内のrootの引数にわたされたクラスがインスタンス化される
# render = htmlを呼び出すんじゃなくてまさにレンダリング処理を行う
# action は指定のファイルを呼び出して、レンダリングする

# indexアクションの中が定義されていない場合は、同名のテンプレートが呼び出される
# なので、この場合はindexアクションの中身を省略することが出来る