require 'test_helper'

class RequestTest < ActiveSupport::TestCase
  def setup
    @request = Request.new(user_id: 1, type: "demo", info: "blah")
  end
  
  test ""
end
