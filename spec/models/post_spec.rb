require 'rails_helper'

RSpec.describe Post, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe Post.new
  it "returns the posts name" do
    post = build(:post, "Norwegian cat")

    expect(post.name).to eq "Norwegian cat"
  end


end
