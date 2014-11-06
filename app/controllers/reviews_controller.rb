class ReviewsController < ApplicationController
  def review
    #binding.pry
    @card = Card.find_translation(text_params[:original_text], text_params[:user_translation])

    if @card.nil? || @card.empty?
      flash[:notice] = 'Не правильно'
    else
      flash[:notice] = 'Правильно'
    end

    redirect_to root_path
  end

  private
  def text_params
    params.require(:card).permit(:original_text, :user_translation)
  end
end