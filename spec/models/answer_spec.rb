require 'rails_helper'

RSpec.describe Answer, type: :model do
  #pending "add some examples to (or delete) #{__FILE__}"
  let(:question) { Question.create!(title: "New Question Title", body: "New Question Body")}
  let(:answer) { Answer.create!(body: "New Answer Body", question: question)}

  describe "attributes" do
  	it "responds to body" do
  		expect(answer).to respond_to(:body)
  	end
  end
end
