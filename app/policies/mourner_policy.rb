class MournerPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def update?
    return true
  end

  def show?
    return true
  end

  def index?
    user.is_a? Client
  end
end
