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


  protected

  def serializable_hash(options = nil)
    super(options).merge(current_sign_in_at: current_sign_in_at, last_sign_in_at: last_sign_in_at) # you can keep adding attributes here that you wish to expose
  end
end
