require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Validation tests' do
    it 'ensures title is present' do
      post = described_class.new(body: 'Test', summary: 'Test')
      expect(post.valid?).to eq(false)
    end

    it 'ensures body is present' do
      post = described_class.new(title: 'Test', summary: 'Test')
      expect(post.valid?).to eq(false)
    end

    it 'ensures summary is present' do
      post = described_class.new(title: 'Test', body: 'Test')
      expect(post.valid?).to eq(false)
    end
  end
end
