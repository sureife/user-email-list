class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :email, 'valid_email_2/email': { mx: true, disposable: true, disallow_subaddressing: true}

  validates_presence_of :first_name, :last_name

  def email=(val)
    self['email'] = val.downcase if val
  end

  def customer?
    !self.is_admin
  end

  def admin?
    self.is_admin
  end
end
