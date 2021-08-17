class CourseTopicsController < ApplicationController
    layout 'admin/layouts/admin'

    def index
        @courses = Course.all.order("id")  #搜尋所有情境
    end

    def show
        @course_topics = CourseTopic.where(:course_id => params[:id]).order("number")  #搜尋所有課程，條件是該情境的課程
        @course_id = params[:id]

        @new_course_topic = CourseTopic.new  #新增課程
    end

    def create
        course = Course.find(params[:course_id])
        course_id = course.id

        audio = params[:audio]

        if audio
            audio_url = save_file(audio, course_id)
        end

        course_topic = CourseTopic.create({
                                              course_id: params[:course_id],
                                              number: params[:topic_id],
                                              eng_topic: params[:eng_topic],
                                              chi_topic: params[:chi_topic]
                                          })

        if course_topic.valid?
            redirect_to course_topic_path(params[:course_id])
            return
        end
    end

    def update
        course = Course.find(params[:course_id])
        course_id = course.id

        audio = params[:audio]

        if audio
            audio_url = save_file(audio, course_id)
        end
        
        edit_course_topic = CourseTopic.find_by(id: params[:id])  #透過表單 action 裡面的 id 搜尋資料表中對應的課程

        if edit_course_topic.update(course_topic_permit)
            redirect_to course_topic_path(params[:course_id])
            return
        end
    end

    def destroy
        course_topic = CourseTopic.find(params[:id])
        course_topic.destroy
        course_id = course_topic.course.id   #抓搜尋到的 course_topic 所屬的 course 的 id
        redirect_to course_topic_path(course_id)  #利用上面抓到的 course_id 返回該頁面
        return
    end

    private

    def course_topic_permit
        params.permit([:number, :eng_topic, :chi_topic])  #[裡面的欄位名稱是資料表裡面的欄位名稱，不是表單的名稱]
    end

    def save_file(newFile, course_id)
        dir_url = Rails.root.join('public', "data/#{course_id}/LS/PAUL")  #音檔路徑位置

        FileUtils.mkdir_p(dir_url) unless File.directory?(dir_url)  #如果沒有該路徑，用mkdir_p 建立路徑， 如果路徑存在則不須建立

        file_url = dir_url + newFile.original_filename  #file_url = 路徑/檔案名稱

        File.open(file_url, 'w+b') do |file|    #開啟檔案或寫入檔案
            file.write(newFile.read)
        end

        return "data/#{course_id}/LS/PAUL/" + newFile.original_filename
    end
end
