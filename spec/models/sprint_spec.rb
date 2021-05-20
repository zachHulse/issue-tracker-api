require 'rails_helper'

RSpec.describe Sprint, type: :model do
  context "relationships" do
    it "should belong to project" do
      association = described_class.reflect_on_association(:project)
      expect(association.macro).to eq :belongs_to
    end
  end
end
