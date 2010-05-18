# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_acm_site_session',
  :secret      => 'bb5cc51cc72d21e16ab652d94fe35997048de6680e0ce08c182250bf5999373d3834bf4f0787910245b9d80ae97020a126cde3623c853471a4237f2f7e908cc8'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
