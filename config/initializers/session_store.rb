# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_marketplace_session',
  :secret      => 'c0a0fa8fb9028c685016507452b39dccbfc3cce8ae234d809b7821279040c8c949e5d259cffa278f574ac35ecb7a887d712e67160e11f6d9567bd2ff738cbb50'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
