require 'rails_helper'

RSpec.describe Post, type: :model do
  context "validation tests" do
    it "ensures title is present" do
      post = Post.new(body: "Test", summary: "Test")
      expect(post.valid?).to eq(false)
    end
    
    it "ensures body is present" do
      post = Post.new(title: "Test", summary: "Test")
      expect(post.valid?).to eq(false)
    end
    
    it "ensures summary is present" do
      post = Post.new(title: "Test", body: "Test")
      expect(post.valid?).to eq(false)
    end
  end
end
