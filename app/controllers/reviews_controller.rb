class ReviewsController < ApplicationController
  def create
    @card = Card.find(card_params[:id])
    # binding.pry

    if @card.translated?(card_params[:user_translation])
      flash[:notice] = "Правильно"
    else
      flash[:notice] = "Не правильно"
    end

    redirect_to root_path
  end

  private

  def card_params
    params.require(:card).permit(:user_translation, :id)
  end
end
