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

  def update?
    record.mourner == user
  end

  def destroy?
    record.client == user || record.mourner == user
  end

  def update?
    record.mourner == user
  end
end
