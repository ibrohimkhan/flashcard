class WelcomeController < ApplicationController
  def index
    @card = Card.next_card(Date.today)[0]
    @card = Card.first_card(Date.today) if @card.nil?
  end
end