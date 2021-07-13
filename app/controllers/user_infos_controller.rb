class UserInfosController < ApplicationController


  def create
    @user_info = UserInfo.create({
      user_id: current_user.id,
      scenes: params[:user_info][:scenes],
      topic: params[:user_info][:topic],
      input_data: params[:user_info][:input_data],
      inserted_at: Time.now
    })

    if !@user_info.valid?
      flash[:alert] = "ERROR!!"
    else
      flash[:notice] = "第#{params[:user_info][:topic]}題繳交成功!!"
    end


    count = params[:user_info][:count].to_i   #用表單從flashes#show傳過來的題目總數量

    url_topic_id = params[:user_info][:topic].to_i + 1  #繳交題目後跳至下一題

    if url_topic_id > count   #如果題目是最後一題的話，就不能再 +1
        url_topic_id -= 1
    end

    redirect_to "http://localhost:3000/flashes/#{params[:user_info][:scenes_id]}?page=#{url_topic_id}"

  end

end
