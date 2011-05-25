# Model represents a book.
# Book belongs to one user and cannot be created without specifying related user.
# Book can have tags.
#
# PdfUploader class from carierwave gem is used for storing book's data.
# It's configuration can be found at app_dir/config/initializers/carrierwave.rb and app_dir/app/uploaders/pdf_uploader.rb
# Tags can be assigned throught model's virtual attr :tags_string separated by space.
#
# Usage:
#
# Book.create :author => "Mr Nobody", :title => "About nothing", :user_id => @user.id, :tags_string => "sci-fi drama commedy"
# Will create a new book for a specifyed user with author name: Mr Nobody, title: About nothing  
# and 3 tags sci-fi, drama and commedy. Tags are fetched from the database or created as new if there is no tag with such name.
# Todo:
#
# Add author and title format validation
#

class Book < ActiveRecord::Base
  validates_presence_of :author, :title, :user_id

  attr_writer :tags_string
  attr_accessible :author, :title, :pdf, :tags_string

  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings

  belongs_to :user

  mount_uploader :pdf, PdfUploader

  after_save :apply_tags

  def tags_string
    @tags_string || self.tags.map(&:name).join(" ")
  end

  private 

  def apply_tags
    self.tags = tags_string.split(" ").map do |tag_name|
      Tag.find_or_create_by_name tag_name
    end
  end
end
