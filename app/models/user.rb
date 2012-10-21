class User < ActiveRecord::Base
  ROLE_OPTIONS = %w(administrator provider requester)

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :role

  has_many :requests, :foreign_key => :requester_id
  has_many :assignments, :class_name => 'Request', :foreign_key => :assignee_id
  has_many :comments
  has_many :attachments

  validates :email, :password, :role, :name, :presence => true
  validates :role, :inclusion => { :in => ROLE_OPTIONS }

  def to_s
    self.name
  end
end
