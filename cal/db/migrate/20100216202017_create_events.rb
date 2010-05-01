class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.references :calendar
	  t.references :chore
      t.string :title
	  t.string :image
      t.text :description
      t.date :start_on
      t.date :stop_on
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
