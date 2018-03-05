class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  ROLES = [
    ROLE_ADMIN = "Admin",
    ROLE_REGULAR = "Regular"
]

devise :invitable, :database_authenticatable, :registerable,
       :recoverable, :rememberable, :trackable, :validatable


validates :first_name, presence: true, length: { maximum: 50 }
validates :last_name, presence: true, length: { maximum: 50 }
validates :role, inclusion: ROLES, presence: true

has_attached_file :avatar, styles: { medium: "450x450>" },
                          default_url: -> (attachment) {
                            ActionController::Base.helpers.asset_path(
                              'default-avatar.png'
                            )
                          }
validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

before_validation :set_role

def full_name
  [first_name, last_name].join(" ")
end

def admin?
  self.role == ROLE_ADMIN
end

private
def set_role
  self.role = ROLE_REGULAR if self.role.blank?
end
end
