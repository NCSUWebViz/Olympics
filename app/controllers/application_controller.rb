class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :add_cross_domain_headers
  
  def add_cross_domain_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'GET, OPTIONS'
  end
end
