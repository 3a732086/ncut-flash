class HomeController < ApplicationController

  def index
    @users = User.count         #註冊的會員數量
    @courses = Course.count     #課程數量
    @user_info = UserInfo.count #今日練習量

    log_in_user = User.where(current_sign_in_at: Date.current.to_time.all_day)  #搜尋 User登入時間是否符合今天日期
    @today_log_in = log_in_user.count  #計算今天登入的 User數量
  end
end
