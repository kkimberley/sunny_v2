Clearance.configure do |config|
  config.mailer_sender = 'reply@example.com'
  config.rotate_csrf_on_sign_in = true
  config.allow_sign_up = false
  config.cookie_expiration = lambda { |cookies| 1.hour.from_now.utc }
  config.routes = true
  config.password_strategy = Clearance::PasswordStrategies::BCrypt
  config.redirect_url = '/'
  config.user_model = User
end
