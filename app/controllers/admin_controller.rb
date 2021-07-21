class AdminController < ApplicationController
  layout 'admin/layouts/admin'

  def index
    @recent_log_in_users = User.order(current_sign_in_at: :desc)

    log_in_user = User.where(current_sign_in_at: Date.current.to_time.all_day)  #搜尋 User登入時間是否符合今天日期
    @today_log_in_users = log_in_user.count  #計算今天登入的 User數量

    practice = UserInfo.where(inserted_at: Date.current.to_time.all_day)   #搜尋當天日期的練習量
    @today_practice_count = practice.count   #今日練習量
  end


  def user_manage
    @users = User.all
    @edit_user = User.find_by(params[:value])
  end

end
