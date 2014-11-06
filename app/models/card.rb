class Card < ActiveRecord::Base
  validates :original_text, :translated_text, presence: true
  scope :first_card, -> (date) { where("review_date <= ?", date).first }
  scope :next_card, -> (date, card) { where("review_date <= ? and id > ?", date, card.id).first }
end