if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_client_side', domain: 'localhost:3000'
  else
    Rails.application.config.session_store :cookie_store, key: '_client_side' 
  end