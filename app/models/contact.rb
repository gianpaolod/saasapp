class Contact < ActiveRecord::Base
  validates :nombre, presence: true
  validates_format_of :email, :with => /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/
  validates :comentarios, presence: true
end