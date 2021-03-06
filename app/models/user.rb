class User < ApplicationRecord
  after_create :send_welcome_email

  has_one :tester, dependent: :destroy
  has_one :startup, dependent: :destroy
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

  def full_name
    name = "#{self&.first_name&.capitalize} #{self&.last_name&.capitalize}"

    name.strip.empty? ? "Your Name" : name
  end

  private

  def send_welcome_email
    if self.is_startup?
      UserMailer.with(user: self).welcome.deliver_now
    elsif self.is_tester?

    end

  end
end
