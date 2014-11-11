class ReviewsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])

    if @card.translated?(params[:user_translation])
      flash[:notice] = "Правильно"
      @card.increase_review_date
    else
      flash[:notice] = "Не правильно"
    end

    redirect_to root_path
  end
end
