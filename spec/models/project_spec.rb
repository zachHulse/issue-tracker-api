require 'rails_helper'

RSpec.describe Project, type: :model do
  context "name" do
    it "is required" do
      project = create(:project)
      project.name = NIL
      expect(project).to_not be_valid
      expect(project.errors.messages[:name]).to include("can't be blank")
    end
    it "should be unique" do
      project_a = create(:role, name: 'a')
      project_b = create(:role, name: 'b')
      project_b.name = project_a.name
      expect(project_b).to_not be_valid
      expect(project_b.errors.messages[:name]).to include('has already been taken')
    end
  end
end
