class CreateCalendars < ActiveRecord::Migration
  def self.up
    create_table :calendars do |t|
	  t.references :user
	  t.references :fam
      t.string :title
      t.text :description
      t.datetime :updated_at

      t.timestamps
    end
  end

  def self.down
    drop_table :calendars
  end
end
