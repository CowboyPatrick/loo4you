class ToiletPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where.not(user: user)
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
end
