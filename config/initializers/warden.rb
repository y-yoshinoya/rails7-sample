require Rails.root.join('lib/strategies/authentication_token_strategy')
Rails.application.configure do |config|
  Warden::Strategies.add(:authentication_token, AuthenticationTokenStrategy)
  config.middleware.use Warden::Manager do |manager|
    manager.default_strategies :authentication_token
    manager.failure_app = ->(env) { SessionsController.action(:new).call(env) }
  end
end
