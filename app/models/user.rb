class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  enum role: [:admin, :team, :product_owner, :chicken]
  before_create :set_default_role
  def set_default_role
    self.role ||= :team
  end
  def self.valid_role? role
    roles.has_key?(role)
  end

end
