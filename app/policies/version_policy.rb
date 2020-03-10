class VersionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def update?
    record.startup.user == user
  end

  def show?
    record.startup.user == user || user.tester
  end

  def destroy?
    record.startup.user == user
  end

end
