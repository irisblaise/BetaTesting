class StartupPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    def resolve
      if user&.is_startup?
        scope.all
      elsif user&.is_tester?
        # user is tester
        startups = scope.all
        startups = startups.by_tester_profession(user.tester.profession) &&
        startups = startups.by_tester_education(user.tester.education) &&
        startups = startups.by_tester_age(user.tester.age) &&
        startups = startups.by_tester_sex(user.tester.sex) &&
        startups = startups.by_tester_nationality(user.tester.nationality)
      elsif user&.is_tester? && user.tester.reviews.count > 0
        # user is tester
        startups = scope.all
        startups = startups.by_tester_profession(user.tester.profession) &&
        startups = startups.by_tester_education(user.tester.education) &&
        startups = startups.by_tester_age(user.tester.age) &&
        startups = startups.by_tester_sex(user.tester.sex) &&
        startups = startups.by_tester_nationality(user.tester.nationality) &&
        startups = startups.by_tester_rating(user.tester.avg_rating.round)
      else
        scope.all
      end
    end

    private

    attr_reader :user, :scope
  end

  def create?
    return true
  end

  def edit?
    record.user == user
  end

  def update?
    record.user == user
  end

end
