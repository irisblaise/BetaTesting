class QuestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.version.startup == user.startup
  end

  def destroy?
    record.version.startup == user.startup
  end
end
