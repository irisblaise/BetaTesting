class TesterPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  # new can be removed because new calls create in the application policy
  # def new?
  #   return true #anyone can create a new tester
  # end

  def create?
    return true
  end

  # def show
  #   return true
  # end

  def edit?
    if record.user? == user
      return true
    else
      return false
    end
  end
end
