require 'rails_helper'

RSpec.describe Role, type: :model do
  context "name" do
    it "is required" do
      role = create(:role)
      role.name = NIL
      expect(role).to_not be_valid
      expect(role.errors.messages[:name]).to include("can't be blank")
    end
    it "should be unique" do
      role_a = create(:role, name: 'a')
      role_b = create(:role, name: 'b')
      role_b.name = role_a.name
      expect(role_b).to_not be_valid
      expect(role_b.errors.messages[:name]).to include('has already been taken')
    end
  end
end
