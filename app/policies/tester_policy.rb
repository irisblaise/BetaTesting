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

  def show?
    return true
  end

#  edit calls update, so we don't need it
  # def edit?
  #   record.user == user
  # end

  def update?
    record.user == user
  end
end
