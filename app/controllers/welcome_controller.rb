class WelcomeController < ApplicationController
  def index
    if flash[:item_id]
      @current_card = Card.find_by_id(flash[:item_id])
      @card = Card.next_card(Date.today, @current_card[:id])
      @card = Card.first_card(Date.today) unless @card.class == Card
    else
      @card = Card.first_card(Date.today)
    end
  end

end