class PrestationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    return true
  end

  def index?
    return true
  end

  def destroy?
    record.client == user
  end

  def update?
    record.mourner == user
  end
end
