class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    record.startup.user == user
  end

  def update?
    record.startup.user == user
  end
end
