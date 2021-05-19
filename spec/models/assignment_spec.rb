require 'rails_helper'

RSpec.describe Assignment, type: :model do
  context "relationships" do
    it "should belong to user" do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end
    it "should belong to role" do
      association = described_class.reflect_on_association(:role)
      expect(association.macro).to eq :belongs_to
    end
  end
end
