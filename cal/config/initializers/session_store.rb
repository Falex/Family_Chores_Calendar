# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cal_session',
  :secret      => '8ca73d7dbea9554c9a1f8a01312a9c447a2dc962643595a5b55620033a24bffaebcf56af7c1277a694f40c41c3c01622fa6c5c1234a129368e75393a57b083aa'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
