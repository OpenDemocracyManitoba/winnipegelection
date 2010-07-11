# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_httpdocs_session',
  :secret      => '4d8d9f25fa60f85070978f0808b2b1b2ff480d821ea1083f65febac391411d2aed9ba8c245993d95cdcb86e948cb8bf000d2d39811ce196960f5508bf13c1cc4'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
