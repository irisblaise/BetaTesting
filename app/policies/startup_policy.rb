class StartupPolicy < ApplicationPolicy
  class Scope < Scope
    def initialize(user, scope)
      @user  = user
      @scope = scope
    end

    # def resolve
      # if current_user.is_startup?
        # scope.all
      # if current_user.is_tester?
        # scope.joins ?

        # SELECT "tester".*
        # FROM "testers"
        # WHERE "age" BETWEEN XX AND XX;

        # SELECT "tester".*
        # FROM "testers"
        # WHERE "profession" BETWEEN XX AND XX;
    # end
    def resolve
      if user.is_startup?
        byebug
        scope.all
      else
        byebug
        startups = scope.all

        # startups = startups.by_tester_age(user.tester.age)
        # scope.where(published: true)
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
