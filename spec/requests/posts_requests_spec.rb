require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:post_contr) { instance_double(PostsController) }
  let(:new_post_params) do
    {
      title: 'new title',
      summary: 'new summary',
      body: 'new body'
    }
  end

  before do
    user = User.create!(email: 'user@mail.ru', password: '123456', id: 1)
    allow(post_contr).to receive(:current_user).and_return(user)
  end

  describe 'GET /index' do
    it 'renders a successful response without id post' do
      Post.create!(title: 'title', summary: 'summary', body: 'body', user_id: 1, draft: false)
      get posts_url
      expect(response).to be_successful
    end

    it 'returns http success' do
      get '/'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'PATCH /update' do
    it 'check correct change title' do
      post = Post.create!(title: 'title', summary: 'summary', body: 'body', user_id: 1, draft: false)
      patch post_url(post.id), params: { post: { title: new_post_params[:title], body: new_post_params[:body] } }
      expect(post.reload[:title]).to eq new_post_params[:title]
    end

    it 'check correct change summary' do
      post = Post.create!(title: 'title', summary: 'summary', body: 'body', user_id: 1, draft: false)
      patch post_url(post.id), params: { post: { title: new_post_params[:title], summary: new_post_params[:summary] } }
      expect(post.reload[:summary]).to eq new_post_params[:summary]
    end

    it 'check correct change body' do
      post = Post.create!(title: 'title', summary: 'summary', body: 'body', user_id: 1, draft: false)
      patch post_url(post.id), params: { post: { title: new_post_params[:title], body: new_post_params[:body] } }
      expect(post.reload[:body]).to eq new_post_params[:body]
    end
  end

  describe 'DELETE /destroy' do
    it 'destroy post a successful' do
      post = Post.create!(title: 'title', summary: 'summary', body: 'body', user_id: 1, draft: false)
      delete post_url(post.id)
      expect { post.reload }.to raise_error ActiveRecord::RecordNotFound
    end
  end

  describe 'GET /edit' do
    it 'renders a successful' do
      post = Post.create!(title: 'title', summary: 'summary', body: 'body', user_id: 1, draft: false)
      get edit_post_path(post.id)
      expect(response).to be_successful
    end
  end

  describe 'GET /create' do
    it 'success create post, check title' do
      Post.create!(title: 'title', summary: 'summary', body: 'body', user_id: 1, draft: false)
      post = Post.all[0]
      expect(post.title).to eq 'title'
    end
  end
end
