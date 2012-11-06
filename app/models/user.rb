class User < ActiveRecord::Base
  ROLE_OPTIONS = %w(administrator provider requester)

  devise :database_authenticatable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :username, :password, :password_confirmation, :remember_me, :name, :role

  has_many :requests, :foreign_key => :requester_id
  has_many :assignments, :class_name => 'Request', :foreign_key => :assignee_id
  has_many :comments
  has_many :attachments
  has_many :systems

  validates :username, :role, :name, :presence => true
  validates :username, :uniqueness => true, :format => /^\w+$/
  validates :role, :inclusion => { :in => ROLE_OPTIONS }

  def to_s
    self.name
  end
end
