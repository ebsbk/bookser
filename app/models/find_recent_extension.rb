# Module that includes method in ActiveRecord model to find recent entries.
# "created_at" field must present.
 
module FindRecentExtension
  def recent
    find(:all, :conditions => ["created_at > ?", 7.days.ago])
  end
end
