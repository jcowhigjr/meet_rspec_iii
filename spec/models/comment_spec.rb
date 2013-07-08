require 'spec_helper'

describe Comment do

  let(:comment) {
    Comment.new(link:"http://example.com/comments/feed", description:"description")
  }
  context ("database empty") do
    describe "attributes" do
      it { expect(comment).to validate_uniqueness_of :link}
    end
  end
end
