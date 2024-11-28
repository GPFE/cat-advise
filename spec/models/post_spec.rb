require 'rails_helper'

RSpec.describe Post, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe "post columns" do
    post = FactoryBot.build(:post, name: "Norwegian cat", content: "My favorite content.", owner_id: 1)

    it "returns the name" do
      expect(post.name).to eq "Norwegian cat"
    end

    it "returns the content" do
      expect(post.content).to eq "My favorite content."
    end
  end

  describe "post associations" do
    it "returns user" do
      owner = FactoryBot.create(:user)
      post = FactoryBot.create(:post, owner: owner)

      expect(post.owner).to be_a(User)
    end

    it "can have many users who liked it" do
      users = FactoryBot.create_list(:user, 10)
      post = FactoryBot.create(:post, users: users)

      expect(post.users.length).to eq(10)
    end
  end
end
