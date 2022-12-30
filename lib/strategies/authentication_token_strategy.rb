class AuthenticationTokenStrategy < ::Warden::Strategies::Base
  # 以下の条件の場合のみ、authenticate!を実行する
  def valid?
    true
  end

  # コントローラーでenv["warden"].authenticate!の形で利用する
  def authenticate!
    user = Session.find_by(authentication_token: session['authentication_token'])&.user

    if user
      # 認証成功
      # ここで渡したuserは、コントローラーからenv['warden'].userで取り出せる
      success!(user)
    else
      # 認証失敗
      # ここで渡したメッセージは、コントローラーからenv['warden'].messageで取り出せる
      fail!('strategies.authentication_token.failed')
    end
  end
end
