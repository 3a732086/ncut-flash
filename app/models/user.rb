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
  # 這段程式碼的用意是在資料表可以看見current_sign_in_at這些欄位，但是在 rails console裡面看不到
  # 所以加上這段程式碼可以在 rails console 裡面看到這些欄位
  # 但是真正在執行的時候必須要註解掉，不然會報錯
  # def serializable_hash(options = nil)
  #   super(options).merge(current_sign_in_at: current_sign_in_at, last_sign_in_at: last_sign_in_at) # you can keep adding attributes here that you wish to expose
  # end
end
