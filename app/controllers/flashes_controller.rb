class FlashesController < ApplicationController
  before_action :redirect_if_not_log_in
  before_action :redirect_if_account_is_guest

  LIMITED_QUESTION_NUMBER = 1  #每頁顯示一個問題

  def index
    @courses = Course.all.order("id")
  end

  def show
    @course = Course.find_by_id(params[:id])
    @course_topics = CourseTopic.where(:course_id => @course).order("id")

    @count = @course_topics.count  #總共有幾個問題

    # 如果網址沒有page的話，他會顯示最後一個問題，這樣是錯的，應該是顯示第一個問題，所以要加判斷
    if params[:page]
      @page = params[:page].to_i    # 從 params 拿進來的值是字串，所以要轉成 integer
    else
      @page = 1
    end

    @first_page = 1
    @last_page = ( @count / LIMITED_QUESTION_NUMBER )

    @course_topics = @course_topics[ (@page - 1) * LIMITED_QUESTION_NUMBER, LIMITED_QUESTION_NUMBER]


    @user_info = UserInfo.new
  end



  private

  def redirect_if_not_log_in
    if !current_user
      flash[:notice] = "您尚未登入"
      redirect_to root_path
      return
    end
  end

  def redirect_if_account_is_guest
    if current_user && current_user.role == 'guest'
      flash[:notice] = "你的帳號尚未開通，請稍等老師為您開通"
      redirect_to root_path
      return
    end
  end


end
