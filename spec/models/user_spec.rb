require 'rails_helper'

RSpec.describe User, type: :model do
  context "email" do
    it "is required" do
      user = create(:user)
      user.email = NIL
      expect(user).to_not be_valid
      expect(user.errors.messages[:email]).to include("can't be blank")
    end
    it "should be unique" do
      john = create(:user, email: 'john@place.com')
      jane = create(:user, email: 'jane@place.com')
      john.email = jane.email
      expect(john).to_not be_valid
      expect(john.errors.messages[:email]).to include('has already been taken')
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
