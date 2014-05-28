require 'test_helper'

class ApplicationHelperTest < ActionView::TestCase
  test 'snippet' do
    assert_equal 'Should get the first six words...',
      snippet("Should get the first six words and only the first six words", :word_count => 6)
  end
end
