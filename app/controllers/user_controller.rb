class UserController < ApplicationController


  def update
    user = User.find_by(id: params[:id])

    if user.update(user_edit_permit)
      redirect_to user_manage_admin_index_path
    end
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
    params.require(:user).permit([:name, :student_class, :email, :role]) #[裡面的欄位名稱是資料表裡面的欄位名稱，不是表單的名稱]
  end

end
