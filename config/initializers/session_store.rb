# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_unicorn_amqp_gem_example_session',
  :secret      => 'd78f11859a5f19d6d11a3351c5b8d6e12e339d25e87a3f89037929312fe99458cc34e32166e893eeb882db5b685b59a8368d84a578ba9e0c407687f2c4e7a6dc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
