require 'rails_helper'
require 'random_data'

RSpec.describe SponsoredPostsController, type: :controller do

  let(:my_topic) { Topic.create!(name: RandomData.random_sentence, description: RandomData.random_paragraph) }
  let(:my_sponsored_post) { my_topic.sponsored_posts.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph) }

  describe "GET #show" do
    it "returns http success" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to have_http_status(:success)
    end
    it "renders the #show view" do
      get :show, topic_id: my_topic.id, id: my_sponsored_post.id
      expect(response).to render_template :show
    end

    it "assigns my_post to @post" do
      get :show, topic_id: my_topic.id, id: my__sponsored_post.id
      expect(assigns(:sponsored_post)).to eq(my_sponsored_post)
    end
  end

  describe "GET new" do
    it "returns http success" do
      get :new, topic_id: my_topic.id
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new, topic_id: my_topic.id
      expect(response).to render_template :new
    end

    it "instatiates @sponsored_post" do
      get :new, topic_id: my_topic.id
      expect(assigns(:sponsored_post)).not_to be_nil
    end
  end

  # describe "POST create" do #I need this, right? In order to save to database.
  #   it "increases the number of Sponsored Post by 1" do
  #     expect{post :create, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}}.to change(Sponsored_Post,:count).by(1)
  #   end
  #
  #   it "assigns the new sponsored post to @sponsored_post" do
  #     sponsored_post :create, sponsored_post: {title: RandomData.random_sentence, body: RandomDAta.random_paragraph}
  #     expect(assigns(:sponsored_post)).to eq Sponsored_post.last
  #   end
  #
  #   it "redirects to the new sponsored post" do
  #     sponsored_post :create, sponsored_post: {title: RandomData.random_sentence, body: RandomData.random_paragraph}
  #     expect(response).to redirect_to Sponsored_post.last
  #   end
  # end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
