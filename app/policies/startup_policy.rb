class StartupPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all

      # select the startups that match the current tester filters
    end
  end

  def create?
    return true
  end

  # def show?
  #   return true
  # end

  def update?
    record.user == user
  end

end
