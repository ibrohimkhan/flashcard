class ReviewsController < ApplicationController
  def create
    @card = Card.find(review_params[:card_id])

    if @card.check_translation(review_params[:user_translation])
      flash[:notice] = "Правильно"
      @card.update_review_date(@card.review_date += 3.day)
    else
      flash[:notice] = "Не правильно"
    end

    redirect_to root_path
  end

  private

  def review_params
    params.require(:review).permit(:card_id, :user_translation)
  end
end
