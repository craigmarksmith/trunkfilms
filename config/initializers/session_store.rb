# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_trunkfilms_session',
  :secret      => '142eeae3c9230408b11c436df0021b1b185b404e4c2477597895af12d11bb331043edf3048b3c0c636800a92b28dd33cb148ad7aaedb1e4fd13e3f90ea32d99c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
