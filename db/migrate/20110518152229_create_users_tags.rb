class CreateUsersTags < ActiveRecord::Migration
  def self.up
    create_table :users_tags do |t|
      t.integer :user_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :users_tags
  end
end
