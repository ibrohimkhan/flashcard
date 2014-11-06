class WelcomeController < ApplicationController
  def index
    @card = Card.first_card(Date.today)
    #@next = Card.next_card(Date.today, @card)
  end
end