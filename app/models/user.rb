class User < ApplicationRecord
  after_create :send_welcome_email
  has_one :tester
  has_one :startup
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def empty_profile?
    startup.company_name.nil? &&
    startup.url.nil? &&
    startup.description.nil? &&
    startup.sector.nil?
  end

  def empty_tester_profile?
    tester.education.nil? &&
    tester.age.nil? &&
    tester.sex.nil? &&
    tester.nationality.nil? &&
    tester.profession.nil?
  end

  def is_tester?
    return !self.tester.nil?
  end

  def is_startup?
    return !self.startup.nil?
  end

  private

  def send_welcome_email
    if self.is_startup?
      UserMailer.with(user: self).welcome.deliver_now
    elsif self.is_tester?

    end

  end
end
