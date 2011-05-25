# Model represents service user.
# User can have many books. See Book model for more information about Books logic.
# User have list of tags, that is agregated throught related books.
#
# Usage:
#
# Todo:
#
# Add proper tags association

class User < ActiveRecord::Base
  validates_presence_of :name, :email

  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create
  has_many :books, :extend => FindRecentExtension
  #has_many :tags, :through => :books, :source => :tags, :uniq => true
end
