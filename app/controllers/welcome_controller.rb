class WelcomeController < ApplicationController
  def index
    @card = Card.for_review(Date.today)
  end
end