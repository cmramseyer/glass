class ProductPolicy < ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    user.admin?
  end

  def new?
    user.admin?
  end

  def create?
    user.admin?
  end


end
