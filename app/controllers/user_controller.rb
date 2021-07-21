class UserController < ApplicationController


  def update
    user = User.find(params[:id])
    if user.update(user_edit_permit)
      flash[:notice] = "更新成功!!"
    else
      flash[:alert] = "發生錯誤!!"
    end

    redirect_to user_manage_admin_index_path
  end


  def destroy
    user = User.find(params[:id])
    user.destroy
    flash[:notice] = "成功刪除!!"
    redirect_to user_manage_admin_index_path
    return
  end


  private

  def user_edit_permit
    params.require(:user).permit([:name, :student_class, :email, :role])
  end

end
