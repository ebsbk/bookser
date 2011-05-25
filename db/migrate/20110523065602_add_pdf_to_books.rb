class AddPdfToBooks < ActiveRecord::Migration
  def self.up
    add_column :books, :pdf, :string
  end

  def self.down
    remove_column :books, :pdf
  end
end
