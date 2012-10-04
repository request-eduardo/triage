require 'test_helper'

class UserTest < ActiveSupport::TestCase
  subject { users :valid }

  should have_many :requests
  should have_many :assignments
  should have_many :comments
  should validate_presence_of :email
  should validate_presence_of :password
  should validate_presence_of :role
  should validate_presence_of :name
end
