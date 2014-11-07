class WelcomeController < ApplicationController
  def index
    if flash[:item_id]
      @card = Card.next_card(Date.today, flash[:item_id])
      @card = Card.first_card(Date.today) unless @card.class == Card
    else
      @card = Card.first_card(Date.today)
    end
  end
end