class ReviewsController < ApplicationController
  def create
    @card = Card.find(params[:card_id])

    if @card.check_translation?(params[:user_translation])
      flash[:notice] = "Правильно"
      @card.update_attribute(:review_date, @card.review_date += 3.day)
    else
      flash[:notice] = "Не правильно"
    end

    redirect_to root_path
  end
end
