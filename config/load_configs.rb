require 'yaml'

YAML::ENGINE.yamler= 'syck'

 Omniauth_keys = YAML::load(File.read("#{Rails.root}/config/omniauth.yml"))[Rails.env]