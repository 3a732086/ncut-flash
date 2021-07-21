class UserInfosController < ApplicationController


  def index  #前台檢視自己資料頁面
    @user_data = UserInfo.where(:user_id => current_user.id)
  end


  def create
    @user_info = UserInfo.create({         #學生填完答案後按繳交題目新增一筆資料
             user_id: current_user.id,
             scenes: params[:user_info][:scenes],
             topic: params[:user_info][:topic],
             input_data: params[:user_info][:input_data],
             inserted_at: Time.zone.now
   })


    if @user_info.valid?   #驗證寫入資料是否成功
      count = params[:user_info][:count].to_i   #用表單從flashes#show傳過來的題目總數量

      url_topic_id = params[:user_info][:topic].to_i + 1  #繳交題目後跳至下一題

      if url_topic_id > count   #如果題目是最後一題的話，就不能再 +1
        url_topic_id -= 1
      end

      redirect_to "http://localhost:3000/flashes/#{params[:user_info][:scenes_id]}?page=#{url_topic_id}"
    else
      redirect_to "http://localhost:3000/flashes/#{params[:user_info][:scenes_id]}?page=#{params[:user_info][:topic]}"  #驗證不成功顯示錯誤訊息並導回同一題
      return
    end



  end

end
