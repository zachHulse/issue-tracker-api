require 'rails_helper'

RSpec.describe Project, type: :model do
  context "name" do
    it "is required" do
      test_is_required(:project, :name)
    end
    it "should be unique" do
      test_is_unique(:project, :name)
    end
  end
  context "abbreviation" do
    it "is required" do
      test_is_required(:project, :abbreviation)
    end
    it "should be unique" do
      test_is_unique(:project, :abbreviation)
    end
  end
end
