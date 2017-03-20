class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :comments, presence: true
end