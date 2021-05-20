class ProjectPolicy < ApplicationPolicy
  def index?
    user.role? :admin or user.role? :dev
  end

  def show?
    user.role? :admin or user.role? :dev
  end

  def create?
    user.role? :admin
  end

  def update?
    user.role? :admin
  end

  def destroy?
    user.role? :admin
  end
end
