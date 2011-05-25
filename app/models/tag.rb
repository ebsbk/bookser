# Model represents a tag that can be assigned to a book.
# One tag can be assigned to many books.
#
# Usage:
#
# Todo:
#
# Add name field format validation
# Add proper users association

class Tag < ActiveRecord::Base
  validates_uniqueness_of :name

  has_many :taggings, :dependent => :destroy
  has_many :books, :through => :taggings

  has_many :users, :through => :books, :source => :users
end
