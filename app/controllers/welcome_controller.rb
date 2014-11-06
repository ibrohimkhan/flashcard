class WelcomeController < ApplicationController
  def index
    @card = Card.first_card(Date.today)
    @review = Card.new
    @review.original_text = @card.original_text
    #@next = Card.next_card(Date.today, @card)
  end
end