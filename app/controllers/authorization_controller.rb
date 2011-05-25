# Controlls authorization logic.
#
# Usage:
#
# Todo:
#
# Add open-id autorization

class AuthorizationController < ApplicationController
  skip_before_filter :require_login, :only => [:login, :authentificate]

  # GET /login
  def login
  end

  # PUT /login
  def authentificate
  end
  
  # DELETE /login
  def logout
  end
  
end
