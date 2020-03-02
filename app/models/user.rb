class User < ApplicationRecord
  has_one :tester
  has_one :startup
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def is_tester?
    return !self.tester.nil?
  end

  def is_startup?
    return !self.startup.nil?
  end
end
