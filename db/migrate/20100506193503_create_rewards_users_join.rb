class CreateRewardsUsersJoin < ActiveRecord::Migration
  def self.up
    create_table 'rewards_users', :id => false do |t|
	  t.column 'reward_id', :integer
	  t.column 'user_id', :integer
	end
  end

  def self.down
    drop_table 'rewards_users'
  end
end
