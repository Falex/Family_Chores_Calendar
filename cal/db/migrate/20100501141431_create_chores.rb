class CreateChores < ActiveRecord::Migration
  def self.up
    create_table :chores do |t|
      t.references :calendar	:null => false
	  t.string :title
      t.string :image_url
      t.timestamps
    end
  end

  def self.down
    drop_table :chores
  end
end
