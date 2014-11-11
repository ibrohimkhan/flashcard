class WelcomeController < ApplicationController
  def index
    @card = Card.get_card(Date.today)
  end
end