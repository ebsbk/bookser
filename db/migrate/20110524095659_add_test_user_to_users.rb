class AddTestUserToUsers < ActiveRecord::Migration
  def self.up
    User.create :name => "Gordon Freeman", :email => "gordon.f@blackmesa.org"
  end

  def self.down
    User.find_by_email("gordon.f@blackmesa.org").destroy
  end
end
