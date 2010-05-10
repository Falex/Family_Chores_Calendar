class CreateRewards < ActiveRecord::Migration
  def self.up
    create_table :rewards do |t|
      t.string :title
	  t.integer :points
	  t.references :calendar
      t.timestamps
    end
  end

  def self.down
    drop_table :rewards
  end
end
