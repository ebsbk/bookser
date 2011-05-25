class CreateBooksTags < ActiveRecord::Migration
  def self.up
    create_table :books_tags do |t|
      t.integer :book_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :books_tags
  end
end
