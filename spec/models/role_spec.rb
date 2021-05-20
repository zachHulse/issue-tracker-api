require 'rails_helper'

RSpec.describe Role, type: :model do
  context "name" do
    it "is required" do
      test_is_required(:role, :name)
    end
    it "should be unique" do
      test_is_unique(:role, :name)
    end
  end
end
