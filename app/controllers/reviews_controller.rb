class ReviewsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])

    if @card.check_translation?(params[:user_translation])
      flash[:notice] = "Правильно"
      @card.update_attribute
    else
      flash[:notice] = "Не правильно"
    end

    redirect_to root_path
  end
end
