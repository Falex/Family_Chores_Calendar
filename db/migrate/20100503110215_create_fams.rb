class CreateFams < ActiveRecord::Migration
  def self.up
    create_table :fams do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :fams
  end
end
