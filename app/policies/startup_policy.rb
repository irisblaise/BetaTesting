class StartupPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user.is_startup?
        scope.all
      else
        startups = scope.all
        startups = startups.by_tester_profession(user.tester.profession) &&
        startups = startups.by_tester_education(user.tester.education) &&
        startups = startups.by_tester_age(user.tester.age) &&
        startups = startups.by_tester_sex(user.tester.sex) &&
        startups = startups.by_tester_nationality(user.tester.nationality)
      end
    end

    private

    attr_reader :user, :scope
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
