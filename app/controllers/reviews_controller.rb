class ReviewsController < ApplicationController
  def create
    @card = Card.find_by_id(text_params[:id])
    # binding.pry

    if @card.found_translation?(text_params[:user_translation])
      flash[:notice] = "Правильно"
    else
      flash[:notice] = "Не правильно"
    end

    flash[:item_id] = text_params[:id]
    redirect_to root_path
  end

  private

  def text_params
    params.require(:card).permit(:original_text, :user_translation, :id)
  end
end
