class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :rememberable, :trackable

  validates :email, uniqueness: true
  validates :username, uniqueness: true

  def admin?
    puts admin
    admin
  end

end
