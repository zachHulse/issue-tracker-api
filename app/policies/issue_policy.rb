class IssuePolicy < ApplicationPolicy
  def index?
    user.role? :admin or user.role? :dev
  end

  def show?
    user.role? :admin or user.role? :dev
  end

  def create?
    user.role? :admin or user.role? :dev
  end

  def update?
    user.role? :admin or user.role? :dev
  end

  def destroy?
    user.role? :admin or user.role? :dev
  end
end
