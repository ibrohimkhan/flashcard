class WelcomeController < ApplicationController
  def index
    if flash[:next_item]
      @card = Card.next_card(Date.today)[0]
      @card = Card.first_card(Date.today) if @card.nil?
    else
      @card = Card.first_card(Date.today)
    end
  end
end