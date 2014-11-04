class CardsController < ApplicationController
  before_action :find_card, only: [:show, :edit, :update, :destroy]

  def index
    @cards = Card.all
  end

  def show
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    return redirect_to @card if @card.save
    render 'new'
  end

  def edit
  end

  def update
    return redirect_to @card if @card.update(card_params)
    render 'edit'
  end

  def destroy
    @card.destroy
    redirect_to cards_path
  end

  private
  def find_card
    @card = Card.find(params[:id])
  end

  def card_params
    params.require(:card).permit(:original_text, :translated_text, :review_date)
  end
end