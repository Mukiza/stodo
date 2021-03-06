ENV['RACK_ENV'] = 'test'

require 'rubygems'
require 'rack/test'
require 'rspec/expectations'
require 'webrat'

require File.expand_path  "./../../../todo.rb", __FILE__

Webrat.configure do |config|
  config.mode = :rack
end

class WebratMixin
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    Sinatra::Application
  end
end

World{WebratMixin.new}
