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
      flash[:notice] = "提交成功!!"
    end

    redirect_to "http://localhost:3000/flashes/2?page=3"

  end

end
