require 'rack/test'

require File.expand_path '../../todo.rb', __FILE__

module RSpecMixin
    
    include Rack::Test::Methods
    def app()
        Sinatra::Application 
    end
end

RSpec.configure { |c| c.include RSpecMixin }
