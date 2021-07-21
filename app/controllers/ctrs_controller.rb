class CtrsController < ApplicationController

  def create
    click_rates = Ctr.create({
                               user_id: current_user.id,
                               scenes: params[:ctr][:scenes],
                               inserted_at: Time.zone.now
                             })
  end

end
