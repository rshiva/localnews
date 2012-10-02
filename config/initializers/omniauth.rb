OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, "rnhTRScUq5sc7RBqpQL0XQ", "dQ3saQ0VKePGPAcWf8xA7rJOYmw5tKKZpIta36cBgOA" 
end