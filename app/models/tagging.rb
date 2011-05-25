# Join model for books and tags

class Tagging < ActiveRecord::Base
  belongs_to :book
  belongs_to :tag
end
