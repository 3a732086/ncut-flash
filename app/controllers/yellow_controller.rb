class YellowController < ApplicationController
    layout 'admin/layouts/admin'

    def index
        @yellows = Yellow.all
    end

    def edit
        @yellow = Yellow.find_by_id(params[:id])
    end

    def create  #新增Yellow詞彙

        count = 0

        unless params[:Verb].blank?
            count += 1
        end

        unless params[:Noun].blank?
            count += 1
        end

        unless params[:Adjective].blank?
            count += 1
        end

        unless params[:Adverb].blank?
            count += 1
        end

        yellow = Yellow.create(yellow_permit.merge({Count: count}))

        if yellow.valid?
            redirect_to action: :index
            return
        end
    end

    def update
        yellow = Yellow.find(params[:id])

        compare_count = 0  #用來比對count是否有增減

        count = params[:Count].to_i  #原本的Count數量

        unless params[:Verb].blank?
            compare_count += 1
        end

        unless params[:Noun].blank?
            compare_count += 1
        end

        unless params[:Adjective].blank?
            compare_count += 1
        end

        unless params[:Adverb].blank?
            compare_count += 1
        end

        if count > compare_count
            compare_total = count - compare_count  #比對出來差多少 ex. 差1或差2
            count -=  compare_total   #Count要減去差的數量
        elsif count < compare_count
            compare_total = compare_count - count  #比對出來差多少 ex. 多1或多2
            count += compare_total  #Count要加上差的數量
        end


        if yellow.update(yellow_permit.merge({Count: count}))
            redirect_to action: :index
            return
        end
    end

    private

    def yellow_permit
        params.permit([:Verb, :Noun, :Adjective, :Adverb])
    end
end
