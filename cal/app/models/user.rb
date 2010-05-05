class User < ActiveRecord::Base
  acts_as_authentic
  belongs_to :fam
  has_many :calendars
  has_many :events, :through => :calendars
  
  #attr_accessible :login, :email, :id, :password, :password_confirmation, :role
  
  #def role_symbols
	#[:admin] if role == "admin"
	#[:child] if role == "child"
	#[:parent] if role == "parent"
  #end
  #serialize :roles, Array

  # The necessary method for the plugin to find out about the role symbols
  # Roles returns e.g. [:admin]
  def role_symbols
    @role_symbols ||= (roles || []).map {|r| r.to_sym}
  end
 
end
