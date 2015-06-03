require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comment_tester" do
  	comment = FactoryGirl.create(:comment)
  	# expected = 'One star'
  	# actual = comment.comment_tester
  	# assert_equal expected, actual
  end

end


# keep getting error email has already been taken. tried  db:test:prepare? Doesn't work.
# Database Cleaner where to put gemfile?



