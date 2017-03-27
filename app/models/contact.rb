class Contact < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, unless: Proc.new { |a| a.email.blank? }
  validates :comments, presence: true
end