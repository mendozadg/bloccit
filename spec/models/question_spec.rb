require 'rails_helper'
require 'random_data'

RSpec.describe Question, type: :model do
  describe "attributes" do
    let(:question) {Question.new(title: "New Question Title", body: "New Question Body", resolved: false) }

    it "responds to title" do
      expect(question).to respond_to(:title)
    end

    it "responds to body" do
      expect(question).to respond_to(:body)
    end

    it "should respond to resolved" do
      expect(question).to respond_to(:resolved)
    end

  end

end
