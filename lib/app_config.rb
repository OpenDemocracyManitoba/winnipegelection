# From: http://kpumuk.info/ruby-on-rails/flexible-application-configuration-in-ruby-on-rails/
#
# You will need to create a /config/config.yml file.
#
# It should at least contain the following:
#
# common:
#   admin_user: specify_username_here
#   admin_password: specify_password_here

require 'ostruct'
require 'yaml'
 
config = YAML.load_file("#{Rails.root}/config/config.yml") || {}
app_config = config['common'] || {}
app_config.update(config[Rails.env] || {})
AppConfig = OpenStruct.new(app_config)
