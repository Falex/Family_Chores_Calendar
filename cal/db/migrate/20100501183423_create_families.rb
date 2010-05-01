class CreateFamilies < ActiveRecord::Migration
  def self.up
    create_table :families do |t|
      t.string :title

      t.timestamps
    end
  end

  def self.down
    drop_table :families
  end
end
