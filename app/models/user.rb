class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :posts
  belongs_to :role
  before_validation :set_default_role

  def is_admin?
    return self.role.name === 'admin'
  end

  private
  def set_default_role
    self.role ||= Role.find_by(name: 'user')
  end
end
