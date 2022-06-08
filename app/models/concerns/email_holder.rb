module EmailHolder
  extend ActiveSupport::Concern
  included do
    before_validation do
      self.email = normalize_as_email(email)
    end
    validates :email, presence: true, "valid_email2/email": true, uniqueness: { case_sensitive: false }
  end
end
