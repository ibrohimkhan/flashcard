class ReviewsController < ApplicationController
  def create
    @card = Card.find(params[:id])

    if @card.translated?(params[:user_translation])
      flash[:notice] = "Правильно"
      @card.review_date += 3.day
      @card.save
    else
      flash[:notice] = "Не правильно"
    end

    redirect_to root_path
  end
end
