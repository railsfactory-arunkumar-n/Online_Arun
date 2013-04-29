OmniAuth_keys=YAML.load_file("#{Rails.root}/config/omniauth.yml")[Rails.env]
Rails.application.config.middleware.use OmniAuth::Builder do
 provider :facebook,  OmniAuth_keys["fb_app_id"], OmniAuth_keys["fb_app_secret"], :scope => 'email,user_birthday,read_stream', :display => 'popup'
 
end
  
  
	#Rails.application.config.middleware.use OmniAuth::Builder do
#	provider :facebook,'536302879753327', 'b7e326ccd4e942b9ab003f57c6bb2ce5',
	#								:scope => 'email,user_birthday,read_stream', :display => 'popup'
 # end
                