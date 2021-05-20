require 'rails_helper'

RSpec.describe User, type: :model do
  context "email" do
    it "is required" do
      test_is_required(:user, :email)
    end
    it "should be unique" do
      test_is_unique(:user, :email)
    end
    it "should require email formatting" do
      bad_emails = %w[bad bademail@ bad.com]
      bad_emails.each {
        |x|  user = User.new(email: x, password: '1234qwer')
        expect(user).to_not be_valid
        expect(user.errors.messages[:email]).to include('is invalid')
      }
    end
  end
  context "password" do
    it "should be hashed" do
      user = User.new(email: 'person@place.com', password: '1234qwer')
      expect(user.password_digest).to be_truthy
      expect(user.password_digest).to_not eq(user.password)
    end
  end
  context "methods" do
    it "should have a role method" do
      user = create(:user)
      user.roles << create(:role, name: 'a')
      create(:role, name: 'b')
      expect(user.role? :a).to be_truthy
      expect(user.role? :b).to_not be_truthy
    end
  end
end
