require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def setup
    @request = Request.new(user_id: 1, queue_type: "demo", info: "blah")
  end
  
end
