class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :trackable

  validates :name, :student_class, :role, presence: true
  enum role: [:guest, :student, :admin]

  mount_uploader :avator, CoverImageUploader

  has_many :user_infos
end
