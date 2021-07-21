class AdminController < ApplicationController
  layout 'admin/layouts/admin'

  def index   #Dashboard頁面
    @recent_log_in_users = User.order(current_sign_in_at: :desc)   #搜尋最近登入 User 使用 Desc 排序

    log_in_user = User.where(current_sign_in_at: Date.current.to_time.all_day)  #搜尋 User登入時間是否符合今天日期
    @today_log_in_users = log_in_user.count  #計算今天登入的 User數量

    practice = UserInfo.where(inserted_at: Date.current.to_time.all_day)   #搜尋當天日期的練習量
    @today_practice_count = practice.count   #今日練習量
  end

  def user_manage  #用戶管理頁面
    @users = User.all     #搜尋所有 User
    @edit_user = User.find_by(params[:value])  #後台按下編輯按鈕尋找特定 User
  end

  def user_response  #學生作答紀錄
    @user_response = User.find_by_sql("select * from users inner join user_infos on users.id = user_infos.user_id order by inserted_at desc")  #搜尋 User join UserInfo
  end

end
