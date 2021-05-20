require 'rails_helper'

RSpec.describe Issue, type: :model do
  context "relationships" do
    it "should belong to project" do
      association = described_class.reflect_on_association(:project)
      expect(association.macro).to eq :belongs_to
    end
    it "should belong to sprint" do
      association = described_class.reflect_on_association(:sprint)
      expect(association.macro).to eq :belongs_to
    end
  end
  context "name" do
    it "is required" do
      test_is_required(:issue, :name)
    end
  end
  context "code" do
    it "is required" do
      test_is_required(:issue, :code)
    end
    it "should be unique" do
      test_is_unique(:issue, :code)
    end
  end
end
