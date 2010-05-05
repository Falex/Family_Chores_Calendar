class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
	t.references :fam

    t.timestamps
	t.string	:role
	t.string    :color
	t.integer   :stars_count
	t.integer   :entire_stars_count
	t.string    :family
	t.string    :family_password
	t.string    :login,               :null => false                # optional, you can use email instead, or both
    t.string    :email,               :null => false                # optional, you can use login instead, or both
    t.string    :crypted_password,    :null => false                # optional, see below
    t.string    :password_salt,       :null => false                # optional, but highly recommended
    t.string    :persistence_token,   :null => false                # required
    t.string    :single_access_token, :null => false                # optional, see Authlogic::Session::Params
    t.string    :perishable_token,    :null => false                # optional, see Authlogic::Session::Perishability

    
    t.integer   :login_count,         :null => false, :default => 0 
    t.datetime  :current_login_at                                   
    t.datetime  :last_login_at                                      
    

    end
  end

  def self.down
    drop_table :users
  end
end
