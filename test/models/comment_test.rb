require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  test "comments" do
  	comment = Comment.create(:message => 'Hi', :rating => 'One Star', :user => 'sdfsdf@gmail.com')
  	puts comment.inspect
  end

end



