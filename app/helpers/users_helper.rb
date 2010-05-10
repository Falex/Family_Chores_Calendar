module UsersHelper
  def gravatar_url (email, options = {})
    url_for({ :gravatar_id => Digest::MD5.hexdigest(email),
	  :host => 'www.gravatar.com',
	  :protocol => 'http://',
	  :only_path => false,
	  :controller => 'avatar.php'}.merge(options)) 
  end
end
