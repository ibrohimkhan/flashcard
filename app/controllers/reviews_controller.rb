class ReviewsController < ApplicationController
  def review
    @card = Card.find_translation(text_params[:original_text], text_params[:user_translation])
    # binding.pry

    if @card[0].nil? || @card.empty?
      flash[:notice] = "Не правильно"
    else
      flash[:notice] = "Правильно"
      @card[0][:review_date] += 3.day
      @card[0].save!
    end

    flash[:item_id] = text_params[:id]
    redirect_to root_path
  end

  private

    def text_params
      params.require(:card).permit(:original_text, :user_translation, :id)
    end
end