require 'rails_helper'
require 'random_data'

RSpec.describe QuestionsController, type: :controller do

  let(:my_question) { Question.create!(title: RandomData.random_sentence, body: RandomData.random_paragraph)}

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "assigns [my_question] to @questions" do
      get :index
      expect(assigns(:questions)).to eq([my_question])
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "renders the #new view" do
      get :new
      expect(response).to render_template :new
    end

    it "instantiates @question" do
      get :new
      expect(assigns(:question)).not_to be_nil
    end
  end

#this just below is new, referenced from the solution video
  describe "POST create" do
    it "increases the number of Questions by 1" do
      expect{ post :create, {question: {title: "Title", body: "Body", resolved: false}}}. to change(Question,:count).by(1)
    end

    it "assigns the new question to @question" do
      post :create, {question: my_question.attributes}
      expect(assigns(:question)).to eq Question.last
    end

    it "redirects to the new question" do
      post :create, {question: my_question.attributes}
      expect(response).to redirect_to Question.last
    end
  end

# this is what I previously had here instead
#   describe "GET #create" do
#     it "returns http success" do
#       get :create
#       expect(response).to have_http_status(:success)
#     end
#   end

# this is my original method implementation. But it doesn't pass the test.
  describe "GET show" do  #what is the difference between putting "show" and "#show"? #show is used when referring to models.
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end

    it "renders the #edit view" do
      get :edit, {id: my_question.id}
      expect(response).to render_template :edit
    end

  end

#I think this one here is why I was having trouble seeding my questions with data.
  describe "PUT update" do
    it "updates the question with expected attributes" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_question.id, question: { title: new_title, body: new_body, resolved: false }

      updated_question = assigns(:question)
      expect(updated_question.id).to eq my_question.id
      expect(updated_question.title).to eq new_title
      expect(updated_question.body).to eq new_body
    end

    it "redirects to the updated question" do
      new_title = RandomData.random_sentence
      new_body = RandomData.random_paragraph

      put :update, id: my_question.id, question: { title: new_title, body: new_body, resolved: true }
      expect(response).to redirect_to my_question
    end
  end

#this was my original method implementation for UPDATE. I used GET instead of PUT.
  # describe "GET #update" do
  #   it "returns http success" do
  #     get :update
  #     expect(response).to have_http_status(:success)
  #   end
  # end

  describe "DELETE destroy" do
    it "deletes the question" do
      delete :destroy, {id: my_question.id}
      count = Question.where({id: my_question.id}).size
      expect(count).to eq 0
    end

    it "redirects to questions index" do
      delete :destroy, {id: my_question.id}
      expect(response).to redirect_to questions_path
    end
  end

end
