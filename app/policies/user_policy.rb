class UserPolicy < ApplicationPolicy
  
  def manage_stages?
    user.admin?
  end

  def manage_products?
    user.admin?
  end

end
