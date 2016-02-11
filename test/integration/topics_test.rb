require 'test_helper'

class TopicsTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:artem)
  end

  test 'new topic' do
    log_in_as(@user)
    get topics_path
    assert_difference 'Topic.count', 1 do
      post topics_path, topic: { title: 'The title', content: 'Test content' }
    end
    assert_redirected_to topics_url
  end
end
