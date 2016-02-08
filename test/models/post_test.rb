require 'test_helper'

class PostTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  def test_has_content
  	response = get('/')
  	assert_equal("Has content", response.body)
  end

end
